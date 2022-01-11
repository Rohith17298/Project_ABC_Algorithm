function [now_H] = get_Hnow(der_weights,der_g)

%% step 5
old_H=(der_weights*der_weights')./(der_weights'*der_g);
% old_H=(der_weights*der_weights')./(der_g'*der_weights);

%% step 6
delta_H = (old_H) - ( (old_H*der_g'*der_g*old_H) / (der_g*old_H*der_g') );
% delta_H = ((der_weights*der_weights')./(der_weights'*der_g)) - ( (old_H.*(der_g.*der_g').*old_H) ./ (der_g'*old_H*der_g) );

%% step 7
now_H= old_H + delta_H;

end

