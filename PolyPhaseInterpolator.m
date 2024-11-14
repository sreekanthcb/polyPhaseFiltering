function [final_out] = PolyPhaseInterpolator(b,M,inpt)
%%=========================================================================
% Synopsis     :   PolyPhase Interpolator
% Last updated : 2022-08-25
%%=========================================================================
b    = b(:).';
inpt = inpt(:).';

if(rem(length(b),M)~=0)
    error('Number of Filter taps should be multiple of Interpolation factor');
end
b   = reshape(b,M,[]);

out = zeros(M,length(inpt));
for ii = 1:M
    out(ii,:) = filter(b(ii,:),1,inpt);
end
final_out = out(:);
end
