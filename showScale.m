function showScale(note, fretboardLayout, dots)

minor = false;
if (note(end) == 'm')
    minor = true;
    note(end) = [];
end

notes = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};
rootInd = find(strcmp(notes, note));
ind = [rootInd, rootInd+2, rootInd+4, rootInd+5, rootInd+7, rootInd+9, rootInd+11];
ind = mod(ind, 12);

ind(ind==0) = 12;
if minor
    ind(3) = ind(3)-1;
    ind(6) = ind(6)-1;
    ind(7) = ind(7)-1;
end
ind(ind==0) = 12;

notesToChange = notes(ind);
for i=1:length(notesToChange)
    ind = strcmp(fretboardLayout, notesToChange(i));
    dotsToChange = dots(ind);
    for j = 1:length(dotsToChange)
        dotsToChange(j).MarkerEdgeColor = [.6 .6 .6];
    end
end

end