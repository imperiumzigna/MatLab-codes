function varargout = estudos_ex02(varargin)
% ESTUDOS_EX02 MATLAB code for estudos_ex02.fig
%      ESTUDOS_EX02, by itself, creates a new ESTUDOS_EX02 or raises the existing
%      singleton*.
%
%      H = ESTUDOS_EX02 returns the handle to a new ESTUDOS_EX02 or the handle to
%      the existing singleton*.
%
%      ESTUDOS_EX02('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESTUDOS_EX02.M with the given input arguments.
%
%      ESTUDOS_EX02('Property','Value',...) creates a new ESTUDOS_EX02 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before estudos_ex02_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to estudos_ex02_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help estudos_ex02

% Last Modified by GUIDE v2.5 09-Aug-2014 16:58:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @estudos_ex02_OpeningFcn, ...
                   'gui_OutputFcn',  @estudos_ex02_OutputFcn, ...
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


% --- Executes just before estudos_ex02 is made visible.
function estudos_ex02_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to estudos_ex02 (see VARARGIN)

% Choose default command line output for estudos_ex02
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes estudos_ex02 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = estudos_ex02_OutputFcn(hObject, eventdata, handles) 
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
