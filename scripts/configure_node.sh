#!/bin/bash
ROLE=$1
JVM_HEAP="4g"

mkdir -p /etc/elasticsearch
echo "node.roles: [\"$ROLE\"]" > /etc/elasticsearch/elasticsearch.yml
echo "-Xms${JVM_HEAP}" > /etc/elasticsearch/jvm.options
echo "-Xmx${JVM_HEAP}" >> /etc/elasticsearch/jvm.options
