#!/usr/bin/env bash

# Copyright 2020 Authors of Arktos.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

KUBE_ROOT=$(dirname "${BASH_SOURCE[0]}")/../..
source "${KUBE_ROOT}/hack/lib/common-var-init.sh"

function kill_scheduler_process {
    if [[ $# -eq 0 ]]; then
        echo "The process to kill is not specified."
    else
        port_arg=$((${INSECURE_SCHEDULER_PORT}))
        tag=$(($1))
        # kill a scheduler process listened on a specific port number
        sudo fuser -k $(($port_arg + $tag))/tcp
    fi
}

kill_scheduler_process $@