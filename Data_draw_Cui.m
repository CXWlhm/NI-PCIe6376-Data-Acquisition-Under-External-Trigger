%--------------------------------------------------------------------------
% This program is a post-process tool for the data produced by the LabView
% program PCIe_6376_Data_Acquisition_Cui.vi which is used for the study
% involved in the article "A Lab-scale Experiment Approach to the 
% Measurement of Wall Pressure from Near-Field under Water Explosions by a 
% Hopkinson bar".
% After the acquisition, a "*.dat" file is generated and its file nane 
% consist of the generation time, the sampling frequency and the number of 
% points which is collected before the NI-PCIe-6376 DAU is triggerred. 
% Firstly, this program decodes the sampling frequency and the number of
% the Pre-trigger points. Then draw the data from the generated "*.dat"
% file and plot the profiles. The X-axis is "ms" and the Y-axis is "V".
%
% Copyright (C) 2019  Xiongwei Cui (cuixiongwei@yahoo.com)
%
% This program is free software; you can redistribute it and/or
% modify it. This program is distributed in the hope that it will be
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITU or FITNESS FOR A PARTICULAR PURPOSE.
%--------------------------------------------------------------------------
clear all
clc;
clf;
dat_names = dir('*.dat');               % Get the names of the "*.dat" files.
dat_names = {dat_names.name};
dat_name = dat_names{end-0};            % Find the newly generated data file.
s_NI = importdata(dat_name);            % Get the data in the data file.
s_find = find(dat_name == '_');
s_start = s_find(end - 1) + 1;
s_find = find(dat_name == 'H');
s_end = s_find(1) - 1;
s_sample_rat = dat_name(s_start:s_end);
sample_rat = str2double(s_sample_rat);  % Get the sampling rate.
dt = 1/sample_rat;                      % Get the sampling interval.

s_find = find(dat_name == '_');
s_start = s_find(end) + 1;
s_find = find(dat_name == 'P');
s_end = s_find(1) - 1;
s_Pre_num = dat_name(s_start:s_end);
Pre_num = str2double(s_Pre_num);        % Get the number of Pre-trigger points.

N = length(s_NI);
t = 1:N;
t = t - Pre_num;
t = t*dt*1000;                          % The X-axis time series.
plot(t,s_NI(:,1),'-b');
hold on
plot(t,s_NI(:,2),'-k');
hold on
plot(t,s_NI(:,3),'-r');
hold on
plot(t,s_NI(:,4),'-g');
hold on
plot(t,s_NI(:,5),'--b');
hold on
plot(t,s_NI(:,6),'--k');
hold on
plot(t,s_NI(:,7),'--r');
hold on
plot(t,s_NI(:,8),'--g');
legend('Ch0','Ch1','Ch2','Ch3','Ch4','Ch5','Ch6','Ch7')