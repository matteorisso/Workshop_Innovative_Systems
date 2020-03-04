if exist('param') == 1

	par_x(param_i)= param;

	result_1(param_i,:) = Delay_nand_and(counter_mod_index,counter_tech_index,:);
	result_2(param_i,:) = Pnand_and_dyn(counter_mod_index,counter_tech_index,:);
	result_3(param_i,:) = Pnand_and(counter_mod_index,counter_tech_index,:);


	if param_i == max_p
		
		for i=1:4	
	
			printf('\n Fan Out = %d\n',i);
			disp('	I/O Delay [ns]	Dynamic Power[W]	Static Power [W]');
			result = [par_x ; result_1(:,i)' ; result_2(:,i)' ; result_3(:,i)']';
			disp(' ');
			disp(result)
		
		endfor

	endif

else

		web_results_1(wb_idx_m, wb_idx_t,:) = Delay_nand_and(counter_mod_index,counter_tech_index,:);
		web_results_2(wb_idx_m, wb_idx_t,:) = Pnand_and_dyn(counter_mod_index,counter_tech_index,:);
		web_results_3(wb_idx_m, wb_idx_t,:) = Pnand_and(counter_mod_index,counter_tech_index,:);
		
		for i=1:4	
	
			printf('\n Fan Out = %d:\n',i);
			disp('  I/ODelay[ns]  DynPower[W]  StaticPower[W]');
			result = [web_results_1(wb_idx_m, wb_idx_t, i) ; web_results_2(wb_idx_m, wb_idx_t, i) ; web_results_3(wb_idx_m, wb_idx_t, i)]';
			disp(result)
	
		endfor


endif


%clear web_results_1,web_results_2,web_results_3,web_results_4


