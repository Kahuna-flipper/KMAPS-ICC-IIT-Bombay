function ch = CHIndex(labels,input)

[m,~] = size(input);
c = max(labels);
medoids = zeros(c,1);
sum = 0;
for i=1:c
    elements = find(labels==i);
    [temp,~] = size(elements);
    distances = zeros(temp,1);
    for j=1:temp
        for k=1:temp
            distances(j)=distances(j)+dtw(input(elements(j),:),input(elements(k),:));
        end
    end
    [~,index] = min(distances);
    [siz, ~] = size(elements);
    if(siz~=0)
        medoids(i)=elements(index);

        for p=1:temp
            sum = sum+(dtw(input(medoids(i),:),input(elements(p),:)))^2;
        end
    end
end

sum2 = zeros(m,1);

for i=1:m
    for j=1:m
        sum2(i) = sum2(i)+dtw(input(i,:),input(j,:));
    end
end

[~,index2] = min(sum2); % index2 is the centroid of the data set 
final_sum=0;

for i=1:c
    [ni,~] = size(find(labels==i));
    if(medoids(i)~=0)
    final_sum = final_sum + ni*(dtw(input(medoids(i),:),input(index2,:)))^2;
    end
end

ch = (final_sum/sum)*((m-c)/(m-1));

end




