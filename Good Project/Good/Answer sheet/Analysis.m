function [Dom, Aom, Answer, Bn] = Analysis(stats1, stats2, Line, Img, flag)
%%下区域分析
%答题区域默认为六个大区：1~20，21~40，41~60，61~75，76~90，91~105
if nargin < 5
    flag = 1;
end
Line1 = Line{1};
Line2 = Line{2};
Line3 = Line{3};
Line4 = Line{4};
yn1 = round(Line1(1, 2) + 0.18*(Line2(1, 2)-Line1(1, 2)));
yn2 = round(Line1(1, 2) + 0.34*(Line2(1, 2)-Line1(1, 2)));
yn3 = round(Line1(1, 2) + 0.50*(Line2(1, 2)-Line1(1, 2)));
yn4 = round(Line1(1, 2) + 0.66*(Line2(1, 2)-Line1(1, 2)));
yn5 = round(Line1(1, 2) + 0.82*(Line2(1, 2)-Line1(1, 2)));
yn6 = round(Line1(1, 2) + 0.98*(Line2(1, 2)-Line1(1, 2)));

%下区域六条横线
Linen1_1 = [Line1(1, 1) yn1; Line1(2, 1) yn1];
Linen2_1 = [Line1(1, 1) yn2; Line1(2, 1) yn2];
Linen3_1 = [Line1(1, 1) yn3; Line1(2, 1) yn3];
Linen4_1 = [Line1(1, 1) yn4; Line1(2, 1) yn4];
Linen5_1 = [Line1(1, 1) yn5; Line1(2, 1) yn5];
Linen6_1 = [Line1(1, 1) yn6; Line1(2, 1) yn6];

% 定位竖直网格分割线
xn1 = round(Line3(1, 1) + 0.22*(Line4(1, 1)-Line3(1, 1)));
xn2 = round(Line3(1, 1) + 0.26*(Line4(1, 1)-Line3(1, 1)));
xn3 = round(Line3(1, 1) + 0.48*(Line4(1, 1)-Line3(1, 1)));
xn4 = round(Line3(1, 1) + 0.52*(Line4(1, 1)-Line3(1, 1)));
xn5 = round(Line3(1, 1) + 0.72*(Line4(1, 1)-Line3(1, 1)));
xn6 = round(Line3(1, 1) + 0.77*(Line4(1, 1)-Line3(1, 1)));
xn7 = round(Line3(1, 1) + 0.98*(Line4(1, 1)-Line3(1, 1)));

Linen1_2 = [xn1 Line3(1, 2); xn1 Line3(2, 2)];
Linen2_2 = [xn2 Line3(1, 2); xn2 Line3(2, 2)];
Linen3_2 = [xn3 Line3(1, 2); xn3 Line3(2, 2)];
Linen4_2 = [xn4 Line3(1, 2); xn4 Line3(2, 2)];
Linen5_2 = [xn5 Line3(1, 2); xn5 Line3(2, 2)];
Linen6_2 = [xn6 Line3(1, 2); xn6 Line3(2, 2)];
Linen7_2 = [xn7 Line3(1, 2); xn7 Line3(2, 2)];

%下区域一定位横网格线坐标计算
ym1_1 = round(Line1(1, 2) + 0.38*(Linen1_1(1, 2)-Line1(1, 2)));
ym2_1 = round(Line1(1, 2) + 0.5*(Linen1_1(1, 2)-Line1(1, 2)));
ym3_1 = round(Line1(1, 2) + 0.65*(Linen1_1(1, 2)-Line1(1, 2)));
ym4_1 = round(Line1(1, 2) + 0.80*(Linen1_1(1, 2)-Line1(1, 2)));
ym5_1 = round(Line1(1, 2) + 0.93*(Linen1_1(1, 2)-Line1(1, 2)));
%下区域一定位横网格线
Linem1_1 = [Line1(1, 1) ym1_1; Line1(2, 1) ym1_1];
Linem2_1 = [Line1(1, 1) ym2_1; Line1(2, 1) ym2_1];
Linem3_1 = [Line1(1, 1) ym3_1; Line1(2, 1) ym3_1];
Linem4_1 = [Line1(1, 1) ym4_1; Line1(2, 1) ym4_1];
Linem5_1 = [Line1(1, 1) ym5_1; Line1(2, 1) ym5_1];

