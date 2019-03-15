# /usr/bin/env python3

import numpy as np
import typhon.arts.xml as axml
from netCDF4 import Dataset


def convert_arts_to_nc():
    fluxes = axml.load('in/allCFCs/fluxes.allCFCs.level_input.xml')
    fluxes = np.array(fluxes).reshape(100, 18, 61, 3)
    fluxes = np.swapaxes(fluxes, 0, 1)
    fluxes = np.flip(fluxes, 2)

    with Dataset('out/rld_Efx_ARTS-2-3_rad-irf_r1i1p1f1_gn.nc', 'a') as ds:
        ds['rld'][:] = fluxes[:, :, :, 2]
    with Dataset('out/rlu_Efx_ARTS-2-3_rad-irf_r1i1p1f1_gn.nc', 'a') as ds:
        ds['rlu'][:] = fluxes[:, :, :, 1]


if __name__ == '__main__':
    convert_arts_to_nc()
