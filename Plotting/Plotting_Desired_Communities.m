% ind = [];
ind = cell(1,length(Desired_Communities));
for i = 1:length(Desired_Communities)
%     index = find(COMTY.COM{end}==Desired_Communities(i));
%     ind = [ind index];
      ind{i} = find(COMTY.COM{end}==Desired_Communities(i));
end
ind = cell2mat(ind);
ind = sort(ind);
B = A(ind,ind);
[xynew, XY, xyc]=FRKK(sparse(B),COMTY.COM{end}(ind),0.01,1000, 2, 25);
figure; axis off; set(gcf,'color',Back_color);
graphplot2d([xynew],sparse(B),ind,0.1,ind);
if any(strcmp(Back_color,'black'))
   title('Desired Communities ','color', 'White','FontWeight','bold');
else
   title('Desired Communities ','FontWeight','bold');
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
saveas(gcf,strcat('./Output_figs', '/','Desired_Com','.fig'));
saveas(gcf,strcat('./Output_figs', '/','Desired_Com','.jpg'));
saveas(gcf,strcat('./Output_figs', '/','Desired_Com','.png'));