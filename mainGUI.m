function varargout = mainGUI(varargin)
% MAINGUI MATLAB code for mainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainGUI

% Last Modified by GUIDE v2.5 23-Mar-2019 06:22:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mainGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainGUI is made visible.
function mainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainGUI (see VARARGIN)

% Choose default command line output for mainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path;

msgbox(num2str(path));

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all force;

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% TSP Using PSO
global matriz N BestSol path X Y G1

x2 = get(handles.edit2,'String'); %edit1 being Tag of ur edit box
x3 = get(handles.edit3,'String'); %edit1 being Tag of ur edit box





var1=N;
Range=[0 100];
MaxIt=str2double(x2);
nPop=str2double(x3);
cla;
set(handles.axes1,'visible', 'on');
[BestSol,BestCost]=pso(var1,Range,MaxIt,nPop);
set(handles.axes1,'visible', 'off');

% %%
m =(BestSol.Position);
[val,ind]=sort(m);

 path=[ind ind(1)];
 pathcost=0;
 for ik=1:numel(path)-1
    pathcost=pathcost+matriz(path(ik),path(ik+1)); 
 end

%%


%%
set(handles.axes1,'visible', 'off');
%set(handles.listbox1,'string',[cellstr(num2str([1:N]')) cellstr(num2str(X')) cellstr(num2str(Y'))]);
xs1=1:numel(BestCost);
set(handles.uitable2,'data',[xs1;BestCost']','ColumnName',{'Iteration','Cost'});

%%
set(handles.axes1,'visible', 'on');
cla;


% path=Pathb1;
  %figure(10),
% path=P;
% figure(10),
% clf;
for p =1:(size(path,2))-1

line([X(path(p)) X(path(p+1))], [Y(path(p)) Y(path(p+1))], 'Color','m','LineWidth',2, 'LineStyle','-') 
arrow([X(path(p)) Y(path(p)) ], [X(path(p+1)) Y(path(p+1)) ])
end 
hold on 

for i2 = 1:N
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



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global matriz N X Y G1
%% Intialization

 x1 = get(handles.edit1,'String'); %edit1 being Tag of ur edit box
if isempty(x1)
   fprintf('Error: Enter Text first\n');
   msgbox('Error: Enter Text first');
else
     
    N =str2double(x1);
    noOfNodes =N;
    % min and max distance
    min1=1;
    max1=100;
    % random X Y Cordinates
    X=min1+(max1-min1).*rand(1,N);
    Y=min1+(max1-min1).*rand(1,N);

    %figure(1); 
    cla;
    set(handles.axes1,'visible', 'on');
    
    
    



    hold on; 
    
    R =max1; %node transmission range 
    
    
    %plotting network topology 
    %i2=1;
    for i2 = 1:noOfNodes 
    plot(X(i2),Y(i2),'o','LineWidth',1,...
                  'MarkerEdgeColor','w',...
                  'MarkerFaceColor','k',...
                  'MarkerSize',8); 
              xlabel('X in m')
              ylabel('Y in m')
        text(X(i2)+2, Y(i2), num2str(i2),'FontSize',12); 
    hold on
    
    end 
    
    
    

    for i2=1:N
        for j = 1:N
     
            distance = sqrt((X(i2) - X(j))^2 + (Y(i2) - Y(j))^2);   
         
            if (distance <= R )
            line([X(i2) X(j)], [Y(i2) Y(j)], 'LineStyle', '-.');   
                matriz(i2,j)=distance; 
                G1(i2,j)=1;
            else 
                matriz(i2,j)=distance; 
                G1(i2,j)=0;
            end 
         
        end
    end

 end
set(handles.axes1,'visible', 'off');
%set(handles.listbox1,'string',[cellstr(num2str([1:N]')) cellstr(num2str(X')) cellstr(num2str(Y'))]);
set(handles.uitable1,'data',[X',Y'],'ColumnName',{'X','Y'});

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
