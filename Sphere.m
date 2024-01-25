
function z=Sphere(x)
global matriz N X Y

%rand('seed',round(x))


[val,ind]=sort(x);

 path=[ind ind(1)];
 pathcost=0;
 for ik=1:numel(path)-1
    pathcost=pathcost+matriz(path(ik),path(ik+1)); 
 end
% 
 z=pathcost;





end
