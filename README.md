# Demo showing how to integrate the Lacework Kubernetes agent with HashiCorp Vault

[![CIS](https://app.soluble.cloud/api/v1/public/badges/f926d9ac-355a-41d1-80da-116ecfcb1017.svg)](https://app.soluble.cloud/repos/details/github.com/bvboe/lacework-vault-k8s-demo)  [![IaC](https://app.soluble.cloud/api/v1/public/badges/43a3f3ea-494d-4503-840d-9f2d9d1380ff.svg)](https://app.soluble.cloud/repos/details/github.com/bvboe/lacework-vault-k8s-demo)  
This demo shows how to integrate HashiCorp Vault with the Lacework Kubernetes agent, deployed on an instance of Kind.

## Prerequisites
* Docker Desktop - https://www.docker.com/
* Kubectl - https://kubernetes.io/docs/tasks/tools/
* Helm - https://helm.sh/docs/intro/install/
* Kind - https://kind.sigs.k8s.io/docs/user/quick-start/#installation
* Git - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## How to run the demo
* Retrieve the agent access token from the lacework dashboard, as described at https://support.lacework.com/hc/en-us/articles/360005318133-Agent-Access-Tokens
* Clone the git repository: `git clone https://github.com/bvboe/lacework-vault-k8s-demo`
* Install the demo: `./install.sh <Lacework AccessToken>`

## How to validate the demo is running
* Validate all pods are running
```
$ kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
lacework-agent-l7g8t                   2/2     Running   0          11s
vault-0                                1/1     Running   0          65s
vault-agent-injector-7cbb4fc56-jj5k2   1/1     Running   0          65s
```
* Watch agent logs
```
$ kubectl exec lacework-agent-l7g8t -- cat /var/log/lacework/datacollector.log
...
* Check the Lacework console
```

## How to uninstall demo
`./teardown.sh`
