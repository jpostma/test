#!/bin/bash
find . -type f -name *,v -print -exec perl -p -i -e s/\r\n/\n/g {} ;
