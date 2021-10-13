[m,n]=size(b(:,:,1));
Z=zeros(m,n);
for i=1:length(CentroidTerm)
    
Z(CentroidTerm(i,2),CentroidTerm(i,1))=1;
    
end
ZTerm=Z'.*roi';
[CentroidTermX,CentroidTermY]=find(ZTerm);

Z=zeros(m,n);
for i=1:length(CentroidBif)
    
Z(CentroidBif(i,2),CentroidBif(i,1))=1;
    
end
ZBif=Z'.*roi';
[CentroidBifX,CentroidBifY]=find(ZBif);


figure
imshow(rt)
hold on
plot(CentroidTermX,CentroidTermY,'ro','linewidth',2)
plot(CentroidBifX,CentroidBifY,'go','linewidth',2)