%下区域二定位横网格线坐标计算
ym1_2 = round(Linen1_1(1, 2) + 0.30*(Linen2_1(1, 2)-Linen1_1(1, 2)));
ym2_2 = round(Linen1_1(1, 2) + 0.43*(Linen2_1(1, 2)-Linen1_1(1, 2)));
ym3_2 = round(Linen1_1(1, 2) + 0.60*(Linen2_1(1, 2)-Linen1_1(1, 2)));
ym4_2 = round(Linen1_1(1, 2) + 0.75*(Linen2_1(1, 2)-Linen1_1(1, 2)));
ym5_2 = round(Linen1_1(1, 2) + 0.90*(Linen2_1(1, 2)-Linen1_1(1, 2)));
%下区域二定位横网格线
Linem1_2 = [Line1(1, 1) ym1_2; Line1(2, 1) ym1_2];
Linem2_2 = [Line1(1, 1) ym2_2; Line1(2, 1) ym2_2];
Linem3_2 = [Line1(1, 1) ym3_2; Line1(2, 1) ym3_2];
Linem4_2 = [Line1(1, 1) ym4_2; Line1(2, 1) ym4_2];
Linem5_2 = [Line1(1, 1) ym5_2; Line1(2, 1) ym5_2];

%下区域三定位横网格线坐标计算
ym1_3 = round(Linen2_1(1, 2) + 0.25*(Linen3_1(1, 2)-Linen2_1(1, 2)));
ym2_3 = round(Linen2_1(1, 2) + 0.43*(Linen3_1(1, 2)-Linen2_1(1, 2)));
ym3_3 = round(Linen2_1(1, 2) + 0.60*(Linen3_1(1, 2)-Linen2_1(1, 2)));
ym4_3 = round(Linen2_1(1, 2) + 0.75*(Linen3_1(1, 2)-Linen2_1(1, 2)));
ym5_3 = round(Linen2_1(1, 2) + 0.90*(Linen3_1(1, 2)-Linen2_1(1, 2)));
%下区域三定位横网格线
Linem1_3 = [Line1(1, 1) ym1_3; Line1(2, 1) ym1_3];
Linem2_3 = [Line1(1, 1) ym2_3; Line1(2, 1) ym2_3];
Linem3_3 = [Line1(1, 1) ym3_3; Line1(2, 1) ym3_3];
Linem4_3 = [Line1(1, 1) ym4_3; Line1(2, 1) ym4_3];
Linem5_3 = [Line1(1, 1) ym5_3; Line1(2, 1) ym5_3];

%下区域四定位横网格线坐标计算
ym1_4 = round(Linen3_1(1, 2) + 0.25*(Linen4_1(1, 2)-Linen3_1(1, 2)));
ym2_4 = round(Linen3_1(1, 2) + 0.40*(Linen4_1(1, 2)-Linen3_1(1, 2)));
ym3_4 = round(Linen3_1(1, 2) + 0.60*(Linen4_1(1, 2)-Linen3_1(1, 2)));
ym4_4 = round(Linen3_1(1, 2) + 0.75*(Linen4_1(1, 2)-Linen3_1(1, 2)));
ym5_4 = round(Linen3_1(1, 2) + 0.90*(Linen4_1(1, 2)-Linen3_1(1, 2)));
%下区域四定位横网格线
Linem1_4 = [Line1(1, 1) ym1_4; Line1(2, 1) ym1_4];
Linem2_4 = [Line1(1, 1) ym2_4; Line1(2, 1) ym2_4];
Linem3_4 = [Line1(1, 1) ym3_4; Line1(2, 1) ym3_4];
Linem4_4 = [Line1(1, 1) ym4_4; Line1(2, 1) ym4_4];
Linem5_4 = [Line1(1, 1) ym5_4; Line1(2, 1) ym5_4];

