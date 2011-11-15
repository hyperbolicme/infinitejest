
% Draw a kstar with kplusone-1 subdivisions and l rays (valid values for l are 1 to 7).
def draw_kstar (expr kplusone, l) = 
  begingroup    
     % draw edges and nodes.
    for i = 1 upto l:
      draw z0 -- z[i];
      dotlabel.bot("", z[i]);
      for j = 1 upto kplusone:
	dotlabel.bot("", (j/kplusone)[z0,z[i]]);
      endfor
    endfor
    
    dotlabel.bot("", z0);
    label.bot(btex $r$ etex, 0.05[z0,z8]);
  endgroup
enddef;


%%%%% k-star %%%%
beginfig(1)    
  r = 1in;              % "radius" of star
  rtmp = sqrt((r*r)/2); % projection of radius at 45 deg.

    % set node co-ordinates
  z0 = (0,0);
  z1 = -z8 = (0, r);
  z5 = -z6 = (rtmp,rtmp);
  z7 = -z4 = (rtmp,-rtmp);
  z3 = -z2 = (r,0);
  draw_kstar(9,7);
endfig;

%%%%% k-star %%%%
beginfig(2)    
% r = 1in;              % "radius" of star
% rtmp = sqrt((r*r)/2); % projection of radius at 45 deg.

% set node co-ordinates
  z0 = (0,0);
  z1 = -z8 = (0, r);
  z5 = -z6 = (rtmp,rtmp);
  z7 = -z4 = (rtmp,-rtmp);
  z3 = -z2 = (r,0);
  draw_kstar(4,3);
endfig;




%   path p; 
%   path q; 
%   color bl;
%   bl = (16/255, 16/225, 99/255);
%   q = fullcircle scaled (2*3);
%   fill q withcolor bl;


% beginfig(13); 
%   z1=-z2=(.2in,0); 
%   x3=-x6=.3in; 
%   x3+y3=x6+y6=1.1in; 
%   z4=1/3[z3,z6]; 
%   z5=2/3[z3,z6]; 
%   z20=whatever[z1,z3]=whatever[z2,z4]; 
%   z30=whatever[z1,z4]=whatever[z2,z5]; 
%   z40=whatever[z1,z5]=whatever[z2,z6]; 
%   draw z1--z20--z2--z30--z1--z40--z2; 
%   pickup pencircle scaled 1pt; 
%   draw z1--z2; 
%   draw z3--z6; 
% endfig;

% beginfig(17); 
%   a=.7in; b=.5in; 
%   z0=(0,0); 
%   z1=-z3=(a,0); 
%   z2=-z4=(0,b); 
%   draw z1..z2..z3..z4..cycle; 
%   draw z1--z0--z2; 
%   label.top("a", .5[z0,z1]); 
%   label.lft("b", .5[z0,z2]); 
%   dotlabel.bot("(0,0)", z0); 
% endfig;

end