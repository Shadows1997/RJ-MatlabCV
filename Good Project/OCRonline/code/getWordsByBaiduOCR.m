function result = getWordsByBaiduOCR(fileName, apiKey, secretKey, accessToken, apiURL, outType)
%GETWORDSBYBAIDUOCR   return recognition words
%  INPUTS:
%        fileName  string, an image file name
%        apiKey  string, the API Key of the application
%        secretKey  string, The Secret Key of the application
%        accessToken  string, default is '', get the Access Token by API
%        Key and Secret Key.
%        apiURL  string, such as:
%                       'https://aip.baidubce.com/rest/2.0/ocr/v1/accurate'
%                       'https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic'
%                       'https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic'
%       outType, 'MultiLine|SingleLine'
%  OUTPUTS:
%        result []|struct
%  USAGE:
%        >>result = getWordsByBaiduOCR(fileName, apiKey, secretKey, accessToken, apiURL)
%  Date: Mar 18, 2021.
%  Author: 清贫王子
%

options = weboptions('RequestMethod', 'post');
if isempty(outType)
    outType = 'MultiLine';
end

if isempty(accessToken)
    url = ['https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=', apiKey, '&client_secret=', secretKey];
    res = webread(url, options);
    access_token = res.access_token;
else
    access_token = accessToken;
end  % end if

url = [apiURL, '?access_token=', access_token];
options.HeaderFields = { 'Content-Type', 'application/x-www-form-urlencoded'};
imgBase64String = img2base64(fileName);
if isempty(imgBase64String)
    result = '';
    return
end  % end if
res = webwrite(url, 'image', imgBase64String, options);
wordsRsult = res.words_result;

data.ocrResultChar = '';

if strcmp(outType, 'SingleLine')
    for ii = 1 : size(wordsRsult, 1)
        data.ocrResultChar = [data.ocrResultChar, wordsRsult(ii,1).words];
    end  % end for
    
elseif strcmp(outType, 'MultiLine')
    for ii = 1 : size(wordsRsult, 1)
        data.ocrResultChar{ii} = wordsRsult(ii,1).words;
    end  % end for
end
result = data.ocrResultChar;
end  % end function