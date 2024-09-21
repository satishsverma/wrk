#!/bin/bash

docker run -i satishsverma/wrk  http://example.com/  > result

docker run -i -v `pwd`:/data satishsverma/wrk  -s script.lua http://example.com/  > result2
