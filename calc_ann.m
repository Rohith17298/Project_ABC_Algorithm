function [y_linear,y_active,linear_z,active_z] = calc_ann(x,u,v,ns,active_type)
% Find the output "y" with input x, u and v 
nl = length(v);
linear_z = cell(1,nl);
active_z = cell(1,nl);

y_linear = linear_calc(u, x(ns,:)');

for hid_lay = 1:nl
    z = type_of_activation(y_linear, active_type);
    linear_z{hid_lay} = y_linear;
    active_z{hid_lay} = z;
    y_linear = linear_calc(v{hid_lay}, z);
end
y_active = type_of_activation(y_linear, active_type);

end