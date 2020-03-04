<?php
error_reporting(-1);

$model     =0;         //BULK         Type
$year      =2007;      //             Year
$lgate     =25;        //nm           Physical Gate Length 
$lc		=15.3;		//nm length of nanowire or Length of channel: Practically its vsalue is equal to lgate 
$rc		=8; 		//nm radius of channel or radius of nanowire
$phi_sn     =4.5;  //work function of Si nw , for polisilico its 4.05 as mentioned in MASTAR
$ldraw     =35;        //	NON SICURO: non trovato in MASTAR (lasciato valore precedente) Vale lo stesso per i parametri non sicuri seguenti
$tox       =1.1;       //nm           Physical Gate Oxide Thickness 
$nbulk     =4.19e18;  //cm^-3        Channel Doping (w/o Pockets)             
$nd        =1e20;      //cm^-3        drogaggio polisilicio n+
$next	   =7.819e18;//cm^-3	  drogaggio delle estensioni	% Obtained from Mastar (Originally 2.8656e+16)  
$nc        =1e20;      //cm^-3        source/drain doping - non sono sicuro che il valore sia corretto
$xj        =7.5;        //nm         Estensione giunzioni
$vdd       =1.1;       //V            Operation Voltage (Gate and Drain Voltage) 
$darks     =3.2;         //[Å = 0.1nm]  Extension of the Dark Space (in EOT). 
$polyd     =4.2;         //[Å = 0.1nm]  Extension of the poly-depletion (in EOT)
$v_bg      =0;         //[V] Back gate voltage, used in ioff module of SOI
$phi_fg    =0;         //[V] Front gate work function, used in ioff module of SOI
$phi_bg    =0;         //[V] Back gate work function, used in ioff module of SOI
$tbox	   =20; 		//nm Buried Oxide Thickness
$tsi        =7.6;        //nm
$ngp	   =1e20; 		//cm^-3 Ground Plain doping level

$rconst    =242.23;
$rconst_n    =242.23;    //  These values are simply the result from a fitting of Mastar's outputs. 
$rconst_p    =242.23;    // NON SICURO: stesso valore di rconst_n Ohm        We need to have a more accurate model for resist)ance (Kim's one in Mastar
$x         =0;	// NON SICUR0: non trovato in MASTAR
$cpoches   =5.2e13;    //at/cm²
$angle     =25;        //°            Pocket Implantation Angle 
$rp        =10;        // NON SICUR0: non trovato in MASTAR nm
$delta_rp  =6;         // NON SICUR0: non trovato in MASTAR nm
$delta_rl  =3;         // NON SICUR0: non trovato in MASTAR nm
$activepkt =0;			// NON SICUR0: non trovato in MASTAR
$wt        =1000;      //nm           Width       
$phi_m     =4.05;      //eV          lavoro estrazione polisilicio little bit higher than 4.05 because polysilicon is highly doped; (NON é lo stesso PER NMOS e PMOS)!!!!
$nsub      =3.2e18;    //cm^-3        drogaggio Si
$kp        =1;         //             When > 1 corresponds to strained silicon (1.801)
$kvs       =1;
$kfield    =1;         //             Effective electric field reduction 
$fring_cap =2.3e-16;   //F/um
$gamma     =0.8;       //             Scaling Factor for the Lateral Diffusion: Lelec=Lgate-gamma*Xj  
$phi_s     =1.897; // ricavato dal file phi_compute.m       
$zeta      =0.8;       //             Scaling Factor for the DIBL (Drain Induced Barrier Lowering) 
$kappa     =79;		// NON SICURO: non trovato in MASTAR
$zeta2     =0.64;      //             Scaling Factor for the SCE (Short Channel Effect) 
$ith       =5e-7;    //A            Id at the threshold voltage used to calculate S Ithnew activates the doping dependence of Ith calculation. 
$delta     =0.03;         //             Shift between Vth “on” and Vth ”off” Is replaced by a QM estimation when “Vthon QM confin. hint” is activated 
$sigma     =1;  // NON SICUR0: non trovato in MASTAR
$ig_improve=1;  // NON SICUR0: non trovato in MASTAR

$esr	    = 11.8;                 // Obtained from Mastar
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
$NE_mol=5000;				// Obtained from Mastar


//CAM_SRAM
$ext_length=150; 
$overlap_cap_perc = 0.2; 

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

