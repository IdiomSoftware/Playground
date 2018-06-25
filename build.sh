#!/usr/bin/env bash

#exit if any command fails
set -e

cd $TRAVIS_BUILD_DIR/Website

artifactsFolder="./artifacts"

if [ -d $artifactsFolder ]; then  
  rm -R $artifactsFolder
fi

dotnet restore Website.sln
dotnet build Website.sln -c Release

revision=${TRAVIS_JOB_ID:=1}  
revision=$(printf "%04d" $revision) 

dotnet pack Website.sln -c Release -o $artifactsFolder --version-suffix=$revision  