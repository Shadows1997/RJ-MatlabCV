function imgData = screenSnipping
%screenSnipping   Capturel full-screen to an image
%  Output:
%         imgData, uint8, image data.
% Source code from: https://www.mathworks.com/support/search.html/answers/362358-how-do-i-take-a-screenshot-using-matlab.html?fq=asset_type_name:answer%20category:matlab/audio-and-video&page=1
% Modified: Qingpinwangzi
% Date: Apr 14, 2021.

% Take screen capture
robo = java.awt.Robot;
tk = java.awt.Toolkit.getDefaultToolkit();
rectSize = java.awt.Rectangle(tk.getScreenSize());
cap = robo.createScreenCapture(rectSize);

% Convert to an RGB image
rgb = typecast(cap.getRGB(0, 0, cap.getWidth, cap.getHeight, [], 0, cap.getWidth), 'uint8');
imgData = zeros(cap.getHeight, cap.getWidth, 3, 'uint8');
imgData(:, :, 1) = reshape(rgb(3:4:end), cap.getWidth, [])';
imgData(:, :, 2) = reshape(rgb(2:4:end), cap.getWidth, [])';
imgData(:, :, 3) = reshape(rgb(1:4:end), cap.getWidth, [])';
end