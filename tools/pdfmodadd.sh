#!/bin/bash

for i in $(st -m | grnc html); do add ${i//html/pdf}; done
