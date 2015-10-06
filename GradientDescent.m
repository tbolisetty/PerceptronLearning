function [w,b] = GradientDescent()
A = dlmread('perceptron.data',',');
w=[0,0,0,0];
b=0;
learningRate = 1;
iterations = 0;
while(true)
[gradient,b_gradient]=loss(A,w,b);
%b_gradient=loss(A,w,b)
w_new = w + learningRate * gradient;
b = b + learningRate * b_gradient;
if(iterations<3)
w_new
b
end
if (w == w_new)
iterations
break;
else
w = w_new;
iterations = iterations+1;
end;
end;
w
b
end
function [gradient,b_gradient] = loss(A,w,b)
gradient=[0,0,0,0];
b_gradient=0;
for j = 1 : 100
if(((-1)*(w*A(j,1:4)'+b)*A(j,5)) >= 0)
d=A(j,5)*A(j,1:4);
gradient = gradient + d ;
b_gradient = b_gradient + A(j,5);
end
end
end
