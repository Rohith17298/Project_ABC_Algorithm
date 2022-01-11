function [scaled_mat] = scaling(matrix,type)
%Scaling of a parameter


if type == 1 
		x_min = -1;
		x_max = 1;
		[x_row,x_col]=size(matrix);
		Max_x = max(matrix);
		Min_x = min(matrix);
		
		for i = 1:x_col
		for n = 1:x_row
		scaled_mat(n,i) = x_min+ (((matrix(n,i) - Min_x(i))./(Max_x(i) - Min_x(i)))*(x_max - x_min));
        end
        end
		
elseif type == 2 
		d_min = 0;
		d_max = 1;
		[d_row,d_col]=size(matrix);
		Max_d = max(matrix);
		Min_d = min(matrix);
		
		for i = 1:d_col
			for n = 1:d_row
				scaled_mat(n,i) = d_min+ (((matrix(n,i) - Min_d(i))./(Max_d(i) - Min_d(i)))*(d_max - d_min));
			end
		end
end