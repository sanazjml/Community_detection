function [communities cut] = findcommunitiesatcut(groups,cut)
%[communities cut]=findcommunitiesatcut(groups,cut)
%
% Gives the community numbers at a requested cut or level in the groups vector,
% if the cut number is not valid the program changes it to a valid one.
% Uses a groups vector and a scalar cut number, gives communities and the cut number,
% which is needed when cut is changed.
%
%
%Last modified by ALT, 20 June 2007

%Error checking
n=unique(groups);
f=diff(n);
z=unique(f);
cutmax=length(z);
if(cut>cutmax)
    disp(['That is too many cuts! I have changed the cut number.']);
    cut=cutmax;
elseif(cut<0)
    cut=cutmax;
    disp(['Negative numbers dont work, I have changed the cut number to the max'])
end

%Identify distinct group values and number of cut levels in dendrogram:
groupnumbers=unique(groups);
differences=diff(groupnumbers);
diffnumbers=unique(differences);
cuts=length(diffnumbers);

if cut==0,
    communities=ones(size(groups));
else
    cutdiff=diffnumbers(cuts+1-cut); %NOTE THERE IS NO ERROR CHECKING HERE, ASSUMED VALID CUT NUMBER
    
   
    commnumbers=cumsum([1,diff(groupnumbers)>=cutdiff]);

    %Define communities by replacing the groupnumbers values in groups with the
    %corresponding commnumbers values, component by component.
    communities=groups;
    for ig=1:length(groupnumbers),
        indx=find(groups==groupnumbers(ig));
        communities(indx)=commnumbers(ig);
    end
end
end