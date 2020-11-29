[xynew, XY, xyc]=FRKK(sparse(A),COMTY.COM{end},0.01,1000, 2, 25);
ind=1:length(xynew);
figure; axis off; set(gcf,'color',Back_color);
graphplot2d(xynew,sparse(A),ind,0.1,ind);
if any(strcmp(Back_color,'black'))
   title('Whole Genome ', 'color', 'White','FontWeight','bold');
else
   title('Whole Genome ','FontWeight','bold');
end

% Adjust title position

set(gca,'Units','normalized')
titleHandle = get( gca ,'Title' );
pos = get(titleHandle , 'position');
pos1 = pos + [0 0.03*pos(2) 0];
set(titleHandle , 'position' , pos1);

% Annotating

if any(strcmp(Annotating,'on'))
   x=xynew(:,1); y=xynew(:,2);
   lbl_dwn = 0.05*max(y);
   if any(strcmp(Back_color,'black'))
      for la = 1:length(ind)
          text(x(la),y(la)+lbl_dwn,num2str(ind(la)),'color', 'w');
      end
   else
      for la = 1:length(ind)
          text(x(la),y(la)+lbl_dwn,num2str(ind(la)));
      end
   end
end

% Saving figure in 'Output_figs' file with different formats

fig = gcf;
fig.InvertHardcopy = 'off';
saveas(gcf,strcat('./Output_figs', '/','whole Chromosome.fig'));
% saveas(gcf,strcat('./Output_figs', '/','whole Chromosome.jpg'));
% saveas(gcf,strcat('./Output_figs', '/','whole Chromosome.png'));