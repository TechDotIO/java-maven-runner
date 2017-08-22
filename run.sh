#!/bin/bash
compilationExitCode=0
executionExitCode=0

JARS_DIR="/project/target/jars"
WORKSPACE_DIR="/project/workspace"

cd ${TECHIO_RUN_DIR}

classpath=$(echo ${JARS_DIR}/*.jar | tr ' ' ':')

find * -name "*.java" -print0 | xargs -0 /usr/src/codingame/java-compiler/cgjavac -Xlint:all -cp "$classpath" -d "${WORKSPACE_DIR}"
compilationExitCode=$?

if [ $compilationExitCode -eq 0 ]; then
	java -cp "${WORKSPACE_DIR}:$classpath" $*
else
	exit $compilationExitCode
fi
