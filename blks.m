function blks(bb)
mkdir ss
Image=bb;
Fimage=Image;
smooth(Image,8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = './aa';
ext = '.jpg';
for i = 1:1:25
    s1=int2str(i);
    s2=strcat(s1,ext);
    s3=strcat(f,s2);
 movefile (s3,'./ss/');
end
%************************************************************************************
smooth(Image,3);
f = './ab';
ext = '.jpg';
for i = 1:1:25
    s1=int2str(i);
    s2=strcat(s1,ext);
    s3=strcat(f,s2);
 movefile (s3,'./ss/');
end
%************************************************************************************
smooth(Image,2);
f = './ac';
ext = '.jpg';
for i = 1:1:25
    s1=int2str(i);
    s2=strcat(s1,ext);
    s3=strcat(f,s2);
 movefile (s3,'./ss/');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c=Fimage;   
s='ad';
ext='.jpg';
for i = 1:1:50
    s1=int2str(i);
    s2=strcat(s1,ext);
    s3=strcat(s,s2);
%   movefile (s3,'./ss/');
cc=imresize(c, [712 712]);
imwrite(cc,s3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% delete *.jpg

f = './ad';                               
ext = '.jpg';
for i = 1:1:50
    s1=int2str(i);
    s2=strcat(s1,ext);
    s3=strcat(f,s2);
  movefile (s3,'./ss/');

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delete *.jpg;
img2vid;
%   q=1;
end


