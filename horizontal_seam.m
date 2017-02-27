function S = horizontal_seam(I)
    
    I = imenergy(I);
    %sum(I)
	cEnergy = zeros(size(I, 1), size(I, 2));    
	Vectors = zeros(size(I, 1), size(I, 2));
	[rows cols]=size(I);

    cEnergy(:,1)=I(:,1);

    for i=2:cols
        for j=1:rows
            vector = 0;
            if j-1<1
                [cEnergy(j,i),m]= min([cEnergy(j,i-1),cEnergy(j+1,i-1)]);
                cEnergy(j,i)=cEnergy(j,i)+I(j,i);
                if m==1
                    vector=0;
                else
                    vector=1;
                end
            elseif j+1>rows
                [cEnergy(j,i),m]= min([cEnergy(j,i-1),cEnergy(j-1,i-1)]);
                cEnergy(j,i)=cEnergy(j,i)+I(j,i);
                if m==1
                    vector=0;
                else
                    vector=-1;
                end
            else
                [cEnergy(j,i),m]= min([cEnergy(j-1,i-1),cEnergy(j,i-1),cEnergy(j+1,i-1)]);
                cEnergy(j,i)=cEnergy(j,i)+I(j,i);
                if m==1
                    vector=-1;
                elseif m==2
                    vector=0;
                else
                    vector=1;
                end
            end
            Vectors(j, i) = vector;
        end
    end
        
    tempIndex = 1;
    col = size(I, 2);
    minEnergy = cEnergy(1, col);
    for row = 1:size(I, 1)
        if(cEnergy(row, col) < minEnergy)
            minEnergy = cEnergy(row, col);
            tempIndex = row;
        end
    end
   
    S = zeros(1, size(I, 2));
    currIndex = tempIndex;
    for col = size(I, 2):-1:1
        S(col) = currIndex;
        currIndex = currIndex + Vectors(currIndex, col);
    end    
    % This used to test 2b
    % saveas(imagesc(cEnergy), 'wang.2b.jpg');
    
end