function final=CrossAndMut1(Generate,Population_size,cross_prob,mut_prob)
    % Applying Crossover and Mutation
    final=strings(Population_size,2);
    for i=1:2:Population_size
        a=rand();
        %a
        if(a<=cross_prob)
            point=randperm(5);
            p11=bin2dec(Generate(i,1));
            p12=bin2dec(Generate(i,2));
            p21=bin2dec(Generate(i+1,1));
            p22=bin2dec(Generate(i+1,1));
            P11=dec2bin(p11,5);
            P12=dec2bin(p12,5);
            P21=dec2bin(p21,5);
            P22=dec2bin(p22,5);
            c11=dec2bin(p11,5);
            c12=dec2bin(p12,5);
            c21=dec2bin(p21,5);
            c22=dec2bin(p22,5);
            k=point(1);
            k;
            %c1
            c11(k:end)=P21(k:end);
            c12(k:end)=P22(k:end);
            %c1
            %c2
            c21(k:end)=P11(k:end);
            c22(k:end)=P12(k:end);
            %c2
            final(i,1)=c11;
            final(i+1,1)=c21;
            final(i,2)=c12;
            final(i+1,2)=c22;
        end
        if(a>cross_prob)
            final(i,1)=Generate(i,1);
            final(i+1,1)=Generate(i+1,1);
            final(i,2)=Generate(i,2);
            final(i+1,2)=Generate(i+1,2);
        end
    end
    %final=Generate;
    for i=1:Population_size
        temp21=final(i,1);
        temp22=final(i,2);
        temp21=bin2dec(temp21);
        temp21=dec2bin(temp21,5);
        
        temp22=bin2dec(temp22);
        temp22=dec2bin(temp22,5);
    	    for j=1:5
    	        temp=rand();
                if(temp<=mut_prob)
                    if(temp21(j)=='1')
                        temp21(j)='0';
                    else
                        temp21(j)='1';
                    end
                    
                    if(temp22(j)=='1')
                        temp22(j)='0';
                    else
                        temp22(j)='1';
                    end
                end 
        end
        final(i,1)= temp21;
        final(i,2)=temp22;
    end

    
    %Children=final;
end