function base64string = img2base64(fileName)
%IMG2BASE64   Coding an image to base64 file
%  INPUTS:
%        fileName  string, an image file name
%  OUTPUTS:
%        base64string  string, the input image's base64 code
%  USAGE:
%        >>base64string = img2base64('1.jpg')
%        >>base64string = 'xxx'
%
try
    fid = fopen(fileName, 'rb');
    bytes = fread(fid);
    fclose(fid);
    % -------------------------------------------
    %  First method
    % -------------------------------------------
    encoder = org.apache.commons.codec.binary.Base64;
    base64string = char(encoder.encode(bytes))';
    % -------------------------------------------
    %  Second method
    % -------------------------------------------
    % base64string = matlab.net.base64encode(bytes);
catch
    disp('The file does not exist!');
    base64string = '';
end  % end try
end  % end function