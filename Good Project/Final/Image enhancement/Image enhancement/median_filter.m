function [ output_image ] = median_filter( input_image )
input=inputdlg({'Order of Filter: '},'Median Filter',1,{'3'});
input_array=cell2mat(input);
order=str2num(input_array);
% output_image=medfilt2(input_image,[order order]);

[m n]=size(input_image);
p=(order-1)/2;
q=(order-1)/2;
% c=ones(order)/(order*order);
% [p q]=size(c);
% p=(p-1)/2;
% q=(q-1)/2;
output_image=input_image;
for i=p+1:m-p
	for j=q+1:n-q
		mask_array=zeros(order);
		for k=-p: p
			for l=-q:q
				mask_array(p+1-k,q+1-l)=input_image(i-k,j-l);
			end
		end
		Array=mask_array( : );
		median_value=median(Array);
		output_image(i,j)=median_value;
	end
end
end

