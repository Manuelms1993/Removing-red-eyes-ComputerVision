function [I,ImageCorrected,mask] = Main(threshold,saturation)

    I = imread('img/redeyes/ojo3.jpg');
    [ImageCorrected,mask] = RedEyesReduction(I,threshold,saturation);

end