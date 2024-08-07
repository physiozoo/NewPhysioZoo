%%
function [Q_linehandle, R_linehandle, S_linehandle, T_linehandle] = plot_ppg_fid_on_data(time_vct, YData_handle, Q, R, S, T, parent_axes, ch_marker_size, if_visible)

if ~isempty(Q)
    Q_linehandle = line(time_vct(Q), YData_handle.YData(Q), 'Parent', parent_axes, 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 's', 'MarkerSize', ch_marker_size, 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'b', 'Tag', 'Q', 'Visible', if_visible);
else
    Q_linehandle = [];
end
if ~isempty(R)
    R_linehandle = line(time_vct(R), YData_handle.YData(R), 'Parent', parent_axes, 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 's', 'MarkerSize', ch_marker_size, 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'g', 'Tag', 'R', 'Visible', if_visible);
else
    R_linehandle = [];
end
if ~isempty(S)
    S_linehandle = line(time_vct(S), YData_handle.YData(S), 'Parent', parent_axes, 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', ch_marker_size, 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'm', 'Tag', 'S', 'Visible', if_visible);
else
    S_linehandle = [];
end
if ~isempty(T)
    T_linehandle = line(time_vct(T), YData_handle.YData(T), 'Parent', parent_axes, 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', ch_marker_size, 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'w', 'Tag', 'T', 'Visible', if_visible);
else
    T_linehandle = [];
end
