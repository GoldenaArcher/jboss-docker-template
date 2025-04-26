#!/bin/bash

set -e 

echo "🧨 Step 1: Shutting down any existing containers..."
docker compose down

echo "🔧 Step 2: Building jboss-mock module with Maven..."
cd jboss-mock
mvn clean install
cd ..

echo "✅ Maven build completed. Artifacts generated in: deployments/"

WAR_SOURCE="./jboss-mock/webapp/target/webapp-1.0.0.war"
WAR_DEST="./deployments/jboss-mock/webapp-1.0.0.war"

if [ -f "$WAR_SOURCE" ]; then
  echo "📦 Copying WAR from $WAR_SOURCE to $WAR_DEST"
  cp "$WAR_SOURCE" "$WAR_DEST"
else
  echo "❌ Cannot find built WAR at $WAR_SOURCE"
  exit 1
fi

touch "${WAR_DEST}.dodeploy"

echo "🚀 Step 3: Starting container services..."
./start.sh

echo ""
echo "🎉 Done! You can now visit your app at:"
echo "🔗 http://localhost:8080/webapp-1.0.0/"
echo "🔗 http://localhost:8180/webapp-1.0.0/"
