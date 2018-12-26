function nuc = get_nucleus(nucleus, cytoplasm)

 
% Pad array so that holes that are on the edge can also be filled. 
    cytoplasm = padarray(cytoplasm, [100 100], 'symmetric');
    cytoplasm1 = imfill(cytoplasm,'holes');
    cytoplasm = cytoplasm(101:2100, 101:2100);
    cytoplasm1 = cytoplasm1(101:2100, 101:2100);

% If something is a hole in cytoplasm and was detected as nucleus, it's
% probably nucleus. 
    nuc = (cytoplasm1 - cytoplasm).*nucleus;
 
 % Remove objects that have area smaller than 0.9 and bigger than 1.1
 % median area value.
    cc = bwconncomp(nuc); 
    stats = regionprops(cc, 'Area'); 
    m = median([stats.Area]);
    idx = find([stats.Area] > 0.3*m & [stats.Area] < 1.7*m); 
    nuc = ismember(labelmatrix(cc), idx); 
end
