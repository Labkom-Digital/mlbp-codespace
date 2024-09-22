#!/bin/bash
docker login -u labkomdigital
docker build -t labkomdigital/mlbp-codespace:latest .devcontainer
docker push labkomdigital/mlbp-codespace:latest