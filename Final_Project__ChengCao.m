function varargout = untitled(varargin)
%UNTITLED MATLAB code file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to untitled_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      UNTITLED('CALLBACK') and UNTITLED('CALLBACK',hObject,...) call the
%      local function named CALLBACK in UNTITLED.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 09-May-2018 18:14:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output;

Avg1=rgb2gray(im);
%F=butterworth_high_center_f(im,50,5);
F=ffilter(Avg1,'Bandstop','Butterworth',10,50,1);
output=F;
axes(handles.axes2);  
imshow(output);title('Homomorphic filter');

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global w1 im
set(handles.edit3,'string',num2str(get(hObject,'value')));
w1 = str2double(get(hObject,'string')); % high_in
J = imadjust(im,[0 w1],[0 1]);
axes(handles.axes2);
imshow(J);title({'Contrast',w1});

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global im Blur
set(handles.slider2,'value',str2num(get(hObject,'string')));
Blur = str2double(get(hObject,'string')); % 
ImgBlur=imfilter(im,Blur);
UnsharpMask=im-ImgBlur;
ImgHighBoost=im+4.5*UnsharpMask;
axes(handles.axes2);  
imshow(ImgHighBoost);title('highboost filter');


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


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global Bright im;
set(handles.edit4,'string',num2str(get(hObject,'value')));
Bright = str2double(get(hObject,'string')); % 
bimge=imsubtract(im,Bright); % -255~255
axes(handles.axes2);
imshow(bimge);title({'Brightness',Bright});

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

global w1 im;
set(handles.slider1,'value',str2num(get(hObject,'string')));
w1 = str2double(get(hObject,'string')); % high_in
J = imadjust(im,[0 w1],[0 1]);
axes(handles.axes2);
imshow(J);title({'Contrast',w1});

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output
se1=strel('disk',5);% create a disk structure element with radius=5
  Er2=imerode(im,se1);
  axes(handles.axes2);
  output=Er2;
  imshow(Er2);
  title('Eroded with disk(5)');

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im output
    Avg1=rgb2gray(im);
    %F=butterworth_high_center_f(im,50,5);
    F=ffilter(Avg1,'Bandstop','Butterworth',10,50,1);
    output=F;
    %Img=imfilter(im,F);
    axes(handles.axes2);
    imshow(output);title({'After Processing Butterworth,10,50,1'});

% --- Executes when selected object is changed in uibuttongroup12.
function uibuttongroup12_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup12 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

global im Blur
set(handles.slider2,'value',str2num(get(hObject,'string')));
Blur = str2double(get(hObject,'string')); % 
ImgBlur=imfilter(im,Blur);
UnsharpMask=im-ImgBlur;
ImgHighBoost=im+4.5*UnsharpMask;
axes(handles.axes2);  
imshow(ImgHighBoost);title('highboost filter');

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Morphological smoothing
global im
Sm=im;

Str=strel('disk',2);% create a disk structure element with radius=1
fom=imopen(Sm,Str);% opening
focm=imclose(fom,Str);
axes(handles.axes2);
fasfm=Sm;
for i=2:3
    Str=strel('disk',i);
    fasfm=imclose(imopen(fasfm,Str),Str);
end
imshow(fasfm);
title('Morphological Smoothing');

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im output
%Avg1=rgb2gray(im);
    F=fspecial('Gaussian',10,5);
    output=imfilter(im,F);
    axes(handles.axes2);
    imshow(output);title('Gaussian,10,5');

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output
    Avg1=rgb2gray(im);
    %F=butterworth_high_center_f(im,50,5);
    F=ffilter(Avg1,'Bandstop','Butterworth',10,50,1);
    output=F;
    %Img=imfilter(im,F);
    axes(handles.axes2);
    imshow(output);title({'After Processing Butterworth,10,50,1'});
% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

global im  output %g
    A= get(handles.listbox2,'value');
switch A
case 1 
    Avg1=rgb2gray(im);
    F=ffilter(Avg1,'lowpass','Butterworth',10,2);
    output=F;
    axes(handles.axes2);
    imshow(output);title('Lowpass Butterworth');
   
case 2 
    Avg1=rgb2gray(im);
    F=ffilter(Avg1,'Highpass','Butterworth',50,5);
        output=F;
    axes(handles.axes2);
    imshow(output);title('Highpass Butterworth');
    
