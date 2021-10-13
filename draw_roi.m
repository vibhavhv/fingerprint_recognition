%
function [roi_area]=draw_roi(in,in_bound,in_area)
[iw,ih]=size(in);
tmplate=zeros(iw,ih);
[w,h]=size(in_area);
tmp=zeros(iw,ih);
left=1;
right=h;
upper=1;
bottom=w;
le2ri=sum(in_bound);
roi_col=find(le2ri>0);
left=min(roi_col);
right=max(roi_col);
tr_bound=in_bound';
up2dw=sum(tr_bound);
roi_row=find(up2dw>0);
upper=min(roi_row);
bottom=max(roi_row);
for i=upper:bottom
    for j=left:right
        if(in_bound==135)
            tmplate(8*i-7:8*i,8*j-7:8*j)=200;
            tmp(8*i-7:8*i,8*j-7:8*j)=1;
        elseif(in_area(i,j)==1 & in_bound(i,j)~=1)
            tmplate(8*i-7:8*i,8*j-7:8*j)=100;
            tmp(8*i-7:i*8,8*j-7:8*j)=1;
        end
    end
end
%imshow(tmp);
disp(size(tmp));
in=in.*tmp;
roi_area=tmp;
%roi_img=in(8*upper-7:8*bottom,8*left-7:8*right);
%roi_bound=in_bound(upper:bottom,left:right);
%roi_area=in_area(upper:bottom,left:right);
%roi_area=im2double(roi_area)-im2double(roi_bound);

end
%}
%{
Kopen=imclose(rt,strel('square',7));

KopenClean= imfill(Kopen,'holes');
KopenClean=bwareaopen(KopenClean,5);
imshow(KopenClean)
KopenClean([1 end],:)=0;
KopenClean(:,[1 end])=0;
roi=imerode(KopenClean,strel('disk',10));
imshow(roi)
%}
