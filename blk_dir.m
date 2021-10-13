function [p,z]=blk_dir(I)
[w,h]=size(I);
direct=zeros(w,h);
grad_val=zeros(w,h);
grad_min_val=zeros(w,h);
grad_bg_under=zeros(w,h);
W=8;
theta=0;
sum_val=1;
bg_uncer=0;
index=zeros(ceil(w/W),ceil(h/W));
val=0;
min_val=0;
center=[];
filter_grad=fspecial('sobel');
I_horiz=filter2(filter_grad,I)
filter_grad=transpose(filter_grad);
I_vert=filter2(filter_grad,I);
grad_val=I_horiz.*I_vert;
grad_min_val=(I_vert-I_horiz).*(I_vert+I_horiz);
grad_bg_under=(I_horiz.*I_horiz)+(I_vert.*I_vert);
for i=1:W:w
    for j=1:W:h
        if(j+W-1<h & i+W-1<w)
            val=sum(sum(grad_val(i:i+W-1,j:j+W-1)));
            min_val=sum(sum(grad_min_val(i:i+W-1,j:j+W-1)));
            sum_val=sum(sum(grad_bg_under(i:i+W-1,j:j+W-1)));
            bg_uncer=0;
            theta=0;
            if(sum_val~=0 & val~=0)
                bg_uncer=(val*val+min_val*min_val)/(W*W*sum_val);
                if(bg_uncer>0.005)
                    blockindex(ceil(i/W),ceil(j/W))=1;
                    tan_val=atan2(min_val,2*val);
                    theta=(tan_val)/2;
                    theta=theta+pi/2;
                    center=[center;[round(i+(W-1)/2),theta]];
                end
            end
        end
        val=0;
        min_val=0;
        sum_val=0;
    end
end
x=bwlabel(blockindex,4);
y=bwmorph(x,'close');
z=bwmorph(y,'open');
p=bwperim(z);
        
end