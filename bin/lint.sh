#!/bin/bash

ROOT=$(dirname $0)/../

our_modules=( "hdo" "ruby" "passenger" )
log_format="%{fullpath}:%{linenumber} %{KIND} %{message}"

code=0

for mod in "${our_modules[@]}"
do
  puppet-lint --log-format "${log_format}" --no-double_quoted_strings-check "${ROOT}/puppet/modules/${mod}"

  ret=$?
  [[ "${code}" != "1" ]] && code="${ret}"
done

exit "${code}"