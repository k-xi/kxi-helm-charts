#!/bin/sh
rm -rf target/charts
mkdir -p target/charts
mkdir -p target/dist
cp -r ./kxi-charts/ target/charts/kxi-charts
helm package target/charts/kxi-charts --destination target/dist

cd target/dist
helm upgrade spring-app -i -f ../../kxi-charts/values.yaml -n  spring-app --create-namespace ../charts/kxi-charts