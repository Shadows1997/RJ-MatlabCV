%*****************************************************
%程序：EX405.M
%功能：patch函数创建三维立体图形应用实例
%*****************************************************
vertex_matrix=[0 0 0; 1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];  %顶点矩阵
face_matrix=[1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];  %连接矩阵
%连接关系矩阵每一行中的数值分别表示顶点矩阵的行标
patch('Vertices',vertex_matrix,'Faces',face_matrix,'FaceVertexCData',hsv(8),'FaceColor','interp')                    %patch函数利用矩阵参数绘制三维立体
view(3)                   %设立视角
axis square
xlabel('X')
ylabel('Y')
zlabel('Y')              %坐标轴标注
