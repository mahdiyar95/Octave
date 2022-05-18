%Assume we have a dataset of 1000 gray images and each image is a 20*30 pixel.

%The dataset has been vectorized and is a 1000 by 600 matrix.


%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&& Step 1: Random data selection %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% It's also useful for change our dataset distribution. Assume 
% we have a tidy dataset of 1000 car images that sort as car type
% 1 to 200 for sedans , 201 to 400 SUVs and so on,
% but we want to break this rule!

%{================================================ 
1_1 : size!
--------------------------------------------
>> x = [1 2 3 4; 5 6 7 8; 9 0 1 2]

x = 1 2 3 4
    5 6 7 8
    9 0 1 2

>> [x1 x2]= size(x)

x1 = 3
x2 = 4
---------------------------------------------
%} 

% dsSize is the number of samples we have in our dataSet,
% for example 1000!
dsSize = size(dataSet , 1);
%===================================================
%{ 1_2 : generate a random indices
----------------------------------------------
>> ri = randperm(10)
ri=
   5    1   6   3   7   8   4   10  9   2
----------------------------------------------
so ri is a 1 by 10 matrix 
%}

% rndIndc is a 1 by 1000 random matrix
rndIndc = randperm(dsSize);
%====================================================
% 1_3 (final step): pick 200 random samples from our dataSet
subData = dataSet(rndIndc(1:30), :)
%====================================================



%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&& Step 2: plot something! %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assume we want to display 30 images in a 6 by 5 overall view.
% so we should create a large image 

%===================================================
% 2_1: gray images and imagese function
% In gray scale images -1 means black and 1 means white and each number
% between that interpret as sort of intensity of b;ack and white
colormap(gray);

%===================================================
% 2_2: What do we want to do? we want to arrange all 30 small images in a
% bigger picture and also add pads between them

% Dimension of small images
instH = 20;
instW = 30;
pad =1;

% The dimension of large image with respect to the number of small images in it:
numbRows = 6; % 6 small images in each row
numbCols = 5; % 5 small images in each column
%===================================================
% 2_3
% Create a big black picture
%{
ones function :
-----------------------------------
>> ones(2,3)
ans = 
    1   1   1
    1   1   1
-----------------------------------
%}

bigImage = - ones(pad + numbRows*(instH + pad), pad + numbCols*(instW + pad));
% So bigImage is a 127 by 156 matrix and all its elemenents is equal to -1

%===================================================
% 2_4
% reshape function 
%{
>> d = 1:24
d = 
    1   2   3   4   5   6   7   8   9   10  ... 24
y = 0nes(4,6)
y=
    1   1   1   1   1   1
    1   1   1   1   1   1
    1   1   1   1   1   1
    1   1   1   1   1   1

%(y has 24 elements)

y = reshape(d, 4, 6)
y = 
    1   5   9   13  17  21
    2   6   10  14  18  22
    3   7   11  15  19  23
    4   8   12  16  20  24

%}

%===================================================
% 2_5
% arrange small images in the large image
instNumber = 1;
for j = 1 : numbRows
    for i = 1 : numbCols
    if(instNumber > 30),
        break;
    end

    maximum_value = max(abs(subData(instNumber, :)));

% abs function : abs(-10) = 10
%
% if x =    -1     2       -7.5
%            3     -10      8 
% then abs(x) is:
% abs(x)=   1     2       7.5
%           3     10       8
%
% max function : max [1 2 10;100 -101]
