classdef ReadWords < matlab.apps.AppBase
    %ReadWords   Convert text in a picture to editable text
    %  Author: Qingping Wangzi.
    %  Date: Apr 15, 2021.
    %  Version: Matlab R2021a (v1.0)
    %
    %%
    properties
        UIFig                   matlab.ui.Figure
        
        ContainerForMain        matlab.ui.container.GridLayout
        ThisTB                  matlab.ui.container.Toolbar
        SnippingToolBtn         matlab.ui.container.toolbar.PushTool
        ImgLoadToolBtn          matlab.ui.container.toolbar.PushTool
        SetupToolBtn            matlab.ui.container.toolbar.PushTool
        CleanToolBtn            matlab.ui.container.toolbar.PushTool
        ImgShow                 matlab.ui.control.Image
        WordsShowTA             matlab.ui.control.TextArea
        
        ContainerForSetup       matlab.ui.container.GridLayout
        APIKeyText              matlab.ui.control.EditField
        SecrectKeyText          matlab.ui.control.EditField
        ResetBtn                matlab.ui.control.Button
        SaveBtn                 matlab.ui.control.Button
    end  % end properties
    
    %%
    properties(Hidden, Dependent)
        APIKeyVal
        SecrectKeyVal
    end  % end properties
    
    %%
    properties(Access = protected)
        HasSetup = false
    end  % end properties
    
    %%
    methods
        % --------------------------------------
        % % Constructor
        % --------------------------------------
        function app = ReadWords
            % Create UIFigure and components
            app.buildApp();
            % Register the app with App Designer
            registerApp(app, app.UIFig)
            
            if nargout == 0
                clear app
            end
        end  % end Constructor
        
        % --------------------------------------
        % % Destructor
        % --------------------------------------
        % Code that executes before app deletion
        function delete(app)
            % Delete UIFigure when app is deleted
            delete(app.UIFig)
        end  % end Constructor
        
        % --------------------------------------
        % % Get/Set methods
        % --------------------------------------
        % get.APIKeyVal
        function apiKeyVal = get.APIKeyVal(app)
            apiKeyVal = app.APIKeyText.Value;
        end
        
        % get.SecrectKeyVal
        function secrectKeyVal = get.SecrectKeyVal(app)
            secrectKeyVal = app.SecrectKeyText.Value;
        end
        
    end  % end methods
    
    %%
    methods(Access = private)
        
        % buildApp
        function buildApp(app)
            %
            % --------------------------------------
            % % Main Figure
            % --------------------------------------
            app.UIFig = uifigure();
            app.UIFig.Icon = 'icons/img2text.png';
            app.UIFig.Name = 'ReadWords';
            app.UIFig.Visible = 'off';
            app.UIFig.Position = [app.UIFig.Position(1), app.UIFig.Position(2), 745, 420];
            app.UIFig.AutoResizeChildren = 'on';
            app.UIFig.Units = 'Normalized';
            app.setAutoResize(app.UIFig, true);
            
            % --------------------------------------
            % % Toolbar
            % --------------------------------------
            app.ThisTB = uitoolbar(app.UIFig);
            % SetupToolBtn
            app.SetupToolBtn = uipushtool(app.ThisTB);
            app.SetupToolBtn.Icon = 'icons/setup.png';
            app.SetupToolBtn.Tooltip = 'Setup';
            
            % SnippingToolBtn
            app.SnippingToolBtn = uipushtool(app.ThisTB);
            app.SnippingToolBtn.Icon = 'icons/snip.png';
            app.SnippingToolBtn.Tooltip = 'Screenshot';
            
            % ImgLoadToolBtn
            app.ImgLoadToolBtn = uipushtool(app.ThisTB);
            app.ImgLoadToolBtn.Icon = 'icons/load.png';
            app.ImgLoadToolBtn.Tooltip = 'Load image';
            
            % CleanToolBtn
            app.CleanToolBtn = uipushtool(app.ThisTB);
            app.CleanToolBtn.Icon = 'icons/clean.png';
            app.CleanToolBtn.Tooltip = 'Clean';
            
            % --------------------------------------
            % % ContainerForMain
            % --------------------------------------
            app.ContainerForMain = uigridlayout(app.UIFig, [1, 2]);
            
            % ContainerForMain
            imgShowPanel = uipanel(app.ContainerForMain, 'Title', 'Original');
            resultShowPanel = uipanel(app.ContainerForMain, 'Title', 'Result');
            % ImgShow
            imgShowPanelLay = uigridlayout(imgShowPanel, [1, 1]);
            imgShowPanelLay.RowSpacing = 0;
            imgShowPanelLay.ColumnSpacing = 0;
            app.ImgShow = uiimage(imgShowPanelLay);
            % WordsShowTA
            resultShowPanelLay = uigridlayout(resultShowPanel, [1, 1]);
            resultShowPanelLay.RowSpacing = 0;
            resultShowPanelLay.ColumnSpacing = 0;
            app.WordsShowTA = uitextarea(resultShowPanelLay);
            app.WordsShowTA.FontSize = 22;
            
            % --------------------------------------
            % % ContainerForSetup
            % --------------------------------------
            app.ContainerForSetup = uigridlayout(app.UIFig, [4, 3]);
            app.ContainerForSetup.RowHeight = {22, 22, 22, '1x'};
            app.ContainerForSetup.ColumnWidth = {'1x', '1x', '2.5x'};
            app.ContainerForSetup.Visible = 'off';
            apiKeyLabel = uilabel(app.ContainerForSetup, 'Text', 'API Key');
            apiKeyLabel.HorizontalAlignment = 'right';
            apiKeyLabel.Layout.Row = 1;
            apiKeyLabel.Layout.Column = 1;
            % APIKeyText
            app.APIKeyText = uieditfield(app.ContainerForSetup);
            app.APIKeyText.Layout.Row = 1;
            app.APIKeyText.Layout.Column = 2;
            secrectKeyLabel = uilabel(app.ContainerForSetup, 'Text', 'Secrect Key');
            secrectKeyLabel.HorizontalAlignment = 'right';
            secrectKeyLabel.Layout.Row = 2;
            secrectKeyLabel.Layout.Column = 1;
            % SecrectKeyText
            app.SecrectKeyText = uieditfield(app.ContainerForSetup);
            app.SecrectKeyText.Layout.Row = 2;
            app.SecrectKeyText.Layout.Column = 2;
            % ResetBtn
            app.ResetBtn = uibutton(app.ContainerForSetup, 'Text', 'Reset');
            app.ResetBtn.Layout.Row = 3;
            app.ResetBtn.Layout.Column = 1;
            % SaveBtn
            app.SaveBtn = uibutton(app.ContainerForSetup, 'Text', 'Save');
            app.SaveBtn.Layout.Row = 3;
            app.SaveBtn.Layout.Column = 2;
            % Set visibility for UIFig
            movegui(app.UIFig, 'center');
            app.UIFig.Visible = 'on';
            
            % --------------------------------------
            % % RunstartupFcn
            % --------------------------------------
            app.runStartupFcn(@startupFcn);
            
        end  % end buildApp
        
        % startupFcn
        function startupFcn(app, ~, ~)
            % Setup APIKeyText and SecrectKeyText
            if exist('apikey.mat', 'file')
                temp = load('apikey.mat');
                app.APIKeyText.Value = temp.key.apiKeyVal;
                app.APIKeyText.Editable = 'off';
                app.SecrectKeyText.Value = temp.key.secrectKeyVal;
                app.SecrectKeyText.Editable = 'off';
            end
            
            % Register callback
            app.SnippingToolBtn.ClickedCallback = @app.clickedSnippingToolBtn;
            app.ImgLoadToolBtn.ClickedCallback = @app.clickedImgLoadToolBtn;
            app.SetupToolBtn.ClickedCallback = @app.clickedSetupToolBtn;
            app.CleanToolBtn.ClickedCallback = @app.clickedCleanToolBtn;
            
            app.ResetBtn.ButtonPushedFcn = @app.callbackResetBtn;
            app.SaveBtn.ButtonPushedFcn = @app.callbackSaveBtn;
        end  % end function
        
        % --------------------------------------
        % % Callback functions
        % --------------------------------------
        % clickedSnippingToolBtn
        function clickedSnippingToolBtn(app, ~, ~)
            if ~isempty(app.SecrectKeyText.Value) && ~isempty(app.APIKeyText.Value)
                app.UIFig.Visible = 'off';
                pause(0.1);
                outFileName = 'temp.png';
                cropImg(outFileName);
                !attrib +s +h temp.png
                %
                app.ImgShow.ImageSource = imread(outFileName);
                app.UIFig.Visible = 'on';
                %
                apiURL = 'https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic';
                words = getWordsByBaiduOCR(outFileName, app.APIKeyVal, app.SecrectKeyVal, '', apiURL, 'MultiLine');
                app.WordsShowTA.Value = words;
            else
                msg = {'API Key or Secrect Key is empty!'; 'Please set it up first!'};
                uialert(app.UIFig, msg, 'Confirm', 'Icon', 'warning');
            end
        end  % end clickedSnippingToolBtn
        
        % clickedImgLoadToolBtn
        function clickedImgLoadToolBtn(app, ~, ~)
            if ~isempty(app.SecrectKeyText.Value) && ~isempty(app.APIKeyText.Value)
                [fName, fPath] = uigetfile({'*.png'; '*.jpg'; '*.bmp'; '*.tif'}, 'Open image');
                if ~isequal(any([fName, fPath]), 0)
                    img = imread(strcat(fPath, fName));
                    outFileName = 'temp.png';
                    if exist(outFileName, 'file')
                        delete(outFileName)
                    end
                    imwrite(img, outFileName);
                    !attrib +s +h temp.png
                    %
                    app.ImgShow.ImageSource = imread(outFileName);
                    app.UIFig.Visible = 'on';
                    %
                    apiURL = 'https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic';
                    words = getWordsByBaiduOCR(outFileName, app.APIKeyVal, app.SecrectKeyVal, '', apiURL, 'MultiLine');
                    app.WordsShowTA.Value = words;
                else
                    return
                end  % end if
            else  % end if
                msg = {'API Key or Secrect Key is empty!'; 'Please set it up first!'};
                uialert(app.UIFig, msg, 'Confirm', 'Icon', 'warning');
            end
        end  % end clickedImgLoadToolBtn
        
        % clickedSetupToolBtn
        function clickedSetupToolBtn(app, ~, ~)
            if ~app.HasSetup
                app.ContainerForMain.Visible = 'off';
                app.ContainerForSetup.Visible = 'on';
                app.HasSetup = true;
            else
                app.ContainerForMain.Visible = 'on';
                app.ContainerForSetup.Visible = 'off';
                app.HasSetup = false;
            end
        end  % end clickedSetupToolBtn
        
        % clickedCleanToolBtn
        function clickedCleanToolBtn(app, ~, ~)
            app.WordsShowTA.Value = '';
            app.ImgShow.ImageSource = '';
        end  % end clickedCleanToolBtn
        
        % callbackResetBtn
        function callbackResetBtn(app, ~, ~)
            app.APIKeyText.Value = '';
            app.APIKeyText.Editable = 'on';
            app.SecrectKeyText.Value = '';
            app.SecrectKeyText.Editable = 'on';
        end  % callbackResetBtn
        
        % callbackSaveBtn
        function callbackSaveBtn(app, ~, ~)
            if ~isempty(app.SecrectKeyText.Value) && ~isempty(app.APIKeyText.Value)
                key.apiKeyVal = app.APIKeyText.Value;
                key.secrectKeyVal = app.SecrectKeyText.Value;
                if exist('apikey.mat', 'file')
                    delete('apikey.mat');
                end
                save('apikey.mat', 'key');
                !attrib +s +h apikey.mat
                uialert(app.UIFig, 'Save successfully!', 'Confirm', 'Icon', 'success');
                app.APIKeyText.Editable = 'off';
                app.SecrectKeyText.Editable = 'off';
            else
                uialert(app.UIFig, 'API Key or Secrect Key is empty!', 'Confirm', 'Icon', 'warning');
            end  % end if
        end  % callbackSaveBtn
        
    end  % end methods
    
end  % end classdef