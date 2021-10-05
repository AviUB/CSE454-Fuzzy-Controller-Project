syms th; syms di;               % symbolic variables for use in functions
syms fa; syms aa;


% create the membership functions
%-----------------------------------------------------------------------------------------------------------
% 4 different shape structures to the functions,(trapezoid, isosceles 
% triangle, semi-trapezoids, and right triangles), each with their own 
% regions. Functions for each shape's respective regions can be predefined 
% and used for the piece-wise membership functions. 
% Each region variable corresponds to one piece of the shape's piece-wise function.
% t_r1=0; t_r2(x)=(x-a)/(b-a); t_r3=1; t_r4(x)=(x-d)/(c-d); t_r5=0;     % trap
% i_r1=0; i_r2(x)=(x-a)/(b-a); i_r3=1; i_r4(x)=(x-c)/(b-c); i_r5=0;     % i. tri
% r_r1=1; r_r2(x)=(x-b)/(a-b); r_r3=0;                                  % r. tri (l)
% sl_r1=1; sl_r2(x)=(x-c)/(b-c); sl_r3=0;                               % s. trap(l)
% sr_r1=0; sr_r2(x)=(x-a)/(b-a); sr_r3=1;                               % s. trap(r)
% syntax for piecewise functions for corresponding shapes:
% trap = piecewise(x<=a, t_r1, (a<x)&(x<b), t_r2(x), (b<=x)&(x<=c), t_r3, (c<x)&(x<d), t_r4(x), x>=d, t_r5);
% i_tri = piecewise(x<=a, i_r1, (a<x)&(x<b), i_r2(x), x==b, i_r3, (b<x)&(x<c), i_r4(x), x>=c, i_r5);
% r_tri = piecewise(x==a, r_r1, (a<x)&(x<b), r_r2(x), x>=b, r_r3);
% s_trapl = piecewise((a<=x)&(x<=b), sl_r1, (b<x)&(x<c), sl_r2(x), x>=c, sl_r3);
% s_trapr = piecewise(x<=a, sr_r1, (a<x)&(x<b), sr_r2(x), (b<=x)&(x<=c), sr_r3);
% where x is some symbolic variable and a,b,c,d are points on the shapes


% Distance piecewise membership functions, {ZE, VC, SC, SF, VF}
% ZE: r_tri
a = 0; b = 10;
diZE_r1=1; diZE_r2(di)=(di-b)/(a-b); diZE_r3=0;
diZE(di) = piecewise(di==a, diZE_r1, (a<di)&(di<b), diZE_r2(di), di>=b, diZE_r3);
% VC: trap
a = 0; b = 10; c = 20; d = 30;
diVC_r1=0; diVC_r2(di)=(di-a)/(b-a); diVC_r3=1; diVC_r4(di)=(di-d)/(c-d); diVC_r5=0;
diVC(di) = piecewise(di<=a, diVC_r1, (a<di)&(di<b), diVC_r2(di), (b<=di)&(di<=c), diVC_r3, (c<di)&(di<d), diVC_r4(di), di>=d, diVC_r5);
% SC: trap
a = 20; b = 30; c = 50; d = 60;
diSC_r1=0; diSC_r2(di)=(di-a)/(b-a); diSC_r3=1; diSC_r4(di)=(di-d)/(c-d); diSC_r5=0;
diSC(di) = piecewise(di<=a, diSC_r1, (a<di)&(di<b), diSC_r2(di), (b<=di)&(di<=c), diSC_r3, (c<di)&(di<d), diSC_r4(di), di>=d, diSC_r5);
% SF: trap
a = 50; b = 60; c = 80; d = 90;
diSF_r1=0; diSF_r2(di)=(di-a)/(b-a); diSF_r3=1; diSF_r4(di)=(di-d)/(c-d); diSF_r5=0;
diSF(di) = piecewise(di<=a, diSF_r1, (a<di)&(di<b), diSF_r2(di), (b<=di)&(di<=c), diSF_r3, (c<di)&(di<d), diSF_r4(di), di>=d, diSF_r5);
% VF: s_trapr
a = 80; b = 90; c = 100;
diVF_r1=0; diVF_r2(di)=(di-a)/(b-a); diVF_r3=1;
diVF(di) = piecewise(di<=a, diVF_r1, (a<di)&(di<b), diVF_r2(di), (b<=di)&(di<=c), diVF_r3);


