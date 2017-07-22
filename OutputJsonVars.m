function [ ] = OutputJsonVars( data, filename )
%Generate data for wildfire case and write to filename

t = jsonencode(data);
fid = fopen(filename, 'w');
fprintf(fid, t);
fclose(fid);

end

