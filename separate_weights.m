function [u,v] = separate_weights(weights,ni,no,hidden_neurons)
%Pre allocation of vector U and V
ind=1;
%% ind=1;pre-allocate u
u=inf(hidden_neurons(1),(ni+1));
%fill-out u
for col = 1:size(u,2)
    for row=1:size(u,1)
        u(row,col)=weights(1,ind);
        ind=ind+1;
    end
end

%% pre-allocate v
v = cell(1,length(hidden_neurons)-1);
v{end}=inf(no,hidden_neurons(end-1)+1);
if length(hidden_neurons)>1
    for num_lay=1:length(hidden_neurons)-1
        v{num_lay}=inf(hidden_neurons(num_lay+1),(hidden_neurons(num_lay)+1));
    end
end
%% fill out each v
for num_lay=1:length(hidden_neurons)-1
    for col = 1:size(v{num_lay},2)
        for row=1:size(v{num_lay},1)
            v{num_lay}(row,col)=weights(1,ind);
            ind=ind+1;
        end
    end
end
end

