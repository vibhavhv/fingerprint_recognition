function [final]=binarization(I)
[w,h]=size(I);
o=zeros(w,h);
for i=1:8:w
    for j=1:8:w
        mean_th=0;
        if(i+7<=w & j+7<=h)
            mean_th=mean2(I(i:i+7,j:j+7));
            mean_th=0.8*mean_th;
            o(i:i+7,j:j+7)=I(i:i+7,j:j+7)<mean_th;
        end
    end
end
final=o;
end