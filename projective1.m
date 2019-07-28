function [f inlierIdx] = projective1( x,y,ransacCoef,projctMAT,projctDist )
minPtNum = ransacCoef.minPtNum;
iterNum = ransacCoef.iterNum;
thInlrRatio = ransacCoef.thInlrRatio;
thDist = ransacCoef.thDist;
ptNum = size(x,2);
thInlr = round(thInlrRatio*ptNum);

inlrNum = zeros(1,iterNum);
fLib = cell(1,iterNum);

for p = 1:iterNum
	
	sampleIdx = projectiveIndex(ptNum,minPtNum);
	f1 = projctMAT(x(:,sampleIdx),y(:,sampleIdx));
	
	dist = projctDist(f1,x,y);
	inlier1 = find(dist < thDist);
	inlrNum(p) = length(inlier1);
	if length(inlier1) < thInlr, continue; end
	fLib{p} = projctMAT(x(:,inlier1),y(:,inlier1));
end


[dim,idx] = max(inlrNum);
f = fLib{idx};
dist = projctDist(f,x,y);
inlierIdx = find(dist < thDist);
	
end