# Business KPI enabler

**Pre-requisites**

- Kubernetes >= 1.14

- Helm >= 2.17.0

- ElasticSearch Helm chart

**Installation**

The enabler is provided as a Helm chart. To install the chart with the release name my-BKPI:

`helm install my-BKPI BKPI`

The command deploys a Kibana helm chart on the Kubernetes cluster in the default configuration. 

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

`helm install my-BKPI -f values.yaml BKPI`


