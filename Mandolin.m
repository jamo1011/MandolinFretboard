%% Creates Fretboard

load('mandolin.mat')

fretboardLayout = createFretboardLayout(Tuning, numOfFrets);
[fretboard, dots, Letters] = createFretboard(fretboardLayout, 'mandolin');


%% TODO
%Aug and sus chords
%Blues scale
%Play chords