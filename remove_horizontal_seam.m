function J = remove_horizontal_seam(I, S)

    J = zeros(size(I, 1) - 1, size(I, 2), 3);

    for col = 1:size(I, 2)             
        for row = 1:S(col) - 1
            J(row, col, 1) = I(row, col, 1);
            J(row, col, 2) = I(row, col, 2);
            J(row, col, 3) = I(row, col, 3);
        end
        
        for row = S(col) + 1:size(I, 1)
            J(row - 1, col, 1) = I(row, col, 1);
            J(row - 1, col, 2) = I(row, col, 2);
            J(row - 1, col, 3) = I(row, col, 3);            
        end
        
    end    
    
end