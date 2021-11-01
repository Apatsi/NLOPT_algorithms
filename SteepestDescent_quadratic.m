close all;
clear all;

prompt1 = 'Enter the initial guess x0:';
x0 = inputdlg(prompt1);
x0=str2num(x0{1})

prompt2 = 'Enter the number of function variables:';
N = inputdlg(prompt2)
N = round(str2double(cell2mat(N)));

Xvars=sym('x',[1 N]);

prompt3 = 'Enter Q';
Q = inputdlg(prompt3)
Q=str2num(Q{1})

prompt4 = 'Enter B';
B = inputdlg(prompt4)
B=str2num(B{1})

prompt5 = 'Enter C';
C = inputdlg(prompt5)

   
% termination tolerance
tol = 1e-5;

% maximum number of allowed iterations
maxiter = 1000;

% minimum allowed perturbation
dxmin = 1e-5;

% initialize gradient norm, optimization vector, iteration counter, perturbation
gnorm = inf; x = x0; niter = 0; dx = inf;

% define the objective function:

% plot objective function contours for visualization:
figure(1); clf;
axis equal; hold on


GradF=Q*Xvars'-B;
% gradient descent algorithm:
while and(gnorm>tol, and(niter <= maxiter, dx >= dxmin))
    % calculate gradient:
    g = grad(x,GradF,Xvars);
    gnorm = norm(g);
    % take step:
    a_k=gnorm^2/(g'*Q*g);
    test=double(a_k);
    a_kROUND=round(test,3);
    xnew = x -  a_kROUND*g;
    xnew=double(xnew);
    xnew=round(xnew,20);
    % check step
    if ~isfinite(xnew)
        display(['Number of iterations: ' num2str(niter)])
        error('x is inf or NaN')
    end
    % plot current point
    plot([x(1) xnew(1)],[x(2) xnew(2)],'ko-')
    refresh
    % update termination metrics
    ArraySteepest(niter+1,1)=niter;
    ArraySteepest(niter+1,2)=gnorm;
    ArraySteepest(niter+1,3)=dx;
    
    niter = niter + 1;
    dx = norm(xnew-x);
    x = xnew;

end
xopt = x
niter = niter - 1;

array2table(ArraySteepest,'VariableNames',{'Niter','gnorm','dx'})

% define the gradient of the objective
% function g = grad(x,GradF,Xvars)
% g = subs(GradF,Xvars(:),x(:));
% end