% Theta piecewise membership functions, {VR, SR, ZE, SL, VL}
% VR: s_trapr
a = 0; b = pi/6; c = pi/4;
thVR_r1=1; thVR_r2(th)=(th-c)/(b-c); thVR_r3=0; 
thVR(th) = piecewise((a<=th)&(th<=b), thVR_r1, (b<th)&(th<c), thVR_r2(th), th>=c, thVR_r3);
% SR: trap
a = pi/6; b = pi/4; c = pi/3; d = pi/2;
thSR_r1=0; thSR_r2(th)=(th-a)/(b-a); thSR_r3=1; thSR_r4(th)=(th-d)/(c-d); thSR_r5=0;
thSR(th) = piecewise(th<=a, thSR_r1, (a<th)&(th<b), thSR_r2(th), (b<=th)&(th<=c), thSR_r3, (c<th)&(th<d), thSR_r4(th), th>=d, thSR_r5);
% ZE: i_tri
a = pi/3; b = pi/2; c = 2*pi/3;
thZE_r1=0; thZE_r2(th)=(th-a)/(b-a); thZE_r3=1; thZE_r4(th)=(th-c)/(b-c); thZE_r5=0;
thZE(th) = piecewise(th<=a, thZE_r1, (a<th)&(th<b), thZE_r2(th), th==b, thZE_r3, (b<th)&(th<c), thZE_r4(th), th>=c, thZE_r5);
% SL: trap
a = pi/2; b = 2*pi/3; c = 3*pi/4; d = 5*pi/6;
thSL_r1=0; thSL_r2(th)=(th-a)/(b-a); thSL_r3=1; thSL_r4(th)=(th-d)/(c-d); thSL_r5=0;
thSL(th) = piecewise(th<=a, thSL_r1, (a<th)&(th<b), thSL_r2(th), (b<=th)&(th<=c), thSL_r3, (c<th)&(th<d), thSL_r4(th), th>=d, thSL_r5);
% VL: s_trapr
a = 3*pi/4; b = 5*pi/6; c = pi;
thVL_r1=0; thVL_r2(th)=(th-a)/(b-a); thVL_r3=1;
thVL(th) = piecewise(th<=a, thVL_r1, (a<th)&(th<b), thVL_r2(th), (b<=th)&(th<=c), thVL_r3);


% Forward acceleration piecewise membership functions, {ZE, S, SS, SF, F}
% ZE: r_tri
a = 0; b = .10;
faZE_r1=1; faZE_r2(fa)=(fa-b)/(a-b); faZE_r3=0;
faZE(fa) = piecewise(fa==a, faZE_r1, (a<fa)&(fa<b), faZE_r2(fa), fa>=b, faZE_r3);
% S: trap
a = 0; b = .10; c = .20; d = .30;
faS_r1=0; faS_r2(fa)=(fa-a)/(b-a); faS_r3=1; faS_r4(fa)=(fa-d)/(c-d); faS_r5=0;
faS(fa) = piecewise(fa<=a, faS_r1, (a<fa)&(fa<b), faS_r2(fa), (b<=fa)&(fa<=c), faS_r3, (c<fa)&(fa<d), faS_r4(fa), fa>=d, faS_r5);
% SS: trap
a = .20; b = .30; c = .50; d = .60;
faSS_r1=0; faSS_r2(fa)=(fa-a)/(b-a); faSS_r3=1; faSS_r4(fa)=(fa-d)/(c-d); faSS_r5=0;
faSS(fa) = piecewise(fa<=a, faSS_r1, (a<fa)&(fa<b), faSS_r2(fa), (b<=fa)&(fa<=c), faSS_r3, (c<fa)&(fa<d), faSS_r4(fa), fa>=d, faSS_r5);
% SF: trap
a = .50; b = .60; c = .80; d = .90;
faSF_r1=0; faSF_r2(fa)=(fa-a)/(b-a); faSF_r3=1; faSF_r4(fa)=(fa-d)/(c-d); faSF_r5=0;
faSF(fa) = piecewise(fa<=a, faSF_r1, (a<fa)&(fa<b), faSF_r2(fa), (b<=fa)&(fa<=c), faSF_r3, (c<fa)&(fa<d), faSF_r4(fa), fa>=d, faSF_r5);
% F: s_trapr
a = .80; b = .90; c = 1;
faF_r1=0; faF_r2(fa)=(fa-a)/(b-a); faF_r3=1;
faF(fa) = piecewise(fa<=a, faF_r1, (a<fa)&(fa<b), faF_r2(fa), (b<=fa)&(fa<=c), faF_r3);


