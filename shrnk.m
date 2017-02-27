function J = shrnk(I, num_rows_removed, num_cols_removed)

    J = I;
    
    for x = 1:num_rows_removed
        S = horizontal_seam(J);
        J = uint8(remove_horizontal_seam(J, S));
    end
    
    J = permute(J, [2 1 3]);
    
    for x = 1:num_cols_removed
        S = horizontal_seam(J);
        J = uint8(remove_horizontal_seam(J, S));
    end
    
    J = permute(J, [2 1 3]);
    
end