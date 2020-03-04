<?php session_start(); ?>
<?php include("head.php"); ?>

<script type="text/javascript" src="css/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="css/simpletree.css" />

<td style="padding-left:25px; padding-right:25px; padding-top:25px; padding-bottom:25px" align="left" class="text" bgcolor="#FFFFFF"><span class="title">TAMTAMS DOCUMENTATION</span> 
</br></br></br></br>


<b><a href="javascript:ddtreemenu.flatten('treemenu1', 'expand')">Expand All</a> | <a href="javascript:ddtreemenu.flatten('treemenu1', 'contact')">Contract All</a></b>
</br></br>

<ul id="treemenu1" class="treeview">
<font color ="black">
<li><b> Parameters </b>
<ul>
	<li><u><i><a href="Documentation/ConstantsHTML/physical_constants.html" target="_blank"> Physical Constants</a></u></i></li>
	<li><u><i><a href="Documentation/ConstantsHTML/system_constants.html" target="_blank"> System Parameters</a></u></i></li>
</ul>
</li>

<li><b> Modules </b>
<ul>
	<li> <b>BULK</b>
	<ul>
		<li> <b>Capacitance </b> - Interconnections capacitance
			<ul>
			<font color ="red">
			<li><b>cap_Bacpac</b> - Bacpac model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Bacpac.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Bacpac.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>cap_Chern92</b> - Chern, Huang, Arledge 1992 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Chern92.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Chern92.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>cap_Sakurai93</b> - Sakurai 1993 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Sakurai93.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Sakurai93.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>cap_Sim03</b> - Sim, Krishnan, Petranovic, Arora, Lee, Yang  2003 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Sim03.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Sim03.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>cap_Wong98</b> - Wong 1998 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Wong98.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Wong98.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>cap_Wong2000</b> - Wong 2000 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/capacitance/cap_Wong2000.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/capacitance/cap_Wong2000.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Cgate</b> - Gate capacitance for frequency and power calculation
			<ul>
			<font color ="red">
			<li><b>cgate_dynamic</b> - Single gate and single fli-flop model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/cgate/cgate_dynamic.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/cgate/cgate_dynamic.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Crosstalk</b> - Interconnections crosstalk
			<ul>
			<font color ="red">
			<li><b>crosstalk_Eo_Eisenstadt</b> - Eisenstadt model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/crosstalk/crosstalk_Eo_Eisenstadt.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/crosstalk/crosstalk_Eo_Eisenstadt.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>crosstalk_Sakurai</b> - Sakurai 1993 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/crosstalk/crosstalk_Sakurai.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/crosstalk/crosstalk_Sakurai.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>DIBL</b> - Drain Induced Barrier Lowering effect on threshold voltage
			<ul>
			<font color ="red">
			<li><b>dibl_mas</b> - Mastar model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/dibl/dibl_mas_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/dibl/dibl_mas_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>dibl_Liu1993</b> - Zhi-Hong Liu 1993 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/dibl/dibl_Liu1993_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/dibl/dibl_Liu1993_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Flip Flop</b> - Flip Flop parameters calculation for frequency and power models
			<ul>
			<font color ="red">
			<li><b>I_Pow_C2MOS_FF</b> - C<sup>2</sup>MOS model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/flip_flop/I_Pow_C2MOS_FF.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/flip_flop/I_Pow_C2MOS_FF.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>I_Pow_static_FF</b> - CMOS model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/flip_flop/I_Pow_static_FF.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/flip_flop/I_Pow_static_FF.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Frequency</b> - Chip frequency
			<ul>
			<font color ="red">
			<li><b>freq_Huang</b> - Huang model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/frequency/freq_Huang.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/frequency/freq_Huang.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>freq_bac</b> - Bacpac model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/frequency/freq_bac.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/frequency/freq_bac.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ibtb</b> - Band-To-Band current
			<ul>
			<font color ="red">
			<li><b>Ibtb_Kaushik</b> - Kaushik model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ibtb/Ibtb_Kaushik_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ibtb/Ibtb_Kaushik_bul.pdf" target="_blank"> View PDF</a></u></i></li>
				</ul>
			</li>
			<li><b>Ibtb_Kaushik_new</b> - Kaushik improved model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ibtb/Ibtb_Kaushik_new_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ibtb/Ibtb_Kaushik_new_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Igate</b> - Gate current
			<ul>
			<font color ="red">
			<li><b>Igate_Lee</b> - Lee model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/igate/Igate_Lee_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/igate/Igate_Lee_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Igate_Mastar4</b> - Mastar 4 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/igate/Igate_Mastar4_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/igate/Igate_Mastar4_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Igate_MondalDutta</b> - Mondal-Dutta model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/igate/Igate_MondalDutta_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/igate/Igate_MondalDutta_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Igate_Yeo</b> - Yeo model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/igate/Igate_Yeo_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/igate/Igate_Yeo_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ileak</b> - Total leakage current for different logic gates
			<ul>
			<font color ="red">
			<li><b>Ileak_inverter</b> - Inverter gate </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ileak/Ileak_inverter.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ileak/Ileak_inverter.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Ileak_Kaushik</b> - Inverter gate considering band-to-band current </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ileak/Ileak_Kaushik.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ileak/Ileak_Kaushik.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Ileak_nand_nor</b> - Nand/Nor gate </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ileak/Ileak_nand_nor.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ileak/Ileak_nand_nor.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ilg</b> - Total gate current for logic gates
			<ul>
			<font color ="red">
			<li><b>Ilg_nand_gate</b> - Nand/And gate </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ilg/Ilg_nand_gate.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ilg/Ilg_nand_gate.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ilj</b> - Total band-to-band current for logic gates
			<ul>
			<font color ="red">
			<li><b>Ilj_nand_junction</b> - Nand/And gate </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ilj/Ilj_nand_junction.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ilj/Ilj_nand_junction.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ilo</b> - Total subthresold current for logic gates
			<ul>
			<font color ="red">
			<li><b>Ilo_nand_off</b> - Nand/And gate </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ilo/Ilo_nand_off.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ilo/Ilo_nand_off.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Inductance</b> - Interconnections inductance
			<ul>
			<font color ="red">
			<li><b>ind_AroraSong</b> - Arora, Song  2004 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/inductance/ind_AroraSong.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/inductance/ind_AroraSong.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>ind_ZhuoZhaoZeng</b> - Self-Inductance Zhuo, Zhao, Zeng 2001 </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/inductance/ind_ZhuoZhaoZeng.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/inductance/ind_ZhuoZhaoZeng.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ioff</b> - Subthresold current
			<ul>
			<font color ="red">
			<li><b>Ioff_mas4</b> - Mastar4 model </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ioff/Ioff_mas4_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ioff/Ioff_mas4_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			<li><b>Ioff_taur</b> - Scholastic model with taur correction </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ioff/Ioff_taur_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ioff/Ioff_taur_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ion</b> - Drain current with transistor ON
			<ul>
			<font color ="red">
			<li><b>Ion_emme</b> - Scholastic model with "m" calculation </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ion/Ion_emme_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ion/Ion_emme_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>Ion_mas</b> - Mastar model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ion/Ion_mas_complete_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/ion/Ion_mas_complete_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Ion/Ioff</b> - Ratio between drain current and subthreshold current
			<ul>
			<font color ="red">
	    	<li><b>Ion_vs_Ioff</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/ion_ioff/Ion_vs_Ioff_bul.html" target="_blank"> Source Code</a></u></i></li>
				<!--<li><u><i><a href="Documentation/ModulesPDF/ion_ioff/Ion_vs_Ioff_bul.pdf" target="_blank"> View PDF</a></u></i></li>-->
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<!-- <li> <b>Irdrop</b> - Voltage drop and electromigration on power supply lines
			<ul>

	    	</ul>
			</li> -->
		<li> <b>Mobility</b> - Transistor mobility
			<ul>
			<font color ="red">
	    	<li><b>mobility_mas</b> - Mastar model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/mobility/mobility_mas_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/mobility/mobility_mas_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>mobility_unified</b> - Unified mobility model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/mobility/mobility_unified_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/mobility/mobility_unified_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<!-- <li> <b>Molfet</b> - Molecular FET model
			<ul>

	    	</ul>
			</li> -->
		<li> <b>NAND/AND</b> - Current, Delay and Power analysis
			<ul>
			<font color ="red">
	    	<li><b>I_Pow_CMOS_NAND2</b> - CMOS 2 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_CMOS_NAND2.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_CMOS_NAND2.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_CMOS_NAND3</b> - CMOS 3 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_CMOS_NAND3.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_CMOS_NAND3.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_CMOS_NAND4</b> - CMOS 4 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_CMOS_NAND4.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_CMOS_NAND4.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Domino_AND2</b> - Domino 2 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Domino_AND2.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Domino_AND2.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Domino_AND3</b> - Domino 3 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Domino_AND3.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Domino_AND3.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Domino_AND4</b> - Domino 4 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Domino_AND4.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Domino_AND4.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Pass_Transistor_AND2</b> - Pass Transistor 2 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Pass_Transistor_AND2.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Pass_Transistor_AND2.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Pass_Transistor_AND3</b> - Pass Transistor 3 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Pass_Transistor_AND3.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Pass_Transistor_AND3.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>I_Pow_Pass_Transistor_AND4</b> - Pass Transistor 4 inputs nand</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/I_Pow_Pass_Transistor_AND4.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/I_Pow_Pass_Transistor_AND4.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
	   </li>
		<li><b>Delay_Pow_nand2_cmos</b> - NAND2 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nand2_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
		<li><b>Delay_Pow_nand3_cmos</b> - NAND3 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nand3_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
		<li><b>Delay_Pow_nand4_cmos</b> - NAND4 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nand4_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
		<li><b>Delay_Pow_nor2_cmos</b> - NOR2 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nor2_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
		<li><b>Delay_Pow_nor3_cmos</b> - NOR3 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nor3_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
		<li><b>Delay_Pow_nor4_cmos</b> - NOR4 CMOS logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_nor4_cmos.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/CMOS-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_and2_dyn</b> - AND2 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_and2_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_and3_dyn</b> - AND3 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_and3_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_and4_dyn</b> - AND4 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_and4_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_or2_dyn</b> - OR2 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_or2_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_or3_dyn</b> - OR3 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_or3_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
	<li><b>Delay_Pow_or4_dyn</b> - OR4 Dynamic logic Delay, Static Power, Dynamic Power</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/nand_and/Delay_Pow_or4_dyn.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/nand_and/Dynamic-logic gates characterisation.pdf" target="_blank"> View PDF</a></u></i>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>PDE</b> - Poly Deplition Effect on threshold voltage 
			<ul>
			<font color ="red">
	    	<li><b>pde_Arora</b> - Arora, Rios 1995 model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/pde/pde_Arora_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/pde/pde_Arora_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Pinterc</b> - Interconnections power analysis
			<ul>
			<font color ="red">
	    	<li><b>pw_interconnect</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/pinterc/pw_interconnect.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/pinterc/pw_interconnect.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Piopads</b> - Input/output pads power analysis
 			<ul>
			<font color ="red">
	    	<li><b>pw_pads</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/piopads/pw_pads.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/piopads/pw_pads.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Plogic</b> - Logic power analysis
			<ul>
			<font color ="red">
	    	<li><b>pw_logic_reg</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/plogic/pw_logic_reg.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/plogic/pw_logic_reg.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
               <li> <b>FPGA</b> - FPGA power, area and time delay analysis
			<ul>
			<font color ="red">
	    	<li><b>pw_area_tau_FPGA</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/FPGA/pw_area_tau_FPGA.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/FPGA/pw_area_tau_FPGA.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Pmemory</b> - Memory power analysis
			<ul>
			<font color ="red">
	    	<li><b>pw_mem_dynamic</b> </i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/pmemory/pw_mem_dynamic.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/pmemory/pw_mem_dynamic.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>QME</b> - Quantum Effect on threshold voltage
			<ul>
			<font color ="red">
	    	<li><b>qme_Chaudhry_Roy_bul</b> - Chaudry-Roy model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/qme/qme_Chaudhry_Roy_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/qme/qme_Chaudhry_Roy_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Resistance</b> - Interconnections resistance
			<ul>
			<font color ="red">
	    	<li><b>res_Bacpac</b> - Bacpac model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/resistance/res_Bacpac.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/resistance/res_Bacpac.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>res_new</b> - Modified bacpac model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/resistance/res_new.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/resistance/res_new.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>SCE</b> - Short Channel Effect on threshold voltage
			<ul>
			<font color ="red">
	    	<li><b>sce_mas</b> - Mastar model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/sce/sce_mas_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/sce/sce_mas_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Skew</b> - Clock skew at system level analysis
			<ul>
			<font color ="red">
	    	<li><b>skew_zarkesh</b> - Zarkesh model</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/skew/skew_zarkesh.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/skew/skew_zarkesh.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Sysinterconnect</b> - Parameters for interconnections power calculation
			<ul>
			<font color ="red">
	    	<li><b>Int_parameters</b></i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/sysintercon/Int_parameters.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/sysintercon/Int_parameters.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Tau</b> - Timing constant
			<ul>
			<font color ="red">
	    	<li><b>tau</b></i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/tau/tau_bul.html" target="_blank"> Source Code</a></u></i></li>
				<!--<li><u><i><a href="Documentation/ModulesPDF/tau/tau_bul.pdf" target="_blank"> View PDF</a></u></i></li>-->
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Vdd/Vth</b> - Ratio between supply voltage and threshold voltage
			<ul>
			<font color ="red">
	    	<li><b>Vdd_vs_Vth</b></i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/vdd_vth/Vdd_vs_Vth_bul.html" target="_blank"> Source Code</a></u></i></li>
				<!--<li><u><i><a href="Documentation/ModulesPDF/vdd_vth/Vdd_vs_Vth_bul.pdf" target="_blank"> View PDF</a></u></i></li>-->
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
		<li> <b>Vth</b> - Threshold voltage
			<ul>
			<font color ="red">
	    	<li><b>vth_mas_complete</b> - Mastar model, includes all correction factors</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/vth/vth_mas_complete_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/vth/vth_mas_complete_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
	    	<li><b>vth_modular</b> - Base model, does not include any correction factor</i>
				<ul>
	    		<li><u><i><a href="Documentation/ModulesHTML/vth/vth_modular_bul.html" target="_blank"> Source Code</a></u></i></li>
				<li><u><i><a href="Documentation/ModulesPDF/vth/vth_modular_bul.pdf" target="_blank"> View PDF</a></u></i></li>
	    		</ul>
            </li>
			</font>
	    	</ul>
			</li>
       </li>
	</ul>
    </li>
	<li><b>SOI</b></li>
	<li><b>FINFET</b></li>
	<li><b>GATE All AROUND</b></li>
	<li><b>CNT</b></li>
