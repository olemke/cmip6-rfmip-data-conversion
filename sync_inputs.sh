#!/bin/bash

[[ ! -d in ]] && mkdir in
[[ ! -d in ]] && exit 1

rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/allCFCs in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/allCFCs_LM in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/option2 in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/option3 in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/atmdata in/

