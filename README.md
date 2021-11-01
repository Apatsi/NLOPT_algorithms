# NLOPT_algorithms
Implementation of the steepest descent algorithm in MATLAB from scratch.

Goal is to find the local minimum (if it exists) using non-linear algorithms such as Steepest Descent. 


Examples:

![image](https://user-images.githubusercontent.com/62386580/139705642-eeba29b2-67cc-4c84-aab8-2bd431ce78b9.png)

Reviewing this function, we conclude that it is in normal form.

With initial guess=[0.5; 0.5] and step alpha=0.15, calculated with 138 repetitions, f has a local minimum at x*=[1; 1].


![image](https://user-images.githubusercontent.com/62386580/139707306-9943930a-cc48-4a24-a444-efd1921f7877.png)
![image](https://user-images.githubusercontent.com/62386580/139707327-1b04c29c-1944-4399-b810-80201b1b47db.png)


As we can see in the diagram, the method is quite slow and fluctuates until it finally reaches the minimizer [1,1].


![image](https://user-images.githubusercontent.com/62386580/139707763-2612763a-04e3-4477-aa25-c9f72ac23702.png)


