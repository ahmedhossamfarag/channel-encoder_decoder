%% Constants
wrdLn = 8;  %code word length
pktLn = 1024;   %packet length
tpktLn = 2 * pktLn; %transmition's packet length
p1 = 0.001; %probability
p2 = 0.1;   %probability

%% File Read
reader = VideoReader('highway.avi');
vod = read(reader);

%% Binary Packets
%   converts the file to bits & subdivides the video stream to packets
pkts = reshape(de2bi(double(vod)), [], pktLn);

%% Encoding Data
trellis = poly2trellis(7,[171 133]);
punRls = [ %punctuation rules
    1 1 1 0 1 0 1 0 0 1 1 0 1 0 1 0 ;
    1 1 1 0 1 0 1 0 1 1 1 0 1 0 1 0 ;
    1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 ;
    1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 0 ;
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
    ];
upgRls = [ %upgrade rules
    1 1 1 0 1 0 1 0 0 1 1 0 1 0 1 0 ;
    0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ;
    0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 ;
    0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 ;
    0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 ;
    ];

%% Drived Variables
vodSz = size(vod); %video size
fr = reader.FrameRate; %frame rate
pktsSz = size(pkts); %packets size
npkts = pktsSz(1); %no of packets

rlSz = size(punRls);    %punctuation rules size
rlLn = rlSz(2);  %punctuation rule length
nRls = rlSz(1);   %no of punctuation rules
nWrds = tpktLn / rlLn;

% run vodTr.m
% run curves.m
