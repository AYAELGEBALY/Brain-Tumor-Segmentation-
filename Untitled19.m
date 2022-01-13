%% start 
close all
clear all
clc

%% Load the image 

input_image = imread('mri_img.png');


%% obtain the three color channels and assign them to zero to get rid of all of the elements

Red_slide   = 0*input_image(:,:,1);
Green_slide = 0*input_image(:,:,2);
Blue_slide  = 0*input_image(:,:,3);


%% Then use find function to assign the wanted elements 
r = find(input_image(:,:,1)>=110);
g = find(input_image(:,:,2)<=49);
b = find(input_image(:,:,3)<=31);

Red_slide(r)   = 1;
Green_slide(g) = 1;
Blue_slide(b)  = 1;

%% Use element-wise multiplication to make a composition of the three layers 
segmentation_mask = Red_slide.*Green_slide.*Blue_slide; %to take the intersection of matrix
segmentation_mask_3d(:,:,1) = segmentation_mask;
segmentation_mask_3d(:,:,2) = segmentation_mask;
segmentation_mask_3d(:,:,3) = segmentation_mask;
%the segmetation mask consist of only ones and zeroes

%% the segmention of the image
output_image = segmentation_mask_3d.*input_image;

%% use subplot to show Original Image, Segmentation Mask and Segmented Image side by side
figure,subplot(1,3,1),imshow(input_image),title('Original Image','fontsize',12)
subplot(1,3,2),imshow(1000*segmentation_mask),title('Segmentation Mask','fontsize',12)
subplot(1,3,3),imshow(output_image),title('Segmented Image','fontsize',12)
 