%下区域五定位横网格线坐标计算
ym1_5 = round(Linen4_1(1, 2) + 0.25*(Linen5_1(1, 2)-Linen4_1(1, 2)));
ym2_5 = round(Linen4_1(1, 2) + 0.40*(Linen5_1(1, 2)-Linen4_1(1, 2)));
ym3_5 = round(Linen4_1(1, 2) + 0.57*(Linen5_1(1, 2)-Linen4_1(1, 2)));
ym4_5 = round(Linen4_1(1, 2) + 0.75*(Linen5_1(1, 2)-Linen4_1(1, 2)));
ym5_5 = round(Linen4_1(1, 2) + 0.90*(Linen5_1(1, 2)-Linen4_1(1, 2)));
%下区域五定位横网格线
Linem1_5 = [Line1(1, 1) ym1_5; Line1(2, 1) ym1_5];
Linem2_5 = [Line1(1, 1) ym2_5; Line1(2, 1) ym2_5];
Linem3_5 = [Line1(1, 1) ym3_5; Line1(2, 1) ym3_5];
Linem4_5 = [Line1(1, 1) ym4_5; Line1(2, 1) ym4_5];
Linem5_5 = [Line1(1, 1) ym5_5; Line1(2, 1) ym5_5];

%下区域六定位横网格线坐标计算
ym1_6 = round(Linen5_1(1, 2) + 0.25*(Linen6_1(1, 2)-Linen5_1(1, 2)));
ym2_6 = round(Linen5_1(1, 2) + 0.40*(Linen6_1(1, 2)-Linen5_1(1, 2)));
ym3_6 = round(Linen5_1(1, 2) + 0.57*(Linen6_1(1, 2)-Linen5_1(1, 2)));
ym4_6 = round(Linen5_1(1, 2) + 0.72*(Linen6_1(1, 2)-Linen5_1(1, 2)));
ym5_6 = round(Linen5_1(1, 2) + 0.88*(Linen6_1(1, 2)-Linen5_1(1, 2)));
%下区域六定位横网格线
Linem1_6 = [Line1(1, 1) ym1_6; Line1(2, 1) ym1_6];
Linem2_6 = [Line1(1, 1) ym2_6; Line1(2, 1) ym2_6];
Linem3_6 = [Line1(1, 1) ym3_6; Line1(2, 1) ym3_6];
Linem4_6 = [Line1(1, 1) ym4_6; Line1(2, 1) ym4_6];
Linem5_6 = [Line1(1, 1) ym5_6; Line1(2, 1) ym5_6];

%下区域一定位竖线坐标计算
xm1_1 = round(Line3(1, 1) + 0.07*(Linen1_2(1, 1)-Line3(1, 1)));
xm1_2 = round(Line3(1, 1) + 0.25*(Linen1_2(1, 1)-Line3(1, 1)));
xm1_3 = round(Line3(1, 1) + 0.43*(Linen1_2(1, 1)-Line3(1, 1)));
xm1_4 = round(Line3(1, 1) + 0.63*(Linen1_2(1, 1)-Line3(1, 1)));
xm1_5 = round(Line3(1, 1) + 0.80*(Linen1_2(1, 1)-Line3(1, 1)));
xm1_6 = round(Line3(1, 1) + 0.98*(Linen1_2(1, 1)-Line3(1, 1)));
%下区域一定位竖线
Linem1_1_2 = [xm1_1 Line3(1, 2); xm1_1 Line3(2, 2)];
Linem1_2_2 = [xm1_2 Line3(1, 2); xm1_2 Line3(2, 2)];
Linem1_3_2 = [xm1_3 Line3(1, 2); xm1_3 Line3(2, 2)];
Linem1_4_2 = [xm1_4 Line3(1, 2); xm1_4 Line3(2, 2)];
Linem1_5_2 = [xm1_5 Line3(1, 2); xm1_5 Line3(2, 2)];
Linem1_6_2 = [xm1_6 Line3(1, 2); xm1_6 Line3(2, 2)];

%下区域二定位竖线坐标计算
xm2_1 = round(Linen2_2(1, 1) + 0*(Linen3_2(1, 1)-Linen2_2(1, 1)));
xm2_2 = round(Linen2_2(1, 1) + 0.22*(Linen3_2(1, 1)-Linen2_2(1, 1)));
xm2_3 = round(Linen2_2(1, 1) + 0.41*(Linen3_2(1, 1)-Linen2_2(1, 1)));
xm2_4 = round(Linen2_2(1, 1) + 0.58*(Linen3_2(1, 1)-Linen2_2(1, 1)));
xm2_5 = round(Linen2_2(1, 1) + 0.78*(Linen3_2(1, 1)-Linen2_2(1, 1)));
xm2_6 = round(Linen2_2(1, 1) + 0.98*(Linen3_2(1, 1)-Linen2_2(1, 1)));
%下区域二定位竖线
Linem2_1_2 = [xm2_1 Line3(1, 2); xm2_1 Line3(2, 2)];
Linem2_2_2 = [xm2_2 Line3(1, 2); xm2_2 Line3(2, 2)];
Linem2_3_2 = [xm2_3 Line3(1, 2); xm2_3 Line3(2, 2)];
Linem2_4_2 = [xm2_4 Line3(1, 2); xm2_4 Line3(2, 2)];
Linem2_5_2 = [xm2_5 Line3(1, 2); xm2_5 Line3(2, 2)];
Linem2_6_2 = [xm2_6 Line3(1, 2); xm2_6 Line3(2, 2)];

