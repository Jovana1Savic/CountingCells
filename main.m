
% Read images
folder = 'cells\cells';
images = cell(1, 7);
output_folder = 'cells_obrade\';

for i=1:7
    images{1, i} = imread( strcat(folder, num2str(i), '.jpg') );
end

close all

for k=1:7
    I = images{1, k};
    n = count_cells(I)
end