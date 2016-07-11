function varargout = NewGUI(varargin)
% NEWGUI MATLAB code for NewGUI.fig
%      NEWGUI, by itself, creates a new NEWGUI or raises the existing
%      singleton*.
%
%      H = NEWGUI returns the handle to a new NEWGUI or the handle to
%      the existing singleton*.
%
%      NEWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWGUI.M with the given input arguments.
%
%      NEWGUI('Property','Value',...) creates a new NEWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewGUI

% Last Modified by GUIDE v2.5 11-Jul-2016 10:49:42

% Begin initialization code - DO NOT EDIT
%NOTE: THE ONLY REAL CHANGE IS IN THE LAST FUNCTION... THE BUTTON PUSHED
%CAUSES THE CREATION OF THE GLOBAL STRUCT "PARAMETERS" WITH CONTENTS
%DEPENDENT ON WHAT WAS INPUTTED TO THE TEXT-EDIT SPOTS
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @NewGUI_OutputFcn, ...
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


% --- Executes just before NewGUI is made visible.
function NewGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NewGUI (see VARARGIN)

% Choose default command line output for NewGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NewGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NewGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function centerPokeTrigger_Callback(hObject, eventdata, handles)
% hObject    handle to centerPokeTrigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of centerPokeTrigger as text
%        str2double(get(hObject,'String')) returns contents of centerPokeTrigger as a double


% --- Executes during object creation, after setting all properties.
function centerPokeTrigger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to centerPokeTrigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function centerPokeRewardWindow_Callback(hObject, eventdata, handles)
% hObject    handle to centerPokeRewardWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of centerPokeRewardWindow as text
%        str2double(get(hObject,'String')) returns contents of centerPokeRewardWindow as a double


% --- Executes during object creation, after setting all properties.
function centerPokeRewardWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to centerPokeRewardWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function leftRewardProb_Callback(hObject, eventdata, handles)
% hObject    handle to leftRewardProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of leftRewardProb as text
%        str2double(get(hObject,'String')) returns contents of leftRewardProb as a double


% --- Executes during object creation, after setting all properties.
function leftRewardProb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to leftRewardProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rightRewardProb_Callback(hObject, eventdata, handles)
% hObject    handle to rightRewardProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rightRewardProb as text
%        str2double(get(hObject,'String')) returns contents of rightRewardProb as a double


% --- Executes during object creation, after setting all properties.
function rightRewardProb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rightRewardProb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ledDuringRewardWindow_Callback(hObject, eventdata, handles)
% hObject    handle to ledDuringRewardWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ledDuringRewardWindow as text
%        str2double(get(hObject,'String')) returns contents of ledDuringRewardWindow as a double


% --- Executes during object creation, after setting all properties.
function ledDuringRewardWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ledDuringRewardWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rewardDurationRight_Callback(hObject, eventdata, handles)
% hObject    handle to rewardDurationRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rewardDurationRight as text
%        str2double(get(hObject,'String')) returns contents of rewardDurationRight as a double


% --- Executes during object creation, after setting all properties.
function rewardDurationRight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rewardDurationRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rewardDurationLeft_Callback(hObject, eventdata, handles)
% hObject    handle to rewardDurationLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rewardDurationLeft as text
%        str2double(get(hObject,'String')) returns contents of rewardDurationLeft as a double


% --- Executes during object creation, after setting all properties.
function rewardDurationLeft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rewardDurationLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minInterTrialInterval_Callback(hObject, eventdata, handles)
% hObject    handle to minInterTrialInterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minInterTrialInterval as text
%        str2double(get(hObject,'String')) returns contents of minInterTrialInterval as a double


% --- Executes during object creation, after setting all properties.
function minInterTrialInterval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minInterTrialInterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blockRangeMin_Callback(hObject, eventdata, handles)
% hObject    handle to blockRangeMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blockRangeMin as text
%        str2double(get(hObject,'String')) returns contents of blockRangeMin as a double


% --- Executes during object creation, after setting all properties.
function blockRangeMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blockRangeMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blockRangeMax_Callback(hObject, eventdata, handles)
% hObject    handle to blockRangeMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blockRangeMax as text
%        str2double(get(hObject,'String')) returns contents of blockRangeMax as a double


% --- Executes during object creation, after setting all properties.
function blockRangeMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blockRangeMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Uses str2double(get(handles.PARAMETER_NAME, 'String')) to set each
%property of the parameters struct, which has been instantiated as a global
%variable
%LEDDuringRewardWindow is automatically set to 1
    global parameters
    parameters = struct;
    parameters.centerPokeTrigger = str2double(get(handles.centerPokeTrigger, 'String'));
    parameters.centerPokeRewardWindow = str2double(get(handles.centerPokeRewardWindow, 'String'));
    parameters.ledDuringRewardWindow = 1;
    parameters.leftRewardProb = str2double(get(handles.leftRewardProb, 'String'));
    parameters.rightRewardProb = str2double(get(handles.rightRewardProb, 'String'));
    parameters.rewardDurationRight = str2double(get(handles.rewardDurationRight, 'String'));
    parameters.rewardDurationLeft = str2double(get(handles.rewardDurationLeft, 'String'));
    parameters.minInterTrialInterval = str2double(get(handles.minInterTrialInterval, 'String'));
    parameters.blockRangeMin = str2double(get(handles.blockRangeMin, 'String'));
    parameters.blockRangeMax = str2double(get(handles.blockRangeMax, 'String'));
