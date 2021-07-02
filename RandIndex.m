function [rd,jc,fm] = RandIndex(labels,inputs)

searchcommand2 = strcat(pwd,'/*TRAIN.tsv');
name2 = dir(searchcommand2).name;
TRAIN2 = load(name2);
labels2 = TRAIN2(:,1);  % True Value 
[m,~] = size(inputs);
a=0;
b=0;
c=0;
d=0;
for i=1:m
    for j=i+1:m
        if(labels2(i)==labels2(j) && labels(i)==labels(j))
            a= a+1;
        end
        if(labels2(i)==labels2(j) && labels(i)~=labels(j))
            b= b+1;
        end
        if(labels2(i)~=labels2(j) && labels(i)==labels(j))
            c= c+1;
        end
        if(labels2(i)~=labels2(j) && labels(i)~=labels(j))
            d= d+1;
        end
    end
end

rd = (a+d)/(m*(m-1)/2);
jc = a/(a+b+c);
fm = (a^2/((a+b)*(a+c)))^0.5;

end