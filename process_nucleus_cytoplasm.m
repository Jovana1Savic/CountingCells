function [nucleus cytoplasm] = process_nucleus_cytoplasm(nucleus, cytoplasm)


se = strel('disk',1);
cytoplasm = imerode(cytoplasm, se);
se = strel('disk',8);
cytoplasm = imclose(cytoplasm, se);

se = strel('disk', 6);
nucleus = imerode(nucleus, se);