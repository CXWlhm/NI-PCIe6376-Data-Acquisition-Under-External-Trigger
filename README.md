# NI-PCIe6376-Data-Acquisition-Under-External-Trigger
A program used to data acquisition based on NI-PCIe-6376 DAU coupled with BNC-2110 BNC adapter, as well as the post-process tool in MATLAB code.

The LabVIEW code "PCIe_6376_Data_Acquisition_Cui.vi" is used to drive the NI-PCIe-6376 DAQ card. In the code, the rising-edge triggering signal is imported through the PFI 0 port of the BNC-2110 adapter. By default, eight channels work at ± 10V range. Ofcourse the range can be changed as required. The delay time is set as 30s by default. 

The path of the gereated data file is the path where the LabVIEW code is located and the file type is .dat. The name of the genreated data file consists of three important parameters: the time when the file is gernerated, the frequency at which the data is sampled and the number of the pre-trigger points. For example, '20190701_123030_3500000HZ_2000Pre.dat' means the data is sampled at 12:30:30 am on July 1st 2019 at 3.5MHz sampling frequency with 2000 pre-trigger sampling points. The file name is extremely important for three important parameters are encoded. So do not change it if it is not required.

The post-process tool "Data_draw_Cui.m" is written to draw the data in the generated data file. This program decodes the sampling frequency and the number of the Pre-trigger points. Then draw the data from the generated "*.dat" file and plot the profiles. The X-axis is "ms" and the Y-axis is "V".

Copyright (C) 2019  Xiongwei Cui (cuixiongwei@yahoo.com).

These two codes or programs have been validated in the study of the article "A Lab-scale Experiment Approach to the Measurement of Wall Pressure from Near-Field under Water Explosions by a Hopkinson bar".

This program is free software; you can redistribute it and/or modify it. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITU or FITNESS FOR A PARTICULAR PURPOSE.This program is free software; you can redistribute it and/or modify it. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITU or FITNESS FOR A PARTICULAR PURPOSE.
