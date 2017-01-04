%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%% preparation
close all

%% choose sky & guide
sky = im2double(imread('sky.jpg'));
guide = im2double(imread('guide/guide10.jpg'));
%% input1
in = im2double(imread('input/input1.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input2
in = im2double(imread('input/input2.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input3
in = im2double(imread('input/input3.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input4
in = im2double(imread('input/input4.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input5
in = im2double(imread('input/input5.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input6
in = im2double(imread('input/input6.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input7
in = im2double(imread('input/input7.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input8
in = im2double(imread('input/input8.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input9
in = im2double(imread('input/input9.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
%% input10
in = im2double(imread('input/input10.jpg'));
out1 = unnamed(in,guide);
out2 = pasteSky(out1,sky,findSky(in));
