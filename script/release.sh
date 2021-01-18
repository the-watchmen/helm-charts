#!/bin/bash -x
set -o nounset
set -o errexit

build=${BUILD_DIR:-build}
doc=${DOC_DIR:-docs}
image=${CR_IMAGE:-quay.io/helmpack/chart-releaser}
ver=${CR_VERSION:-v1.0.0-beta.1}
owner=${CR_OWNER:-the-watchmen}
repo=${CR_GIT_REPO:-helm-charts}

echo "begin"

echo "clearing ${build}"
rm -rf ${build}

for dir in charts/* ; do
  echo "packaging ${dir}"
  helm package -d $build $dir
done

echo "running cr upload"
docker run \
  --rm \
  -v $(pwd)/${build}:/${build} \
  -e CR_OWNER=${owner} \
  -e CR_GIT_REPO=${repo} \
  -e CR_PACKAGE_PATH=/${build} \
  -e CR_TOKEN=${CR_TOKEN} \
  ${image}:${ver} \
  cr upload

echo "running cr index"
docker run \
  --rm \
  -v $(pwd)/${build}:/${build} \
  -v $(pwd)/${doc}:/${doc} \
  -e CR_OWNER=${owner} \
  -e CR_GIT_REPO=${repo} \
  -e CR_INDEX_PATH=/${doc}/index.yaml \
  -e CR_CHARTS_REPO=https://${owner}.github.io/${repo} \
  -e CR_PACKAGE_PATH=/${build} \
  ${image}:${ver} \
  cr index

echo "end"