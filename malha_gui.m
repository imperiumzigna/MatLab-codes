function varargout = malha_gui(varargin)
% MALHA_GUI MATLAB code for malha_gui.fig
%      MALHA_GUI, by itself, creates a new MALHA_GUI or raises the existing
%      singleton*.
%
%      H = MALHA_GUI returns the handle to a new MALHA_GUI or the handle to
%      the existing singleton*.
%
%      MALHA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MALHA_GUI.M with the given input arguments.
%
%      MALHA_GUI('Property','Value',...) creates a new MALHA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before malha_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to malha_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help malha_gui

% Last Modified by GUIDE v2.5 06-Aug-2014 15:18:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @malha_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @malha_gui_OutputFcn, ...
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


% --- Executes just before malha_gui is made visible.
function malha_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to malha_gui (see VARARGIN)

% Choose default command line output for malha_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes malha_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = malha_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ed_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to ed_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_p_disc as text
%        str2double(get(hObject,'String')) returns contents of ed_p_disc as a double
ed=get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function ed_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lim_inf_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to lim_inf_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lim_inf_p_disc as text
%        str2double(get(hObject,'String')) returns contents of lim_inf_p_disc as a double
lim_inf=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function lim_inf_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lim_inf_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lim_sup_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to lim_sup_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lim_sup_p_disc as text
%        str2double(get(hObject,'String')) returns contents of lim_sup_p_disc as a double
lim_sup=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function lim_sup_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lim_sup_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cc1_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to cc1_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cc1_p_disc as text
%        str2double(get(hObject,'String')) returns contents of cc1_p_disc as a double
cc1=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function cc1_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cc1_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cc2_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to cc2_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cc2_p_disc as text
%        str2double(get(hObject,'String')) returns contents of cc2_p_disc as a double
cc2=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function cc2_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cc2_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to n_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_p_disc as text
%        str2double(get(hObject,'String')) returns contents of n_p_disc as a double
nump=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function n_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ord_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to ord_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ord_p_disc as text
%        str2double(get(hObject,'String')) returns contents of ord_p_disc as a double
ord=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function ord_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ord_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function opt_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to opt_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of opt_p_disc as text
%        str2double(get(hObject,'String')) returns contents of opt_p_disc as a double
opt=get(hObject,'String');

% --- Executes during object creation, after setting all properties.
function opt_p_disc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to opt_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bto_p_disc.
function bto_p_disc_Callback(hObject, eventdata, handles)
% hObject    handle to bto_p_disc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pplot,disc]=mdf_malha(ed,lim_inf,lim_sup,cc1,cc2,nump,ord,opt);
handles.lcl_graf=mesh(pplot);

% --- Executes on button press in bto_p_sub_div_malha.
function bto_p_sub_div_malha_Callback(hObject, eventdata, handles)
% hObject    handle to bto_p_sub_div_malha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



