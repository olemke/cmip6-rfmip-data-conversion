#!/bin/bash

[[ ! -d in ]] && mkdir in
[[ ! -d in ]] && exit 1

rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/allCFCs_export in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/allCFCs_LM_export in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/option2_export in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/results/option3_export in/
rsync -av t7:/scratch/uni/u237/users/mbrath/RFMIP_withCFC/atmdata in/