%下区域三定位竖线坐标计算
xm3_1 = round(Linen4_2(1, 1) + 0*(Linen5_2(1, 1)-Linen4_2(1, 1)));
xm3_2 = round(Linen4_2(1, 1) + 0.19*(Linen5_2(1, 1)-Linen4_2(1, 1)));
xm3_3 = round(Linen4_2(1, 1) + 0.37*(Linen5_2(1, 1)-Linen4_2(1, 1)));
xm3_4 = round(Linen4_2(1, 1) + 0.58*(Linen5_2(1, 1)-Linen4_2(1, 1)));
xm3_5 = round(Linen4_2(1, 1) + 0.78*(Linen5_2(1, 1)-Linen4_2(1, 1)));
xm3_6 = round(Linen4_2(1, 1) + 1.00*(Linen5_2(1, 1)-Linen4_2(1, 1)));
%下区域三定位竖线
Linem3_1_2 = [xm3_1 Line3(1, 2); xm3_1 Line3(2, 2)];
Linem3_2_2 = [xm3_2 Line3(1, 2); xm3_2 Line3(2, 2)];
Linem3_3_2 = [xm3_3 Line3(1, 2); xm3_3 Line3(2, 2)];
Linem3_4_2 = [xm3_4 Line3(1, 2); xm3_4 Line3(2, 2)];
Linem3_5_2 = [xm3_5 Line3(1, 2); xm3_5 Line3(2, 2)];
Linem3_6_2 = [xm3_6 Line3(1, 2); xm3_6 Line3(2, 2)];

%下区域四定位竖线坐标计算
xm4_1 = round(Linen6_2(1, 1) + 0*(Linen7_2(1, 1)-Linen6_2(1, 1)));
xm4_2 = round(Linen6_2(1, 1) + 0.20*(Linen7_2(1, 1)-Linen6_2(1, 1)));
xm4_3 = round(Linen6_2(1, 1) + 0.41*(Linen7_2(1, 1)-Linen6_2(1, 1)));
xm4_4 = round(Linen6_2(1, 1) + 0.58*(Linen7_2(1, 1)-Linen6_2(1, 1)));
xm4_5 = round(Linen6_2(1, 1) + 0.78*(Linen7_2(1, 1)-Linen6_2(1, 1)));
xm4_6 = round(Linen6_2(1, 1) + 0.98*(Linen7_2(1, 1)-Linen6_2(1, 1)));
%下区域四定位竖线
Linem4_1_2 = [xm4_1 Line3(1, 2); xm4_1 Line3(2, 2)];
Linem4_2_2 = [xm4_2 Line3(1, 2); xm4_2 Line3(2, 2)];
Linem4_3_2 = [xm4_3 Line3(1, 2); xm4_3 Line3(2, 2)];
Linem4_4_2 = [xm4_4 Line3(1, 2); xm4_4 Line3(2, 2)];
Linem4_5_2 = [xm4_5 Line3(1, 2); xm4_5 Line3(2, 2)];
Linem4_6_2 = [xm4_6 Line3(1, 2); xm4_6 Line3(2, 2)];