% Angular acceleration piecewise membership functions, {L, SL, ZE, SR, R}
% L: s_trapr
a = -1; b = -.75; c = -.5;
aaL_r1=1; aaL_r2(aa)=(aa-c)/(b-c); aaL_r3=0; 
aaL(aa) = piecewise((a<=aa)&(aa<=b), aaL_r1, (b<aa)&(aa<c), aaL_r2(aa), aa>=c, aaL_r3);
% SL: trap
a = -.75; b = -.5; c = -.25; d = 0;
aaSL_r1=0; aaSL_r2(aa)=(aa-a)/(b-a); aaSL_r3=1; aaSL_r4(aa)=(aa-d)/(c-d); aaSL_r5=0;
aaSL(aa) = piecewise(aa<=a, aaSL_r1, (a<aa)&(aa<b), aaSL_r2(aa), (b<=aa)&(aa<=c), aaSL_r3, (c<aa)&(aa<d), aaSL_r4(aa), aa>=d, aaSL_r5);
% ZE: i_tri
a = -.25; b = 0; c = .25;
aaZE_r1=0; aaZE_r2(aa)=(aa-a)/(b-a); aaZE_r3=1; aaZE_r4(aa)=(aa-c)/(b-c); aaZE_r5=0;
aaZE(aa) = piecewise(aa<=a, aaZE_r1, (a<aa)&(aa<b), aaZE_r2(aa), aa==b, aaZE_r3, (b<aa)&(aa<c), aaZE_r4(aa), aa>=c, aaZE_r5);
% SR: trap
a = 0; b = .25; c = .5; d = .75;
aaSR_r1=0; aaSR_r2(aa)=(aa-a)/(b-a); aaSR_r3=1; aaSR_r4(aa)=(aa-d)/(c-d); aaSR_r5=0;
aaSR(aa) = piecewise(aa<=a, aaSR_r1, (a<aa)&(aa<b), aaSR_r2(aa), (b<=aa)&(aa<=c), aaSR_r3, (c<aa)&(aa<d), aaSR_r4(aa), aa>=d, aaSR_r5);
% R: s_trapr
a = .5; b = .75; c = 1;
aaR_r1=0; aaR_r2(aa)=(aa-a)/(b-a); aaR_r3=1;
aaR(aa) = piecewise(aa<=a, aaR_r1, (a<aa)&(aa<b), aaR_r2(aa), (b<=aa)&(aa<=c), aaR_r3);


% print the membership function graph of distance
%fplot(diZE, [0,100]);
%hold on
%fplot(diVC, [0,100]);
%fplot(diSC, [0,100]);
%fplot(diSF, [0,100]);
%fplot(diVF, [0,100]);
%hold off

% print the membership function graph of theta
%fplot(thVR, [0,pi]);
%hold on
%fplot(thSR, [0,pi]);
%fplot(thZE, [0,pi]);
%fplot(thSL, [0,pi]);
%fplot(thVL, [0,pi]);
%hold off

