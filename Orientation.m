Table=[3*pi/4 2*pi/3 pi/2 pi/3 pi/4
       5*pi/6 0 0 0 pi/6
       pi 0 0 0 0
      -5*pi/6 0 0 0 -pi/6
      -3*pi/4 -2*pi/3 -pi/2 -pi/3 -pi/4];
  dxTerm=[]
  dyTerm=[]
  [ct1,w]=size(CentroidTermX)
  dxTerm=zeros(ct1,w*3)
  dyTerm=zeros(ct1,w*3)
for ind=1:length(CentroidTermX)
    Klocal=rt(CentroidTermY(ind)-2:CentroidTermY(ind)+2,CentroidTermX(ind)-2:CentroidTermX(ind)+2);
    Klocal(2:end-1,2:end-1)=0;
    [i,j]=find(Klocal,1,'first');
    if(sum(sum(Klocal))==0)
       continue; 
    end
    
    OrientationTerm(ind,1)=Table(i,j);
end
dxTerm=sin(OrientationTerm)*5;
dyTerm=cos(OrientationTerm)*5;
figure
imshow(rt)
hold on
plot(CentroidTermX,CentroidTermY,'ro','linewidth',2)
OrientX=[CentroidTermX CentroidTermX+dyTerm]';
OrientY=[CentroidTermY CentroidTermY-dxTerm]';
plot(OrientX,OrientY,'r','linewidth',2)

[ct1,w]=size(CentroidBifX)
  dxBif=zeros(ct1,w*3)
  dyBif=zeros(ct1,w*3)
for ind=1:length(CentroidBifX)
    if(isnan(CentroidBifY(ind)) | isnan(CentroidBifX(ind)))
         for k=1:3
            dxBif(ind,k)=0;
            dyBif(ind,k)=0;

        end
        continue;
    end
    Klocal=rt(CentroidBifY(ind)-2:CentroidBifY(ind)+2,CentroidBifX(ind)-2:CentroidBifX(ind)+2);
    Klocal(2:end-1,2:end-1)=0;
    [i,j]=find(Klocal);
    disp(Klocal);
    if length(i)~=3
        CentroidBifY(ind)=NaN;
        CentroidBifX(ind)=NaN;
        OrientationBif(ind)=NaN;
    else
        for k=1:3
            OrientationBif(ind,k)=Table(i(k),j(k));
            dxBif(ind,k)=sin(OrientationBif(ind,k))*5;
            dyBif(ind,k)=cos(OrientationBif(ind,k))*5;

        end
    end
end
plot(CentroidBifX,CentroidBifY,'go','linewidth',2)
OrientationLinesX=[CentroidBifX CentroidBifX+dyBif(:,1);CentroidBifX CentroidBifX+dyBif(:,2);CentroidBifX CentroidBifX+dyBif(:,3)]';
OrientationLinesY=[CentroidBifY CentroidBifY-dxBif(:,1);CentroidBifY CentroidBifY-dxBif(:,2);CentroidBifY CentroidBifY-dxBif(:,3)]';
plot(OrientationLinesX,OrientationLinesY,'g','linewidth',2)

o1=zeros(size(b))
o2=zeros(size(b))
for i=1:length(CentroidTermX)
    if(~(isnan(CentroidTermX(i))) & ~(isnan(CentroidTermY(i))))
    o1(round(CentroidTermY(i)),round(CentroidTermX(i)))=1;
    end
end
for i=1:length(CentroidBifX)
     if(~(isnan(CentroidBifX(i))) & ~(isnan(CentroidBifY(i))))
     o2(round(CentroidBifY(i)),round(CentroidBifX(i)))=1;
     end
end
dyTerm=[];
dxTerm=[];
dyBif=[];
dxBif=[];

