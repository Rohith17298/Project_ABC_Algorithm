function [new_u, delta_u] = update_u(old_u,alpha,x,v,y,d,i,activ_deriv)

hidden_neurons = size(v{1},2)-1;
hidden_layers = length(v);
delta_u=zeros(size(v{1},2)-1, size(x,2)+1);

for j=1:hidden_neurons
    temp_product = activ_deriv{1}(j,:);
    temp_product = v{1}(:,j)*temp_product;
    
    for nl=2:hidden_layers 
        temp_product= activ_deriv{nl}.*temp_product;
        temp_product=v{nl}*[1;temp_product];
    end
    delta_u(j, :)=[1; x(i,:)']*((y(i,:)-d(i,:))*temp_product);
end

new_u=old_u+(alpha.*delta_u);
end
