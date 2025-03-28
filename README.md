# Raccoon Hardware Implementations
This is the hardware implementation of Raccoon, which is a slef-masking PQC in NIST addition DSA round 1. This implementation combines the three security levels and two mask levels (no-masking and first order-masking) in Raccoon.
This project includes three subfolders, namely rtl files, .coe files and .xci files. The .coe files contain the twiddle factors required by NTT in Raccoon. The .xci files contain the Vivado IP we used in this project (BRAM, DSP, Shift_reg and so on). 

The source codes are for academic use only.