case 3 
    Avg1=rgb2gray(im);
    F=ffilter(Avg1,'Bandpass','Butterworth',10,50,1);    
        output=F;
    axes(handles.axes2);
    imshow(output);title('Bandpass Butterworth');
case 4 
    Avg1=rgb2gray(im);
    F=ffilter(Avg1,'Bandstop','Butterworth',10,50,1);
       output=F;
    axes(handles.axes2);
    imshow(output);title('Bandstop Butterworth');
end       

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global output
figure;
imshow(output);title('preview detailed');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global output
imwrite(output,'save.jpg');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im IMG
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'Open Image');
if isequal(filename,0)||isequal(pathname,0)
  errordlg("Image isn't selected!!",'Remind'); % If there is no input, then create an error dialog. 
  return;
else
    IMG=[pathname,filename]; % Synthetic path + file name.
    im=imread(IMG); % Read Image
    set(handles.axes1,'HandleVisibility','ON'); % Open axes for following process.
    axes(handles.axes1); % handle image in axes1.
    imshow(im); % show the image in axes1.
    title('Raw Image');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global im  output 
A= get(handles.listbox1,'value');
switch A 
case 1 
    % J = imnoise(im,'salt & pepper', 0.02);
    Avg1=rgb2gray(im);
    AvgImg=filter2(fspecial('average',3),Avg1);
    axes(handles.axes2);
    RGB = im; % Define RGB
    R=double(RGB(:,:,1));% Red channel
    G=double(RGB(:,:,2));% Green channel
    p=0.2989;q=0.5870;t=0.1140;
    B=(double(AvgImg)-p*R-q*G)/t; % B is the blue channel as processing image
    output=uint8(cat(3,R,G,B));
    imshow(output);title({'After Processing,','neighborhood average 3x3'});
    
case 2 
    Avg1=rgb2gray(im);
    AvgImg=filter2(fspecial('average',5),Avg1);
    axes(handles.axes2);
    RGB = im; % Define RGB
    R=double(RGB(:,:,1));% Red channel
    G=double(RGB(:,:,2));% Green channel
    p=0.2989;q=0.5870;t=0.1140;
    B=(double(AvgImg)-p*R-q*G)/t; % B is the blue channel as processing image
    output=uint8(cat(3,R,G,B));
    imshow(output);title({'After Processing,','neighborhood average 5x5'});

case 3 
    Avg1=rgb2gray(im);
    AvgImg=filter2(fspecial('average',7),Avg1);
    axes(handles.axes2);
    RGB = im; % Define RGB
    R=double(RGB(:,:,1));% Red channel
    G=double(RGB(:,:,2));% Green channel
    p=0.2989;q=0.5870;t=0.1140;
    B=(double(AvgImg)-p*R-q*G)/t; % B is the blue channel as processing image
    output=uint8(cat(3,R,G,B));
    imshow(output);title({'After Processing,','neighborhood average 7x7'});

case 4 
    Avg1=rgb2gray(im);
    AvgImg=filter2(fspecial('average',9),Avg1);
    axes(handles.axes2);
    RGB = im; % Define RGB
    R=double(RGB(:,:,1));% Red channel
    G=double(RGB(:,:,2));% Green channel
    p=0.2989;q=0.5870;t=0.1140;
    B=(double(AvgImg)-p*R-q*G)/t; % B is the blue channel as processing image
    output=uint8(cat(3,R,G,B));
    imshow(output);title({'After Processing,','neighborhood average 9x9'});
end

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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im output
%Avg1=rgb2gray(im);
    F=fspecial('Gaussian',10,5);
    output=imfilter(im,F);
    axes(handles.axes2);
    imshow(output);title('Gaussian,10,5');


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global w1 im;
set(handles.slider1,'value',str2num(get(hObject,'string')));
w1 = str2double(get(hObject,'string')); % high_in
J = imadjust(im,[0 w1],[0 1]);
axes(handles.axes2);
imshow(J);title({'Contrast',w1});

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global Bright im;
set(handles.slider2,'value',str2num(get(hObject,'string')));
Bright = str2double(get(hObject,'string')); % 
bimge=imsubtract(im,Bright); % -255~255
axes(handles.axes2);
imshow(bimge);title({'Brightness',Bright});


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Adaptive Histogram-Equalization
global im;
image_r=im(:,:,1); 
Jr = adapthisteq(image_r);
image_g=im(:,:,2); 
Jg = adapthisteq(image_g);
image_b=im(:,:,3);
Jb = adapthisteq(image_b);
axes(handles.axes2);  
imshow(cat(3,Jr,Jg,Jb));title('Adaptive Histogram-Equalization');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Global Histogram-Equalization
global im;
His= histeq(im);
axes(handles.axes2);
imshow(His);title('Global Histogram-Equalization')

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output
image=im; % Read Image
% mask threshold level for R,G,B color
image_r=image(:,:,1); 
image_g=image(:,:,2); 
image_b=image(:,:,3);