% print the membership function graph of acceleration
%fplot(faZE, [0,1]);
%hold on
%fplot(faS, [0,1]);
%fplot(faSS, [0,1]);
%fplot(faSF, [0,1]);
%fplot(faF, [0,1]);
%hold off

% print the membership function graph of angular acceleration
%fplot(aaL, [-1,1]);
%hold on
%fplot(aaSL, [-1,1]);
%fplot(aaZE, [-1,1]);
%fplot(aaSR, [-1,1]);
%fplot(aaR, [-1,1]);
%hold off
%--------------------------------------------------------------------------


% record user inputs
cur_x = input("Enter Initial X Coordinate: ");
cur_y = input("Enter Initial Y Coordinate: ");
dest_x = input("Enter Destination's X Coordinate: ");
dest_y = input("Enter Destination's Y Coordinate: ");
% set intial acceleration, angular acceleration, distance, and theta to zero
fa = sym(0); aa = sym(0); di = sym(0); th = sym(0);
syms m; % sym variable for mass in force equation

% body of the program
%--------------------------------------------------------------------------
% output the following information for each timestamp:
% timestamp
% weights of each membership function (Lukasiewics t-norms)
% new angular velocity ( aa*(t_new-t_cur) + (th_new-th_cur)/(t_new-t_cur) )
% and new forward force ( m*fa )

%while (dest_x ~= cur_x || dest_y ~= cur_y)     % while current location isn't destination
% set timestamp
t = 0.1                                         % 100 milliseconds

% calculate cur_di and cur_th with dest input
cur_di = sqrt((dest_x - cur_x)^2 + (dest_y - cur_y)^2);
if (dest_y - cur_y < 0)
    if (dest_x - cur_x < 0)
        cur_th = pi;                            % if dest is behind and left of cur, set th to go left
    else
        cur_th = 0;                             % if dest is behind and right of cur, set th to go right
    end
else
    cur_th = acos((dest_x - cur_x) / cur_di);   % otherwise use arccos to find forward angle
end

% print out angular velocity and forward force
%f(m) = m*fa
%av(th) = aa*t + (cur_th - th)/t

% set symbolic variables as cur_di and cur_th
di=sym(cur_di); th=sym(cur_th);
%-------------------------------------------------------------------------------------


% fuzzify the system inputs into memberships
% -------------------------------------------------------------------------------------
% Łukasiewicz tnorms for each membership function
% tnorm = max(min(nonzero components), zero components)

% di tnorms
% diZE
diZE_1=double(diZE_r1); diZE_2=double(diZE_r2(di)); diZE_3=double(diZE_r3);
diZE_min = min([diZE_1, diZE_2]);
diZE_mem = max([diZE_min, diZE_3]);
% diVC
diVC_1=double(diVC_r1); diVC_2=double(diVC_r2(di)); diVC_3=double(diVC_r3); diVC_4=double(diVC_r4(di)); diVC_5=double(diVC_r5);
diVC_min = min([diVC_2, diVC_3, diVC_4]);
diVC_mem = max([diVC_min, diVC_1, diVC_5]);
% diSC
diSC_1=double(diSC_r1); diSC_2=double(diSC_r2(di)); diSC_3=double(diSC_r3); diSC_4=double(diSC_r4(di)); diSC_5=double(diSC_r5);
diSC_min = min([diSC_2, diSC_3, diSC_4]);
diSC_mem = max([diSC_min, diSC_1, diSC_5]);
% diSF
diSF_1=double(diSF_r1); diSF_2=double(diSF_r2(di)); diSF_3=double(diSF_r3); diSF_4=double(diSF_r4(di)); diSF_5=double(diSF_r5);
diSF_min = min([diSF_2, diSF_3, diSF_4]);
diSF_mem = max([diSF_min, diSF_1, diSF_5]);
% diVF
diVF_1=double(diVF_r1); diVF_2=double(diVF_r2(di)); diVF_3=double(diVF_r3);
diVF_min = min([diVF_2, diVF_3]);
diVF_mem = max([diVF_min, diVF_1]);

