clc;
clear;
I = imread('union-terrace.jpg');
a = shrnk(I, 0, 100);
b = shrnk(I, 100, 0);
c = shrnk(I, 100, 100);
imwrite(a, 'wang.1a.jpg');
imwrite(b, 'wang.1b.jpg');
imwrite(c, 'wang.1c.jpg');


clc;
clear;
I = imread('union-terrace.jpg');
E = imenergy(I);
h = imagesc(E);
saveas(h, 'wang.2a.jpg');
% To test 2b, implement horizontal_seam 89th line
% Only evaluate selection from 11 to 19 line in main.m
f = shrnk(I, 1, 0);


clc;
clear;
I = imread('union-terrace.jpg');
seam = horizontal_seam(I);
J = permute(I, [2 1 3]);
V = horizontal_seam(J);
imshow(I);
hold on
plot(seam);
plot(V, 1:size(I, 1));


clc;
clear;
I = imread('wang.4a.jpg');
f = shrnk(I, 100, 0);
imwrite(f, 'wang.4b.jpg');


clc;
clear;
I = imread('wang.5a.jpg');
f = shrnk(I, 100, 0);
imwrite(f, 'wang.5b.jpg');

