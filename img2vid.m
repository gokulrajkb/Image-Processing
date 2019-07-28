clear
myFolder = 'ss'; %Specify Directory
filePattern = fullfile(myFolder, '*.jpg') %identify jpg files
jpegFiles = dir(filePattern) %use dir to list jpg files
size = length(jpegFiles); % length of the size of the file

outputVideo = VideoWriter(fullfile(myFolder,'video1.avi'));
outputVideo.FrameRate = 30;
open(outputVideo);


for i = 1:length(jpegFiles) %load all the files in the directory
  j = i; %%accumulating the number of jpegfiles into handles.j
  baseFileName = jpegFiles(i).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName); %image being read
  imagecell{i} = imageArray; %storing the images in imagecells
  writeVideo(outputVideo,imagecell{i});
end
cd ss
delete *.jpg;
cd(['..']);
delete *.jpg;
% command = 'cd';
% status = dos(command)

close(outputVideo);
video1 = VideoReader(fullfile(myFolder,'video1.avi'));

mov(video1.NumberOfFrames) = struct('cdata',[],'colormap',[]);

for ii = 1:video1.NumberOfFrames
    mov(ii) = im2frame(read(video1,ii));
end

set(gcf,'position', [150 150 video1.Width video1.Height])
set(gca,'units','pixels');
set(gca,'position',[0 0 video1.Width video1.Height])

image(mov(1).cdata,'Parent',gca);
axis off;

movie(mov,1,video1.FrameRate);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55