%上区域横网格线坐标计算
%由下向上
ym1_u = round(Line1(1, 2) - 0.22*(Linen1_1(1, 2)-Line1(1, 2)));
ym2_u = round(Line1(1, 2) - 0.37*(Linen1_1(1, 2)-Line1(1, 2)));
ym3_u = round(Line1(1, 2) - 0.52*(Linen1_1(1, 2)-Line1(1, 2)));
ym4_u = round(Line1(1, 2) - 0.66*(Linen1_1(1, 2)-Line1(1, 2)));
ym5_u = round(Line1(1, 2) - 0.81*(Linen1_1(1, 2)-Line1(1, 2)));
ym6_u = round(Line1(1, 2) - 0.96*(Linen1_1(1, 2)-Line1(1, 2)));
ym7_u = round(Line1(1, 2) - 1.11*(Linen1_1(1, 2)-Line1(1, 2)));
ym8_u = round(Line1(1, 2) - 1.27*(Linen1_1(1, 2)-Line1(1, 2)));
ym9_u = round(Line1(1, 2) - 1.42*(Linen1_1(1, 2)-Line1(1, 2)));
ym10_u = round(Line1(1, 2) - 1.58*(Linen1_1(1, 2)-Line1(1, 2)));
ym11_u = round(Line1(1, 2) - 1.74*(Linen1_1(1, 2)-Line1(1, 2)));
%上区域横网格线
Linem1_u = [Line1(1, 1) ym1_u; Line1(2, 1) ym1_u];
Linem2_u = [Line1(1, 1) ym2_u; Line1(2, 1) ym2_u];
Linem3_u = [Line1(1, 1) ym3_u; Line1(2, 1) ym3_u];
Linem4_u = [Line1(1, 1) ym4_u; Line1(2, 1) ym4_u];
Linem5_u = [Line1(1, 1) ym5_u; Line1(2, 1) ym5_u];
Linem6_u = [Line1(1, 1) ym6_u; Line1(2, 1) ym6_u];
Linem7_u = [Line1(1, 1) ym7_u; Line1(2, 1) ym7_u];
Linem8_u = [Line1(1, 1) ym8_u; Line1(2, 1) ym8_u];
Linem9_u = [Line1(1, 1) ym9_u; Line1(2, 1) ym9_u];
Linem10_u = [Line1(1, 1) ym10_u; Line1(2, 1) ym10_u];
Linem11_u = [Line1(1, 1) ym11_u; Line1(2, 1) ym11_u];

%下区域一分割线信息
Dom(1).Loc = [Line1(1, 2) Linen1_1(1, 2)];
Dom(1).y = [ym1_1 ym2_1 ym3_1 ym4_1 ym5_1];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
xt{4} = [xm4_1 xm4_2 xm4_3 xm4_4 xm4_5 xm4_6];
Dom(1).x = xt;

%下区域二分割线信息
Dom(2).Loc = [Linen1_1(1, 2) Linen2_1(1, 2)];
Dom(2).y = [ym1_2 ym2_2 ym3_2 ym4_2 ym5_2];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
xt{4} = [xm4_1 xm4_2 xm4_3 xm4_4 xm4_5 xm4_6];
Dom(2).x = xt;

%下区域三分割线信息
Dom(3).Loc = [Linen2_1(1, 2) Linen3_1(1, 2)];
Dom(3).y = [ym1_3 ym2_3 ym3_3 ym4_3 ym5_3];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
xt{4} = [xm4_1 xm4_2 xm4_3 xm4_4 xm4_5 xm4_6];
Dom(3).x = xt;

%下区域四分割线信息
Dom(4).Loc = [Linen3_1(1, 2) Linen4_1(1, 2)];
Dom(4).y = [ym1_4 ym2_4 ym3_4 ym4_4 ym5_4];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
Dom(4).x = xt;
Dom(4).x(4) = [];

%下区域五分割线信息
Dom(5).Loc = [Linen4_1(1, 2) Linen5_1(1, 2)];
Dom(5).y = [ym1_5 ym2_5 ym3_5 ym4_5 ym5_5];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
Dom(5).x = xt;
Dom(5).x(4) = [];

%下区域六分割线信息
Dom(6).Loc = [Linen5_1(1, 2) Linen6_1(1, 2)];
Dom(6).y = [ym1_6 ym2_6 ym3_6 ym4_6 ym5_6];
xt{1} = [xm1_1 xm1_2 xm1_3 xm1_4 xm1_5 xm1_6];
xt{2} = [xm2_1 xm2_2 xm2_3 xm2_4 xm2_5 xm2_6];
xt{3} = [xm3_1 xm3_2 xm3_3 xm3_4 xm3_5 xm3_6];
Dom(6).x = xt;
Dom(6).x(4) = [];

