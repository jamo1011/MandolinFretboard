%Returns an array of notes on a fretboard with given tuning and numOfFrets

function fretboard = createFretboardLayout(Tuning, numOfFrets)
    notes = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};
    fretboard = [];
    for (i = 1:length(Tuning))
        openNote = Tuning{i};
        openNotePos = find(strcmp(notes, openNote));
        string = openNote;
        for (j = 1:numOfFrets)
            noteInd = mod(openNotePos+j, 12);
            if (noteInd==0)
                noteInd = 12;
            end
            note = notes(noteInd);
            string = [string, note];
        end
        fretboard = [fretboard; string];
    end
end