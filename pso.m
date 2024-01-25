

function [BestSol,BestCost]=pso(N,Range,MaxIt,nPop)

global X Y

%% Problem Definition

CostFunction=@(x) Sphere(x);        % Cost Function

nVar=N;            % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin=Range(1);         % Lower Bound of Variables
VarMax=Range(2);         % Upper Bound of Variables


%% PSO Parameters

%MaxIt=1000;      % Maximum Number of Iterations

%nPop=100;        % Population Size (Swarm Size)

% PSO Parameters
w=.0;            % Inertia Weight
wdamp=.03;     % Inertia Weight Damping Ratio
c1=2.33;         % Personal Learning Coefficient
c2=1.33;         % Global Learning Coefficient

% If you would like to use Constriction Coefficients for PSO,
% uncomment the following block and comment the above set of parameters.

% % Constriction Coefficients
% phi1=0.05;
% phi2=0.05;
% phi=phi1+phi2;
% chi=2/(phi-2+sqrt(phi^2-4*phi));
% w=chi;          % Inertia Weight
% wdamp=.1;        % Inertia Weight Damping Ratio
% c1=chi*phi1;    % Personal Learning Coefficient
% c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
VelMax=1*(VarMax-VarMin);
VelMin=-VelMax;

%% Initialization

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    % Initialize Position
    iv=0;
%     while(iv<=10000)
    m=unifrnd(VarMin,VarMax,VarSize);
    
%     m1=zeros(rows, columns, 'double');
%     randRows = randperm(rows);
%     for col = 1 : columns  % Pick out "onesPerColumn" rows that will be set to 1.
%        m1(randRows(col), col) = 1;
%     end
% 
%     m=m1(:);
%     
%     
%     con1=subconstraint(m);
%     if(sum(con1)==2)
%         break;
%     end
%     iv=iv+1;
%     end
    particle(i).Position=m;
    
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
    particle(i).Cost=CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost<GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxIt,1);

%% PSO Main Loop

for it=1:MaxIt
    
    for i=1:nPop
        
        % Update Velocity
        %A=GlobalBest.Position;
        %GlobalBest.Position=reshape(A,1,nVar);
%         size(GlobalBest.Position)
%         size(particle(i).Position)
  rmin=1; rmax=3.0;
          rr=rmin+rand()*(rmax-rmin);
          wr=abs(((2*rand()) - (1*rand()+rand()))/rr);  
          fmax=0.75; %  Maximum frequency of the wavy motion
    fmin=0.07; %  Minimum frequency of the wavy motion   
    tau=4.11; 
mu=2/abs(2-tau-sqrt(tau^2-4*tau));
 wr=abs(((2*rand()) - (1*rand()+rand()))/rr); 
        particle(i).Velocity =  mu*particle(i).Velocity +  wr *(GlobalBest.Position-particle(i).Position);
        % ...
            % +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            % +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        %% obey constarint
            m=particle(i).Position;
%             iv=0;
%            while(iv<=10000)
% %              
% %              
%             con1=subconstraint(m);
%             if(sum(con1)==2)
%             particle(i).Position =m;   
%             %fprintf('break/n');
%             break;
%             else
%             particle(i).Position =m;    
%             end
% %         
% %         
% %             %m=unifrnd(VarMin,VarMax,VarSize);
%            m1=zeros(rows, columns, 'double');
%            randRows = randperm(rows);
%            for col = 1 : columns  % Pick out "onesPerColumn" rows that will be set to 1.
%                   m1(randRows(col), col) = 1;
%            end
% % 
%            m=m1(:)';
%     
%  
%         
%          iv=iv+1;
%          end
    
        
        
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position);
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
            end
            
        end
        
    end
    
    BestCost(it)=GlobalBest.Cost;
    
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    w=w*wdamp;
    
    %%
    m1 =GlobalBest.Position;
    [val,ind]=sort(m1,'descend');
    path=[ind ind(1)];
   
    
 
 
 %clf;
  cla;
  hold on
for p =1:(size(path,2))-1
line([X(path(p)) X(path(p+1))], [Y(path(p)) Y(path(p+1))], 'Color','m','LineWidth',2, 'LineStyle','-') 
arrow([X(path(p)) Y(path(p)) ], [X(path(p+1)) Y(path(p+1)) ])
end 
hold on 
               
 for i2 = 1:nVar
  plot(X(i2),Y(i2),'o','LineWidth',1,...
               'MarkerEdgeColor','k',...
               'MarkerFaceColor','w',...
               'MarkerSize',8); 
           xlabel('X in m')
           ylabel('Y in m')
     text(X(i2)+2, Y(i2), num2str(i2),'FontSize',10); 
 hold on
 
 plot(X(path(1)),Y(path(1)),'o','LineWidth',1,...
               'MarkerEdgeColor','k',...
               'MarkerFaceColor','g',...
               'MarkerSize',10); 
           xlabel('X in m')
           ylabel('Y in m')
          
 
 end 
pause(0.05);

end

BestSol = GlobalBest;

%% Results

% figure;
% %plot(BestCost,'LineWidth',2);
% semilogy(BestCost,'LineWidth',2);
% xlabel('Iteration');
% ylabel('Best Cost');
% grid on;
