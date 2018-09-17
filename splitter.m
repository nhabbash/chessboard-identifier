function splitter(file, out_folder)
    %file = files(1);

    fileName = strsplit(file.name, '.');
    fileName = fileName{1};
    filePath = [file.folder '/' file.name];
    image = im2double(imread(filePath));
    if size(image,3)==3
        image = rgb2gray(image);
    end
    
   image = imresize(image, [64 64]);
   
   [m,n] = size(image);
   counti = 0;
   
   for i = 1:8:m-7
       
       counti = counti + 1;
       countj = 0;
       for j = 1:8:n-7
            countj = countj + 1;
            block = image(i:i+7,j:j+7);
            block_role = fen_parser(counti, countj, fileName);
            
            imwrite(block, [out_folder '/' fileName '-' block_role '-' num2str(counti) '-' num2str(countj) '.png']);
       end
   end
   
end