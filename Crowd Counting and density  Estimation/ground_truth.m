%Changes the resolution of image files to 1024*768 to make them compatible
%with ShanghaiTech dataset part_B 

%Generates ground truth .mat files for each image file using head
%annotations

clear all
clc
close all
filePattern = fullfile('D:\FYP\gt\dataset\frames\images_8\', '/*.jpg');
ImageFiles = dir(filePattern);
n = length(ImageFiles)
read_path = 'D:\FYP\gt\dataset\frames\images_8\';
store_path = 'D:\FYP\gt\dataset\frames\ground_truth\';
t = 173;                          %number of files initially in training set

for i=1:n
    im = imread([read_path 'IMG_' num2str(i+t) '.jpg']);
    im = imresize(im, [480 640]);
    imwrite(im,[read_path 'IMG_' num2str(i+t) '.jpg'], 'jpg'); 
    figure
    imshow(im)
    [x,y] = getpts;
    image_info{1,1}.location = [x y];
    image_info{1,1}.number = size(x,1);
    save([store_path 'GT_IMG_' num2str(t+i) '.mat'], 'image_info')
    close
end
