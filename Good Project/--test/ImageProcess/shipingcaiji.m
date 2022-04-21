clc;
clear;
vid=imaq.VideoDevice('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
boxInserter=vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[255 255 0]);
videoPlayer=vision.VideoPlayer();
faceDetector=vision.CascadeObjectDetector();


for i=1:300

    videoFrame=step(vid);
    bbox=step(faceDetector,videoFrame);
    videoFrame=insertShape(videoFrame,'Rectangle',bbox);
    videoOut=step(boxInserter,videoFrame,bbox);
    step(videoPlayer,videoOut);

end
   