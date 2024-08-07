%%
function [P, Q, S, T, R] = return_PQST_PPG(PQRST_position, start_sig, end_sig)

select_row = find(PQRST_position.on >= start_sig & PQRST_position.off < end_sig);
fiducials = PQRST_position(select_row, :);

% P = [];
% Q = fiducials.on;
% S = fiducials.dn;
% T = fiducials.dp;
% 
% R = fiducials.sp;

P = fiducials.sp;
Q = fiducials.on;
R = fiducials.dn;
S = fiducials.dp;
T = [];