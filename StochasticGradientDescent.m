function [w,b] = StochasticGradientDescent()
A = dlmread('perceptron.data',',');
w=[0,0,0,0];
b=0;
gamma = 1;
iterations = 0;
i=1;
while(true)
if(((-1)*(w*A(i,1:4)'+b)*A(i,5)) >= 0)
no_change=0;
[gradient,b_gradient]=loss(A(i,1:4),A(i,5),w,b);
w_new = w + gamma * gradient;
b = b + gamma * b_gradient;
else
no_change= no_change +1;
end
%b_gradient=loss(A,w,b)
i=i+1;
if(i>100)
i=1;
end
if(iterations<3)
w_new
b
end
iterations = iterations+1;
if (no_change==100)
iterations =iterations -100
break;
else
w = w_new;
end;
end;
w
b
end
function [out] = classified(x,y,w,b)
if(((-1)*(w*x'+b)*y) >= 0)
out= true;
else out=false;
end
end
function [gradient,b_gradient] = loss(x,y,w,b)
gradient=[0,0,0,0];
b_gradient=0;
d=y*x;
gradient = gradient + d ;
b_gradient = b_gradient + y;
end
