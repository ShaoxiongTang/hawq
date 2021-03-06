#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

hadoop fs -rm -r $2

export HADOOP_CLASSPATH=target/test-classes:target/hawq-mapreduce-parquet-1.0.0.jar:../hawq-mapreduce-common/target/hawq-mapreduce-common-1.0.0.jar:lib/parquet-column-1.3.2.jar:lib/parquet-common-1.3.2.jar:lib/parquet-encoding-1.3.2.jar:lib/parquet-hadoop-1.3.2.jar:lib/parquet-format-1.0.0.jar

# enable debug
# export HADOOP_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5002"
hadoop com.pivotal.hawq.mapreduce.parquet.HAWQParquetInputDriver -conf conf/hadoop-localjob.xml $1 $2
