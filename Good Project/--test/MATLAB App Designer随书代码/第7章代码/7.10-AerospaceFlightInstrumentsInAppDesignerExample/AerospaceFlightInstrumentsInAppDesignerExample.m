%% Aerospace Flight Instruments in App Designer
%
% This app shows how to display flight status information with standard
% cockpit instrumentation using Aerospace Toolbox flight instruments in App
% Designer. On startup, the app loads saved flight data from a MAT-file and
% starts a new |Aero.Animation| figure window. The app uses six flight
% instruments to display flight data corresponding with the time selected
% in the slider. The animation window updates to reflect the aircraft
% orientation at the selected time.
%
% This example demonstrates the following app building tasks:
%
% * Use a |StartupFcn| callback to load data from a file and create an
% |Aero.Animation| object.
% * Use aerospace flight instrument components to visualize flight status
% information: Airspeed Indicator, Artificial Horizon, Altimeter, Turn
% Coordinator, Heading Indicator, and Climb Indicator
% * Use the slider component |ValueChangingFcn| callback to set aerospace
% flight instrument component properties and interact with an
% |Aero.Animation| object.
%
% <<../flightinstrumentsappdesigner.png>>

% Copyright 2018 The MathWorks, Inc.
