#!/bin/bash

set -o pipefail
set -eu

a=`wc -l < settings.xml`
result=`expr $a - 1`

echo "$result"

sed -i "$result i\\		<profile>\\" $1
sed -i "`expr $result + 1`i\\			<id>$2</id>\\" $1
sed -i "`expr $result + 2`i\\			<properties>\\" $1
sed -i "`expr $result + 3`i\\				<profile.name>Fuse-$2</profile.name>\\" $1
sed -i "`expr $result + 4`i\\		   		<fuse.version>$2</fuse.version>\\" $1
sed -i "`expr $result + 5`i\\				<fuse.image.version>$3</fuse.image.version>\\" $1
sed -i "`expr $result + 6`i\\				<fuse.ignite.operator.manifest.dir>/manifests/$4</fuse.ignite.operator.manifest.dir>\\" $1
sed -i "`expr $result + 7`i\\				<fuse.ignite.operator.cluster.service.spec.version>$4</fuse.ignite.operator.cluster.service.spec.version>\\" $1
sed -i "`expr $result + 8`i\\				<fuse.ignite.operator.cluster.service.clusterServiceVersion>manifests/$4/fuse-online-operator.v$4.clusterserviceversion.yaml</fuse.ignite.operator.cluster.service.clusterServiceVersion>\\" $1
sed -i "`expr $result + 9`i\\				<fuse.ignite.operator.config>/conf/config.yaml</fuse.ignite.operator.config>\\" $1
sed -i "`expr $result + 10`i\\				<fuse.ignite.operator.upstream>$5</fuse.ignite.operator.upstream>\\" $1
sed -i "`expr $result + 11`i\\			</properties>\\" $1
sed -i "`expr $result + 12`i\\		</profile>\\" $1

b=`wc -l < settings.xml`
echo "$b"
cat settings.xml