</ul>
</li>

<li><b>Technologies</b>
<ul>
	<li><b>BULK</b>
	<ul>
		<li><b>HP</b> - High Performance transistors
			<ul>
			<font color ="red">
	    	<li><b>2005</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2005_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2005_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2005_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2006</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2006_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2006_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2006_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2007</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2007_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2007_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2007_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2008</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2008_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2008_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2008_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2009</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2009_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2009_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2009_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2010</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2010_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2010_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2010_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2011</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2011_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2011_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2011_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2012</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2012_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/HP2012_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/HP2012_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
			</font>
	    	</ul>
		</li>
		<li><b>LOP</b> - Low operating Power transistors
			<ul>
			<font color ="red">
	    	<li><b>2005</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2005_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2005_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2005_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2006</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2006_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2006_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2006_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2007</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2007_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2007_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2007_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2008</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2008_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2008_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2008_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2009</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2009_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2009_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2009_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2010</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2010_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2010_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2010_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2011</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2011_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2011_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2011_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2012</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2012_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LOP2012_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LOP2012_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
			</font>
	    	</ul>
		</li>
		<li><b>LSTP</b> - Low STand-by Power transistors
			<ul>
			<font color ="red">
	    	<li><b>2005</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2005_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2005_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2005_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2006</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2006_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2006_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2006_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2007</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2007_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2007_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2007_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2008</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2008_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2008_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2008_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2009</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2009_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2009_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2009_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2010</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2010_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2010_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2010_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2011</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2011_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2011_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2011_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
	    	<li><b>2012</b>
				<ul>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2012_dev_bul.html" target="_blank"> Device parameters</a></u></i></li>
	    		<li><u><i><a href="Documentation/TechnologyHTML/bulk/LSTP2012_int_bul.html" target="_blank"> Interconnection parameters</a></u></i></li>
				<!--<li><u><i><a href="Documentation/TechnologyPDF/bulk/LSTP2012_bul.pdf" target="_blank"> Download PDF</a></u></i></li>-->
	    		</ul>
			</li>
			</font>
	    	</ul>
		</li>
	</ul>
	</li>
	<li><b>SOI</b></li>
	<li><b>FINFET</b></li>
	<li><b>GATE ALL AROUND</b></li>
	<li><b>CNT</b></li>
