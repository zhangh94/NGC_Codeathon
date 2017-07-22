function [ data ] = GenTestData( nCol, mRow, t, type, options )
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
arr = ones(mRow, nCol);

% TODO: Allow non square matrix
nCol = mRow;

% set boundary function
switch upper(type)
    case 'FIRE'
        a = 1;
        h = 10;
        k = 10;
        funcT = @(x) a*(x - h).^2 + k; % use y = f(x) since matrix is transposed catesian coordinates
    case 'FLOOD'
        
    case 'RADIATION'
        
    case 'FLOOD_RADIATION'
        
    otherwise
        error('Error: Invalid Disaster type')
end

% fill with constant lat lon and alt
for i1 = 1:mRow
    data(1).lat(i1,1:nCol) = options.lat0 + i1*second;
    data(1).lon(1:mRow,i1) = options.lon0 + i1*second;
    data(1).alt(i1,1:nCol) = 30; 
end

% loop through time steps
for i1 = 1:floor(t)
    % fill into struct
    % TODO: Move to only do once
    data(i1).t = i1;

    
    % calculate function boundary 
    % TODO: Test if updating k here will updated function
    
    % update
    for j1 = 1:nCol
       ixL = find(1:1:nCol <= funcT(j1));
       ixR = find(1:1:nCol > funcT(j1));
       data(i1).T(ixL,j1) = options.roomT;
       data(i1).T(ixR,j1) = options.fireT;   
    end
    data(i1).T = NeighborMeanFilter(data(i1).T);
    data(i1).P = 14.4*arr; % set P to 1atm 14.4 PSI
    data(i1).r = 1*arr; % set radiation to 1 micro-sa
    data(i1).V = (options.Vmax - options.Vmin).*rand(nCol,mRow) + options.Vmin;
    data(i1).V = NeighborMeanFilter(data(i1).V);

end

    function output = NeighborMeanFilter(input)
        [rows, cols] = size(input);
        output = input;
        for k1 = 2:rows
            for l1 = 2:cols-1
                if (k1 ==  rows)
                    output(k1,l1) = mean([input(k1-1:k1,l1)' input(k1,l1-1:l1+1)]);
                else
                    output(k1,l1) = mean([input(k1-1:k1+1,l1)' input(k1,l1-1:l1+1)]);
                end
                
            end    
        end
    end


end

