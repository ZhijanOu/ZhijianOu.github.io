% clc;clear;close all;
% filename=fstr;
% filename='1339254';
% filename='2315143';
% filename='2346403';
% filename='1517027';
% run start_up.m;
filename='Mv97626c';

% Define variables
Tw = 25;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)
alpha = 0.97;           % preemphasis coefficient
M = 20;                 % number of filterbank channels 
C = 12;                 % number of cepstral coefficients
L = 22;                 % cepstral sine lifter parameter
LF = 300;               % lower frequency limit (Hz)
HF = 3700;              % upper frequency limit (Hz)
wav_file = [filename,'.wav'];  % input audio filename
ans_file = [filename,'.txt'];


% Read speech samples, sampling rate and precision from file
[ speech, fs, nbits ] = wavread( wav_file );
% speech=speech(1:200000);

% Feature extraction (feature vectors as columns)
[ MFCCs, FBEs, frames ] = mfcc( speech, fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
MFCCs=MFCCs(2:13,:);