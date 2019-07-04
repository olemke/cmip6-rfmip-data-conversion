# /usr/bin/env python3

import numpy as np
import typhon.arts.xml as axml
from netCDF4 import Dataset


def convert_arts_to_nc(casename, physics_index=1, forcing_index=1):
    if casename.startswith('option'):
        fluxes = axml.load(
            f'in/{casename}_export/fluxes.{casename}.level_input_{casename}.xml')
    else:
        fluxes = axml.load(f'in/{casename}_export/fluxes.{casename}.level_input.xml')
    fluxes = np.array(fluxes).reshape(18, 100, 61, 3)
    fluxes = np.flip(fluxes, 2)

    with Dataset(
            f'out/rld_Efx_ARTS-2-3_rad-irf_r1i1p'
            f'{physics_index}f{forcing_index}_gn.nc', 'a') as ds:
        ds['rld'][:] = -fluxes[:, :, :, 2]
        ds.physics_index = np.int32(physics_index)

    with Dataset(
            f'out/rlu_Efx_ARTS-2-3_rad-irf_r1i1p'
            f'{physics_index}f{forcing_index}_gn.nc', 'a') as ds:
        ds['rlu'][:] = fluxes[:, :, :, 1]
        ds.physics_index = np.int32(physics_index)


if __name__ == '__main__':
    convert_arts_to_nc('allCFCs')
    convert_arts_to_nc('allCFCs_LM', physics_index=2)
    convert_arts_to_nc('option2', forcing_index=2)
    convert_arts_to_nc('option3', forcing_index=3)
