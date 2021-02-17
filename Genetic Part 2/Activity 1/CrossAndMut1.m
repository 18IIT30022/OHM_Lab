function final=CrossAndMut1(Generate,Population_size,cross_prob,mut_prob)
    final=strings(Population_size,1);
    for i=1:2:Population_size
        a=rand();
        %a
        if(a<=cross_prob)
            point=randperm(5);
            p1=bin2dec(Generate(i));
            p2=bin2dec(Generate(i+1));
            P1=dec2bin(p1,5);
            P2=dec2bin(p2,5);
            c1=dec2bin(p1,5);
            c2=dec2bin(p2,5);
            k=point(1);
            k;
            %c1
            c1(k:end)=P2(k:end);
            %c1
            %c2
            c2(k:end)=P1(k:end);
            %c2
            final(i)=c1;
            final(i+1)=c2;
        end
        if(a>cross_prob)
            final(i)=Generate(i);
            final(i+1)=Generate(i+1);
        end
    end
    %final=Generate;
    for i=1:Population_size
        temp2=final(i);
        temp2=bin2dec(temp2);
        temp2=dec2bin(temp2,5);
    	    for j=1:5
    	        temp=rand();
                if(temp<=mut_prob)
                    if(temp2(j)=='1')
                        temp2(j)='0';
                    else
                        temp2(j)='1';
                    end
                end 
        end
        final(i)= temp2;
    end

    
    %Children=final;
end