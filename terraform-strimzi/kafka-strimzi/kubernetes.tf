
resource "kubernetes_namespace" "strimzi" {
  metadata {
    name = "strimzi"
  }
}

resource "helm_release" "strimzi_operator" {
  name       = "strimzi"
  chart      = "strimzi-helm/strimzi-kafka-operator"
  version    = "0.36.1"
  repository = "oci://quay.io/"

  set {
    name  = "replicas"
    value = "1"
  }

  set {
    name  = "name"
    value = "strimzi"
  }

  set {
    name  = "namespace"
    value = "strimzi"
  }

  set {
    name  = "watchAnyNamespace"
    value = "true"
  }

  set {
    name  = "annotations.meta\\.helm\\.sh/release-name"
    value = "strimzi"
    type  = "string"
  }

  set {
    name  = "labels.app\\.kubernetes\\.io/managed-by"
    value = "helm"
    type  = "string"
  }


  depends_on = [kubernetes_namespace.strimzi]
}

resource "kubernetes_manifest" "kafka_cluster" {
  manifest = {
    "apiVersion" : "kafka.strimzi.io/v1beta2",
    "kind" : "Kafka",
    "metadata" : {
      "name" : "croct-tech-cluster"
      "namespace" : "strimzi"
    },
    "spec" : {
      "kafka" : {
        "version" : "3.5.1",
        "replicas" : 1,
        "listeners" : [
          {
            "name" : "plain",
            "port" : 9092,
            "type" : "internal",
            "tls" : false
          },
          {
            "name" : "tls",
            "port" : 9093,
            "type" : "internal",
            "tls" : true
          }
        ],
        "config" : {
          "offsets.topic.replication.factor" : 1,
          "transaction.state.log.replication.factor" : 1,
          "transaction.state.log.min.isr" : 1,
          "default.replication.factor" : 1,
          "min.insync.replicas" : 1,
          "inter.broker.protocol.version" : "3.5"
        },
        "storage" : {
          "type" : "jbod",
          "volumes" : [
            {
              "id" : 0,
              "type" : "persistent-claim",
              "size" : "10Gi",
              "deleteClaim" : false
            }
          ]
        }
      },
      "zookeeper" : {
        "replicas" : 1,
        "storage" : {
          "type" : "persistent-claim",
          "size" : "10Gi",
          "deleteClaim" : false
        }
      },
      "entityOperator" : {
        "topicOperator" : {},
        "userOperator" : {}
      }
    }
  }
  depends_on = [helm_release.strimzi_operator]
}


resource "kubernetes_manifest" "kafka_topic_strimzi" {
  manifest = {
    "apiVersion" : "kafka.strimzi.io/v1beta2",
    "kind" : "KafkaTopic",
    "metadata" : {
      "name" : "croct-tech-topic",
      "labels" : {
        "strimzi.io/cluster" : "croct-tech-cluster"
      }
    },
    "spec" : {
      "partitions" : 1,
      "replicas" : 1
    }
  }
}
