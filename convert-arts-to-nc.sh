#!/bin/bash

[[ ! -d out ]] && mkdir out
[[ ! -d out ]] && exit 1

ln -sf in/atmdata/multiple_input4MIPs_radiation_RFMIP_UColorado-RFMIP-1-2_none.nc

./generate-output-file-templates.py --physics_index=1 --source_id ARTS-2-3
./generate-output-file-templates.py --physics_index=2 --source_id ARTS-2-3
./generate-output-file-templates.py --physics_index=1 --forcing_index=2 --source_id ARTS-2-3
./generate-output-file-templates.py --physics_index=1 --forcing_index=3 --source_id ARTS-2-3
rm -f rs[du]_Efx_ARTS-2-3_rad-irf_r1i1p[12]f[123]_gn.nc
mv rl[du]_Efx_ARTS-2-3_rad-irf_r1i1p[12]f[123]_gn.nc out/

python convert2nc.py

