# helm-charts

![](https://github.com/the-watchmen/helm-charts/workflows/release/badge.svg)

basic generic helm charts

## appendix

```
docker run \
  --rm \
  -v /Users/tony/git/helm-charts/build:/build \
  -e CR_OWNER=the-watchmen \
  -e CR_GIT_REPO=helm-charts \
  -e CR_PACKAGE_PATH=./build \
  -e CR_INDEX_PATH=./build/index.yaml \
  -e CR_CHARTS_REPO=https://the-watchmen.github.io/helm-charts \
  -e CR_TOKEN=$CR_TOKEN \
  quay.io/helmpack/chart-releaser:v1.0.0-beta.1 \
  cr index
```

### vault

currently hashicorp does not publish vault helm chart, so cloning it out here to publish...

```
git clone --single-branch --branch v0.5.0 git@github.com:hashicorp/vault-helm.git charts/vault
rm -rf charts/vault/.git
```
