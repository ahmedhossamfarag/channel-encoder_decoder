%% Encoding & Transmition & Decoding
% run src.m first

%% 
%     1. P=0.001 using no channel coding 
rcvPkts1 = noCdTr(pkts, p1);
writeVod("newVod1.avi", rcvPkts1, wrdLn, vodSz, fr);
%% 
%     2. P=0.001 using rate 1/2 convolutional code
rcvPkts2 = incRedTr(pkts, trellis, punRls(nRls,:), npkts, tpktLn, rlLn, nWrds, p1);
writeVod("newVod2.avi", rcvPkts2, wrdLn, vodSz, fr);

%% 
%     3. P=0.001 using incremental redundancy 
rcvPkts3 = incRedTr(pkts, trellis, upgRls, npkts, tpktLn, rlLn, nWrds, p1);
writeVod("newVod3.avi", rcvPkts3, wrdLn, vodSz, fr);

%% 
%     4. P=0.1 using no channel coding 
rcvPkts4 = noCdTr(pkts, p2);
writeVod("newVod4.avi", rcvPkts4, wrdLn, vodSz, fr);

%% 
%     5. P=0.1 using rate 1/2 convolutional code
rcvPkts5 = incRedTr(pkts, trellis, punRls(nRls,:), npkts, tpktLn, rlLn, nWrds, p2);
writeVod("newVod5.avi", rcvPkts5, wrdLn, vodSz, fr);

%% 
%     6. P=0.1 using incremental redundancy
rcvPkts6 = incRedTr(pkts, trellis, upgRls, npkts, tpktLn, rlLn, nWrds, p2);
writeVod("newVod6.avi", rcvPkts6, wrdLn, vodSz, fr);

