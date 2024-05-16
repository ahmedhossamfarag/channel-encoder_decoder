%incremental redundancy transmition
function [rcvPkts, dRate] = incRedTr(pkts, trellis, upgRls, npkts, tpktLn, rlLn, nWrds, p)
    %   create recieved packets array
    rcvPkts = zeros(size(pkts));
    dRate = uint64(0);
    %   loop on packets
    for i = 1:npkts
        pkt = pkts(i,:);
        %   create array for current transmition's packet to recieve
        rcv = zeros(1, tpktLn);
        %   current punctuation rule
        punRl = zeros(rlLn, 1);
        %   loop on rules
        for rule = upgRls'
            %   encodeing
            encoded = convenc(pkt, trellis,rule);
            %   update data rate
            dRate = dRate + length(encoded);
            %   apply a probability of error p 
            errored = bsc(encoded,p);
            %   set recieved bits in their places in the packet
            rcv(indices(rule, nWrds)) = errored;
            %   update punctuation rule
            punRl = punRl + rule;
            %   combined recieved data
            recieved = rcv(indices(punRl, nWrds));
            %   decoding
            decoded = vitdec(recieved,trellis,35,'trunc','hard',punRl);
            %   break when no error
            if all(decoded == pkt); break; end
        end
        %   set current decoded packet
        rcvPkts(i,:) = decoded;
    end
end


function inds = indices(arr, n)
    inds = logical(repmat(arr', 1, n));
end

