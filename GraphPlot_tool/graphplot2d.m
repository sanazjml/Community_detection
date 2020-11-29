function graphplot2d(xy,W,ind,varargin)
% This program was written to take in xy-coordinates of a network as well as
% the adjacency matrix W, to graph the network using these coordinates.  We
% have many programs that can calculate these coordinates either respecting
% community structure (KamadaC.m, fruc_reinC.m, KKFR.m, FRKK.m) or ignoring 
% it (Kamada.m, fruc_rein.m).  This program can also take in a factor for edge length, 
% colors for each node and shapes for each node.  If colors and alpha are given only,
% this program sets up the skeleton for a very nice legend.
%
%Inputs:
%
% xy= matrix of xy-coordinates for each node in the network
%
% W=Adjacency Matrix for the network
%
% Optional Variables:
% 
% alpha = factor for edge length
%
% colors = a vector of numbers defining colors, if zero is one of the
% colors, that is given as purple
%
% shapes = a vector of strings defining the shapes for each node, i. e. 'd'
% for diamond, '.' for dot, etc.
%
% Function Calls:
%
% graphplod2d(xy,W)
% graphplot2d(xy,W,alpha)
% graphplot2d(xy,W,alpha,colors)
% graphplot2d(xy,W,alpha,colors,shapes)
%
% Last Modified by ALT May 19,2009, Created by PJM


if (length(varargin))
    alpha=varargin{1};
else
    alpha=2;
end

%
%Set colormap by scores, if a vector (assumed to be of correct length)
map = colormap;

if (length(varargin)>1)
    scores=varargin{2};
    if min(scores)==0
        map=[.5 0 .5; map];
    end;
    colors = size(map,1);
    R=scores-min(scores)+1e-10; %Create R vector of scores > 0
    Rcolor=colors*R/max(R); %normalize scores/colors to number map elements
    Ucolor=unique(Rcolor);

    for j=1:length(Ucolor)
        idx(j)=find(Rcolor==Ucolor(j),1);
    end
end

if (length(varargin)>2)
    shapes=varargin{3};
else
    shape='.';
    shapes=repmat(shape,length(W),1);
    
end
%
x=xy(:,1); y=xy(:,2);
edges=find(W);

We=[W(edges),edges];
sortWe=sortrows(We);


% This is for a Weighted Network or an unweighted network
 str=(W/max(max(W))).^alpha;

% This is for Making the edges random strengths
 %str=rand(size(W));


hold on
if (length(varargin)>1)

    for i=idx,
       
        h=plot(x(i),y(i),shapes(i,:),'markersize',10);
        set(h,'Color',map(ceil(Rcolor(i)),:));
%         if any(strcmp(Annotating,'on'))
%            text(x(i),y(i),num2str(i));
%         end
    end
end
N=length(W);
for ie=sortWe(:,2)',
    i=mod(ie-1,N)+1;
    j=floor((ie-1)/N)+1;
    
    if (j>i)
        h=plot(x([i,j]),y([i,j])); hold on;
        set(h,'color',str(i,j)*ones(1,3))
        set(h,'LineWidth',.001);
        %set(h,'color',[.2 .2 .2]);
        
    end
end
if (length(varargin)>1)
    for i=1:N,
        if shapes(i,:)=='.'
        h=plot(x(i),y(i),shapes(i,:),'markersize',25);
        set(h,'MarkerFaceColor',map(ceil(Rcolor(i)),:));
        set(h,'Color',map(ceil(Rcolor(i)),:));
%         if any(strcmp(Annotating,'on'))
%            text(x(i),y(i),num2str(i));
%         end
        end
    end
    for i=1:N
        if shapes(i,:)~='.'
        h=plot(x(i),y(i),shapes(i,:),'markersize',8);
        set(h,'MarkerFaceColor',[.7 .7 .7]);
        set(h,'Color',map(ceil(Rcolor(i)),:));
%         if any(strcmp(Annotating,'on'))
%            text(x(i),y(i),num2str(i));
%         end
        end
    end
else
    plot(x,y,'b.','markersize',20)
%     lbl_dwn = 0.05*max(y);
%     for la = 1:length(ind);
%         if Annotating == 1
%            text(x(la),y(la)+lbl_dwn,num2str(ind(la)));
%         end
%     end
end

%

axis equal
hold off