<?php
error_reporting(-1);

$model     =0;         //BULK         Type
$year      =2005;      //             Year
$lgate     =32;        //nm           Physical Gate Length 
$lc		=15.3;		//nm length of nanowire or Length of channel: Practically its vsalue is equal to lgate 
$rc		=8; 		//nm radius of channel or radius of nanowire
$phi_sn     =4.5;  //work function of Si nw , for polisilico its 4.05 as mentioned in MASTAR
$ldraw     =35;        // NON SICURO: lo stesso valore di hp_2007 perché non sono riuscito a trovarlo
$tox       =1.2;       //nm            Physical Gate Oxide Thickness 
$nbulk     =3.25e18;  //cm^-3        Channel Doping (w/o Pockets)             
$nd        =1e20;      // NON SICURO:Ho usato Npoly da GateStack; potrebbe essere quelo di Ngp cm^-3        drogaggio polisilicio n+	
$next	   =7.819e18;// NON SICUR0: valore di HP_2007 cm^-3	  extensions doping  
$nc        =1e20;      // NON SICURO:Ho usato Nsub da Pockets cm^-3        source/drain doping - non sono sicuro che il valore sia corretto altrimenti uguale a Ngp
$xj        =11;        //nm
$vdd       =1.1;       //V            Operation Voltage (Gate and Drain Voltage) 
$darks     =3.3;         //[Å = 0.1nm]  Extension of the Dark Space (in EOT). 
$polyd     =4.0;         //[Å = 0.1nm]  Extension of the poly-depletion (in EOT)
$v_bg      =0;         //[V] Back gate voltage, used in ioff module of SOI
$phi_fg    =0;        //[V] Front gate work function, used in ioff module of SOI
$phi_bg    =0;         //[V] Back gate work function, used in ioff module of SOI
$tbox	   =20; 		//nm Buried Oxide Thickness
$tsi        =7.6;        //nm
$ngp	   =1e20; 		//cm^-3 Ground Plain doping level

$rconst_n  =217.76;    //Ohm        These values are simply the result from a fitting of Mastar's outputs. 
$rconst_p  =217.76;    //Ohm     NON SICURO: Ho usato lo stesso valore di rconst_n   We need to have a more accurate model for resist)ance (Kim's one in Mastar
$x         =0; /// CHE COSA E'?
$cpoches   =5.2e13;    //at/cm²
$angle     =25;        //°            Pocket Implantation Angle 
$rp        =10;        // NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
$delta_rp  =6;         // NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
$delta_rl  =3;         // NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
$activepkt =0; 		   // NON SICURO: lasciato valore di hp_2007 non avendolo trovato. 	nm
$wt        =1000;      //nm           Width       
$phi_m     =4.05;      // NON SICURO: valore di mastar 4.05eV          lavoro estrazione polisilicio little bit higher than 4.05 because polysilicon is highly doped; (NON é lo stesso PER NMOS e PMOS)!!!!	
$nsub      =3.2e18;    //cm^-3        drogaggio Si
$kp        =1;         //  NON SICURO: ho usato kd non avendolo trovato            When > 1 corresponds to strained silicon (1.801)
$kvs       =1;
$kfield    =1;         //             Effective electric field reduction 
$fring_cap =2.4e-16;   //F/um
$gamma     =0.8;       //             Scaling Factor for the Lateral Diffusion: Lelec=Lgate-gamma*Xj   
$phi_s	   =1.864; // ricavato dal file phi_compute.m      
$zeta      =0.8;       //             Scaling Factor for the DIBL (Drain Induced Barrier Lowering) 
$kappa     =79; // NON SICURO: lasciato il valore di hp_2005 non avendolo trovato
$zeta2     =0.64;      //             Scaling Factor for the SCE (Short Channel Effect) 
$ith       =5e-7;    //A            Id at the threshold voltage used to calculate S Ithnew activates the doping dependence of Ith calculation. 
$delta     =0.03;         //             Shift between Vth “on” and Vth ”off” Is replaced by a QM estimation when “Vthon QM confin. hint” is activated 
$sigma     =1; // NON SICURO: lasciato il valore di hp_2007 non avendolo trovato
$ig_improve=1; // NON SICURO: lasciato il valore di hp_2007 non avendolo trovato

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
$ext_length=192; 
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

