% Recoding own voice
%%% Originally sampled at 44.1kHz and digitized at 24 bits
recordVoice = audiorecorder(44100, 24, 1);
disp('Start Recording! Record for 5 seconds');
recordblocking(recordVoice, 5); % Record your sound for 5 seconds
disp('End of Recording');
% %%% Recording done, Now saving the recording to a file
myrec = getaudiodata(recordVoice);
audiowrite('myRec.wav', myrec, 44100);

% Part (ii): Resampling of audio data
% Reading the audio from myRec.wav
[y, Fs] = audioread('myRec.wav');
% Resampling the audio data

% sampling frequencies
Fs1 = 44100;
Fs2 = 24000;
Fs3 = 16000;
Fs4 = 8000;
Fs5 = 4000;

disp('Playing Original Sound');
sound(y, Fs);
pause(size(y)/Fs);

% for Fs2
% duration of the input track
tim = length(myrec) / Fs1;
resample_new = zeros(tim * Fs2, 1);
% linspace equally divides the segment given
idx = round(linspace(1, length(myrec), length(resample_new)));
resample_new = myrec(idx);
sound(resample_new, Fs2);
pause(size(resample_new)/Fs2);

% % for Fs3
% % duration of the input track
% tim_Fs3 = length(myrec) / Fs1;
% resample_new = zeros(tim_Fs3 * Fs3, 1);
% % linspace equally divides the segment given
% idx = round(linspace(1, length(myrec), length(resample_new)));
% resample_new = myrec(idx);
% sound(resample_new, Fs3);
% pause(size(resample_new)/Fs3);
% 
% % for Fs4
% % duration of the input track
% tim_Fs4 = length(myrec) / Fs1;
% resample_new = zeros(tim_Fs4 * Fs4, 1);
% % linspace equally divides the segment given
% idx = round(linspace(1, length(myrec), length(resample_new)));
% resample_new = myrec(idx);
% sound(resample_new, Fs4);
% pause(size(resample_new)/Fs4);
% 
% % for Fs5
% % duration of the input track
% tim_Fs5 = length(myrec) / Fs1;
% resample_new = zeros(tim_Fs3 * Fs5, 1);
% % linspace equally divides the segment given
% idx = round(linspace(1, length(myrec), length(resample_new)));
% resample_new = myrec(idx);
% sound(resample_new, Fs5);
% pause(size(resample_new)/Fs5);

% duration of the input track
tim2 = length(myrec) / Fs1;
[h1,FH1] = audioread('cafetaria.wav');
% sound(h1, FH1);
% pause(size(h1)/FH1);
resampl = zeros(tim2 * FH1, 1);
ind = round(linspace(1, length(h1), length(resampl)));
resampl = h1(ind);
con1st = convn(y,resampl);
sound(con1st,Fs);
pause(size(y)/Fs);