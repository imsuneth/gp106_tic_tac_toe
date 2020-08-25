function varargout = winner(varargin)
% WINNER MATLAB code for winner.fig
%      WINNER, by itself, creates a new WINNER or raises the existing
%      singleton*.
%
%      H = WINNER returns the handle to a new WINNER or the handle to
%      the existing singleton*.
%
%      WINNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINNER.M with the given input arguments.
%
%      WINNER('Property','Value',...) creates a new WINNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before winner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to winner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help winner

% Last Modified by GUIDE v2.5 07-Sep-2017 20:27:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @winner_OpeningFcn, ...
                   'gui_OutputFcn',  @winner_OutputFcn, ...
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


% --- Executes just before winner is made visible.
function winner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to winner (see VARARGIN)

% Choose default command line output for winner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes winner wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global player_won;
if player_won==1
    set(handles.txt_winner,'String','Player 1 won !!!');
elseif(player_won==2)
    set(handles.txt_winner,'String','Player 2 won !!!');
end
% --- Outputs from this function are returned to the command line.
function varargout = winner_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b_close.
function b_close_Callback(hObject, eventdata, handles)
% hObject    handle to b_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(winner);