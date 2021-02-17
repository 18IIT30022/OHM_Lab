
function q=DoAction(p,a)

   switch a(1)
       case 1
            q=DoSwap(p,a(2),a(3));
       case 2
           q=DoReverse(p,a(2),a(3));
       case 3
           q=DoInsert(p,a(2),a(3));
   end
        
end