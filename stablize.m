f = 'preFinal/preFinal_';
ext = 'jpg';
n=load('f.txt');
for i = 1:1:n
    s1='.';
    s2=int2str(i);
    s3='img';
    s=strcat(s2,s1);
    s4=strcat(s3,s2);
inp = imread([f s ext]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
sigma=5;

K=0;
for x1=-2:2
    for x2=-2:2
        K=K+exp(-(x1.^2+x2.^2)/(2*sigma^2));
    end
end
K=1/K;
p=1;
for x1=-2:2
    q=1;
    for x2=-2:2
        G(p,q)=K.*exp((x1.^2+x2.^2)/(-2*sigma^2));
        q=q+1;
    end
    p=p+1;
end

w = imfilter(inp,G,'conv','symmetric');


img=deconvlucy(w,G);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
x=rgb2ntsc(img);
x(:,:,1)=histeq(x(:,:,1));
c2=ntsc2rgb(x);


rimg=histeq(img(:,:,1));
gimg=histeq(img(:,:,2));
bimg=histeq(img(:,:,3));
img=cat(3,rimg,gimg,bimg);


imwrite(img,['Final_' s2 '.' ext],ext)
end
 mkdir('Final');
 movefile ('*.jpg','./Final/');