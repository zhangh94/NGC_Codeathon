% script to run functions to generate the correct data sets
close all; clear; clc; format compact
options.lat0 = 37.421;
options.lon0 = 141.029;
options.fireT = 800; % [F]
options.roomT = 90; % [F]
options.Vmax = 15; % [mph]
options.Vmin = 10; %[mph]
data = GenTestData(25,25,1,'FIRE',options);
OutputJsonVars( data, 'FireData' );