function mat = commAdjMatrixSparse(groups, A)
% Creates a community adjacency matrix using
% groups from the output for reccurrcommsNew2Sparse, A is the adjacency matrix
% 0's on the diagonal, other elements consist of the total number of
% connections between the two communities
%
% Last Modified by ALT 20 June 2007


h=sort(groups);
g=unique(h);
d=diff(g);
f=sort(d);
z=unique(f);
cuts=size(z,2);

[communities cut]=findcommunitiesatcut(groups,cuts);
rows = max(communities);
mat=spalloc(rows,rows,2*rows);

for i = 1:rows
    for j = 1:rows
        if(i ~= j)
            comm1 = find(communities==i);
            comm2 = find(communities==j);
            mat(j, i) = sum(sum(A(comm1, comm2)));
        end
    end
end
end