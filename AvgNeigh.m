function [im] = KNN_denoise(I, K, N)  

    Im = imnoise(I,'salt & pepper');  
    figure,imshow(Im);  
    [m, n] = size(Im);  
    s = ceil(N/2);  
    d = fix(N/2);  
    i_e = m-s+1;  
    j_e = n-s+1;  
    for i=s:i_e  
        for j=s:j_e  
            B = I(i-d:i+d, j-d:j+d);        %B??N*N???  
            A = reshape(B, 1, []);%?B??????A?????????sort????????????  
            [val, id] = sort(abs(A-I(i, j)));      %??I(i,j)?????????  
            for k=2:1+K  
                t = k-1;  
                C(t,1) = A(1, id(1, k));        %??I(i,j)????K???C?  
            end  
            I(i, j) = round(mean(C));       %???  
        end  
    end  
    im = I;  