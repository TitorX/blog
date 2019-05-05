#!/bin/bash

docker run -it --rm -v "$PWD":/blog -p 4000:4000 haocen/hexo-with-hexo-hey bash -c "hexo clean && hexo g"
aws s3 sync public s3://blog.nodes.studio --acl public-read
