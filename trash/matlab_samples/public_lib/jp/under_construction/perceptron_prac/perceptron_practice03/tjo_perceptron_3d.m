function [yvec,wvec]=tjo_perceptron_3d(xvec)

% xyz座標系の値を素性とした訓練データ
% 適当に決めて第1集団なら1
% 第2集団なら-1を正解ラベルとする

x_list=[[1;1;1;1] [2;3;1;1] [2;1;1;1] [2;-1;1;1] [3;2;1;1] [-1;-1;-1;1] [0;-1;0;1] [0;-1;-1;1] [-1;-2;-1;1] [-1;-2;-3;1]];
t_list=[1;1;1;1;1;-1;-1;-1;-1;-1];

% 訓練パート
wvec=[0;0;0;1]; % 初期重みベクトル
loop=1000; % 訓練の繰り返し回数

% Learning
for j=1:loop
    for i=1:10
        wvec=tjo_train(wvec,x_list(:,i),t_list(i));
    end;
    j=j+1;
end;

% xvecは[x;y;bias]とする

% Trial
[t_label,yvec]=tjo_predict(wvec,xvec);
if(t_label>0)
    fprintf(1,'Group 1\n\n');
else
    fprintf(1,'Group 2\n\n');
end;

a=wvec(1);
b=wvec(2);
c=wvec(3);
d=wvec(4);

[xx,yy]=meshgrid(-5:.1:5,-5:.1:5);
zz=-(a/c)*xx-(b/c)*yy-(d/c);
figure;
mesh(xx,yy,zz);hold on;
scatter3(x_list(1,1:5),x_list(2,1:5),x_list(3,1:5),500,'black');hold on;
scatter3(x_list(1,6:10),x_list(2,6:10),x_list(3,6:10),500,'black','+');hold on;
scatter3(xvec(1),xvec(2),xvec(3),500,'red');

end