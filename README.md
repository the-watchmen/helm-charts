# helm-charts

custom helm charts

## appendix

### test chart locally

```
helm template --debug -n my-ns --values charts/micro-service/values.eg.yaml  micro-service-scratch charts/micro-service
```
