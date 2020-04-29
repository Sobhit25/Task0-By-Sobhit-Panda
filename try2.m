function varargout = try2(varargin)
% TRY2 MATLAB code for try2.fig
%      TRY2, by itself, creates a new TRY2 or raises the existing
%      singleton*.
%
%      H = TRY2 returns the handle to a new TRY2 or the handle to
%      the existing singleton*.
%
%      TRY2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRY2.M with the given input arguments.
%
%      TRY2('Property','Value',...) creates a new TRY2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before try2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to try2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help try2

% Last Modified by GUIDE v2.5 26-Apr-2020 15:17:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @try2_OpeningFcn, ...
                   'gui_OutputFcn',  @try2_OutputFcn, ...
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


% --- Executes just before try2 is made visible.
function try2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to try2 (see VARARGIN)

% Choose default command line output for try2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes try2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = try2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function weight_Callback(hObject, eventdata, handles)
% hObject    handle to weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of weight as text
%        str2double(get(hObject,'String')) returns contents of weight as a double


% --- Executes during object creation, after setting all properties.
function weight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function height_Callback(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height as text
%        str2double(get(hObject,'String')) returns contents of height as a double


% --- Executes during object creation, after setting all properties.
function height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearit.
function clearit_Callback(hObject, eventdata, handles)
% hObject    handle to clearit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set (handles.warning,'String',"");
set (handles.name,'String',"");
set (handles.weight,'String',"");
set (handles.height,'String',"");
set (handles.result,'String',"Your Report will be displayed here.");
set (handles.wgt,'String',"Unit");
set (handles.hgt,'String',"Unit");



% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(handles.weight,'String');
b = get(handles.height,'String');

if (get(handles.popupmenu,'Value') == 1)
   set (handles.warning,'String',"*Choose a Standard");

elseif (get(handles.popupmenu,'Value') == 2)
    c = str2num(a)* 703 / (str2num(b)^2);
     if(c>=0 && c<267.8693)
            stiti = "Very Severely Underweight";
      elseif (c>=267.8693 && c<285.7272)
             stiti = "Severely Underweight";
      elseif (c>=285.7272 && c<330.3721)
             stiti = "Underweight";
      elseif (c>=330.3721 && c<446.4488)
             stiti = "Normal(Healthy Weight)";
      elseif (c>=446.4488 && c<535.7386)
             stiti = "Overweight";
      elseif (c>=535.7386 && c<625.0283)
             stiti = "Moderately Obese";
      elseif (c>=625.0283 && c<714.3181) 
             stiti = "Severely Obese";
      elseif (c>=714.3181)
             stiti = "Very severely Obese";
     end  
       
    txt = sprintf('%s you are %s.',get(handles.name,'String'),stiti);
    set (handles.result,'String',txt);

elseif (get(handles.popupmenu,'Value') == 3) 
    c = str2num(a) / (str2num(b)^2);
        if (c>=0 && c<15)
             stiti = "Very Severely Underweight";
         elseif (c>=15 && c<16)
             stiti = "Severely Underweight";
         elseif (c>=16 && c<18.5)
             stiti = "Underweight";
         elseif (c>=18.5&& c<25)
             stiti = "Normal(Healthy Weight)";
         elseif (c>=25 && c<30)
             stiti = "Overweight";
         elseif (c>=30 && c<35)
             stiti = "Moderately Obese";
         elseif (c>=35 && c<40) 
             stiti = "Severely Obese";
         elseif (c>=40)
             stiti = "Very Severely Obese";
        end  
       
    txt = sprintf('%s you are %s.',get(handles.name,'String'),stiti);
    set (handles.result,'String',txt);
end





function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.popupmenu,'Value') == 1)
   set (handles.warning,'String',"*Choose a Standard");   

elseif (get(handles.popupmenu,'Value') == 2)
   set (handles.warning,'String',"");
   
   set (handles.wgt,'String',"(lbs)");
   set (handles.hgt,'String',"(in)");

elseif (get(handles.popupmenu,'Value') == 3) 
    set (handles.warning,'String',"");
    
    set (handles.wgt,'String',"(kgs)");
    set (handles.hgt,'String',"(m)");   

end   
   
   
 
  

    



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu


% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
