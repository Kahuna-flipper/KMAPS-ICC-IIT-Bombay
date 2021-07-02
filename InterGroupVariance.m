function igv = InterGroupVariance(input,labels)
[m,~] = size(input);
sum = 0;
c = max(labels); % number of clusters

%% Medoids and Inter Group Variance calculation : 
for i=1:c
    elements = find(labels==i);
    [a,~] = size(elements);
    distances = zeros(a,1);
    for j=1:a
        for k=1:a
            distances(j)=distances(j)+dtw(input(elements(j),:),input(elements(k),:));
        end
    end
    [~,index] = min(distances);
    for p=1:a
        sum = sum + dtw(input(elements(index),:),input(elements(p),:));
    end    
end
igv = sum/(m-c);
end