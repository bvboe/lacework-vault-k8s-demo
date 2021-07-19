# Demo showing how to integrate the Lacework Kubernetes agent with HashiCorp Vault
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
