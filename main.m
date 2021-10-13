I=imread('samp1.png');
I=rgb2gray(I);
e=enhance(I);
b=binarization(e);
[p,z]=blk_dir(b);
RidgeThinning;
Term_Bfurc;
FalseMinutiaRemoval;
roi=draw_roi(b,p,z);
roi_ref=roi;
roi_merge;
SuppressExtremaMinutiae;
Orientation;
ref_ter=o1;
ref_bif=o2;
main2;
main3;

