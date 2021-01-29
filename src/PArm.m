%In this project we want to simulate a 5-DOF manipulator and calculate the position and
%the orientation of the end effector
%Define a function, which takes the angles between the joints
%Define the matrices of the fixed link parameters (alpha, a, d)
function PARM()
teta = input('Please enter teta matrix(1*6) in radian: ');
alpha=[0,pi/2,0,pi/2,-1*pi/2,-1*pi/2];
a=[0,1,1,0,0,1];
d=[0,0,0,0,0,0];
%A cell to store the transformation matrix between each two joints
T=cell(1,5);
%The transformation matrix between each two joints
for i=1:5
    T{1,i}=[cos(teta(1,i)),-1*sin(teta(1,i)),0,a(1,i);
    sin(teta(1,i))*cos(alpha(1,i)),cos(teta(1,i))*cos(alpha(1,i)),-1*sin(alpha(1,i)),-1*sin(alpha(1,i))*d(1,i);
    sin(teta(1,i))*sin(alpha(1,i)),cos(teta(1,i))*sin(alpha(1,i)),cos(alpha(1,i)),cos(alpha(1,i))*d(1,i);
    0,0,0,1];
end
%Calculating the final transformation matrix by multiplying T{1,1} to T{1,5}
a=T{1,1}*T{1,2}*T{1,3}*T{1,4}*T{1,5};
%Define a zero matrix to store the position coordinates of the end effector
p=zeros(3,1);
for j=1:3
    p(j,1)=a(j,4);
end
%Displaying the position matrix
disp('the position matrix is:')
disp(p)
%Define a zero matrix to store the orientation coordinates of the end effector
R=zeros(3,3);
for i=1:3
    for j=1:3
    R(i,j)=a(i,j);
    end
end
%Displaying the orientation matrix
disp('the orientatation matrix is:')
disp(R); 
end