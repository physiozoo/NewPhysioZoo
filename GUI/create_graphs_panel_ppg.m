%%
function PPG_Axes_Handles = create_graphs_panel_PPG(parent_panel, Spacing, Padding, myUpBackgroundColor, ch_num)

PPG_Axes_Handles = gobjects(1, ch_num);

two_axes_box = uix.VBox('Parent', parent_panel, 'Spacing', 0, 'Padding', 0);

PPG_Axes_Handles(1) = axes('Parent', uicontainer('Parent', two_axes_box), 'Tag', 'ppg_ch_axes_1');
PPG_Axes_Handles(2) = axes('Parent', uicontainer('Parent', two_axes_box), 'Tag', 'ppg_ch_axes_2');
PPG_Axes_Handles(3) = axes('Parent', uicontainer('Parent', two_axes_box), 'Tag', 'ppg_ch_axes_3');
PPG_Axes_Handles(4) = axes('Parent', uicontainer('Parent', two_axes_box), 'Tag', 'ppg_ch_axes_4');
PPG_Axes_Handles(5) = axes('Parent', uicontainer('Parent', two_axes_box), 'Tag', 'ppg_ch_axes_5');


y_label_text = {'PPG`'; 'PPG``'; 'PPG```'};

for i = 1 : ch_num
    PPG_Axes_Handles(i).FontName = 'Times New Roman';        
    PPG_Axes_Handles(i).XGrid = 'on';
    PPG_Axes_Handles(i).YGrid = 'on';
    PPG_Axes_Handles(i).XMinorGrid = 'on';
    PPG_Axes_Handles(i).YMinorGrid = 'on';
    PPG_Axes_Handles(i).GridColor = [1 0 0];
    PPG_Axes_Handles(i).MinorGridColor = [1 0 0];
    PPG_Axes_Handles(i).MinorGridLineStyle = ':';
    PPG_Axes_Handles(i).GridAlpha = 0.5;
end

for i = 2 : ch_num-1
    ylabel(PPG_Axes_Handles(i), y_label_text{i-1}, 'FontName', 'Times New Roman');
    hold(PPG_Axes_Handles(i), 'on');
end

for i = 1 : ch_num -2
    PPG_Axes_Handles(i).XAxis.Visible = 'off';
end

xlabel(PPG_Axes_Handles(ch_num-1), 'Time (h:min:sec)', 'FontName', 'Times New Roman');

set(two_axes_box, 'Heights', [-5 -5 -5 -6 -2]);

set(parent_panel, 'BackgroundColor', myUpBackgroundColor);
set(two_axes_box, 'BackgroundColor', myUpBackgroundColor);

set(findobj(parent_panel, 'Type', 'uicontainer'), 'BackgroundColor', myUpBackgroundColor);













%
% grid_panel = uix.GridFlex('Parent', parent_panel, 'Padding', 10, 'Spacing', 0);
%
% PPG_Axes_Handles = gobjects(1, ch_num);
%
% for i = 1 : ch_num
%     tempPanel = uix.Panel('Parent', grid_panel, 'BorderType', 'none', 'Padding', Padding, 'Tag', ['ppg_ch_panel_' num2str(i)]);
%
%     axes_name = ['ppg_ch_axes_' num2str(i)];
%     PPG_Axes_Handles(i) = axes('Parent', tempPanel, 'ActivePositionProperty', 'Position', 'Tag', axes_name);
%     PPG_Axes_Handles(i).FontName = 'Times New Roman';
%
% %     ECG_Axes_Handles(i).XTick = [];
% %     ECG_Axes_Handles(i).YTick = [];
% %     ECG_Axes_Handles(i).XTickLabel = [];
% %     ECG_Axes_Handles(i).YTickLabel = [];
%     PPG_Axes_Handles(i).XAxis.Visible = 'off';
%     PPG_Axes_Handles(i).YAxis.Visible = 'off';
% end
%
% % [tb1, btns1] = axtoolbar(PPG_Axes_Handles(1),{'pan', 'zoomin','zoomout','restoreview'});
%
% set(grid_panel, 'Widths', -1, 'Heights', [-5 -5 -5 -5 -2]);
%
% set(parent_panel, 'BackgroundColor', myUpBackgroundColor);
% set(grid_panel, 'BackgroundColor', myUpBackgroundColor);
%
% set(findobj(parent_panel, 'Type', 'uicontainer'), 'BackgroundColor', myUpBackgroundColor);
% set(findobj(parent_panel, 'Type', 'uipanel'), 'BackgroundColor', myUpBackgroundColor);