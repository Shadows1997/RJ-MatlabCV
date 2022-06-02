
function cropImg(outFileName)
output = screenSnipping();

fig = figure('ToolBar', 'None', 'MenuBar', 'none', 'Name', 'Sniping', 'NumberTitle', 'off');
scSize = get(0, 'ScreenSize');
fig.Position = [0, 0, scSize(3), scSize(4)];
imshow(output, 'Border', 'tight', 'InitialMagnification', 'fit');
fig.Position = [0, 0, scSize(3), scSize(4)];
% set(fig, 'WindowButtonMotionFcn', @winBtnMotion);

% imwrite(uint8(output), 'TestPic1.png');
ax = gca;
pos1 = ginput(1);
hold on
scatter(pos1(1), pos1(2), 10, ...
    'Parent', ax, ...
    'Marker', 'o', ...
    'MarkerFaceColor', 'r', ...
    'MarkerEdgeColor', 'r');

pos2 = ginput(1);
pos = [pos1; pos2];
[posX, indx] = sort(pos(:, 1));
posY = pos(:, 2);
posY = posY(indx);

rectSize = [posX(1), posY(1), posX(2)-posX(1), posY(2)-posY(1)];
rect = rectangle('Position', rectSize);
rect.EdgeColor = 'r';
rect.LineWidth = 1.5;

% Crop image
newImg = output(floor(posY(1)):floor(posY(2)), floor(posX(1)):floor(posX(2)), :);
if exist(outFileName, 'file')
   delete(outFileName); 
end
imwrite(newImg, outFileName);

fig.Visible = 'off';
close(fig);
delete(fig);
clear('fig');
end  % end function