function smooth(im,colm)

Image=im;

n =1; 
m =colm;
a='a'; 
if m==8
    kk='a';
end
if m==3
    kk='b';
end
if m==2
    kk='c';
end

Image = imresize(Image, [712 712]); 

rf = floor(712/n); 
cf = floor(712/m); 
m=1;
for v = 1:n
for s = 1:m %nXm files need to be made
startr = (v-1)*rf;
startc = (s-1)*cf;
for i = 1 : rf
for j = 1 : cf
for k = 1:3 %loop for RGB values

Img1(i,j,k) = Image(startr+i, startc+j,k);
end
end
end

a = strcat(a,kk); 
NewImage = a; 
  for p=1:1:25
      ss=int2str(p);
      sss=strcat(a,ss);
      s4 = strcat(sss,'.jpg');
      cc=imresize(Img1, [712 712]);
      imwrite( cc, s4);
  end

end
end

end