%%上区域分析
%信息区默认三个大区：试卷类型、准考证号、科目类型
%区域分割线信息
Aom(1).Loc = [ym7_u ym6_u];
Aom(1).y = [ym7_u ym6_u];
Aom(1).x = [xm1_5 xm1_6 xm2_1 xm2_2 xm2_3];

%区域分割线信息
Aom(2).Loc = [ym11_u ym1_u];
Aom(2).y = [ym11_u ym10_u ym9_u ym8_u ...
    ym7_u ym6_u ym5_u ym4_u ...
    ym3_u ym2_u ym1_u];
Aom(2).x = [xm2_5 xm2_6 xm3_1 xm3_2 xm3_3 ...
    xm3_4 xm3_5 xm3_6 xm4_1 xm4_2];

%区域分割线信息
Aom(3).Loc = [ym11_u ym1_u];
Aom(3).y = [ym11_u ym10_u ym9_u ym8_u ...
    ym7_u ym6_u ym5_u ym4_u ...
    ym3_u ym2_u ym1_u];
Aom(3).x = [xm4_5 xm4_6];

%%下区域结果
aw = ['A' 'B' 'C' 'D'];
%统计答题区域信息
for i = 1 : 115
    Answer(i).Loc = [];%初始化位置信息
    Answer(i).no = [];%初始化题号信息
    Answer(i).aw = [];%初始化答案信息（可以多选）
end
for i = 1 : 115%length(stats1)%扫描已填涂区域数量
    if i <= length(stats1)
        temp = stats1(i).Centroid; %获取填涂区质心坐标
        for i1 = 1 : length(Dom)%遍历横大区
            Loc = Dom(i1).Loc;%获取横大区分割线位置信息
            if temp(2) >= Loc(1) && temp(2) <= Loc(2)
                %质心纵坐标与当前横大区域分割线坐标对比，判断落在哪个答题横大区
                x = Dom(i1).x;%当前横大区的竖线集合
                y = Dom(i1).y;%当前横大区的横线集合
                %%前三行与后三行每行题数目不一样，前三行20题，后三行15题
                % i_y是列编号
                if i1 >= 4 && i1 <= 6           
                    i_y = i1*15;
                else
                    i_y = (i1-1)*20;
                end
                if i1 >= 4 && i1 <= 6
                    for i2 = 1 : (length(x)-1)%前三竖大区扫描                
                        xt = x{i2};%第i2个竖大区
                        for i3 = 1 : length(xt)-1%遍历每个竖大区的小区分割线
                            if temp(1) >= xt(i3) && temp(1) <= xt(i3+1)
                            %质心横坐标与该区域竖分割线坐标对比，判断落在哪个答题区域  
                            %%i_x为小区横向编号
                                i_x = (i2-1)*5 + i3;                 
                                break;
                            end
                        end
                    end
                else
                    for i2 = 1 : length(x)              
                        xt = x{i2};
                        for i3 = 1 : length(xt)-1
                            if temp(1) >= xt(i3) && temp(1) <= xt(i3+1)
                            %质心横坐标与该区域竖分割线坐标对比，判断落在哪个答题区域  
                                i_x = (i2-1)*5 + i3;
                                break;
                            end
                        end
                    end
                end
                i_n = i_y + i_x;%计算题号
                for i4 = 1 : length(y)-1
                    if temp(2) >= y(i4) && temp(2) <= y(i4+1)
                        i_a = aw(i4);%获取答案
                        break;
                    end
                end
            end
        end
        Answer(i_n).Loc = [Answer(i_n).Loc; temp];
        Answer(i_n).no = i_n;
        Answer(i_n).aw = [Answer(i_n).aw i_a];
    end
end
%答案信息整合

%%上区域结果

%试卷类型区域
Loc1 = Aom(1).Loc;
x1 = Aom(1).x;
y1 = Aom(1).y;
%准考证区域
Loc2 = Aom(2).Loc;
x2 = Aom(2).x;
y2 = Aom(2).y;
%科目类型区域
Loc3 = Aom(3).Loc;
x3 = Aom(3).x;
y3 = Aom(3).y;
% 科目字符串
strs = ['政治'; '语文'; '数学'; '物理'; '化学'; '外语'; '历史'; '地理'; '生物'; '文综'; '理综'];

for i = 1 : 3
    Bn(i).result = []; % 涂抹结果（可以存储多个涂抹信息）
    Bn(i).Loc = []; % 位置（可以存储多个位置信息）