% th tnorms
% thVR
thVR_1=double(thVR_r1); thVR_2=double(thVR_r2(th)); thVR_3=double(thVR_r3);
thVR_min = min([thVR_1, thVR_2]);
thVR_mem = max([thVR_min, thVR_3]);
% thSR
thSR_1=double(thSR_r1); thSR_2=double(thSR_r2(th)); thSR_3=double(thSR_r3); thSR_4=double(thSR_r4(th)); thSR_5=double(thSR_r5);
thSR_min = min([thSR_2, thSR_3, thSR_4]);
thSR_mem = max([thSR_min, thSR_1, thSR_5]);
% thZE
thZE_1=double(thZE_r1); thZE_2=double(thZE_r2(th)); thZE_3=double(thZE_r3); thZE_4=double(thZE_r4(th)); thZE_5=double(thZE_r5);
thZE_min = min([thZE_2, thZE_3, thZE_4]);
thZE_mem = max([thZE_min, thZE_1, thZE_5]);
% thSL
thSL_1=double(thSL_r1); thSL_2=double(thSL_r2(th)); thSL_3=double(thSL_r3); thSL_4=double(thSL_r4(th)); thSL_5=double(thSL_r5);
thSL_min = min([thSL_2, thSL_3, thSL_4]);
thSL_mem = max([thSL_min, thSL_1, thSL_5]);
% thVL
thVL_1=double(thVL_r1); thVL_2=double(thVL_r2(th)); thVL_3=double(thVL_r3);
thVL_min = min([thVL_2, thVL_3]);
thVL_mem = max([thVL_min, thVL_1]);

% fa tnorms
% faZE
faZE_1=double(faZE_r1); faZE_2=double(faZE_r2(fa)); faZE_3=double(faZE_r3);
faZE_min = min([faZE_1, faZE_2]);
faZE_mem = max([faZE_min, faZE_3]);
% faS
faS_1=double(faS_r1); faS_2=double(faS_r2(fa)); faS_3=double(faS_r3); faS_4=double(faS_r4(fa)); faS_5=double(faS_r5);
faS_min = min([faS_2, faS_3, faS_4]);
faS_mem = max([faS_min, faS_1, faS_5]);
% faSS
faSS_1=double(faSS_r1); faSS_2=double(faSS_r2(fa)); faSS_3=double(faSS_r3); faSS_4=double(faSS_r4(fa)); faSS_5=double(faSS_r5);
faSS_min = min([faSS_2, faSS_3, faSS_4]);
faSS_mem = max([faSS_min, faSS_1, faSS_5]);
% faSF
faSF_1=double(faSF_r1); faSF_2=double(faSF_r2(fa)); faSF_3=double(faSF_r3); faSF_4=double(faSF_r4(fa)); faSF_5=double(faSF_r5);
faSF_min = min([faSF_2, faSF_3, faSF_4]);
faSF_mem = max([faSF_min, faSF_1, faSF_5]);
% faF
faF_1=double(faF_r1); faF_2=double(faF_r2(fa)); faF_3=double(faF_r3);
faF_min = min([faF_2, faF_3]);
faF_mem = max([faF_min, faF_1]);

% th tnorms
% aaL
aaL_1=double(aaL_r1); aaL_2=double(aaL_r2(aa)); aaL_3=double(aaL_r3);
aaL_min = min([aaL_1, aaL_2]);
aaL_mem = max([aaL_min, aaL_3]);
% aaSL
aaSL_1=double(aaSL_r1); aaSL_2=double(aaSL_r2(aa)); aaSL_3=double(aaSL_r3); aaSL_4=double(aaSL_r4(aa)); aaSL_5=double(aaSL_r5);
aaSL_min = min([aaSL_2, aaSL_3, aaSL_4]);
aaSL_mem = max([aaSL_min, aaSL_1, aaSL_5]);
% aaZE
aaZE_1=double(aaZE_r1); aaZE_2=double(aaZE_r2(aa)); aaZE_3=double(aaZE_r3); aaZE_4=double(aaZE_r4(aa)); aaZE_5=double(aaZE_r5);
aaZE_min = min([aaZE_2, aaZE_3, aaZE_4]);
aaZE_mem = max([aaZE_min, aaZE_1, aaZE_5]);
% aaSR
aaSR_1=double(aaSR_r1); aaSR_2=double(aaSR_r2(aa)); aaSR_3=double(aaSR_r3); aaSR_4=double(aaSR_r4(aa)); aaSR_5=double(aaSR_r5);
aaSR_min = min([aaSR_2, aaSR_3, aaSR_4]);
aaSR_mem = max([aaSR_min, aaSR_1, aaSR_5]);
% aaR
aaR_1=double(aaR_r1); aaR_2=double(aaR_r2(aa)); aaR_3=double(aaR_r3);
aaR_min = min([aaR_2, aaR_3]);
aaR_mem = max([aaR_min, aaR_1]);
%------------------------------------------------------------------------------------