%Difine the binary mask size
zero = zeros(size(image_r));
%Obtain R,G,B color mask
Rr=cat(3,image_r,zero,zero);  
Gg=cat(3,zero,image_g,zero);  
Bb=cat(3,zero,zero,image_b);  
RGB=cat(3,image_r,image_g,image_b); 

%Show each portion
figure;
subplot(2,2,1),imshow(Rr),title('Red Component');  
subplot(2,2,2),imshow(Gg),title('Green Component');  
subplot(2,2,3),imshow(Bb),title('Blue Component');  
subplot(2,2,4),imshow(RGB),title('Original Image'); 


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output
A1=im;
B=[0 1 0
     1 1 1
     0 1 0];
A2=imdilate(A1,B);
A3=imdilate(A2,B);
A4=imdilate(A3,B);
figure;
imshow(Er2);
subplot(221),imshow(A1);
title('Raw image before imdilate');
subplot(222),imshow(A2);
title('image dilated 1 time using B');
subplot(223),imshow(A3);
title('image dilated 2 time using B');
subplot(224),imshow(A4);
title('image dilated 3 time using B');



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im output
f=im;
axes(handles.axes2);
se=strel('disk',5');% create a disk structure element with radius=5  
fo=imopen(f,se);
figure;imshow(fo);
title('imopening');

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im output
f=im;
se=strel('square',3);%create a square structure element with width=3
axes(handles.axes2);
fc=imclose(f,se);
imshow(fc);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% boundary
global im output
dary=im;
figure;
Str=strel('disk',10);% create a disk structure element with radius=10
Er3=imerode(Er1,Str);
subplot(121),imshow(Er3);
title('Eroded with disk(10)');
Bo=dary-Er3;
subplot(122),imshow(Bo);
title('Boundary');
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
R1=im;
% select the shape use strel
se1=strel('disk',2);% create a disk structure element with radius=2
R2=imerode(R1,se1);
Di1=im;
BD=[0 1 0
     1 1 1
     0 1 0];
Di2=imdilate(Di1,BD);
Gr=Di2-R2;
axes(handles.axes2);
imshow(Gr);
title('Morphological gradient');


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
disk=im;
[x,y,z]=size(disk);               
disk2=double(disk);                  
N =sqrt(100) * randn(x,y);      
I=disk2+N;                           
for i=1:x                        
    for j=1:y
        if (I(i,j)>255)
            I(i,j)=255;
        end
        if (I(i,j)<0)
            I(i,j)=0;
        end
    end
end   

% Set the value of object
zmax=max(max(I));                  
zmin=min(min(I));                  
Thalf=(zmax+zmin)/2;                     
Thalf2=0;
S0=0; n0=0;
S1=0; n1=0;
allow=0.5;                       
d=abs(Thalf-Thalf2);
count=0;                        
while(d>=allow)                 
    count=count+1;
    for i=1:x
        for j=1:y
            if (I(i,j)>=Thalf)
                S0=S0+I(i,j);
                n0=n0+1;
            end
            if (I(i,j)<Thalf)
                S1=S1+I(i,j);
                n1=n1+1;
            end
        end
    end
    T0=S0/n0;
    T1=S1/n1;
    Thalf2=(T0+T1)/2;
    d=abs(Thalf-Thalf2);
    Thalf=Thalf2;
end
Seg=ones(x,y);
for i=1:x
    for j=1:y
        if(I(i,j)>=Thalf)
            Seg(i,j)=0;               
        end
    end
end
axes(handles.axes2);
imshow(Seg),title('Searched item');


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
