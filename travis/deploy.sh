#!/usr/bin/env bash
#
# Copyright 2018-2019 The OpenZipkin Authors
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#

set -x

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
GH_PAGES_BRANCH="gh-pages"
git switch $GH_PAGES_BRANCH
git restore -s master -- zipkin-api.yaml.js
git restore -s master -- zipkin2-api.yaml.js
git restore -s master -- zipkin.proto

git commit -m "$1"
git push origin $GH_PAGES_BRANCH

git checkout $CURRENT_BRANCH
