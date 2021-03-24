function changeInstrument_callback(handle, event)

instrument = handle.String{handle.Value};
load(instrument)
delete(gcf)

fretboardLayout = createFretboardLayout(Tuning, numOfFrets);
createFretboard(fretboardLayout, instrument);


end