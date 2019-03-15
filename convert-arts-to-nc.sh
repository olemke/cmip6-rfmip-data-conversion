#!/bin/bash

[[ ! -d out ]] && mkdir out
[[ ! -d out ]] && exit 1

ln -sf in/atmdata/multiple_input4MIPs_radiation_RFMIP_UColorado-RFMIP-1-1_none.nc

./generate-output-file-templates.py --source_id ARTS-2-3 
rm -f rs[du]_Efx_ARTS-2-3_rad-irf_r1i1p1f1_gn.nc
mv rl[du]_Efx_ARTS-2-3_rad-irf_r1i1p1f1_gn.nc out/

python convert2nc.py

