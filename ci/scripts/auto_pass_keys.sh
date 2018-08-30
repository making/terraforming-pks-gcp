#!/bin/bash
root=$PWD
propsDir="$root/keyvalout"
propsFile="${propsDir}/keyval.properties"
if [ -d "$propsDir" ]
then
  touch "$propsFile"
  echo "Setting key values for next job in ${propsFile}"
  while IFS='=' read -r name value ; do
    if [[ $name == 'PASSED_'* ]]; then
      echo "Adding: ${name}=${value}"
      echo "${name}=${value}" >> "$propsFile"
    fi
  done < <(env)
fi