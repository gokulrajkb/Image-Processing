function [ imgout ] = imStitch( img1,img2,adjColor )
[matchLoc1 matchLoc2] = siftMatch(img1, img2);
[H corrPtIdx] = findHomography(matchLoc2',matchLoc1');
H  %#ok
tform = maketform('projective',H');
img21 = imtransform(img2,tform); % reproject img2
[M1 N1 dim] = size(img1);
[M2 N2 dim] = size(img2);

% do the mosaic
pt = zeros(3,4);
pt(:,1) = H*[1;1;1];
pt(:,2) = H*[N2;1;1];
pt(:,3) = H*[N2;M2;1];
pt(:,4) = H*[1;M2;1];
x2 = pt(1,:)./pt(3,:);
y2 = pt(2,:)./pt(3,:);

up = round(min(y2));
Yoffset = 0;
if up <= 0
	Yoffset = -up+1;
	up = 1;
end

left = round(min(x2));
Xoffset = 0;
if left<=0
	Xoffset = -left+1;
	left = 1;
end

[M3 N3 dim] = size(img21);
imgout(up:up+M3-1,left:left+N3-1,:) = img21;
	% img1 is above img21
imgout(Yoffset+1:Yoffset+M1,Xoffset+1:Xoffset+N1,:) = img1;

end

