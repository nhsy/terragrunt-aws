#!/bin/bash
# Execute terraform init in each subfolder
for dir in bootstrap network compute
do \
  echo Initialising ../platform/$dir
  (cd ../platform/$dir && terragrunt init)
done