</ul>
</li>

<!-- 
<li><b>Variables Index</b>
<ul>
	<li><a href="Documentation/IndexHTMLfiles/A.html" target="_blank"> A</a></li>
	<li><a href="Documentation/IndexHTMLfiles/B.html" target="_blank"> B</a></li>
	<li><a href="Documentation/IndexHTMLfiles/C.html" target="_blank"> C</a></li>
	<li><a href="Documentation/IndexHTMLfiles/D.html" target="_blank"> D</a></li>
	<li><a href="Documentation/IndexHTMLfiles/E.html" target="_blank"> E</a></li>
	<li><a href="Documentation/IndexHTMLfiles/F.html" target="_blank"> F</a></li>
	<li><a href="Documentation/IndexHTMLfiles/G.html" target="_blank"> G</a></li>
	<li><a href="Documentation/IndexHTMLfiles/H.html" target="_blank"> H</a></li>
	<li><a href="Documentation/IndexHTMLfiles/I.html" target="_blank"> I</a></li>
	<li><a href="Documentation/IndexHTMLfiles/J.html" target="_blank"> J</a></li>
	<li><a href="Documentation/IndexHTMLfiles/K.html" target="_blank"> K</a></li>
	<li><a href="Documentation/IndexHTMLfiles/L.html" target="_blank"> L</a></li>
	<li><a href="Documentation/IndexHTMLfiles/M.html" target="_blank"> M</a></li>
	<li><a href="Documentation/IndexHTMLfiles/N.html" target="_blank"> N</a></li>
	<li><a href="Documentation/IndexHTMLfiles/O.html" target="_blank"> O</a></li>
	<li><a href="Documentation/IndexHTMLfiles/P.html" target="_blank"> P</a></li>
	<li><a href="Documentation/IndexHTMLfiles/Q.html" target="_blank"> Q</a></li>
	<li><a href="Documentation/IndexHTMLfiles/R.html" target="_blank"> R</a></li>
	<li><a href="Documentation/IndexHTMLfiles/S.html" target="_blank"> S</a></li>
	<li><a href="Documentation/IndexHTMLfiles/T.html" target="_blank"> T</a></li>
	<li><a href="Documentation/IndexHTMLfiles/U.html" target="_blank"> U</a></li>
	<li><a href="Documentation/IndexHTMLfiles/V.html" target="_blank"> V</a></li>
	<li><a href="Documentation/IndexHTMLfiles/W.html" target="_blank"> W</a></li>
	<li><a href="Documentation/IndexHTMLfiles/X.html" target="_blank"> X</a></li>
	<li><a href="Documentation/IndexHTMLfiles/Y.html" target="_blank"> Y</a></li>
	<li><a href="Documentation/IndexHTMLfiles/Z.html" target="_blank"> Z</a></li>
	<li><a href="Documentation/IndexHTMLfiles/others.html" target="_blank"> -</a></li>
</ul>
</li> -->
</ul>

</br></br>

<b><a href="javascript:ddtreemenu.flatten('treemenu1', 'expand')">Expand All</a> | <a href="javascript:ddtreemenu.flatten('treemenu1', 'contact')">Contract All</a></b>

<script type="text/javascript">
ddtreemenu.createTree("treemenu1", false)
</script>

</td>

<?php include("footer.php"); ?>
