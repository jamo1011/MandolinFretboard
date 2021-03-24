function resetDots(dots)
    d = dots(:);
    for i = 1:length(d)
        d(i).MarkerEdgeColor = 'white';
    end
end