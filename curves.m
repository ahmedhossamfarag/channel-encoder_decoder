%% Plots & Analysis
% run src.m first

p = [.0001 .001 .01 .05 .1 .15 .2];
L = length(pkts);

%% 
% Plot of the coded bit error probability vs. different values of p from (0.0001 to 0.2) assuming code rate =1/2.

cberrs = zeros(1, length(p));   %coded bit error array
for i = 1:length(p)
    rcvPkts = noCdTr(pkts, p(i));
    cberrs(i) = length(find(rcvPkts ~= pkts)) / L;
end

figure()
plot(p, cberrs);
title('code rate 1/2')
xlabel('probability')
ylabel('bit error rate')

%% 
% Plot of the coded bit error probability vs. different values of p from (0.0001 to 0.2) using incremental redundancy (increasing code rate). 
% Plot of the throughput (data rate) vs. different values of p from (0.0001 to 0.2) using incremental redundancy.

cberrs = zeros(1, length(p));   %coded bit error array
dRates = zeros(1, length(p));   %data rate array
for i = 1:length(p)
    [rcvPkts ,dr] = incRedTr(pkts, trellis, upgRls, npkts, tpktLn, rlLn, nWrds, p(i));
    cberrs(i) = length(find(rcvPkts ~= pkts)) / L;
    dRates(i) = dr;
end

figure()
plot(p, cberrs);
title('incremental redundancy')
xlabel('probability')
ylabel('bit error rate')
figure()
plot(p, dRates);
title('incremental redundancy')
xlabel('probability')
ylabel('data rate')

