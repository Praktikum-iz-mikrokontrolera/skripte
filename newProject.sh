#!/bin/bash
cp -r ~/.pim/project-template project
cd project/build
cmake -DUPLOAD_METHOD=PYOCD ..
make -j2 hello_world
