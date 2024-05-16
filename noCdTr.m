%no channel coding transmition
function rcvPkts = noCdTr(pkts, p)
    %   apply a probability of error p 
    rcvPkts = bsc(pkts, p);
end