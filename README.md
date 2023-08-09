<h1 align="center">Hi 👋, I'm Victor</h1>
<h3 align="center">Challenge of DevOps croct-tech</h3>

## Índice

- [Índice](#índice)
- [Descrição](#descrição)
- [Tecnologias](#tecnologias)
- [Colaboradores](#colaboradores)
- [Instalação](#instalação)
  - [Requisitos](#requisitos)
  - [Passo a passo](#passo-a-passo)
- [Contribua com o Projeto](#contribua-com-o-projeto)

## Descrição

Desavio tecnico da Croct:

- Um operador Strimzi implantado em um namespace strimzi
- Um cluster Kafka implantado em um namespace de aplicativo usando o Operador Strimzi
- Um tópico Kafka criado usando o operador de entidades do Strimzi
- Um trabalho que executa kafka-producer-perf-test (incluído nas imagens Kafka do Strimzi) para produzir mensagens no tópico criado
- Uma implantação que executa kafka-console-consumer (também incluída nas imagens Kafka do Srimzi) para ler e registrar as mensagens do tópico na saída padrão


## Tecnologias

Breve lista das tecnologias empreendidas neste Projeto:

- [Kubernetes](https://kubernetes.io/)
- [Terraform](https://www.terraform.io/)
- [GCP](https://cloud.google.com/?utm_source=google&utm_medium=cpc&utm_campaign=latam-BR-all-pt-dr-BKWS-all-all-trial-e-dr-1605194-LUAC0010101&utm_content=text-ad-none-any-DEV_c-CRE_512285710737-ADGP_Hybrid%20%7C%20BKWS%20-%20EXA%20%7C%20Txt%20~%20GCP_General-KWID_43700062788251518-kwd-155951229&utm_term=KW_gcp-ST_GCP&gclid=Cj0KCQjwz8emBhDrARIsANNJjS5QQ8DYIgvjN07c348tcAcg9H0OjbdcsSDoKmL9qLAHuxTx9slWhG8aAphjEALw_wcB&gclsrc=aw.ds&hl=pt-br)
- [minikube](https://minikube.sigs.k8s.io/docs/start/)


## Colaboradores

Este projeto é mantido devido a colaboração de:
<div align="left">
    <a href="https://github.com/augustovan"><img src="https://github.com/augustovan.png" title="Victor Nascimento" width="90" height="90"></a>
</div>

## Instalação

### Requisitos

Antes de iniciar o processo de instalação, verifique se o seu ambiente atende os requisitos*:

- [Kubernetes](https://kubernetes.io/)
- [Terraform](https://www.terraform.io/);
- [GCP](https://cloud.google.com/?utm_source=google&utm_medium=cpc&utm_campaign=latam-BR-all-pt-dr-BKWS-all-all-trial-e-dr-1605194-LUAC0010101&utm_content=text-ad-none-any-DEV_c-CRE_512285710737-ADGP_Hybrid%20%7C%20BKWS%20-%20EXA%20%7C%20Txt%20~%20GCP_General-KWID_43700062788251518-kwd-155951229&utm_term=KW_gcp-ST_GCP&gclid=Cj0KCQjwz8emBhDrARIsANNJjS5QQ8DYIgvjN07c348tcAcg9H0OjbdcsSDoKmL9qLAHuxTx9slWhG8aAphjEALw_wcB&gclsrc=aw.ds&hl=pt-br);
- [minikube](https://minikube.sigs.k8s.io/docs/start/)Caso queira fazer o deploy do kubernetes sem custo***.

### Passo a passo

1 - Clone o Projeto.
>SSH
```bash
git git@github.com:augustovan/croct-tech-devops.git
```

>HTTPS
```bash
git clone https://github.com/augustovan/croct-tech-devops.git
```

2 - Acesse o diretório do Projeto.

3 - Deploy do Terraform:
> **IMPORTANTE:** Contate o time responsável para obter o conteúdo dos arquivos
---
3.1 - Fazer o login no GCLOUD ` gcloud auth login` (Credenciais);

3.2 - Configurar o projeto `gcloud config set project <XPTO-123>` (Configuração acessar o Projeto no googel);

3.3 - Acessar a pasta Terraform-gke e executar o comando `terraform init` 

3.4 - Para realizar o deploy executar o domando `terraform apply` (necessario criar o bucket para salvar o estado do terraforme)
 
---

4 - Deploy Strimzi.

---
4.1 - Para coletar dos dados do Kubernetes execute o comando `kubectl config view --minify --flatten --context=nome-do-contexto`

4.2 - Configurar os valores no `terraform.tfvars`

4.3 - Acessar a pasta Terraform-strimzi e executar o comando `terraform init` 

4.4 - Para realizar o deploy executar o domando `terraform apply` 

5 - Teste em nosso cluster Kafka.

---
Criar nosso kafka-producer executando o comando:

```bash
kubectl -n kafka run kafka-producer -ti --image=quay.io/strimzi/kafka:0.36.1-kafka-3.5.1 --rm=true --restart=Never -- bin/kafka-console-producer.sh --bootstrap-server croct-tech-cluster.strimzi.svc.cluster.local:9092 --topic croct-tech-topic

```
Criar nosso kafka-consulmer executando o comando:

```bash
kubectl -n kafka run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.36.1-kafka-3.5.1 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server croct-tech-cluster.svc.cluster.local:9092 --topic croct-tech-topic --from-beginning
```

## Contribua com o Projeto

Confira nosso guia para [CONTRIBUIÇÃO]().


- 🔭 I’m currently working on **Raizen Tech**

- 👨‍💻 All of my projects are available at [https://github.com/augustovan](https://github.com/augustovan)

- 📫 How to reach me **augusto.van@gmail.com**

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://linkedin.com/in/victoranascimento" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="victoranascimento" height="30" width="40" /></a>
</p>

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://aws.amazon.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="40" height="40"/> </a> <a href="https://azure.microsoft.com/en-in/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/microsoft_azure/microsoft_azure-icon.svg" alt="azure" width="40" height="40"/> </a> <a href="https://www.gnu.org/software/bash/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/gnu_bash/gnu_bash-icon.svg" alt="bash" width="40" height="40"/> </a> <a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="40" height="40"/> </a> <a href="https://cloud.google.com" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/google_cloud/google_cloud-icon.svg" alt="gcp" width="40" height="40"/> </a> <a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://www.jenkins.io" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/jenkins/jenkins-icon.svg" alt="jenkins" width="40" height="40"/> </a> <a href="https://kubernetes.io" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-icon.svg" alt="kubernetes" width="40" height="40"/> </a> <a href="https://www.linux.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="linux" width="40" height="40"/> </a> <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="40" height="40"/> </a> </p>
