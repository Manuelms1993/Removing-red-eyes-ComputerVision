function [ImageCorrected,redEyesImage] = RedEyesReduction(I,threshold,saturation)

    Ihsv=rgb2hsv(I);
    redEyesImage=zeros(length(I(:,1,:)),length(I(1,:,:)));

    for i=1:length(I(:,1,:))
        for j=1:length(I(1,:,:))
            if (Ihsv(i,j,1) > threshold || Ihsv(i,j,1) < 0.02) & Ihsv(i,j,2) > saturation
                redEyesImage(i,j)=1;
            end
        end
    end

    redEyesImage = removeFalseAreas(redEyesImage);

    ImageCorrected=I;
    nPixelesC = 0;
    for i=1:size(I,1)
        for j=1:size(I,2)
            if redEyesImage(i,j)==1
                nPixelesC = nPixelesC + 1;
                ImageCorrected(i,j,1)=(I(i,j,2)+I(i,j,3))/2;
            end
        end
    end

end