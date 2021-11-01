% define the gradient of the objective
function g = grad(x,GradF,Xvars)
g = subs(GradF,Xvars(:),x(:));  
end
