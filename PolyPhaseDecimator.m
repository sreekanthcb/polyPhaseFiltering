function [final_out] = PolyPhaseDecimator(b,M,inpt)
%%=========================================================================
% Synopsis     :   PolyPhase Decimator
% Last updated : 2022-08-28
%%=========================================================================
b    = b(:).';
inpt = inpt(:).';

if(rem(length(b),M)~=0)
    error('Number of Filter taps should be multiple of decimation factor')
end
if(rem(length(inpt),M)~=0)
    error('Number of Input elements should be multiple of decimation factor')
end

out  = zeros(M,length(inpt)/M);
b    = reshape(b,M,[]);
inpt = reshape(inpt,M,[]);
inpt = fliplr(inpt.').'; % flipping the matrix upside down

for ii = 1:M
    out(ii,:) = filter(b(ii,:),1,inpt(ii,:));
end
final_out = sum(out);
end
