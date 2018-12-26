function n = count_cells(I)
%   Function N = COUNT_CELLS(I) returns estimate of number of cells in
%   given image I. 
%   It is assumed that I is rgb image. It also assumes that the background
%   is the lightest and that the cells' nucleuses are the darkest parts of
%   the image. 

% Process image and extract nucleuses. 
[nucleus, cytoplasm] = get_cells(I);
[nucleus, cytoplasm] = process_nucleus_cytoplasm(nucleus, cytoplasm);
nucleus = get_nucleus(nucleus, cytoplasm);

% Find number of object in image that has extracted nucleuses. 
s = regionprops(nucleus);
n = size(s, 1);

centroids = cat(1, s.Centroid);
figure, imshow(imresize(I, [2000, 2000]));
hold on
plot(centroids(:,1), centroids(:,2), 'w*')
hold off
