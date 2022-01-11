function [der_u] = get_der_u(d,x,v,y,i,activ_deriv)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%%
hidden_neurons = size(v{1},2)-1;
hidden_layers = length(v);
der_u=zeros(size(v{1},2)-1, size(x,2)+1);

for j=1:hidden_neurons
    temp_product = activ_deriv{1}(j,:);
    temp_product = v{1}(:,j)*temp_product;
    
    for nl=2:hidden_layers 
        temp_product= activ_deriv{nl}.*temp_product;
        temp_product=v{nl}*[1;temp_product];
    end
der_u(j, :)=[1; x(i,:)']*((y(i,:)-d(i,:))*temp_product);
end
end