end
for i = 1 : length(stats2)
    temp = stats2(i).Centroid; %区域中点
    if temp(1) >= x1(1) && temp(1) <= x1(2) && ...
            temp(2) >= y1(1) && temp(2) <= y1(2)
        %试卷类型区域，区域一
        Bn(1).Loc = temp;%区域位置
        Bn(1).result = 'A';%区域内容
    elseif temp(1) >= x1(2) && temp(1) <= x1(3) && ...
            temp(2) >= y1(1) && temp(2) <= y1(2)
        %试卷类型区域，区域一
        Bn(1).Loc = temp;%区域位置
        Bn(1).result = 'B';%区域内容
    elseif temp(1) >= x1(3) && temp(1) <= x1(4) && ...
            temp(2) >= y1(1) && temp(2) <= y1(2)
        %试卷类型区域，区域一
        Bn(1).Loc = temp;%区域位置
        Bn(1).result = 'C';%区域内容
    elseif temp(1) >= x1(4) && temp(1) <= x1(5) && ...
            temp(2) >= y1(1) && temp(2) <= y1(2)
        %试卷类型区域，区域一
        Bn(1).Loc = temp;%区域位置
        Bn(1).result = 'D';%区域内容
    end
    if temp(2) >= Loc2(1) && temp(2) <= Loc2(2)
        %准考证区域，区域二
        for i1 = 1 : length(x2)-1
            if temp(1) >= x2(i1) && temp(1) <= x2(i1+1)
                for i2 = 1 : length(y2)-1
                    if temp(2) >= y2(i2) && temp(2) <= y2(i2+1)
                        Bn(2).Loc = [Bn(2).Loc; temp];%区域位置
                        Bn(2).result = [Bn(2).result; i2-1];%区域内容
                    end
                end
            end
        end
    end
    if temp(2) >= Loc3(1) && temp(2) <= Loc3(2) && temp(1) >= x3(1) && temp(1) <= x3(2)
        %科目区域，区域三
        for i1 = 1 : length(y3)-1
            if temp(2) >= y3(i1) && temp(2) <= y3(i1+1)
                Bn(3).Loc = [Bn(3).Loc; temp];%区域位置
                Bn(3).result = [Bn(3).result; strs(i1, :)];%区域内容 
            end
        end
    end
end

