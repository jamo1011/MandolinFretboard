function showChord(note, fretboardLayout, dots)

minor = false;
seventhChord = false;
majorSeventh = false;
if (contains(note,'m'))
    minor = true;
    note(note=='m') = [];
end

if (contains(note, '7'))
    seventhChord = true;
    note(note=='7') = [];
    if contains(note, 'M')
        note(note=='M') = [];
        majorSeventh = true;
    end
end

if (contains(note, '6'))
    sixthChord = true;
end
    
   
%Finds indices for root, third, and fifth    
notes = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};
rootInd = find(strcmp(notes, note));

thirdInd = rootInd+4;
if minor
    thirdInd = thirdInd-1;
end
thirdInd = mod(thirdInd,12);
if thirdInd == 0
    thirdInd = 12;
end
third = notes(thirdInd);

fifthInd = mod(rootInd+7, 12);
if fifthInd == 0
    fifthInd = 12;
end
fifth = notes(fifthInd);

if seventhChord
    if majorSeventh
        seventhInd = mod(rootInd+11, 12);
    else 
        seventhInd = mod(rootInd+10, 12);
    end
    if seventhInd == 0
        seventhInd = 12;
    end
    seventh = notes(seventhInd);
end

%Plots root
ind = strcmp(fretboardLayout, note);
dotsToChange = dots(ind);
for i = 1:length(dotsToChange)
    dotsToChange(i).MarkerEdgeColor = 'green';
end

%Plots third
ind = strcmp(fretboardLayout, third);
dotsToChange = dots(ind);
for i = 1:length(dotsToChange)
    dotsToChange(i).MarkerEdgeColor = 'yellow';
end

%Plots fifth
ind = strcmp(fretboardLayout, fifth);
dotsToChange = dots(ind);
for i = 1:length(dotsToChange)
    dotsToChange(i).MarkerEdgeColor = 'red';
end

%Plots seventh
if seventhChord
    ind = strcmp(fretboardLayout, seventh);
    dotsToChange = dots(ind);
    for i = 1:length(dotsToChange)
        dotsToChange(i).MarkerEdgeColor = 'blue';
    end
end

end