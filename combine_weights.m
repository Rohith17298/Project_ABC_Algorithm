function [old_weights] = combine_weights(u,v)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
old_weights=reshape(u,[1 numel(u)]);
for num_layer=1:length(v)
    old_weights=[old_weights reshape(v{num_layer},[1 numel(v{num_layer})])];
end
end

