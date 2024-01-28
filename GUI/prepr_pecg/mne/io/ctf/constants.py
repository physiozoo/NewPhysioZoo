"""CTF constants."""

# Authors: Matti Hämäläinen <msh@nmr.mgh.harvard.edu>
#          Eric Larson <larson.eric.d@gmail.com>
#
# License: BSD-3-Clause

from ...utils import BunchConst


CTF = BunchConst()

# ctf_types.h
CTF.CTFV_MAX_AVERAGE_BINS = 8
CTF.CTFV_MAX_COILS = 8
CTF.CTFV_MAX_BALANCING = 50
CTF.CTFV_SENSOR_LABEL = 31

CTF.CTFV_COIL_LPA = 1
CTF.CTFV_COIL_RPA = 2
CTF.CTFV_COIL_NAS = 3
CTF.CTFV_COIL_SPARE = 4

CTF.CTFV_REF_MAG_CH = 0
CTF.CTFV_REF_GRAD_CH = 1
CTF.CTFV_MEG_CH = 5
CTF.CTFV_EEG_CH = 9
CTF.CTFV_STIM_CH = 11

CTF.CTFV_FILTER_LOWPASS = 1
CTF.CTFV_FILTER_HIGHPASS = 2

# read_res4.c
CTF.FUNNY_POS = 1844

# read_write_data.c
CTF.HEADER_SIZE = 8
CTF.BLOCK_SIZE = 2000
CTF.SYSTEM_CLOCK_CH = 'SCLK01-177'