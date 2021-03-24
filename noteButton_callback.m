function noteButton_callback(handle, event, fretboardLayout, dots)
    resetDots(dots)
    s = findobj('Style', 'checkbox', 'String', 'Scales');
    c = findobj('Style', 'checkbox', 'String', 'Chords');
    
    if s.Value
        showScale(handle.String, fretboardLayout, dots);
    end
    
    if c.Value
        handle.String
        showChord(handle.String, fretboardLayout, dots);
    end
end