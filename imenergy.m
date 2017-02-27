function E = imenergy(I)

    Idouble = im2double(I);

    Igray = double(rgb2gray(Idouble));

    [Gmag, Gdir] = imgradient(Igray);

    E = Gmag;

end