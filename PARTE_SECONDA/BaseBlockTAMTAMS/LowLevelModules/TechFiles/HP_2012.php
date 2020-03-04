<?php
error_reporting(-1);

$model      =0;       
$year       =2012;
$lgate      =14;  
$lc		=15.3;		//nm length of nanowire or Length of channel: Practically its vsalue is equal to lgate 
$rc		=8; 		//nm radius of channel or radius of nanowire
$phi_sn     =4.5;  //work function of Si nw , for polisilico its 4.05 as mentioned in MASTAR   
$ldraw      =35; // NON SICUR0: non trovato in MASTAR; valore di HP_2007
$tox        =0.5;    
$nbulk      =9e18;
$nd         =1e20;////////////////////////////////////////////////////////////////////////////////////////////////////

$lgate_graphene = 200e-9;                    // gate length (from 100 nm up to 300 nm) [m]
$lchannel_graphene = 2e-6;                       // channel length (from 0.4 up to 3 um) [m]
$tox_graphene = 30e-9;			  // oxide thickness [m] Wg_graphene
$nlayer_graphene = 2;                     // number of layers


////////////////////////////////////////////////////////////////////////////////////////////////////

$next	    =7.819e18; // NON SICUR0: non trovato in MASTAR. stesso valore di HP_2007 cm^-3	  Extension Doping
$nc         =1e20;        
$xj         =4.5;    
$vdd        =0.9;    
$darks      =2.5;       
$polyd      =0;   
$v_bg      =0;         //[V] Back gate voltage, used in ioff module of SOI
$phi_fg    =0;         //[V] Front gate work function, used in ioff module of SOI
$phi_bg    =0;         //[V] Back gate work function, used in ioff module of SOI
$tbox	   =20; 		//nm Buried Oxide Thickness
$tsi        =7.6;        //nm
$ngp	   =1e20; 		//cm^-3 Ground Plain doping level
    	
$rconst_n   =297.26;
$rconst_p   =297.26;  	// NON SICUR0: non trovato in MASTAR: lasciato valore precedente	
$x          =0;  // NON SICUR0: non trovato in MASTAR	
$cpoches    =5.2e13;  
$angle      =25;     
$rp         =10;      // NON SICUR0: non trovato in MASTAR; valore di HP_2007
$delta_rp   =6;       // NON SICUR0: non trovato in MASTAR; valore di HP_2007
$delta_rl   =3;       // NON SICUR0: non trovato in MASTAR; valore di HP 2007
$activepkt  =0; 		// NON SICUR0: non trovato in MASTAR; valre di HP_2007
$wt         =1000;    
$phi_m      =4.15;    // 4.55 originally, modified in 4.2 has in the previous files  
$nsub       =3.2e18;
$kp         =1;
$kvs        =1.1;
$kfield     =1;
$fring_cap  =1.1e-16;
$gamma      =0.6;
$phi_s      =1.904; // ricavato dal file phi_compute.m
$zeta       =0.8;
$kappa      =79; // NON SICUR0: non trovato in MASTAR: valore precedente
$zeta2      =0.64;
$ith        =5e-7;
$delta      =0; //NON SICUR0: non trovato in MASTAR: lasciato valore precedente
$sigma      =1; // NON SICUR0: non trovato in MASTAR; lasciato valore precedente
 $ig_improve =1; // NON SICUR0: non trovato in MASTAR; laciato valore precedente
 
$esr	    = 11.8;
$esio2r     = 3.9;
$t           =1e3; //Life time, This variable is used in Reliability calculations
////////////////////////////////////////////////////////////////////////////////////////////////////

$lgate_graphene = 200e-9;                    // gate length (from 100 nm up to 300 nm) [m]
$lchannel_graphene = 2e-6;                       // channel length (from 0.4 up to 3 um) [m]
$tox_graphene = 30e-9;			  // oxide thickness [m] Wg_graphene
$nlayer_graphene = 2;                     // number of layers


////////////////////////////////////////////////////////////////////////////////////////////////////

$E0_mol1=0.45;
$E0_mol2=1.4;
$U0_mol=0.95;
$g1_mol1=0.045;
$g1_mol2=0.15;
$g2_mol1=0.045;
$g2_mol2=0.15;
$alphag_mol=0.25;
$vdf_mol=0.5;
$uf_mol=0;
$G0_mol=38.7e-6;
$Vappl_mol=1;
$rho_mol=1.68e-8;
$eps_r_mol=3.7;
$n_mol=1;
$NE_mol=5000;

//CAM_SRAM
$ext_length=84; 
$overlap_cap_perc = 0.2; 

//////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// VALUES FOR IMAGE GENERATION ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$DopH 		= 30; 		// doping depth of source/drain
$DopW		= 100;		// doping width of source/drain
$LDDW		= 50;		// doping width of source/drain extension
$GateH		= 40;		// gate thickness
$ContW		= 30;		// contact width
$Diff		= 5;		// ray of annealing diffusion

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

?>

