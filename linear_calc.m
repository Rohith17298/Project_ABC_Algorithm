function linear_out=linear_calc(weight, neuron_value)
%find the sigmoid by an linear operation between 
%weight and neuron value
linear_out=weight*[1; neuron_value];

end