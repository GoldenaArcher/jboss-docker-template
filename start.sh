#!/bin/bash

set -e

echo "🔍 Checking if containers are already running..."
if docker ps -q --filter name=jboss | grep -q . || docker ps -q --filter name=wildfly | grep -q .; then
  echo "⚠️  Containers already running. Skipping start."
else
  echo "🚀 Starting JBoss and WildFly containers..."
  docker compose up --build -d
  echo "✅ Services started!"
  echo "   - JBoss:    http://localhost:8080"
  echo "   - WildFly:  http://localhost:8180"
fi