% defuzzify system outputs
%-----------------------------------------------------------------------------------
% using the fuzzy rules described in the project writeup, outputs can be defuzzified
% outputs' (fa and aa) weights can be determined with more Lukasiewicz and
% Sugeno s-norms
% s-norm = summation(weights*output levels) / summation(weights)

% defuzzify fa output
fa_w1 = max(min([diZE_mem, faZE_mem]),0)
fa_w2 = max(min([diVC_mem, faZE_mem]),0)
fa_w3 = max(min([diSC_mem, faZE_mem]),0)
fa_w4 = max(min([diSF_mem, faZE_mem]),0)
fa_w5 = max(min([diVF_mem, faZE_mem]),0)
fa_w6 = max(min([diZE_mem, faS_mem]),0)
fa_w7 = max(min([diVC_mem, faS_mem]),0)
fa_w8 = max(min([diSC_mem, faS_mem]),0)
fa_w9 = max(min([diSF_mem, faS_mem]),0)
fa_w10 = max(min([diVF_mem, faS_mem]),0)
fa_w11 = max(min([diZE_mem, faSS_mem]),0)
fa_w12 = max(min([diVC_mem, faSS_mem]),0)
fa_w13 = max(min([diSC_mem, faSS_mem]),0)
fa_w14 = max(min([diSF_mem, faSS_mem]),0)
fa_w15 = max(min([diVF_mem, faSS_mem]),0)
fa_w16 = max(min([diZE_mem, faSF_mem]),0)
fa_w17 = max(min([diVC_mem, faSF_mem]),0)
fa_w18 = max(min([diSC_mem, faSF_mem]),0)
fa_w19 = max(min([diSF_mem, faSF_mem]),0)
fa_w20 = max(min([diVF_mem, faSF_mem]),0)
fa_w21 = max(min([diZE_mem, faF_mem]),0)
fa_w22 = max(min([diVC_mem, faF_mem]),0)
fa_w23 = max(min([diSC_mem, faF_mem]),0)
fa_w24 = max(min([diSF_mem, faF_mem]),0)
fa_w25 = max(min([diVF_mem, faF_mem]),0)
% constant values are used to represent typical values where a membership
% function is 1, this is done as a work around for being unable to
% translate this membership value from Lukasiewicz back into it's piecewise
% function to retrieve the original variable, and they serve as the output
% levels for the s-norms
faZE_val = 0; faS_val = .15; faSS_val = .4; faSF_val = .7; faF_val = 1;
fa_wsum = fa_w1 + fa_w2 + fa_w3 + fa_w4 + fa_w5 + fa_w6 + fa_w7 + fa_w8 + fa_w9 + fa_w10 + fa_w11 + fa_w12 + fa_w13 + fa_w14 + fa_w15 + fa_w16 + fa_w17 + fa_w18 + fa_w19 + fa_w20 + fa_w21 + fa_w22 + fa_w23 + fa_w24 + fa_w25;
fa_wzsum = fa_w1*faZE_val + fa_w2*faS_val + fa_w3*faSS_val + fa_w4*faSF_val + fa_w5*faF_val + fa_w6*faZE_val + fa_w7*faS_val + fa_w8*faSS_val + fa_w9*faSF_val + fa_w10*faF_val + fa_w11*faZE_val + fa_w12*faS_val + fa_w13*faSS_val + fa_w14*faSF_val + fa_w15*faF_val + fa_w16*faZE_val + fa_w17*faZE_val + fa_w18*faS_val + fa_w19*faSF_val + fa_w20*faF_val + fa_w21*faZE_val + fa_w22*faZE_val + fa_w23*faS_val + fa_w24*faSF_val + fa_w25*faF_val;
fa_out = fa_wzsum / fa_wsum