% if flag
%     figure;
%     imshow(Img); title('网格线生成', 'FontWeight', 'Bold');
%     hold on;
%     %2017-04-09 11:35:37
%     axis on;
%     set(gca,'XLim',[0 605]);%Y轴的数据显示范围
%     set(gca,'XTick',[0:0.5:605]);%设置要显示坐标刻度
%     set(gca,'YLim',[0 832]);%Y轴的数据显示范围
%     set(gca,'YTick',[0:0.5:832]);%设置要显示坐标刻度
%     grid on;
%     %--------------------
%     plot(Linem1_1(:, 1), Linem1_1(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_1(:, 1), Linem2_1(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_1(:, 1), Linem3_1(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_1(:, 1), Linem4_1(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_1(:, 1), Linem5_1(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_2(:, 1), Linem1_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_2(:, 1), Linem2_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_2(:, 1), Linem3_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_2(:, 1), Linem4_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_2(:, 1), Linem5_2(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_3(:, 1), Linem1_3(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_3(:, 1), Linem2_3(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_3(:, 1), Linem3_3(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_3(:, 1), Linem4_3(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_3(:, 1), Linem5_3(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_4(:, 1), Linem1_4(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_4(:, 1), Linem2_4(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_4(:, 1), Linem3_4(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_4(:, 1), Linem4_4(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_4(:, 1), Linem5_4(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_5(:, 1), Linem1_5(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_5(:, 1), Linem2_5(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_5(:, 1), Linem3_5(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_5(:, 1), Linem4_5(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_5(:, 1), Linem5_5(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_6(:, 1), Linem1_6(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_6(:, 1), Linem2_6(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_6(:, 1), Linem3_6(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_6(:, 1), Linem4_6(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem5_6(:, 1), Linem5_6(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem1_u(:, 1), Linem1_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem2_u(:, 1), Linem2_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem3_u(:, 1), Linem3_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem4_u(:, 1), Linem4_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem5_u(:, 1), Linem5_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem6_u(:, 1), Linem6_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem7_u(:, 1), Linem7_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem8_u(:, 1), Linem8_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem9_u(:, 1), Linem9_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem10_u(:, 1), Linem10_u(:, 2), 'b-', 'LineWidth', 1);
%     plot(Linem11_u(:, 1), Linem11_u(:, 2), 'b-', 'LineWidth', 1);
%     %竖线显示
%     plot(Linem1_1_2(:, 1), Linem1_1_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem1_2_2(:, 1), Linem1_2_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem1_3_2(:, 1), Linem1_3_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem1_4_2(:, 1), Linem1_4_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem1_5_2(:, 1), Linem1_5_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem1_6_2(:, 1), Linem1_6_2(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem2_1_2(:, 1), Linem2_1_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_2_2(:, 1), Linem2_2_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_3_2(:, 1), Linem2_3_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_4_2(:, 1), Linem2_4_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_5_2(:, 1), Linem2_5_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem2_6_2(:, 1), Linem2_6_2(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem3_1_2(:, 1), Linem3_1_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_2_2(:, 1), Linem3_2_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_3_2(:, 1), Linem3_3_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_4_2(:, 1), Linem3_4_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_5_2(:, 1), Linem3_5_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem3_6_2(:, 1), Linem3_6_2(:, 2), 'r-', 'LineWidth', 1);
%     
%     plot(Linem4_1_2(:, 1), Linem4_1_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_2_2(:, 1), Linem4_2_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_3_2(:, 1), Linem4_3_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_4_2(:, 1), Linem4_4_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_5_2(:, 1), Linem4_5_2(:, 2), 'r-', 'LineWidth', 1);
%     plot(Linem4_6_2(:, 1), Linem4_6_2(:, 2), 'r-', 'LineWidth', 1);
%     hold off;
%     set(gcf, 'units', 'normalized', 'position', [0 0 1 1]);
%     figure;
%     imshow(Img); title('结果分析标记', 'FontWeight', 'Bold'); hold on;
%     for i = 1 : length(Answer)
%         if ~isempty(Answer(i).Loc)
%             tempi = Answer(i).Loc; 
%             awi = Answer(i).aw;
%             for j = 1 : size(tempi, 1)
%                 tempij = tempi(j, :);
%                 awij = awi(j);
%                 text(tempij(1), tempij(2), awij, 'color', 'b');
%             end
%         end
%     end
%     %判别错误类型
%     Err = [0 0 0];
%     %试卷类型判断
%     if ~isempty(Bn(1).Loc)
%         tempi = Bn(1).Loc;
%         resulti = Bn(1).result;
%         for j = 1 : size(tempi, 1)
%             tempij = tempi(j, :);
%             resultij = resulti(j, :);
%             text(tempij(1), tempij(2), num2str(resultij), 'color', 'b');
%         end
%     else
%         Err(1) = 1;
%     end
%     %学号判断
%     if ~isempty(Bn(2).Loc)
%         tempi = Bn(2).Loc;
%         resulti = Bn(2).result;
%         for j = 1 : size(tempi, 1)
%             tempij = tempi(j, :);
%             resultij = resulti(j, :);
%             text(tempij(1), tempij(2), num2str(resultij), 'color', 'b');
%         end
%         if size(tempi, 1) ~= 9
%             Err(2) = 1;
%         end
%     else
%         Err(2) = 1;
%     end
%     %学科判断
%     if ~isempty(Bn(3).Loc)
%         tempi = Bn(3).Loc; 
%         resulti = Bn(3).result; 
%         for j = 1 : size(tempi, 1)
%             tempij = tempi(j, :);
%             resultij = resulti(j, :);
%             text(tempij(1), tempij(2), num2str(resultij), 'color', 'b');
%         end
%         if size(tempi, 1) ~= 1
%             Err(3) = 1;
%         end
%     else
%         Err(3) = 1;
%     end
%     hold off;
%     set(gcf, 'units', 'normalized', 'position', [0 0 1 1]);
%     if Err(1)
%         msgbox('试卷类型报警！', '提示信息', 'modal');
%     end
%     if Err(2)
%         msgbox('准考证报警，请检查是否涂抹正确！', '提示信息', 'modal');
%     end
%     if Err(3)
%         msgbox('考试科目报警！', '提示信息', 'modal');
%     end    
end