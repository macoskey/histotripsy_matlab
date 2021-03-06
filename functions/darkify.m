function darkify(figNum,colors)
% Makes figures the dark versions of themselves. Intended to make figures
% both pleasing to the eye and much cooler looking.
% 
% Jonathan Macoskey
% Created: 12.2.17
% Last edited: 2.2.18
%
% Input:
%   figNum = number of the figure you want to darkify
%   colors = 1 or 0 - determines if you want to change line colors

COLORORDER = [1 1 1;1 0 0;0 1 0;0.43 0.67 1;0.8 0.8 0.8;1 1 0;0 0 1];
t = get(gca,'Title');
t.Color = 'white';
l = get(gca,'Legend');

figure(figNum)
set(l,'Color','k')
set(l,'TextColor',[1 1 1]);
set(l,'Location','best')
set(figNum,'color',[0.1 0.1 0.1])
set(gca,'XColor','w')
set(gca,'YColor','w')
set(gca,'ZColor','w')
set(gca,'GridColor','w')
set(gca,'Color',[0.25 0.25 0.25])
set(gca,'ColorOrder',COLORORDER)
xlims = get(gca,'xlim');
ylims = get(gca,'ylim');
set(gca,'FontSize',16)
set(gca,'xlim',xlims)
set(gca,'ylim',ylims)
set(gca,'LineWidth',1.5)
fig = gcf;
fig.InvertHardcopy = 'off';

if(colors)
    hline = findobj(gcf,'type','line');
    for n = 1:length(hline)
        set(hline(n),'LineWidth',1.5)
        try
            set(hline(n),'Color',COLORORDER(mod(n,size(COLORORDER,1)),:));
        catch
            set(hline(n),'Color',COLORORDER(size(COLORORDER,1),:));
        end
    end
end

end