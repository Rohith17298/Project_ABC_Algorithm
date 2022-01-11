function [y_new,u,v]=update_by_abc(x,d,u,v,i,hidden_neurons,active_type,T,c,k)

%% Main
[u_row,u_col]=size(u);
[v_row,v_col]=size(v);
j = randi(u_row,1);                 
p = randi(u_row,1);
k = randi(v_row,1);                 
l = randi(v_row,1);
if (p == i) || (l == i)                 
    p = randi(i,1);
    l = randi(i,1);
end

Phi = -1 + (1-(-1))*rand;  


%% For u
[u_row,u_col]=size(u);
for a=1:u_row
    for b=1:u_col
        [y_old,~,~,~]=calc_ann(x,u,v,i,active_type); %Get current solution
        u(a,b)=u(a,b)+Phi*(u(a,j) - u(p,j)); %Creates new solution
        [y_new,~,~,~]=calc_ann(x,u,v,i,active_type); %Get new solution
        if y_new > y_old %If the new solution is greater
            delta_y=y_new-y_old;
            r=prob(u(a,b));
            Fitness = CalFit(r);
            if (Fitness > 0.7)
                y_new=y_old; u(a,b)=u(a,b); 
            else
                y_new=y_old; 
            end
        else
            y_new=y_old; u(a,b)=u(a,b);
        end
    end
end

%% For v
for c=1:length(v)
    for a=1:size(v{c},1)
        for b=1:size(v{c},2)
            [y_old,~,~,~]=calc_ann(x,u,v,i,active_type); %Get current solution
            v{c}(a,b)=v{c}(a,b)+Phi*(v{c}(a,k) - v{c}(l,k)); %Creates new solution
            [y_new,~,~,~]=calc_ann(x,u,v,i,active_type); %Get new solution
            if y_new > y_old %If the new solution is greater
                y_new=y_old; 
                v{c}(a,b)=v{c}(a,b); %Keep solution
            else
                delta_y=y_new-y_old;
               % r=prob(v{c}(a,b));
                r=(0.9.*v{c}(a,b)./max(v{c}(a,b)))+0.1;;
            Fitness = CalFit(r);
            if (Fitness > 0.7)
                    y_new=y_old; v{c}(a,b)=v{c}(a,b); 
                else
                    y_new=y_old; 
                end
            end
        end
    end
end