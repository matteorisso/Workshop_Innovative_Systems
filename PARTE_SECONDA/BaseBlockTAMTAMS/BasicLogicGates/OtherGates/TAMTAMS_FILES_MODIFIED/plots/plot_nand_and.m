

if exist('param') == 1

	x_plot = par_x;



	y1 = result_1';
	y2 = result_2';
	y3 = result_3';
		


	file_path_save_data = strcat(plot_path, "nand_and_SPower.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Parameter		Fanout1 [W]		Fanout2 [W]		Fanaout3 [W]		Fanaout4 [W]\n");	

	for count_save_file = 1:length(par_x)
		fprintf(fp,"%f		",par_x(count_save_file));
		fprintf(fp,"%e		",y3(1,count_save_file));
		fprintf(fp,"%e		",y3(2,count_save_file));
		fprintf(fp,"%e		",y3(3,count_save_file));
		fprintf(fp,"%e\n",y3(4,count_save_file));
	endfor

	fclose(fp);


	file_path_save_data = strcat(plot_path, "nand_and_Dpower.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Parameter		Fanout1 [W]		Fanout2 [W]		Fanaout3 [W]		Fanaout4 [W]\n");	

	for count_save_file = 1:length(par_x)
		fprintf(fp,"%f		",par_x(count_save_file));
		fprintf(fp,"%e		",y2(1,count_save_file));
		fprintf(fp,"%e		",y2(2,count_save_file));
		fprintf(fp,"%e		",y2(3,count_save_file));
		fprintf(fp,"%e\n",y2(4,count_save_file));
	endfor

	fclose(fp);


	file_path_save_data = strcat(plot_path, "nand_and_delay.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Parameter		Fanout1 [ns]		Fanout2 [ns]		Fanaout3 [ns]		Fanaout4 [ns]\n");	

	for count_save_file = 1:length(par_x)
		fprintf(fp,"%f		",par_x(count_save_file));
		fprintf(fp,"%e		",y1(1,count_save_file));
		fprintf(fp,"%e		",y1(2,count_save_file));
		fprintf(fp,"%e		",y1(3,count_save_file));
		fprintf(fp,"%e\n",y1(4,count_save_file));
	endfor

	fclose(fp);
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

else

	x_plot = linspace(1,tech_index_web,tech_index_web);


		for count_tech = 1:tech_index_web

				y1(count_tech, :) = web_results_1(wb_idx_m, count_tech, :);
				y2(count_tech, :) = web_results_2(wb_idx_m, count_tech, :);
				y3(count_tech, :) = web_results_3(wb_idx_m, count_tech, :);

			
		endfor


	file_path_save_data = strcat(plot_path, "nand_and_Spower.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Technology		Fanout1 [W]		Fanout2 [W]		Fanaout3 [W]		Fanaout4 [W]\n");	

	for count_save_file = 1:tech_index_web
		fprintf(fp,"%d		",count_save_file);
		fprintf(fp,"%e		",y3(count_save_file,1));
		fprintf(fp,"%e		",y3(count_save_file,2));
		fprintf(fp,"%e		",y3(count_save_file,3));
		fprintf(fp,"%e\n",y3(count_save_file,4));
	endfor

	fclose(fp);
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%% CODE TO SAVE DATA ON FILE %%%%%%%%%%%%%%%%%%%%
	file_path_save_data = strcat(plot_path, "nand_and_Dpower.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Technology		Fanout1 [W]		Fanout2 [W]		Fanaout3 [W]		Fanaout4 [W]\n");	

	for count_save_file = 1:tech_index_web
		fprintf(fp,"%d		",count_save_file);
		fprintf(fp,"%e		",y2(count_save_file,1));
		fprintf(fp,"%e		",y2(count_save_file,2));
		fprintf(fp,"%e		",y2(count_save_file,3));
		fprintf(fp,"%e\n",y2(count_save_file,4));
	endfor

	fclose(fp);

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%% CODE TO SAVE DATA ON FILE %%%%%%%%%%%%%%%%%%%%
	file_path_save_data = strcat(plot_path, "nand_and_Delay.txt");
	fp=fopen(file_path_save_data,'w');

	fprintf(fp,"# Technology		Fanout1 [ns]		Fanout2 [ns]		Fanaout3 [ns]		Fanaout4 [ns]\n");	

	for count_save_file = 1:tech_index_web
		fprintf(fp,"%d		",count_save_file);
		fprintf(fp,"%e		",y1(count_save_file,1));
		fprintf(fp,"%e		",y1(count_save_file,2));
		fprintf(fp,"%e		",y1(count_save_file,3));
		fprintf(fp,"%e\n",y1(count_save_file,4));
	endfor

	fclose(fp);
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

		
		

endif
