function [descriptors, locs] = sift(img)
if ndims(img)
   img = rgb2gray(img);
end
bn=load('f.txt');
if bn < 10
 error('No.of Frames Should be more than 10');   
end
    
[rows, cols] = size(img); 
f = fopen('tmp.pgm', 'w');
if f == -1
    error('Could not create file tmp.pgm.');
end
fprintf(f, 'P5\n%d\n%d\n255\n', cols, rows);
fwrite(f, img', 'uint8');
fclose(f);

command = '!siftWin32 ';

command = [command ' <tmp.pgm >tmp.key'];
eval(command);
% Open tmp.key and check its header
g = fopen('tmp.key', 'r');
if g == -1
    error('Could not open file tmp.key.');
end
[header, count] = fscanf(g, '%d %d', [1 2]);

num = header(1);
len = header(2);

locs = double(zeros(num, 4));
descriptors = double(zeros(num, 128));
% Parse tmp.key
for i = 1:num
    [vector, count] = fscanf(g, '%f %f %f %f', [1 4]); %row col scale ori
    locs(i, :) = vector(1, :);
  
    [descrip, count] = fscanf(g, '%d', [1 len]);

    % Normalize each input vector to unit length
    descrip = descrip / sqrt(sum(descrip.^2));
    descriptors(i, :) = descrip(1, :);
end
fclose(g);
delete('tmp.pgm');
