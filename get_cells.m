function [nucleus, cytoplasm] = get_cells(I)
%   function get_cells returns two binary images - nucleus and cytoplasm.

im = rgb2gray(I);
im = imresize(im, [2000, 2000]);

% Quantize image into 3 levels - background, cytoplasm and nucleus. 
 for i= 1:5
    for j = 1:5
        im_p = im((400*i -399):(400*i), (400*j -399):(400*j));
        t = unique(multithresh(im_p, 2));
        im_p = imquantize(im_p, t);   
        im_q((400*i-399):(400*i), (400*j-399):(400*j)) = im_p;
    end
 end
 
nucleus = zeros(2000);
cytoplasm = zeros(2000);

nucleus(im_q == 1) = 1;
cytoplasm(im_q == 2) = 1;
