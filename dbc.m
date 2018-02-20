function D = box_count( IMG )
    %dim of image matrix
    dim = max(size(IMG));
    mymax = dim;
    %in order to divide by half, want the size be 2^n
    dim = 2^ceil(log2(dim))
    %padding the matrix to square
    rowPad = dim - size(IMG, 1);
    colPad = dim - size(IMG, 2);
    IMG = padarray(IMG, [rowPad, colPad],0, 'both');
    N = zeros(1, ceil(log2(dim)));
    G = zeros(1, ceil(log2(dim))+1);
    L = zeros(1, ceil(log2(dim))+1);
    K = zeros(1, ceil(log2(dim))+1);
    invr = zeros(1, ceil(log2(dim)));
    %intially, just one box
    num_boxes = 1;
    expo = 0;
    %while box is larger than 1x1, dim is box length
    L(expo+1) = 0;
    K(expo+1) = 0;
    while dim >= 1
       
        G(expo+1) = 0;
        N(expo+1) = 0; %initialize count
       
        
        for box_row = 1:num_boxes
            for box_col = 1:num_boxes
                row_start = (box_row - 1) * dim + 1;
                row_end = box_row * dim;
                col_start = (box_col - 1) * dim + 1;
                col_end = box_col * dim;
                %i,e, 1~256,257~512,513~768, 769~1024
                contain_pixel = false;
                %every box got 1, if max gray exists plus 1, if min
                %exists minus 1
                if(dim <= 128)
                N(expo+1) = N(expo+1) + 1;
                end
                
                for row = row_start:row_end
                    for col = col_start:col_end
                        if(dim <= 128)
                            if IMG(row, col) > 240%only consider the boxes with pixels
                                N(expo+1) = N(expo+1) + 1;
                                contain_pixel = true;
                            end
                            if IMG(row, col) < 8%only consider the boxes with pixels
                                N(expo+1) = N(expo+1) - 1;
                                contain_pixel = true; % Break from nested loop.
                            end
                        end
                        if(dim > 128)
                            if IMG(row, col)%only consider the boxes with pixels
                                N(expo+1) = N(expo+1) + 1;
                                contain_pixel = true;
                            end
                        end
                        %break inner
                        if contain_pixel
                            break; % Break from nested loop.
                        end
                    end %end inner inbox col loop
                    %break outer
                    if contain_pixel
                        break; % Break from nested loop.
                    end                   
                end %end outer inbox row loop
                
            end %end inner counting row of boxes loop
        end %end outer counting row of boxes loop
        
        % 2^expo = magnitude
        
        expo = expo + 1;
        G(expo) = L(expo) - K(expo) + 1;
        
        invr(expo) = mymax/dim;
        
        num_boxes = num_boxes * 2;
        dim = dim / 2;
    end

    plot(log(invr),log(N))
    D = polyfit(log(invr), log(N),1);
    D = D(1); %get the slope
end