% defuzzify aa output
aa_w1 = max(min([thVL_mem, aaL_mem]),0)
aa_w2 = max(min([thSL_mem, aaL_mem]),0)
aa_w3 = max(min([thZE_mem, aaL_mem]),0)
aa_w4 = max(min([thSR_mem, aaL_mem]),0)
aa_w5 = max(min([thVR_mem, aaL_mem]),0)
aa_w6 = max(min([thVL_mem, aaSL_mem]),0)
aa_w7 = max(min([thSL_mem, aaSL_mem]),0)
aa_w8 = max(min([thZE_mem, aaSL_mem]),0)
aa_w9 = max(min([thSR_mem, aaSL_mem]),0)
aa_w10 = max(min([thVR_mem, aaSL_mem]),0)
aa_w11 = max(min([thVL_mem, aaZE_mem]),0)
aa_w12 = max(min([thSL_mem, aaZE_mem]),0)
aa_w13 = max(min([thZE_mem, aaZE_mem]),0)
aa_w14 = max(min([thSR_mem, aaZE_mem]),0)
aa_w15 = max(min([thVR_mem, aaZE_mem]),0)
aa_w16 = max(min([thVL_mem, aaSR_mem]),0)
aa_w17 = max(min([thSL_mem, aaSR_mem]),0)
aa_w18 = max(min([thZE_mem, aaSR_mem]),0)
aa_w19 = max(min([thSR_mem, aaSR_mem]),0)
aa_w20 = max(min([thVR_mem, aaSR_mem]),0)
aa_w21 = max(min([thVL_mem, aaR_mem]),0)
aa_w22 = max(min([thSL_mem, aaR_mem]),0)
aa_w23 = max(min([thZE_mem, aaR_mem]),0)
aa_w24 = max(min([thSR_mem, aaR_mem]),0)
aa_w25 = max(min([thVR_mem, aaR_mem]),0)
aaL_val = -1; aaSL_val = -.5; aaZE_val = 0; aaSR_val = .5; aaR_val = 1;
aa_wsum = aa_w1 + aa_w2 + aa_w3 + aa_w4 + aa_w5 + aa_w6 + aa_w7 + aa_w8 + aa_w9 + aa_w10 + aa_w11 + aa_w12 + aa_w13 + aa_w14 + aa_w15 + aa_w16 + aa_w17 + aa_w18 + aa_w19 + aa_w20 + aa_w21 + aa_w22 + aa_w23 + aa_w24 + aa_w25;
aa_wzsum = aa_w1*aaL_val + aa_w2*aaSL_val + aa_w3*aaZE_val + aa_w4*aaSR_val + aa_w5*aaR_val + aa_w6*aaL_val + aa_w7*aaSL_val + aa_w8*aaZE_val + aa_w9*aaSR_val + aa_w10*aaR_val + aa_w11*aaL_val + aa_w12*aaSL_val + aa_w13*aaZE_val + aa_w14*aaSR_val + aa_w15*aaR_val + aa_w16*aaL_val + aa_w17*aaL_val + aa_w18*aaSL_val + aa_w19*aaSR_val + aa_w20*aaR_val + aa_w21*aaL_val + aa_w22*aaL_val + aa_w23*aaSL_val + aa_w24*aaSR_val + aa_w25*aaR_val;
aa_out = aa_wzsum / aa_wsum

% update cur_x and cur_y based on aa and fa



%end
