function [ struct ] = GenTestData( nCol, mRow, t, type, options )
%FUNCTION to generate test data for a scenario of 'type' for t seconds
%   Inputs
%       nCol - number of columns for output data 
%       nRow - number of rows for output data
%       t - time in integer seconds to generate test data for
%       type - scenario type to generate test data for
%       options - option to customize generated data
%           lat0 - starting lat [deg]
%           lon0 -  starting lon [deg]
%           dist -  

% store constant for 1 second of latitude
second = 0.00027778;

% allocate array
arr = zeros(nRow, nCol);

% set boundary function
switch uppertype
    case 'FLOOD'
        func = @(x,t) 
    case 'FIRE'
        
    case 'RADIATION'
        
    case 'FLOOD_RADIATION'
        
    otherwise
        error('Error: Invalid Disaster type')
end

% loop through time steps
for i1 = 1:floor(t)
    % fill into struct
    data(i1).t = i1;
    data(i1).lat
    data(i1).lon
    data(i1).alt
    
    % calculate function boundary 
    
    % update
    data(i1).T
    data(i1).P
    data(i1).r
    data(i1).V


end

    function fun1()
        
    end


end

