#!/bin/bash

docker run -p 9000:8888 -it --rm -v $(pwd):/work gnucash-playground
