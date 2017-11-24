function redEyesImage = removeFalseAreas(redEyesImage)

    SE = strel('disk',2);
    removingSnowflakes = imopen(redEyesImage,SE);
    redEyesImage = imdilate(removingSnowflakes,SE);

    [E m]=bwlabel(redEyesImage);
    regions = regionprops(E);
    A=[];
    
    for i=1:size(regions,1)
        A=[A regions(i).Area];
    end
    
    Amean=mean(A);
    areasFind = find([regions.Area]>2*Amean);
    for i=1:size(areasFind,2)
        d=round(regions(areasFind(i)).BoundingBox);
        redEyesImage(d(2):d(2)+d(4),d(1):d(1)+d(3))=0;
    end
    
end