provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.5.0"

  create_namespace = true

  set {
    name  = "controller.adminPassword"
    value = "admin"
  }

  set {
    name  = "controller.serviceType"
    value = "ClusterIP"
  }
}

