function [fretboard, dots, Letters] = createFretboard(fretboardLayout, instrument)
notes = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};

numOfFrets = size(fretboardLayout,2);
numOfStrings = size(fretboardLayout,1);

%% Creates fretboard
fig = figure('NumberTitle', 'off', 'Name', [upper(instrument(1)) instrument(2:end) ' Fretboard']);
subplot(2,1,1)
xlim([-100 100*numOfFrets-100])
set(fig, 'Position', [200, 100, 100*numOfFrets-100, 100*numOfStrings]);
rectangle('Position', [0, 0, 100*numOfFrets-100, 100*numOfStrings]);
hold on
axis off
plot([0,0],[0,100*numOfStrings], 'k', 'LineWidth', 3)
for (i=1:numOfFrets-1)
    plot([i*100, i*100], [0, 100*numOfStrings], 'k');
end


circles = [];
Letters = [];
for i=1:size(fretboardLayout,1)
    string = [];
    letterStr = [];
    for j=1:size(fretboardLayout,2)
        note = scatter(-50+100*(j-1), 50+100*(i-1), 'LineWidth', 15, 'MarkerEdgeColor', 'white');
        letter = text(-58+100*(j-1), 50+100*(i-1), fretboardLayout{i,j});
        string = [string note];
        letterStr = [letterStr, letter];
    end
    circles = [circles; string];
    Letters = [Letters; letterStr];
end


fretboard = fig;
dots = circles;

%% Create ui panel
p = uipanel('Title', 'Chords', 'Position', [0,0,1,.5]);


%Major chord buttons
for (i=1:length(notes))
    b = uicontrol('Parent', p, 'Style', 'pushbutton', 'String', notes{i}, 'Units', 'normalized', 'Position', [i/length(notes)-1/length(notes)+.005, .8, 1/length(notes)-.01, .1], 'Callback', {@noteButton_callback, fretboardLayout, dots});
end

%minor chord buttons
for (i=1:length(notes))
    b = uicontrol('Parent', p, 'Style', 'pushbutton', 'String', [notes{i} 'm'], 'Units', 'normalized', 'Position', [i/length(notes)-1/length(notes)+.005, .7, 1/length(notes)-.01, .1], 'Callback', {@noteButton_callback, fretboardLayout, dots});
end

%Dominant chord buttons
for (i=1:length(notes))
    b = uicontrol('Parent', p, 'Style', 'pushbutton', 'String', [notes{i} '7'], 'Units', 'normalized', 'Position', [i/length(notes)-1/length(notes)+.005, .6, 1/length(notes)-.01, .1], 'Callback', {@noteButton_callback, fretboardLayout, dots});
end

%minor 7th chord buttons
for (i=1:length(notes))
    b = uicontrol('Parent', p, 'Style', 'pushbutton', 'String', [notes{i} 'm7'], 'Units', 'normalized', 'Position', [i/length(notes)-1/length(notes)+.005, .5, 1/length(notes)-.01, .1], 'Callback', {@noteButton_callback, fretboardLayout, dots});
end

%major 7th chord buttons
for (i=1:length(notes))
    b = uicontrol('Parent', p, 'Style', 'pushbutton', 'String', [notes{i} 'M7'], 'Units', 'normalized', 'Position', [i/length(notes)-1/length(notes)+.005, .4, 1/length(notes)-.01, .1], 'Callback', {@noteButton_callback, fretboardLayout, dots});
end


%b = uicontrol('Parent', p, 'Style', 'edit', 'Units', 'normalized', 'Position', [0.5, .5, .1, .1],  'Callback', {@noteButton_callback, fretboardLayout, dots});


%menu to change instrument
m = uicontrol('Parent', p, 'Style', 'popupmenu', 'Position', [20 20 100 10], 'Callback', @changeInstrument_callback);
m.String = {'mandolin', 'guitar', 'banjo', 'ukulele'};
m.Value = find(strcmp(m.String, instrument));

%checkboxes for scales and chords
uicontrol('Parent', p, 'Style', 'checkbox', 'Position', [20 50 100 20], 'String', 'Scales');
uicontrol('Parent', p, 'Style', 'checkbox', 'Position', [20 80 100 20], 'String', 'Chords', 'Value', 1);
end