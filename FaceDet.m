%%MATLAB Code for R2013a (Code needs revision for newer versions) for boxing faces in a mp4 file file.mp4, saving it in AVI format as Detected_One
videoFReader = vision.VideoFileReader('input.mp4');
Videra=VideoReader('input.mp4');
numFr=Videra.NumberOfFrames;
frmRa=Videra.FrameRate;
writerObj = VideoWriter('output');
writerObj.FrameRate = frmRa;
open(writerObj);
faceDetector = vision.CascadeObjectDetector();
for i=1:numFr
    display(i);
    videoFrame = step(videoFReader);
    bbox= step(faceDetector, videoFrame);
    for j=1:size(bbox,1)
    xbox=bbox(j,:);
    subImage = imcrop(videoFrame, xbox);
    H = fspecial('disk',10);
    blurred = imfilter(subImage,H,'replicate');
videoFrame(xbox(2):xbox(2)+xbox(4),xbox(1):xbox(1)+xbox(3),1:end) = blurred; 
end
    writeVideo(writerObj,videoFrame);
close(figure);

end

release(videoFReader);
close(writerObj);
