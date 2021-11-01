close all;
clear all;

prompt1 = 'Enter the initial guess x0:';
x0 = inputdlg(prompt1);
x0=str2num(x0{1})

prompt2 = 'Enter the number of function variables:   ';
userInput = inputdlg(prompt2)
N = round(str2double(cell2mat(userInput)));

prompt3 = 'Enter objective function (of x):  ';
f = inputdlg(prompt3);
warning('off')

prompt4 = 'Enter the line search step alpha:  ';
alpha = inputdlg(prompt4);
alpha=str2num(alpha{1})

Xvars=sym('x',[1 N]);


% termination tolerance
tol = 1e-5;

% maximum number of allowed iterations
maxiter = 1000;

% minimum allowed perturbation
dxmin = 1e-5;

% initialize gradient norm, optimization vector, iteration counter, perturbation
gnorm = inf; x = x0; niter = 0; dx = inf;

GradF=sym(zeros(N,1));
for i=1:N
GradF(i,1)=diff(f,Xvars(i));
end

% gradient descent algorithm:
while and(gnorm>=tol, and(niter <= maxiter, dx >= dxmin))
    % calculate gradient:
    g = grad(x,GradF,Xvars);
    gnorm = norm(g);
    % take step:
    xnew = x - alpha*g;
    % check step
    if ~isfinite(xnew)
        display(['Number of iterations: ' num2str(niter)])
        error('x is inf or NaN')
    end
    % update termination metrics
    Fx=subs(f,Xvars(:),x(:));
    ArraySteepest(niter+1,1)=niter;
    ArraySteepest(niter+1,2)=Fx;
    ArraySteepest(niter+1,3)=gnorm;
    ArraySteepest(niter+1,4)=dx;
    
    xnew=double(xnew);
    xnew=round(xnew,20);
    
    niter = niter + 1;
    dx = norm(xnew-x);
    x = xnew;
    
    
end
xopt = x
niter = niter - 1;

array2table( ArraySteepest,'VariableNames',{'Niter','Fx','gnorm','dx'})

% define the gradient of the objective
% function g = grad(x,GradF,Xvars)
% g = subs(GradF,Xvars(:),x(:));  
% end
