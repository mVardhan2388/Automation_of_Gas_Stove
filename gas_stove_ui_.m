classdef gas_stove_ui_ < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        TimeScope2              matlab.ui.scope.TimeScope
        TimeScope_4             matlab.ui.scope.TimeScope
        TimeScope_3             matlab.ui.scope.TimeScope
        TimeScope_2             matlab.ui.scope.TimeScope
        TimeScope               matlab.ui.scope.TimeScope
        SimulationProgress      simulink.ui.control.SimulationProgress
        SimulationControls      simulink.ui.control.SimulationControls
        Panel                   matlab.ui.container.Panel
        FlowRatefrequencyLabel  matlab.ui.control.Label
        AmplitudeKnob_2         matlab.ui.control.Knob
        AmplitudeKnobLabel_2    matlab.ui.control.Label
        FlowRateAmpliLabel      matlab.ui.control.Label
        FlowRateBiasLabel       matlab.ui.control.Label
        AmplitudeKnob           matlab.ui.control.Knob
        AmplitudeKnobLabel      matlab.ui.control.Label
        BiasKnob                matlab.ui.control.Knob
        BiasKnobLabel           matlab.ui.control.Label
    end


    % Public properties that correspond to the Simulink model
    properties (Access = public, Transient)
        Simulation simulink.Simulation
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.902 0.902 0.902];
            app.UIFigure.Position = [100 100 1920 1200];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Pointer = 'hand';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Title = 'Panel';
            app.Panel.Position = [1304 53 454 190];

            % Create BiasKnobLabel
            app.BiasKnobLabel = uilabel(app.Panel);
            app.BiasKnobLabel.HorizontalAlignment = 'center';
            app.BiasKnobLabel.Position = [272 58 25 22];
            app.BiasKnobLabel.Text = '';

            % Create BiasKnob
            app.BiasKnob = uiknob(app.Panel, 'continuous');
            app.BiasKnob.Position = [43 53 70 70];
            app.BiasKnob.Value = 10;

            % Create AmplitudeKnobLabel
            app.AmplitudeKnobLabel = uilabel(app.Panel);
            app.AmplitudeKnobLabel.HorizontalAlignment = 'center';
            app.AmplitudeKnobLabel.Position = [220 57 25 22];
            app.AmplitudeKnobLabel.Text = '';

            % Create AmplitudeKnob
            app.AmplitudeKnob = uiknob(app.Panel, 'continuous');
            app.AmplitudeKnob.Position = [185 49 73 73];
            app.AmplitudeKnob.Value = 10;

            % Create FlowRateBiasLabel
            app.FlowRateBiasLabel = uilabel(app.Panel);
            app.FlowRateBiasLabel.Position = [32 6 86 22];
            app.FlowRateBiasLabel.Text = 'Flow Rate Bias';

            % Create FlowRateAmpliLabel
            app.FlowRateAmpliLabel = uilabel(app.Panel);
            app.FlowRateAmpliLabel.Position = [182 7 92 22];
            app.FlowRateAmpliLabel.Text = 'Flow Rate Ampli';

            % Create AmplitudeKnobLabel_2
            app.AmplitudeKnobLabel_2 = uilabel(app.Panel);
            app.AmplitudeKnobLabel_2.HorizontalAlignment = 'center';
            app.AmplitudeKnobLabel_2.Position = [352 57 61 22];
            app.AmplitudeKnobLabel_2.Text = 'flowR_in_f';

            % Create AmplitudeKnob_2
            app.AmplitudeKnob_2 = uiknob(app.Panel, 'continuous');
            app.AmplitudeKnob_2.Limits = [1 10];
            app.AmplitudeKnob_2.Position = [334 49 73 73];
            app.AmplitudeKnob_2.Value = 1;

            % Create FlowRatefrequencyLabel
            app.FlowRatefrequencyLabel = uilabel(app.Panel);
            app.FlowRatefrequencyLabel.Position = [315 7 115 22];
            app.FlowRatefrequencyLabel.Text = 'Flow Rate frequency';

            % Create SimulationControls
            app.SimulationControls = uisimcontrols(app.UIFigure);
            app.SimulationControls.Simulation = app.Simulation;
            app.SimulationControls.BackgroundColor = [0.902 0.902 0.902];
            app.SimulationControls.Position = [75 98 161 54];

            % Create SimulationProgress
            app.SimulationProgress = uisimprogress(app.UIFigure);
            app.SimulationProgress.Color = [0.3922 0.8314 0.0745];
            app.SimulationProgress.Simulation = app.Simulation;
            app.SimulationProgress.BackgroundColor = [0.902 0.902 0.902];
            app.SimulationProgress.Position = [235 102 664 45];

            % Create TimeScope
            app.TimeScope = uitimescope(app.UIFigure);
            app.TimeScope.LegendNames = {'Sine Wave:1'};
            app.TimeScope.Title = 'Desired input';
            app.TimeScope.YLabel = 'Amplitude';
            app.TimeScope.Position = [2 843 480 304];

            % Create TimeScope_2
            app.TimeScope_2 = uitimescope(app.UIFigure);
            app.TimeScope_2.LegendNames = {'PS-Simulink Converter:1'};
            app.TimeScope_2.Title = 'Actual flow rate';
            app.TimeScope_2.YLabel = 'Amplitude';
            app.TimeScope_2.Position = [1439 843 480 304];

            % Create TimeScope_3
            app.TimeScope_3 = uitimescope(app.UIFigure);
            app.TimeScope_3.LegendNames = {'Burner:1'};
            app.TimeScope_3.Title = 'Flame temperature';
            app.TimeScope_3.YLabel = 'Amplitude';
            app.TimeScope_3.YLimits = [0 2000];
            app.TimeScope_3.YLimitsMethod = 'manual';
            app.TimeScope_3.XTimeUnits = 'auto';
            app.TimeScope_3.Position = [470 845 480 304];

            % Create TimeScope_4
            app.TimeScope_4 = uitimescope(app.UIFigure);
            app.TimeScope_4.LegendNames = {'Burner:1'};
            app.TimeScope_4.Title = 'Flame intensity';
            app.TimeScope_4.YLabel = 'Amplitude';
            app.TimeScope_4.Position = [972 843 480 304];

            % Create TimeScope2
            app.TimeScope2 = uitimescope(app.UIFigure);
            app.TimeScope2.LegendNames = {'Vessel:1'};
            app.TimeScope2.LegendVisible = 'on';
            app.TimeScope2.Title = 'Temperature (water)';
            app.TimeScope2.YLabel = 'Amplitude';
            app.TimeScope2.XLimits = [0 1000];
            app.TimeScope2.XTimeSpan = 1000;
            app.TimeScope2.Position = [0 333 1920 494];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % Bind initialization
    methods (Access = protected)

        function createBindings(app)

            bind(app.Simulation.LoggedSignals, [app.Simulation.ModelName '/Burner:1'], app.TimeScope_3);
            bind(app.Simulation.LoggedSignals, [app.Simulation.ModelName '/Burner:2'], app.TimeScope_4);
            bind(app.AmplitudeKnob, 'Value', app.Simulation.TunableVariables, ['flowR_in_A:' app.Simulation.ModelName]);
            bind(app.BiasKnob, 'Value', app.Simulation.TunableVariables, ['flowR_in_B:' app.Simulation.ModelName]);
            bind(app.AmplitudeKnob_2, 'Value', app.Simulation.TunableVariables, ['flowR_in_f:' app.Simulation.ModelName]);
            bind(app.Simulation.LoggedSignals, [app.Simulation.ModelName '/Vessel:1'], app.TimeScope2);
            bind(app.Simulation.LoggedSignals, [app.Simulation.ModelName '/PS-Simulink Converter:1'], app.TimeScope_2);
            bind(app.Simulation.LoggedSignals, [app.Simulation.ModelName '/Sine Wave:1'], app.TimeScope);
            
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = gas_stove_ui_

            % Associate the Simulink Model
            app.Simulation = simulation('Pipeline');

            % Create UIFigure and components
            createComponents(app)

            % Create bindings
            createBindings(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end