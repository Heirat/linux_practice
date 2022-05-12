#!/bin/bash

cd "$(dirname "$1")"
dirname=$(pwd)

echo "$dirname/$(basename "$1")"
