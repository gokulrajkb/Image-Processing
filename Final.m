fID = fopen('f.txt','w');
fclose(fID);
clear
close all
vid1=VideoReader('1.mp4');
%  numFrames = vid1.NumberOfFrames;
 n=10;
 for i = 1:1:n
 frames = read(vid1,i);
 imwrite(frames,['vid' int2str(i), '.jpg']);
 im(i)=image(frames);
 end
fID = fopen('f.txt','a+');
fprintf(fID,'%d',n);
fclose(fID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
close all
 n=load('f.txt');
 vid2=VideoReader('2.mp4');
 for i = 1:1:n
 frames = read(vid2,i);
 imwrite(frames,['mov' int2str(i), '.jpg']);
 im(i)=image(frames);
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
mkdir('0');
movefile ('*.jpg','./0/');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 clear
  n=load('f.txt');
 f1 = '0/vid';
f2 = '0/mov';
ext = 'jpg';
 for i = 1:1:n
    s1='.';
    s2=int2str(i);
    s3='img';
    s=strcat(s2,s1);
    s4=strcat(s3,s2);
img1 = imread([f1 s ext]);
img2 = imread([f2 s ext]);
s4 = imStitch(img2,img1,1);
imwrite(s4,['mosaic_' s2 '.' ext],ext)
 end

 mkdir('out');
 movefile ('*.jpg','./out/');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
clear
 n=load('f.txt');
f = 'out/mosaic_';
ext = 'jpg';
for i = 1:1:n
    s1='.';
    s2=int2str(i);
    s3='img';
    s=strcat(s2,s1);
    s4=strcat(s3,s2);
a = imread([f s ext]);
c=imresize(a, [712 712]);
%    for j = 1:1:2
%        s5=int2str(j);
%        s6=strcat(s2,s5);
   imwrite(c,['preFinal_'  s2 '.' ext],ext)
%    end
end
 mkdir('preFinal');
 movefile ('*.jpg','./preFinal/');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stablize;
clear
nn=load('f.txt');
f = 'Final/Final_';
ext = 'jpg';
% for q=nn:1:nn
s1='.';
s2=int2str(nn);
s3='img';
s=strcat(s1,ext);
s4=strcat(s2,s);
s5=strcat(f,s4);
a = imread(s5);
blks(a); 
% end
