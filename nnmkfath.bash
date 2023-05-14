#!/bin/bash

docker container run --rm --entrypoint="make" --name "asciidoctor" -it --volume `pwd`:/documents asciidoctor/docker-asciidoctor "html"
