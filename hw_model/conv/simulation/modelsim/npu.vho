-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"

-- DATE "09/19/2019 18:14:37"

-- 
-- Device: Altera EP2C15AF484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE top_conv_data_type IS

TYPE o_data_43_0_type IS ARRAY (43 DOWNTO 0) OF std_logic;
TYPE o_data_43_0_0_3_type IS ARRAY (0 TO 3) OF o_data_43_0_type;
SUBTYPE o_data_type IS o_data_43_0_0_3_type;

END top_conv_data_type;

LIBRARY CYCLONEII;
LIBRARY IEEE;
LIBRARY WORK;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.TOP_CONV_DATA_TYPE.ALL;

ENTITY 	top_conv IS
    PORT (
	o_data : OUT o_data_type;
	ck : IN std_logic;
	rst : IN std_logic;
	start : IN std_logic;
	i_k : IN std_logic;
	i_data : IN std_logic_vector(31 DOWNTO 0)
	);
END top_conv;

-- Design Ports Information
-- o_data[3][0]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][1]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][2]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][3]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][4]	=>  Location: PIN_J20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][5]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][6]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][7]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][8]	=>  Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][9]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][10]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][11]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][12]	=>  Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][13]	=>  Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][14]	=>  Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][15]	=>  Location: PIN_L19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][16]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][17]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][18]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][19]	=>  Location: PIN_AB15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][20]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][21]	=>  Location: PIN_AA17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][22]	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][23]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][24]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][25]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][26]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][27]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][28]	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][29]	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][30]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][31]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][32]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][33]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][34]	=>  Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][35]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][36]	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][37]	=>  Location: PIN_K22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][38]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][39]	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][40]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][41]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][42]	=>  Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[3][43]	=>  Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][0]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][1]	=>  Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][2]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][3]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][4]	=>  Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][5]	=>  Location: PIN_N21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][6]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][7]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][8]	=>  Location: PIN_AA12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][9]	=>  Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][10]	=>  Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][11]	=>  Location: PIN_G20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][12]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][13]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][14]	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][15]	=>  Location: PIN_J21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][16]	=>  Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][17]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][18]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][19]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][20]	=>  Location: PIN_W14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][21]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][22]	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][23]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][24]	=>  Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][25]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][26]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][27]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][28]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][29]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][30]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][31]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][32]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][33]	=>  Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][34]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][35]	=>  Location: PIN_N22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][36]	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][37]	=>  Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][38]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][39]	=>  Location: PIN_L18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][40]	=>  Location: PIN_K20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][41]	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][42]	=>  Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[2][43]	=>  Location: PIN_P18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][0]	=>  Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][1]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][2]	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][3]	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][4]	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][5]	=>  Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][6]	=>  Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][7]	=>  Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][8]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][9]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][10]	=>  Location: PIN_M19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][11]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][12]	=>  Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][13]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][14]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][15]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][16]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][17]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][18]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][19]	=>  Location: PIN_P17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][20]	=>  Location: PIN_R18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][21]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][22]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][23]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][24]	=>  Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][25]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][26]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][27]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][28]	=>  Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][29]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][30]	=>  Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][31]	=>  Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][32]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][33]	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][34]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][35]	=>  Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][36]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][37]	=>  Location: PIN_T21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][38]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][39]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][40]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][41]	=>  Location: PIN_H18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][42]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[1][43]	=>  Location: PIN_R13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][0]	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][1]	=>  Location: PIN_U13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][2]	=>  Location: PIN_AB16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][3]	=>  Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][4]	=>  Location: PIN_F22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][5]	=>  Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][6]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][7]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][8]	=>  Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][9]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][10]	=>  Location: PIN_K21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][11]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][12]	=>  Location: PIN_AB14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][13]	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][14]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][15]	=>  Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][16]	=>  Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][17]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][18]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][19]	=>  Location: PIN_AB17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][20]	=>  Location: PIN_AA16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][21]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][22]	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][23]	=>  Location: PIN_Y10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][24]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][25]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][26]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][27]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][28]	=>  Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][29]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][30]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][31]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][32]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][33]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][34]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][35]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][36]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][37]	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][38]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][39]	=>  Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][40]	=>  Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][41]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][42]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- o_data[0][43]	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ck	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_k	=>  Location: PIN_Y14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[12]	=>  Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[0]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[8]	=>  Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[16]	=>  Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[4]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[13]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[1]	=>  Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[9]	=>  Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[17]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[5]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[14]	=>  Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[2]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[10]	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[18]	=>  Location: PIN_C20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[6]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[15]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[3]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[11]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[19]	=>  Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[7]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[20]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[21]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[22]	=>  Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[23]	=>  Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[24]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[25]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[26]	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[27]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[28]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[29]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[30]	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_data[31]	=>  Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- start	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF top_conv IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_o_data : o_data_type;
SIGNAL ww_ck : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_i_k : std_logic;
SIGNAL ww_i_data : std_logic_vector(31 DOWNTO 0);
SIGNAL \ck~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|res_cnt|terminal_cnt~regout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux13~0_combout\ : std_logic;
SIGNAL \dp|r|Mux61~2_combout\ : std_logic;
SIGNAL \dp|r|Mux60~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux12~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux14~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux14~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|r|Mux60~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|r|Mux60~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_im~1_combout\ : std_logic;
SIGNAL \ctrl|ps.IDLE~regout\ : std_logic;
SIGNAL \ctrl|ps.IDLE~0_combout\ : std_logic;
SIGNAL \dp|res_cnt|terminal_cnt~0_combout\ : std_logic;
SIGNAL \dp|vmode_cnt|Add1~0_combout\ : std_logic;
SIGNAL \dp|vmode_cnt|cnt_out~0_combout\ : std_logic;
SIGNAL \dp|res_cnt|cnt_out~0_combout\ : std_logic;
SIGNAL \dp|res_cnt|cnt_out~1_combout\ : std_logic;
SIGNAL \ck~combout\ : std_logic;
SIGNAL \ck~clkctrl_outclk\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \dp|wr_cnt|cnt_out~0_combout\ : std_logic;
SIGNAL \start~combout\ : std_logic;
SIGNAL \ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \rst~clkctrl_outclk\ : std_logic;
SIGNAL \ctrl|ps.INIT~regout\ : std_logic;
SIGNAL \dp|vmode_cnt|cnt_out~1_combout\ : std_logic;
SIGNAL \dp|vmode_cnt|cnt_out~2_combout\ : std_logic;
SIGNAL \dp|vmode_cnt|terminal_cnt~0_combout\ : std_logic;
SIGNAL \dp|vmode_cnt|terminal_cnt~regout\ : std_logic;
SIGNAL \dp|rem_cnt|cnt_out~1_combout\ : std_logic;
SIGNAL \ctrl|Selector4~0_combout\ : std_logic;
SIGNAL \ctrl|ps.DONE~regout\ : std_logic;
SIGNAL \ctrl|Selector3~0_combout\ : std_logic;
SIGNAL \ctrl|ps.FILL~regout\ : std_logic;
SIGNAL \dp|rem_cnt|cnt_out~2_combout\ : std_logic;
SIGNAL \dp|rem_cnt|Add1~0_combout\ : std_logic;
SIGNAL \dp|rem_cnt|cnt_out~0_combout\ : std_logic;
SIGNAL \dp|rem_cnt|terminal_cnt~0_combout\ : std_logic;
SIGNAL \dp|rem_cnt|terminal_cnt~regout\ : std_logic;
SIGNAL \dp|hmode_cnt|cnt_out~0_combout\ : std_logic;
SIGNAL \dp|hmode_cnt|cnt_out~2_combout\ : std_logic;
SIGNAL \dp|hmode_cnt|Add1~0_combout\ : std_logic;
SIGNAL \dp|hmode_cnt|cnt_out~1_combout\ : std_logic;
SIGNAL \dp|hmode_cnt|terminal_cnt~0_combout\ : std_logic;
SIGNAL \dp|hmode_cnt|terminal_cnt~regout\ : std_logic;
SIGNAL \ctrl|Selector1~0_combout\ : std_logic;
SIGNAL \ctrl|Selector1~1_combout\ : std_logic;
SIGNAL \ctrl|ps.HMODE~regout\ : std_logic;
SIGNAL \ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \ctrl|ps.VMODE~regout\ : std_logic;
SIGNAL \ctrl|en_wr_ptr~combout\ : std_logic;
SIGNAL \dp|wr_cnt|terminal_cnt~0_combout\ : std_logic;
SIGNAL \dp|wr_cnt|terminal_cnt~regout\ : std_logic;
SIGNAL \dp|wr_cnt|cnt_out~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~0_combout\ : std_logic;
SIGNAL \dp|r|Mux66~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux15~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux15~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux15~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ : std_logic;
SIGNAL \dp|r|Mux64~0_combout\ : std_logic;
SIGNAL \dp|r|Mux63~0_combout\ : std_logic;
SIGNAL \dp|r|Mux63~1_combout\ : std_logic;
SIGNAL \dp|r|Mux66~1_combout\ : std_logic;
SIGNAL \dp|r|Mux66~2_combout\ : std_logic;
SIGNAL \dp|r|Mux63~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux15~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux15~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux15~2_combout\ : std_logic;
SIGNAL \dp|r|Mux63~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~8_combout\ : std_logic;
SIGNAL \dp|r|Mux62~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~9_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~5_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~6_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux14~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux14~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~7_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux14~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux14~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux14~2_combout\ : std_logic;
SIGNAL \dp|r|Mux62~1_combout\ : std_logic;
SIGNAL \dp|r|Mux62~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux14~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux14~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux14~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux14~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux14~2_combout\ : std_logic;
SIGNAL \dp|r|Mux62~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_im~1_combout\ : std_logic;
SIGNAL \i_k~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_k~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~13_combout\ : std_logic;
SIGNAL \dp|r|Mux61~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~11_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~10_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux13~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux13~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux13~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux13~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux13~2_combout\ : std_logic;
SIGNAL \dp|r|Mux61~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~14_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux13~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux13~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux13~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux13~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux13~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux13~2_combout\ : std_logic;
SIGNAL \dp|r|Mux61~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~18_combout\ : std_logic;
SIGNAL \dp|r|Mux60~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~16_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~15_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux12~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux12~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~19_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~17_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux12~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux12~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux12~2_combout\ : std_logic;
SIGNAL \dp|r|Mux60~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux12~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux12~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux12~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux12~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux12~2_combout\ : std_logic;
SIGNAL \dp|r|Mux60~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux15~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux11~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux15~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux11~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~20_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux15~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux11~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux11~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~6_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux11~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux11~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux15~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux11~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux11~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~21_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux14~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux10~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux10~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux10~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux10~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~22_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux13~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux9~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux9~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux13~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux9~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux9~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux9~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux9~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux13~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux9~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux9~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~23_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux12~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux8~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux8~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux12~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux8~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux8~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~24_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux15~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux7~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux7~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux15~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux7~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux7~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~25_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux14~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux6~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux6~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux14~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux6~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux6~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux14~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux6~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux6~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux14~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux6~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux6~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~26_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux13~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~12_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux5~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux5~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux13~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux5~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux5~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux13~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux5~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux5~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux13~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux5~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux5~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux12~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux4~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux4~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~27_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux12~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux4~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux4~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~28_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux3~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux3~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux3~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux3~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux15~7_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux3~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux3~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux3~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux3~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux2~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux2~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~29_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux2~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux2~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux2~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux2~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux2~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux2~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux1~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~30_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux1~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux1~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux1~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux1~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux1~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux1~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux1~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|r|rGen:0:regi|q~31_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux0~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux0~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux0~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:1:hsi|Mux0~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux0~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux0~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux12~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux0~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux0~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|Mux61~4_combout\ : std_logic;
SIGNAL \dp|r|Mux61~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|r|Mux62~4_combout\ : std_logic;
SIGNAL \dp|r|Mux62~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|Mux60~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~9_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux12~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux8~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux8~2_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux12~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux8~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux12~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux8~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im~11_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux7~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux7~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux7~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux7~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~9_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux4~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux4~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux12~4_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux4~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux4~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~11_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~9_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im~11_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|Mux63~4_combout\ : std_logic;
SIGNAL \dp|r|Mux63~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|Mux62~6_combout\ : std_logic;
SIGNAL \dp|r|Mux62~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|Mux61~6_combout\ : std_logic;
SIGNAL \dp|r|Mux61~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|r|Mux60~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|r|Mux63~6_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux15~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:3:hsi|Mux15~2_combout\ : std_logic;
SIGNAL \dp|r|Mux63~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_im~3_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux10~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux14~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:2:hsi|Mux10~1_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux14~3_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux10~0_combout\ : std_logic;
SIGNAL \dp|r|SRF|sGen:0:hsi|Mux10~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~4_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~5_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~6_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im~7_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ : std_logic;
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ : std_logic;
SIGNAL \i_data~combout\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dp|wr_cnt|cnt_out\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \dp|hmode_cnt|cnt_out\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|res_cnt|cnt_out\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|r|SRF|r|rGen:2:regi|q\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:0:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|r|SRF|r|rGen:0:regi|q\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dp|rem_cnt|cnt_out\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \dp|vmode_cnt|cnt_out\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:3:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:2:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:1:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:3:peColGen:0:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:3:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:2:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:1:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:2:peColGen:0:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:3:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:2:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:1:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:1:peColGen:0:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:3:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:2:peij|q_acc\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \dp|p|peRowGen:0:peColGen:1:peij|q_im\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dp|r|SRF|r|rGen:3:regi|q\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dp|r|SRF|r|rGen:1:regi|q\ : std_logic_vector(31 DOWNTO 0);

BEGIN

o_data <= ww_o_data;
ww_ck <= ck;
ww_rst <= rst;
ww_start <= start;
ww_i_k <= i_k;
ww_i_data <= i_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ck~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \ck~combout\);

\rst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst~combout\);

-- Location: LCFF_X32_Y23_N21
\dp|p|peRowGen:2:peColGen:1:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(1));

-- Location: LCFF_X20_Y25_N21
\dp|p|peRowGen:2:peColGen:2:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(1));

-- Location: LCFF_X33_Y24_N5
\dp|p|peRowGen:1:peColGen:1:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(1));

-- Location: LCFF_X21_Y21_N27
\dp|res_cnt|terminal_cnt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|res_cnt|terminal_cnt~0_combout\,
	sclr => \rst~combout\,
	ena => \ctrl|ps.DONE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|res_cnt|terminal_cnt~regout\);

-- Location: LCCOMB_X19_Y26_N12
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y22_N20
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:0:peij|q_im\(1) $ (((\dp|p|peRowGen:2:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(0),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0),
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X33_Y23_N26
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(1) $ (((\dp|p|peRowGen:2:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(1),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X32_Y24_N14
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y25_N12
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3)) # (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X34_Y22_N24
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:1:peij|q_im\(1) $ (((\dp|p|peRowGen:0:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(0),
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(1),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X26_Y24_N20
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N14
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCFF_X23_Y22_N3
\dp|r|SRF|r|rGen:0:regi|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~1_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(0));

-- Location: LCCOMB_X23_Y22_N20
\dp|r|SRF|sGen:0:hsi|Mux15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~3_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(12)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~2_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(12),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~3_combout\);

-- Location: LCCOMB_X23_Y22_N2
\dp|r|SRF|sGen:0:hsi|Mux15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~4_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~3_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(4)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~3_combout\ & (((\dp|r|SRF|r|rGen:0:regi|q\(0) & 
-- \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~3_combout\,
	datab => \dp|r|SRF|r|rGen:0:regi|q\(4),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(0),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~4_combout\);

-- Location: LCFF_X24_Y23_N5
\dp|r|SRF|r|rGen:3:regi|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~2_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(8));

-- Location: LCFF_X25_Y23_N27
\dp|r|SRF|r|rGen:0:regi|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~5_combout\,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(13));

-- Location: LCCOMB_X24_Y25_N6
\dp|r|SRF|sGen:2:hsi|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux13~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(10))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(10),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(18),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux13~0_combout\);

-- Location: LCFF_X22_Y25_N13
\dp|r|SRF|r|rGen:3:regi|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~12_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(10));

-- Location: LCCOMB_X25_Y22_N16
\dp|r|Mux61~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:1:regi|q\(18)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(18) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(18),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:1:regi|q\(18),
	combout => \dp|r|Mux61~2_combout\);

-- Location: LCFF_X21_Y23_N7
\dp|r|SRF|r|rGen:0:regi|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~16_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(3));

-- Location: LCCOMB_X21_Y23_N2
\dp|r|Mux60~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(19))) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(19)))))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & 
-- (\dp|wr_cnt|cnt_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(19),
	datad => \dp|r|SRF|r|rGen:0:regi|q\(19),
	combout => \dp|r|Mux60~0_combout\);

-- Location: LCCOMB_X22_Y24_N24
\dp|r|SRF|sGen:3:hsi|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux12~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(11))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(11),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:3:regi|q\(19),
	combout => \dp|r|SRF|sGen:3:hsi|Mux12~0_combout\);

-- Location: LCFF_X23_Y23_N21
\dp|r|SRF|r|rGen:3:regi|q[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~20_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(20));

-- Location: LCFF_X23_Y24_N17
\dp|r|SRF|r|rGen:2:regi|q[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~21_combout\,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(21));

-- Location: LCCOMB_X23_Y24_N10
\dp|r|SRF|sGen:2:hsi|Mux14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux14~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(13)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(21),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(13),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux14~3_combout\);

-- Location: LCCOMB_X24_Y24_N10
\dp|r|SRF|sGen:1:hsi|Mux14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux14~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(13))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(13),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:1:regi|q\(21),
	combout => \dp|r|SRF|sGen:1:hsi|Mux14~3_combout\);

-- Location: LCCOMB_X32_Y24_N12
\dp|p|peRowGen:3:peColGen:1:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux8~2_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux8~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\);

-- Location: LCCOMB_X19_Y25_N20
\dp|p|peRowGen:3:peColGen:2:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux4~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux4~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux4~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\);

-- Location: LCFF_X22_Y24_N13
\dp|r|SRF|r|rGen:3:regi|q[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~27_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(27));

-- Location: LCFF_X23_Y23_N11
\dp|r|SRF|r|rGen:3:regi|q[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~28_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(28));

-- Location: LCFF_X24_Y24_N11
\dp|r|SRF|r|rGen:1:regi|q[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~29_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(29));

-- Location: LCFF_X25_Y23_N25
\dp|r|SRF|r|rGen:3:regi|q[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~30_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(30));

-- Location: LCCOMB_X21_Y23_N14
\dp|r|Mux60~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~4_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(19)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(19))))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & 
-- (((\dp|wr_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|SRF|r|rGen:2:regi|q\(19),
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:0:regi|q\(19),
	combout => \dp|r|Mux60~4_combout\);

-- Location: LCCOMB_X31_Y24_N4
\dp|p|peRowGen:2:peColGen:1:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux10~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux10~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux10~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux10~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\);

-- Location: LCCOMB_X32_Y23_N20
\dp|p|peRowGen:2:peColGen:1:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~7_combout\);

-- Location: LCCOMB_X20_Y25_N20
\dp|p|peRowGen:2:peColGen:2:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~7_combout\);

-- Location: LCCOMB_X21_Y24_N18
\dp|r|Mux60~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:3:regi|q\(19)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(19) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(19),
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:3:regi|q\(19),
	combout => \dp|r|Mux60~6_combout\);

-- Location: LCCOMB_X33_Y24_N4
\dp|p|peRowGen:1:peColGen:1:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|q_im~1_combout\);

-- Location: LCFF_X21_Y22_N15
\ctrl|ps.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|ps.IDLE~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.IDLE~regout\);

-- Location: LCCOMB_X21_Y22_N14
\ctrl|ps.IDLE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|ps.IDLE~0_combout\ = (\ctrl|ps.IDLE~regout\) # (\start~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|ps.IDLE~regout\,
	datad => \start~combout\,
	combout => \ctrl|ps.IDLE~0_combout\);

-- Location: LCFF_X20_Y23_N25
\dp|vmode_cnt|cnt_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|vmode_cnt|cnt_out~0_combout\,
	ena => \ctrl|ps.VMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|vmode_cnt|cnt_out\(2));

-- Location: LCFF_X21_Y21_N13
\dp|res_cnt|cnt_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|res_cnt|cnt_out~0_combout\,
	ena => \ctrl|ps.DONE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|res_cnt|cnt_out\(0));

-- Location: LCFF_X21_Y21_N31
\dp|res_cnt|cnt_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|res_cnt|cnt_out~1_combout\,
	ena => \ctrl|ps.DONE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|res_cnt|cnt_out\(1));

-- Location: LCCOMB_X21_Y21_N26
\dp|res_cnt|terminal_cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|res_cnt|terminal_cnt~0_combout\ = (\dp|res_cnt|cnt_out\(1) & (!\dp|res_cnt|terminal_cnt~regout\ & \dp|res_cnt|cnt_out\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|res_cnt|cnt_out\(1),
	datac => \dp|res_cnt|terminal_cnt~regout\,
	datad => \dp|res_cnt|cnt_out\(0),
	combout => \dp|res_cnt|terminal_cnt~0_combout\);

-- Location: LCCOMB_X20_Y23_N22
\dp|vmode_cnt|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|vmode_cnt|Add1~0_combout\ = \dp|vmode_cnt|cnt_out\(2) $ (((\dp|vmode_cnt|cnt_out\(0) & \dp|vmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|vmode_cnt|cnt_out\(2),
	datab => \dp|vmode_cnt|cnt_out\(0),
	datac => \dp|vmode_cnt|cnt_out\(1),
	combout => \dp|vmode_cnt|Add1~0_combout\);

-- Location: LCCOMB_X20_Y23_N24
\dp|vmode_cnt|cnt_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|vmode_cnt|cnt_out~0_combout\ = (\dp|vmode_cnt|Add1~0_combout\ & (!\rst~combout\ & !\dp|vmode_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|vmode_cnt|Add1~0_combout\,
	datac => \rst~combout\,
	datad => \dp|vmode_cnt|terminal_cnt~regout\,
	combout => \dp|vmode_cnt|cnt_out~0_combout\);

-- Location: LCCOMB_X21_Y21_N12
\dp|res_cnt|cnt_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|res_cnt|cnt_out~0_combout\ = (!\rst~combout\ & (!\dp|res_cnt|cnt_out\(0) & !\dp|res_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \dp|res_cnt|cnt_out\(0),
	datad => \dp|res_cnt|terminal_cnt~regout\,
	combout => \dp|res_cnt|cnt_out~0_combout\);

-- Location: LCCOMB_X21_Y21_N30
\dp|res_cnt|cnt_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|res_cnt|cnt_out~1_combout\ = (!\rst~combout\ & (!\dp|res_cnt|terminal_cnt~regout\ & (\dp|res_cnt|cnt_out\(1) $ (\dp|res_cnt|cnt_out\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \dp|res_cnt|terminal_cnt~regout\,
	datac => \dp|res_cnt|cnt_out\(1),
	datad => \dp|res_cnt|cnt_out\(0),
	combout => \dp|res_cnt|cnt_out~1_combout\);

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(10),
	combout => \i_data~combout\(10));

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ck~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ck,
	combout => \ck~combout\);

-- Location: CLKCTRL_G3
\ck~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ck~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ck~clkctrl_outclk\);

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: LCCOMB_X20_Y23_N28
\dp|wr_cnt|cnt_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|wr_cnt|cnt_out~0_combout\ = (!\rst~combout\ & (!\dp|wr_cnt|terminal_cnt~regout\ & (\dp|wr_cnt|cnt_out\(0) $ (\dp|wr_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datab => \rst~combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|wr_cnt|terminal_cnt~regout\,
	combout => \dp|wr_cnt|cnt_out~0_combout\);

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\start~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_start,
	combout => \start~combout\);

-- Location: LCCOMB_X21_Y22_N4
\ctrl|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector0~0_combout\ = (\ctrl|ps.IDLE~regout\ & (((\ctrl|ps.INIT~regout\ & !\dp|wr_cnt|terminal_cnt~regout\)))) # (!\ctrl|ps.IDLE~regout\ & ((\start~combout\) # ((\ctrl|ps.INIT~regout\ & !\dp|wr_cnt|terminal_cnt~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|ps.IDLE~regout\,
	datab => \start~combout\,
	datac => \ctrl|ps.INIT~regout\,
	datad => \dp|wr_cnt|terminal_cnt~regout\,
	combout => \ctrl|Selector0~0_combout\);

-- Location: CLKCTRL_G1
\rst~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~clkctrl_outclk\);

-- Location: LCFF_X21_Y22_N5
\ctrl|ps.INIT\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|Selector0~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.INIT~regout\);

-- Location: LCCOMB_X20_Y23_N2
\dp|vmode_cnt|cnt_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|vmode_cnt|cnt_out~1_combout\ = (!\rst~combout\ & (!\dp|vmode_cnt|cnt_out\(0) & !\dp|vmode_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datac => \dp|vmode_cnt|cnt_out\(0),
	datad => \dp|vmode_cnt|terminal_cnt~regout\,
	combout => \dp|vmode_cnt|cnt_out~1_combout\);

-- Location: LCFF_X20_Y23_N3
\dp|vmode_cnt|cnt_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|vmode_cnt|cnt_out~1_combout\,
	ena => \ctrl|ps.VMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|vmode_cnt|cnt_out\(0));

-- Location: LCCOMB_X20_Y23_N20
\dp|vmode_cnt|cnt_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|vmode_cnt|cnt_out~2_combout\ = (!\rst~combout\ & (!\dp|vmode_cnt|terminal_cnt~regout\ & (\dp|vmode_cnt|cnt_out\(0) $ (\dp|vmode_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \dp|vmode_cnt|cnt_out\(0),
	datac => \dp|vmode_cnt|cnt_out\(1),
	datad => \dp|vmode_cnt|terminal_cnt~regout\,
	combout => \dp|vmode_cnt|cnt_out~2_combout\);

-- Location: LCFF_X20_Y23_N21
\dp|vmode_cnt|cnt_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|vmode_cnt|cnt_out~2_combout\,
	ena => \ctrl|ps.VMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|vmode_cnt|cnt_out\(1));

-- Location: LCCOMB_X20_Y23_N26
\dp|vmode_cnt|terminal_cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|vmode_cnt|terminal_cnt~0_combout\ = (\dp|vmode_cnt|cnt_out\(2) & (!\dp|vmode_cnt|cnt_out\(0) & (!\dp|vmode_cnt|terminal_cnt~regout\ & !\dp|vmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|vmode_cnt|cnt_out\(2),
	datab => \dp|vmode_cnt|cnt_out\(0),
	datac => \dp|vmode_cnt|terminal_cnt~regout\,
	datad => \dp|vmode_cnt|cnt_out\(1),
	combout => \dp|vmode_cnt|terminal_cnt~0_combout\);

-- Location: LCFF_X20_Y23_N27
\dp|vmode_cnt|terminal_cnt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|vmode_cnt|terminal_cnt~0_combout\,
	sclr => \rst~combout\,
	ena => \ctrl|ps.VMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|vmode_cnt|terminal_cnt~regout\);

-- Location: LCCOMB_X21_Y21_N22
\dp|rem_cnt|cnt_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|rem_cnt|cnt_out~1_combout\ = (!\rst~combout\ & (!\dp|rem_cnt|cnt_out\(0) & !\dp|rem_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \dp|rem_cnt|cnt_out\(0),
	datad => \dp|rem_cnt|terminal_cnt~regout\,
	combout => \dp|rem_cnt|cnt_out~1_combout\);

-- Location: LCCOMB_X21_Y22_N8
\ctrl|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector4~0_combout\ = (\dp|res_cnt|terminal_cnt~regout\ & (\dp|vmode_cnt|terminal_cnt~regout\ & ((\ctrl|ps.VMODE~regout\)))) # (!\dp|res_cnt|terminal_cnt~regout\ & ((\ctrl|ps.DONE~regout\) # ((\dp|vmode_cnt|terminal_cnt~regout\ & 
-- \ctrl|ps.VMODE~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|res_cnt|terminal_cnt~regout\,
	datab => \dp|vmode_cnt|terminal_cnt~regout\,
	datac => \ctrl|ps.DONE~regout\,
	datad => \ctrl|ps.VMODE~regout\,
	combout => \ctrl|Selector4~0_combout\);

-- Location: LCFF_X21_Y22_N9
\ctrl|ps.DONE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|Selector4~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.DONE~regout\);

-- Location: LCCOMB_X21_Y22_N26
\ctrl|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector3~0_combout\ = (\dp|res_cnt|terminal_cnt~regout\ & ((\ctrl|ps.DONE~regout\) # ((!\dp|rem_cnt|terminal_cnt~regout\ & \ctrl|ps.FILL~regout\)))) # (!\dp|res_cnt|terminal_cnt~regout\ & (!\dp|rem_cnt|terminal_cnt~regout\ & 
-- (\ctrl|ps.FILL~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|res_cnt|terminal_cnt~regout\,
	datab => \dp|rem_cnt|terminal_cnt~regout\,
	datac => \ctrl|ps.FILL~regout\,
	datad => \ctrl|ps.DONE~regout\,
	combout => \ctrl|Selector3~0_combout\);

-- Location: LCFF_X21_Y22_N27
\ctrl|ps.FILL\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|Selector3~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.FILL~regout\);

-- Location: LCFF_X21_Y21_N23
\dp|rem_cnt|cnt_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|rem_cnt|cnt_out~1_combout\,
	ena => \ctrl|ps.FILL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|rem_cnt|cnt_out\(0));

-- Location: LCCOMB_X21_Y21_N8
\dp|rem_cnt|cnt_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|rem_cnt|cnt_out~2_combout\ = (!\rst~combout\ & (!\dp|rem_cnt|terminal_cnt~regout\ & (\dp|rem_cnt|cnt_out\(0) $ (\dp|rem_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \dp|rem_cnt|cnt_out\(0),
	datac => \dp|rem_cnt|cnt_out\(1),
	datad => \dp|rem_cnt|terminal_cnt~regout\,
	combout => \dp|rem_cnt|cnt_out~2_combout\);

-- Location: LCFF_X21_Y21_N9
\dp|rem_cnt|cnt_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|rem_cnt|cnt_out~2_combout\,
	ena => \ctrl|ps.FILL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|rem_cnt|cnt_out\(1));

-- Location: LCCOMB_X21_Y21_N2
\dp|rem_cnt|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|rem_cnt|Add1~0_combout\ = \dp|rem_cnt|cnt_out\(2) $ (((\dp|rem_cnt|cnt_out\(0) & \dp|rem_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|rem_cnt|cnt_out\(0),
	datac => \dp|rem_cnt|cnt_out\(1),
	datad => \dp|rem_cnt|cnt_out\(2),
	combout => \dp|rem_cnt|Add1~0_combout\);

-- Location: LCCOMB_X21_Y21_N28
\dp|rem_cnt|cnt_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|rem_cnt|cnt_out~0_combout\ = (!\rst~combout\ & (\dp|rem_cnt|Add1~0_combout\ & !\dp|rem_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \dp|rem_cnt|Add1~0_combout\,
	datad => \dp|rem_cnt|terminal_cnt~regout\,
	combout => \dp|rem_cnt|cnt_out~0_combout\);

-- Location: LCFF_X21_Y21_N29
\dp|rem_cnt|cnt_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|rem_cnt|cnt_out~0_combout\,
	ena => \ctrl|ps.FILL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|rem_cnt|cnt_out\(2));

-- Location: LCCOMB_X21_Y21_N0
\dp|rem_cnt|terminal_cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|rem_cnt|terminal_cnt~0_combout\ = (!\dp|rem_cnt|cnt_out\(0) & (!\dp|rem_cnt|cnt_out\(1) & (!\dp|rem_cnt|terminal_cnt~regout\ & \dp|rem_cnt|cnt_out\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|rem_cnt|cnt_out\(0),
	datab => \dp|rem_cnt|cnt_out\(1),
	datac => \dp|rem_cnt|terminal_cnt~regout\,
	datad => \dp|rem_cnt|cnt_out\(2),
	combout => \dp|rem_cnt|terminal_cnt~0_combout\);

-- Location: LCFF_X21_Y21_N1
\dp|rem_cnt|terminal_cnt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|rem_cnt|terminal_cnt~0_combout\,
	sclr => \rst~combout\,
	ena => \ctrl|ps.FILL~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|rem_cnt|terminal_cnt~regout\);

-- Location: LCCOMB_X21_Y22_N2
\dp|hmode_cnt|cnt_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|hmode_cnt|cnt_out~0_combout\ = (!\dp|hmode_cnt|terminal_cnt~regout\ & (!\dp|hmode_cnt|cnt_out\(0) & !\rst~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|terminal_cnt~regout\,
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \rst~combout\,
	combout => \dp|hmode_cnt|cnt_out~0_combout\);

-- Location: LCFF_X21_Y22_N3
\dp|hmode_cnt|cnt_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|hmode_cnt|cnt_out~0_combout\,
	ena => \ctrl|ps.HMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|hmode_cnt|cnt_out\(0));

-- Location: LCCOMB_X21_Y22_N6
\dp|hmode_cnt|cnt_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|hmode_cnt|cnt_out~2_combout\ = (!\dp|hmode_cnt|terminal_cnt~regout\ & (!\rst~combout\ & (\dp|hmode_cnt|cnt_out\(0) $ (\dp|hmode_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|terminal_cnt~regout\,
	datab => \dp|hmode_cnt|cnt_out\(0),
	datac => \dp|hmode_cnt|cnt_out\(1),
	datad => \rst~combout\,
	combout => \dp|hmode_cnt|cnt_out~2_combout\);

-- Location: LCFF_X21_Y22_N7
\dp|hmode_cnt|cnt_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|hmode_cnt|cnt_out~2_combout\,
	ena => \ctrl|ps.HMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|hmode_cnt|cnt_out\(1));

-- Location: LCCOMB_X21_Y22_N10
\dp|hmode_cnt|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|hmode_cnt|Add1~0_combout\ = \dp|hmode_cnt|cnt_out\(2) $ (((\dp|hmode_cnt|cnt_out\(0) & \dp|hmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|hmode_cnt|Add1~0_combout\);

-- Location: LCCOMB_X21_Y22_N28
\dp|hmode_cnt|cnt_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|hmode_cnt|cnt_out~1_combout\ = (!\rst~combout\ & (\dp|hmode_cnt|Add1~0_combout\ & !\dp|hmode_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \dp|hmode_cnt|Add1~0_combout\,
	datac => \dp|hmode_cnt|terminal_cnt~regout\,
	combout => \dp|hmode_cnt|cnt_out~1_combout\);

-- Location: LCFF_X21_Y22_N29
\dp|hmode_cnt|cnt_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|hmode_cnt|cnt_out~1_combout\,
	ena => \ctrl|ps.HMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|hmode_cnt|cnt_out\(2));

-- Location: LCCOMB_X21_Y22_N24
\dp|hmode_cnt|terminal_cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|hmode_cnt|terminal_cnt~0_combout\ = (!\dp|hmode_cnt|cnt_out\(0) & (\dp|hmode_cnt|cnt_out\(2) & (!\dp|hmode_cnt|terminal_cnt~regout\ & !\dp|hmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(0),
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|hmode_cnt|terminal_cnt~regout\,
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|hmode_cnt|terminal_cnt~0_combout\);

-- Location: LCFF_X21_Y22_N25
\dp|hmode_cnt|terminal_cnt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|hmode_cnt|terminal_cnt~0_combout\,
	sclr => \rst~combout\,
	ena => \ctrl|ps.HMODE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|hmode_cnt|terminal_cnt~regout\);

-- Location: LCCOMB_X21_Y22_N12
\ctrl|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector1~0_combout\ = (\ctrl|ps.HMODE~regout\ & (((\dp|rem_cnt|terminal_cnt~regout\ & \ctrl|ps.FILL~regout\)) # (!\dp|hmode_cnt|terminal_cnt~regout\))) # (!\ctrl|ps.HMODE~regout\ & (\dp|rem_cnt|terminal_cnt~regout\ & ((\ctrl|ps.FILL~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|ps.HMODE~regout\,
	datab => \dp|rem_cnt|terminal_cnt~regout\,
	datac => \dp|hmode_cnt|terminal_cnt~regout\,
	datad => \ctrl|ps.FILL~regout\,
	combout => \ctrl|Selector1~0_combout\);

-- Location: LCCOMB_X21_Y22_N16
\ctrl|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector1~1_combout\ = (\ctrl|Selector1~0_combout\) # ((\dp|wr_cnt|terminal_cnt~regout\ & \ctrl|ps.INIT~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|terminal_cnt~regout\,
	datac => \ctrl|ps.INIT~regout\,
	datad => \ctrl|Selector1~0_combout\,
	combout => \ctrl|Selector1~1_combout\);

-- Location: LCFF_X21_Y22_N17
\ctrl|ps.HMODE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|Selector1~1_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.HMODE~regout\);

-- Location: LCCOMB_X21_Y22_N30
\ctrl|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|Selector2~0_combout\ = (\dp|hmode_cnt|terminal_cnt~regout\ & ((\ctrl|ps.HMODE~regout\) # ((!\dp|vmode_cnt|terminal_cnt~regout\ & \ctrl|ps.VMODE~regout\)))) # (!\dp|hmode_cnt|terminal_cnt~regout\ & (!\dp|vmode_cnt|terminal_cnt~regout\ & 
-- (\ctrl|ps.VMODE~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|terminal_cnt~regout\,
	datab => \dp|vmode_cnt|terminal_cnt~regout\,
	datac => \ctrl|ps.VMODE~regout\,
	datad => \ctrl|ps.HMODE~regout\,
	combout => \ctrl|Selector2~0_combout\);

-- Location: LCFF_X21_Y22_N31
\ctrl|ps.VMODE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \ctrl|Selector2~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ctrl|ps.VMODE~regout\);

-- Location: LCCOMB_X21_Y22_N0
\ctrl|en_wr_ptr\ : cycloneii_lcell_comb
-- Equation(s):
-- \ctrl|en_wr_ptr~combout\ = (\ctrl|ps.INIT~regout\) # (\ctrl|ps.VMODE~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|ps.INIT~regout\,
	datad => \ctrl|ps.VMODE~regout\,
	combout => \ctrl|en_wr_ptr~combout\);

-- Location: LCFF_X20_Y23_N29
\dp|wr_cnt|cnt_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|wr_cnt|cnt_out~0_combout\,
	ena => \ctrl|en_wr_ptr~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|wr_cnt|cnt_out\(1));

-- Location: LCCOMB_X20_Y23_N0
\dp|wr_cnt|terminal_cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|wr_cnt|terminal_cnt~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (!\dp|wr_cnt|terminal_cnt~regout\ & \dp|wr_cnt|cnt_out\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|wr_cnt|terminal_cnt~regout\,
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|wr_cnt|terminal_cnt~0_combout\);

-- Location: LCFF_X20_Y23_N1
\dp|wr_cnt|terminal_cnt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|wr_cnt|terminal_cnt~0_combout\,
	sclr => \rst~combout\,
	ena => \ctrl|en_wr_ptr~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|wr_cnt|terminal_cnt~regout\);

-- Location: LCCOMB_X20_Y23_N6
\dp|wr_cnt|cnt_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|wr_cnt|cnt_out~1_combout\ = (!\rst~combout\ & (!\dp|wr_cnt|cnt_out\(0) & !\dp|wr_cnt|terminal_cnt~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|wr_cnt|terminal_cnt~regout\,
	combout => \dp|wr_cnt|cnt_out~1_combout\);

-- Location: LCFF_X20_Y23_N7
\dp|wr_cnt|cnt_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|wr_cnt|cnt_out~1_combout\,
	ena => \ctrl|en_wr_ptr~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|wr_cnt|cnt_out\(0));

-- Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(12),
	combout => \i_data~combout\(12));

-- Location: LCCOMB_X22_Y22_N24
\dp|r|SRF|r|rGen:0:regi|q~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~0_combout\ = (\i_data~combout\(12) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_data~combout\(12),
	datac => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~0_combout\);

-- Location: LCCOMB_X25_Y22_N8
\dp|r|Mux66~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux66~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & !\dp|wr_cnt|cnt_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|r|Mux66~0_combout\);

-- Location: LCFF_X22_Y22_N25
\dp|r|SRF|r|rGen:2:regi|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~0_combout\,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(12));

-- Location: LCCOMB_X23_Y22_N16
\dp|r|SRF|sGen:0:hsi|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ = (\dp|hmode_cnt|cnt_out\(0) & !\dp|hmode_cnt|cnt_out\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\);

-- Location: PIN_V11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(8),
	combout => \i_data~combout\(8));

-- Location: LCCOMB_X24_Y23_N16
\dp|r|SRF|r|rGen:0:regi|q~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~2_combout\ = (!\rst~combout\ & \i_data~combout\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(8),
	combout => \dp|r|SRF|r|rGen:0:regi|q~2_combout\);

-- Location: LCFF_X22_Y22_N19
\dp|r|SRF|r|rGen:2:regi|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~2_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(8));

-- Location: PIN_W11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(16),
	combout => \i_data~combout\(16));

-- Location: LCCOMB_X24_Y23_N14
\dp|r|SRF|r|rGen:0:regi|q~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~3_combout\ = (!\rst~combout\ & \i_data~combout\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(16),
	combout => \dp|r|SRF|r|rGen:0:regi|q~3_combout\);

-- Location: LCFF_X23_Y22_N15
\dp|r|SRF|r|rGen:2:regi|q[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~3_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(16));

-- Location: LCCOMB_X23_Y22_N14
\dp|r|SRF|sGen:2:hsi|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux15~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(8))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(8),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(16),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux15~0_combout\);

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(0),
	combout => \i_data~combout\(0));

-- Location: LCCOMB_X23_Y23_N2
\dp|r|SRF|r|rGen:0:regi|q~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~1_combout\ = (!\rst~combout\ & \i_data~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(0),
	combout => \dp|r|SRF|r|rGen:0:regi|q~1_combout\);

-- Location: LCFF_X23_Y22_N11
\dp|r|SRF|r|rGen:2:regi|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~1_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(0));

-- Location: LCCOMB_X23_Y22_N10
\dp|r|SRF|sGen:2:hsi|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux15~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|r|rGen:2:regi|q\(0)) # (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux15~0_combout\ & 
-- ((!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(0),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux15~1_combout\);

-- Location: LCCOMB_X23_Y22_N24
\dp|r|SRF|sGen:2:hsi|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux15~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux15~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(4))) # (!\dp|r|SRF|sGen:2:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(12)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(4),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(12),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux15~2_combout\);

-- Location: LCCOMB_X21_Y24_N16
\dp|r|SRF|sGen:0:hsi|Mux15~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|hmode_cnt|cnt_out\(0)) # (\dp|hmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(0),
	datac => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\);

-- Location: LCCOMB_X25_Y22_N2
\dp|r|Mux64~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux64~0_combout\ = (!\dp|wr_cnt|cnt_out\(1) & !\dp|wr_cnt|cnt_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|r|Mux64~0_combout\);

-- Location: LCFF_X23_Y22_N1
\dp|r|SRF|r|rGen:0:regi|q[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~3_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(16));

-- Location: LCCOMB_X24_Y22_N10
\dp|r|Mux63~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:2:regi|q\(16))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(16),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(16),
	combout => \dp|r|Mux63~0_combout\);

-- Location: LCCOMB_X24_Y22_N28
\dp|r|Mux63~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (((\dp|r|Mux63~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux63~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux15~2_combout\))) # (!\dp|r|Mux63~0_combout\ & 
-- (\dp|r|SRF|sGen:0:hsi|Mux15~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~4_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux15~2_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|Mux63~0_combout\,
	combout => \dp|r|Mux63~1_combout\);

-- Location: LCCOMB_X25_Y22_N12
\dp|r|Mux66~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux66~1_combout\ = (!\dp|wr_cnt|cnt_out\(1) & \dp|wr_cnt|cnt_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|r|Mux66~1_combout\);

-- Location: LCFF_X24_Y23_N31
\dp|r|SRF|r|rGen:1:regi|q[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~3_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(16));

-- Location: LCCOMB_X25_Y22_N22
\dp|r|Mux66~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux66~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & \dp|wr_cnt|cnt_out\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|r|Mux66~2_combout\);

-- Location: LCFF_X24_Y23_N15
\dp|r|SRF|r|rGen:3:regi|q[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~3_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(16));

-- Location: LCCOMB_X24_Y22_N22
\dp|r|Mux63~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(16)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & \dp|r|SRF|r|rGen:3:regi|q\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(16),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:3:regi|q\(16),
	combout => \dp|r|Mux63~2_combout\);

-- Location: LCFF_X24_Y23_N17
\dp|r|SRF|r|rGen:1:regi|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~0_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(12));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(4),
	combout => \i_data~combout\(4));

-- Location: LCCOMB_X23_Y23_N20
\dp|r|SRF|r|rGen:0:regi|q~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~4_combout\ = (!\rst~combout\ & \i_data~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(4),
	combout => \dp|r|SRF|r|rGen:0:regi|q~4_combout\);

-- Location: LCFF_X24_Y23_N1
\dp|r|SRF|r|rGen:1:regi|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~4_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(4));

-- Location: LCFF_X24_Y23_N29
\dp|r|SRF|r|rGen:1:regi|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~2_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(8));

-- Location: LCCOMB_X24_Y23_N30
\dp|r|SRF|sGen:1:hsi|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux15~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(8))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:1:regi|q\(8),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(16),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux15~0_combout\);

-- Location: LCFF_X24_Y23_N3
\dp|r|SRF|r|rGen:1:regi|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~1_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(0));

-- Location: LCCOMB_X23_Y22_N12
\dp|r|SRF|sGen:0:hsi|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ = (\dp|hmode_cnt|cnt_out\(2)) # ((\dp|hmode_cnt|cnt_out\(1) & \dp|hmode_cnt|cnt_out\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\);

-- Location: LCCOMB_X24_Y23_N2
\dp|r|SRF|sGen:1:hsi|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux15~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(0)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(0),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux15~1_combout\);

-- Location: LCCOMB_X24_Y23_N18
\dp|r|SRF|sGen:1:hsi|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux15~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(4)))) # (!\dp|r|SRF|sGen:1:hsi|Mux15~1_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(12))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|r|rGen:1:regi|q\(12),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(4),
	datad => \dp|r|SRF|sGen:1:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux15~2_combout\);

-- Location: LCCOMB_X24_Y22_N24
\dp|r|Mux63~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~3_combout\ = (\dp|r|Mux63~2_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\) # (\dp|r|SRF|sGen:1:hsi|Mux15~2_combout\)))) # (!\dp|r|Mux63~2_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux15~2_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux15~2_combout\,
	datab => \dp|r|Mux63~2_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux15~2_combout\,
	combout => \dp|r|Mux63~3_combout\);

-- Location: LCCOMB_X26_Y23_N26
\dp|p|peRowGen:3:peColGen:0:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux63~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux63~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux63~1_combout\,
	datad => \dp|r|Mux63~3_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|q_im~0_combout\);

-- Location: LCFF_X26_Y23_N27
\dp|p|peRowGen:3:peColGen:0:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(0));

-- Location: LCCOMB_X26_Y23_N8
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X26_Y23_N9
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0));

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(17),
	combout => \i_data~combout\(17));

-- Location: LCCOMB_X23_Y24_N30
\dp|r|SRF|r|rGen:0:regi|q~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~8_combout\ = (\i_data~combout\(17) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_data~combout\(17),
	datad => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~8_combout\);

-- Location: LCFF_X23_Y24_N7
\dp|r|SRF|r|rGen:2:regi|q[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~8_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(17));

-- Location: LCCOMB_X24_Y22_N4
\dp|r|Mux62~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:2:regi|q\(17)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(17) & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(17),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(17),
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	combout => \dp|r|Mux62~0_combout\);

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(5),
	combout => \i_data~combout\(5));

-- Location: LCCOMB_X25_Y23_N20
\dp|r|SRF|r|rGen:0:regi|q~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~9_combout\ = (!\rst~combout\ & \i_data~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \i_data~combout\(5),
	combout => \dp|r|SRF|r|rGen:0:regi|q~9_combout\);

-- Location: LCFF_X23_Y24_N25
\dp|r|SRF|r|rGen:2:regi|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~9_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(5));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(13),
	combout => \i_data~combout\(13));

-- Location: LCCOMB_X25_Y23_N26
\dp|r|SRF|r|rGen:0:regi|q~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~5_combout\ = (\i_data~combout\(13) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_data~combout\(13),
	datad => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~5_combout\);

-- Location: LCFF_X23_Y24_N9
\dp|r|SRF|r|rGen:2:regi|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~5_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(13));

-- Location: PIN_AA11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(1),
	combout => \i_data~combout\(1));

-- Location: LCCOMB_X25_Y23_N8
\dp|r|SRF|r|rGen:0:regi|q~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~6_combout\ = (!\rst~combout\ & \i_data~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \i_data~combout\(1),
	combout => \dp|r|SRF|r|rGen:0:regi|q~6_combout\);

-- Location: LCFF_X23_Y24_N27
\dp|r|SRF|r|rGen:2:regi|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~6_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(1));

-- Location: LCCOMB_X23_Y24_N26
\dp|r|SRF|sGen:2:hsi|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux14~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|r|rGen:2:regi|q\(1)) # (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux14~0_combout\ & 
-- ((!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux14~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(1),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux14~1_combout\);

-- Location: LCCOMB_X23_Y24_N2
\dp|r|SRF|sGen:2:hsi|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux14~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux14~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(5))) # (!\dp|r|SRF|sGen:2:hsi|Mux14~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(13)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|r|rGen:2:regi|q\(5),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(13),
	datad => \dp|r|SRF|sGen:2:hsi|Mux14~1_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux14~2_combout\);

-- Location: LCFF_X25_Y23_N9
\dp|r|SRF|r|rGen:0:regi|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~6_combout\,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(1));

-- Location: LCFF_X25_Y23_N21
\dp|r|SRF|r|rGen:0:regi|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~9_combout\,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(5));

-- Location: LCFF_X23_Y24_N31
\dp|r|SRF|r|rGen:0:regi|q[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~8_combout\,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(17));

-- Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(9),
	combout => \i_data~combout\(9));

-- Location: LCCOMB_X23_Y24_N18
\dp|r|SRF|r|rGen:0:regi|q~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~7_combout\ = (!\rst~combout\ & \i_data~combout\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(9),
	combout => \dp|r|SRF|r|rGen:0:regi|q~7_combout\);

-- Location: LCFF_X23_Y24_N21
\dp|r|SRF|r|rGen:0:regi|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~7_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(9));

-- Location: LCCOMB_X23_Y23_N8
\dp|r|SRF|sGen:0:hsi|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux14~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(9)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:0:regi|q\(17),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(9),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux14~0_combout\);

-- Location: LCCOMB_X23_Y23_N18
\dp|r|SRF|sGen:0:hsi|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux14~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(13)) # ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux14~0_combout\ & 
-- !\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(13),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux14~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux14~1_combout\);

-- Location: LCCOMB_X24_Y22_N18
\dp|r|SRF|sGen:0:hsi|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux14~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux14~1_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(5)))) # (!\dp|r|SRF|sGen:0:hsi|Mux14~1_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(1))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|r|rGen:0:regi|q\(1),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(5),
	datad => \dp|r|SRF|sGen:0:hsi|Mux14~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux14~2_combout\);

-- Location: LCCOMB_X24_Y22_N6
\dp|r|Mux62~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux62~0_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux62~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux14~2_combout\)) # (!\dp|r|Mux62~0_combout\ & 
-- ((\dp|r|SRF|sGen:0:hsi|Mux14~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux62~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux14~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux14~2_combout\,
	combout => \dp|r|Mux62~1_combout\);

-- Location: LCFF_X24_Y24_N15
\dp|r|SRF|r|rGen:3:regi|q[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~8_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(17));

-- Location: LCFF_X24_Y24_N31
\dp|r|SRF|r|rGen:1:regi|q[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~8_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(17));

-- Location: LCCOMB_X25_Y22_N30
\dp|r|Mux62~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(17)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(17))))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & 
-- (((\dp|wr_cnt|cnt_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(17),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(17),
	datad => \dp|wr_cnt|cnt_out\(1),
	combout => \dp|r|Mux62~2_combout\);

-- Location: LCFF_X24_Y24_N29
\dp|r|SRF|r|rGen:1:regi|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~7_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(9));

-- Location: LCCOMB_X24_Y24_N30
\dp|r|SRF|sGen:1:hsi|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux14~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(9))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:1:regi|q\(9),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(17),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux14~0_combout\);

-- Location: LCFF_X24_Y24_N3
\dp|r|SRF|r|rGen:1:regi|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~6_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(1));

-- Location: LCCOMB_X24_Y24_N2
\dp|r|SRF|sGen:1:hsi|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux14~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(1)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux14~0_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(1),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux14~1_combout\);

-- Location: LCFF_X24_Y24_N17
\dp|r|SRF|r|rGen:1:regi|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~5_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(13));

-- Location: LCCOMB_X24_Y24_N18
\dp|r|SRF|sGen:1:hsi|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux14~2_combout\ = (\dp|r|SRF|sGen:1:hsi|Mux14~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(5)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:1:hsi|Mux14~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(13) & 
-- \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(5),
	datab => \dp|r|SRF|sGen:1:hsi|Mux14~1_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(13),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux14~2_combout\);

-- Location: LCFF_X25_Y24_N25
\dp|r|SRF|r|rGen:3:regi|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~6_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(1));

-- Location: LCFF_X25_Y24_N11
\dp|r|SRF|r|rGen:3:regi|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~5_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(13));

-- Location: LCCOMB_X25_Y24_N10
\dp|r|SRF|sGen:3:hsi|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux14~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(13)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(13),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux14~1_combout\);

-- Location: LCCOMB_X25_Y24_N24
\dp|r|SRF|sGen:3:hsi|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux14~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux14~1_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(5))) # (!\dp|r|SRF|sGen:3:hsi|Mux14~1_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(1)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(5),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(1),
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~1_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux14~2_combout\);

-- Location: LCCOMB_X24_Y22_N0
\dp|r|Mux62~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~3_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux62~2_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux62~2_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux14~2_combout\)) # (!\dp|r|Mux62~2_combout\ & 
-- ((\dp|r|SRF|sGen:3:hsi|Mux14~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux62~2_combout\,
	datac => \dp|r|SRF|sGen:1:hsi|Mux14~2_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~2_combout\,
	combout => \dp|r|Mux62~3_combout\);

-- Location: LCCOMB_X26_Y23_N28
\dp|p|peRowGen:3:peColGen:0:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux62~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux62~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux62~1_combout\,
	datad => \dp|r|Mux62~3_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|q_im~1_combout\);

-- Location: LCFF_X26_Y23_N29
\dp|p|peRowGen:3:peColGen:0:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(1));

-- Location: PIN_Y14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_k~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_k,
	combout => \i_k~combout\);

-- Location: LCCOMB_X32_Y22_N2
\dp|p|peRowGen:0:peColGen:0:peij|q_k~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|q_k~0_combout\ = (!\i_k~combout\ & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_k~combout\,
	datac => \rst~combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|q_k~0_combout\);

-- Location: LCFF_X26_Y22_N17
\dp|p|peRowGen:0:peColGen:0:peij|q_k\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|p|peRowGen:0:peColGen:0:peij|q_k~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\);

-- Location: LCCOMB_X26_Y25_N0
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:0:peij|q_im\(1) $ (((\dp|p|peRowGen:3:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(0),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(1),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X26_Y23_N18
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1) $ (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X26_Y23_N19
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1));

-- Location: PIN_C20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(18),
	combout => \i_data~combout\(18));

-- Location: LCCOMB_X22_Y25_N30
\dp|r|SRF|r|rGen:0:regi|q~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~13_combout\ = (!\rst~combout\ & \i_data~combout\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(18),
	combout => \dp|r|SRF|r|rGen:0:regi|q~13_combout\);

-- Location: LCFF_X24_Y25_N5
\dp|r|SRF|r|rGen:0:regi|q[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~13_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(18));

-- Location: LCFF_X24_Y25_N7
\dp|r|SRF|r|rGen:2:regi|q[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~13_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(18));

-- Location: LCCOMB_X24_Y25_N0
\dp|r|Mux61~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:2:regi|q\(18)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(18) & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(18),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(18),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	combout => \dp|r|Mux61~0_combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(2),
	combout => \i_data~combout\(2));

-- Location: LCCOMB_X25_Y24_N0
\dp|r|SRF|r|rGen:0:regi|q~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~11_combout\ = (!\rst~combout\ & \i_data~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(2),
	combout => \dp|r|SRF|r|rGen:0:regi|q~11_combout\);

-- Location: LCFF_X23_Y25_N9
\dp|r|SRF|r|rGen:0:regi|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~11_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(2));

-- Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(14),
	combout => \i_data~combout\(14));

-- Location: LCCOMB_X25_Y23_N30
\dp|r|SRF|r|rGen:0:regi|q~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~10_combout\ = (\i_data~combout\(14) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_data~combout\(14),
	datad => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~10_combout\);

-- Location: LCFF_X23_Y25_N19
\dp|r|SRF|r|rGen:0:regi|q[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~10_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(14));

-- Location: LCCOMB_X24_Y25_N30
\dp|r|SRF|sGen:0:hsi|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux13~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(10))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(10),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(18),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux13~0_combout\);

-- Location: LCCOMB_X23_Y25_N18
\dp|r|SRF|sGen:0:hsi|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux13~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\) # ((\dp|r|SRF|r|rGen:0:regi|q\(14))))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & 
-- ((\dp|r|SRF|sGen:0:hsi|Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(14),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux13~1_combout\);

-- Location: LCCOMB_X23_Y25_N8
\dp|r|SRF|sGen:0:hsi|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux13~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux13~1_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(6))) # (!\dp|r|SRF|sGen:0:hsi|Mux13~1_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(2)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(6),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(2),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux13~2_combout\);

-- Location: LCFF_X24_Y25_N25
\dp|r|SRF|r|rGen:2:regi|q[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~10_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(14));

-- Location: LCFF_X24_Y25_N27
\dp|r|SRF|r|rGen:2:regi|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~11_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(2));

-- Location: LCCOMB_X24_Y25_N26
\dp|r|SRF|sGen:2:hsi|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux13~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|r|rGen:2:regi|q\(2)) # (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux13~0_combout\ & 
-- ((!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux13~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(2),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux13~1_combout\);

-- Location: LCCOMB_X24_Y25_N18
\dp|r|SRF|sGen:2:hsi|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux13~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux13~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(6))) # (!\dp|r|SRF|sGen:2:hsi|Mux13~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(14)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(6),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(14),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux13~1_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux13~2_combout\);

-- Location: LCCOMB_X24_Y21_N0
\dp|r|Mux61~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux61~0_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux61~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux13~2_combout\))) # (!\dp|r|Mux61~0_combout\ & 
-- (\dp|r|SRF|sGen:0:hsi|Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux61~0_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux13~2_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux13~2_combout\,
	combout => \dp|r|Mux61~1_combout\);

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(6),
	combout => \i_data~combout\(6));

-- Location: LCCOMB_X25_Y25_N16
\dp|r|SRF|r|rGen:0:regi|q~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~14_combout\ = (!\rst~combout\ & \i_data~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(6),
	combout => \dp|r|SRF|r|rGen:0:regi|q~14_combout\);

-- Location: LCFF_X25_Y25_N17
\dp|r|SRF|r|rGen:1:regi|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~14_combout\,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(6));

-- Location: LCFF_X23_Y25_N25
\dp|r|SRF|r|rGen:1:regi|q[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~10_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(14));

-- Location: LCFF_X23_Y25_N27
\dp|r|SRF|r|rGen:1:regi|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~11_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(2));

-- Location: LCFF_X22_Y25_N27
\dp|r|SRF|r|rGen:1:regi|q[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~13_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(18));

-- Location: LCCOMB_X22_Y25_N26
\dp|r|SRF|sGen:1:hsi|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux13~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(10))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(10),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(18),
	combout => \dp|r|SRF|sGen:1:hsi|Mux13~0_combout\);

-- Location: LCCOMB_X23_Y25_N26
\dp|r|SRF|sGen:1:hsi|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux13~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(2))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux13~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(2),
	datad => \dp|r|SRF|sGen:1:hsi|Mux13~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux13~1_combout\);

-- Location: LCCOMB_X23_Y25_N12
\dp|r|SRF|sGen:1:hsi|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux13~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux13~1_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(6))) # (!\dp|r|SRF|sGen:1:hsi|Mux13~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(14)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|r|rGen:1:regi|q\(6),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(14),
	datad => \dp|r|SRF|sGen:1:hsi|Mux13~1_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux13~2_combout\);

-- Location: LCFF_X25_Y24_N31
\dp|r|SRF|r|rGen:3:regi|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~11_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(2));

-- Location: LCFF_X25_Y24_N1
\dp|r|SRF|r|rGen:3:regi|q[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~13_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(18));

-- Location: LCCOMB_X25_Y24_N30
\dp|r|SRF|sGen:3:hsi|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux13~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(10))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(10),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(18),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux13~0_combout\);

-- Location: LCFF_X25_Y23_N31
\dp|r|SRF|r|rGen:3:regi|q[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~10_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(14));

-- Location: LCCOMB_X25_Y24_N18
\dp|r|SRF|sGen:3:hsi|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux13~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(14)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|sGen:3:hsi|Mux13~0_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(14),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux13~1_combout\);

-- Location: LCCOMB_X25_Y24_N6
\dp|r|SRF|sGen:3:hsi|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux13~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux13~1_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(6))) # (!\dp|r|SRF|sGen:3:hsi|Mux13~1_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(2)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(6),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(2),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux13~1_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux13~2_combout\);

-- Location: LCCOMB_X24_Y21_N10
\dp|r|Mux61~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~3_combout\ = (\dp|r|Mux61~2_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\) # ((\dp|r|SRF|sGen:1:hsi|Mux13~2_combout\)))) # (!\dp|r|Mux61~2_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux61~2_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|sGen:1:hsi|Mux13~2_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux13~2_combout\,
	combout => \dp|r|Mux61~3_combout\);

-- Location: LCCOMB_X25_Y22_N24
\dp|p|peRowGen:3:peColGen:0:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux61~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux61~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux61~1_combout\,
	datad => \dp|r|Mux61~3_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|q_im~2_combout\);

-- Location: LCFF_X25_Y22_N25
\dp|p|peRowGen:3:peColGen:0:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(2));

-- Location: LCCOMB_X26_Y23_N14
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(0),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N0
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X25_Y22_N0
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(2) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(2),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X25_Y22_N1
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2));

-- Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(19),
	combout => \i_data~combout\(19));

-- Location: LCCOMB_X22_Y24_N22
\dp|r|SRF|r|rGen:0:regi|q~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~18_combout\ = (!\rst~combout\ & \i_data~combout\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~combout\,
	datad => \i_data~combout\(19),
	combout => \dp|r|SRF|r|rGen:0:regi|q~18_combout\);

-- Location: LCFF_X22_Y23_N27
\dp|r|SRF|r|rGen:1:regi|q[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~18_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(19));

-- Location: LCCOMB_X25_Y22_N10
\dp|r|Mux60~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:1:regi|q\(19)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(19) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(19),
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:1:regi|q\(19),
	combout => \dp|r|Mux60~2_combout\);

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(3),
	combout => \i_data~combout\(3));

-- Location: LCCOMB_X21_Y23_N20
\dp|r|SRF|r|rGen:0:regi|q~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~16_combout\ = (!\rst~combout\ & \i_data~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(3),
	combout => \dp|r|SRF|r|rGen:0:regi|q~16_combout\);

-- Location: LCFF_X22_Y24_N1
\dp|r|SRF|r|rGen:3:regi|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~16_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(3));

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(15),
	combout => \i_data~combout\(15));

-- Location: LCCOMB_X22_Y24_N18
\dp|r|SRF|r|rGen:0:regi|q~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~15_combout\ = (!\rst~combout\ & \i_data~combout\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(15),
	combout => \dp|r|SRF|r|rGen:0:regi|q~15_combout\);

-- Location: LCFF_X22_Y24_N19
\dp|r|SRF|r|rGen:3:regi|q[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~15_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(15));

-- Location: LCCOMB_X22_Y24_N2
\dp|r|SRF|sGen:3:hsi|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux12~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(15)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux12~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datad => \dp|r|SRF|r|rGen:3:regi|q\(15),
	combout => \dp|r|SRF|sGen:3:hsi|Mux12~1_combout\);

-- Location: LCCOMB_X22_Y24_N0
\dp|r|SRF|sGen:3:hsi|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux12~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux12~1_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(7))) # (!\dp|r|SRF|sGen:3:hsi|Mux12~1_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(3)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux12~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(7),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(3),
	datad => \dp|r|SRF|sGen:3:hsi|Mux12~1_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux12~2_combout\);

-- Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(7),
	combout => \i_data~combout\(7));

-- Location: LCCOMB_X22_Y23_N26
\dp|r|SRF|r|rGen:0:regi|q~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~19_combout\ = (!\rst~combout\ & \i_data~combout\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(7),
	combout => \dp|r|SRF|r|rGen:0:regi|q~19_combout\);

-- Location: LCFF_X22_Y23_N5
\dp|r|SRF|r|rGen:1:regi|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~19_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(7));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(11),
	combout => \i_data~combout\(11));

-- Location: LCCOMB_X22_Y24_N20
\dp|r|SRF|r|rGen:0:regi|q~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~17_combout\ = (!\rst~combout\ & \i_data~combout\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~combout\,
	datad => \i_data~combout\(11),
	combout => \dp|r|SRF|r|rGen:0:regi|q~17_combout\);

-- Location: LCFF_X22_Y25_N9
\dp|r|SRF|r|rGen:1:regi|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~17_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(11));

-- Location: LCCOMB_X22_Y23_N12
\dp|r|SRF|sGen:1:hsi|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux12~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(11)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(19),
	datad => \dp|r|SRF|r|rGen:1:regi|q\(11),
	combout => \dp|r|SRF|sGen:1:hsi|Mux12~0_combout\);

-- Location: LCFF_X22_Y23_N25
\dp|r|SRF|r|rGen:1:regi|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~16_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(3));

-- Location: LCCOMB_X22_Y23_N24
\dp|r|SRF|sGen:1:hsi|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux12~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(3)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux12~0_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(3),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux12~1_combout\);

-- Location: LCCOMB_X22_Y23_N14
\dp|r|SRF|sGen:1:hsi|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux12~2_combout\ = (\dp|r|SRF|sGen:1:hsi|Mux12~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(7)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:1:hsi|Mux12~1_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(15) & 
-- ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(15),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(7),
	datac => \dp|r|SRF|sGen:1:hsi|Mux12~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux12~2_combout\);

-- Location: LCCOMB_X26_Y21_N28
\dp|r|Mux60~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~3_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux60~2_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux60~2_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux12~2_combout\))) # (!\dp|r|Mux60~2_combout\ & 
-- (\dp|r|SRF|sGen:3:hsi|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux60~2_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux12~2_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux12~2_combout\,
	combout => \dp|r|Mux60~3_combout\);

-- Location: LCFF_X22_Y23_N11
\dp|r|SRF|r|rGen:2:regi|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~16_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(3));

-- Location: LCFF_X21_Y23_N3
\dp|r|SRF|r|rGen:2:regi|q[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~18_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(19));

-- Location: LCFF_X21_Y23_N1
\dp|r|SRF|r|rGen:2:regi|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~17_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(11));

-- Location: LCCOMB_X21_Y23_N28
\dp|r|SRF|sGen:2:hsi|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux12~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(11)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(19),
	datac => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(11),
	combout => \dp|r|SRF|sGen:2:hsi|Mux12~0_combout\);

-- Location: LCCOMB_X22_Y23_N10
\dp|r|SRF|sGen:2:hsi|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux12~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\) # ((\dp|r|SRF|r|rGen:2:regi|q\(3))))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(3),
	datad => \dp|r|SRF|sGen:2:hsi|Mux12~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux12~1_combout\);

-- Location: LCFF_X22_Y23_N13
\dp|r|SRF|r|rGen:2:regi|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~19_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(7));

-- Location: LCCOMB_X22_Y23_N30
\dp|r|SRF|sGen:2:hsi|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux12~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux12~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(7)))) # (!\dp|r|SRF|sGen:2:hsi|Mux12~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(15))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux12~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(15),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux12~1_combout\,
	datad => \dp|r|SRF|r|rGen:2:regi|q\(7),
	combout => \dp|r|SRF|sGen:2:hsi|Mux12~2_combout\);

-- Location: LCFF_X21_Y23_N23
\dp|r|SRF|r|rGen:0:regi|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~19_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(7));

-- Location: LCFF_X21_Y23_N25
\dp|r|SRF|r|rGen:0:regi|q[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~15_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(15));

-- Location: LCCOMB_X21_Y23_N24
\dp|r|SRF|sGen:0:hsi|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux12~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(15)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux12~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(15),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux12~1_combout\);

-- Location: LCCOMB_X27_Y23_N26
\dp|r|SRF|sGen:0:hsi|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux12~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux12~1_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(7)))) # (!\dp|r|SRF|sGen:0:hsi|Mux12~1_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(3))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux12~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(3),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(7),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux12~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux12~2_combout\);

-- Location: LCCOMB_X27_Y23_N12
\dp|r|Mux60~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~1_combout\ = (\dp|r|Mux60~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\) # ((\dp|r|SRF|sGen:2:hsi|Mux12~2_combout\)))) # (!\dp|r|Mux60~0_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux60~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux12~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux12~2_combout\,
	combout => \dp|r|Mux60~1_combout\);

-- Location: LCCOMB_X27_Y23_N30
\dp|p|peRowGen:3:peColGen:0:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux60~1_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux60~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux60~3_combout\,
	datad => \dp|r|Mux60~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|q_im~3_combout\);

-- Location: LCFF_X27_Y23_N31
\dp|p|peRowGen:3:peColGen:0:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3));

-- Location: LCCOMB_X27_Y23_N0
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N1
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3));

-- Location: LCCOMB_X27_Y23_N2
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y23_N18
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N19
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4));

-- Location: LCCOMB_X27_Y23_N4
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N5
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5));

-- Location: LCCOMB_X27_Y23_N20
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N10
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(2))))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(2),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N20
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4) & 
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X26_Y23_N22
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y23_N14
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N15
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6));

-- Location: LCCOMB_X26_Y23_N24
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y23_N24
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N25
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7));

-- Location: LCCOMB_X26_Y23_N2
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N12
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X26_Y23_N13
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8));

-- Location: LCCOMB_X26_Y23_N4
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8),
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N6
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X26_Y23_N7
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9));

-- Location: LCCOMB_X26_Y23_N30
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9) & ((\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9) & (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y23_N16
\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:0:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(10),
	datad => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X26_Y23_N17
\dp|p|peRowGen:3:peColGen:0:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(10));

-- Location: LCCOMB_X22_Y23_N16
\dp|r|SRF|sGen:2:hsi|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ = (!\dp|hmode_cnt|cnt_out\(0) & ((!\dp|hmode_cnt|cnt_out\(2)) # (!\dp|hmode_cnt|cnt_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\);

-- Location: LCFF_X23_Y23_N5
\dp|r|SRF|r|rGen:3:regi|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~4_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(4));

-- Location: LCFF_X23_Y23_N27
\dp|r|SRF|r|rGen:3:regi|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~0_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(12));

-- Location: LCCOMB_X23_Y23_N4
\dp|r|SRF|sGen:3:hsi|Mux15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux15~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(12)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(20),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(12),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux15~3_combout\);

-- Location: LCCOMB_X23_Y23_N14
\dp|r|SRF|sGen:3:hsi|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux11~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|r|rGen:3:regi|q\(4)) # ((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|sGen:3:hsi|Mux15~3_combout\ & 
-- \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(4),
	datac => \dp|r|SRF|sGen:3:hsi|Mux15~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux11~0_combout\);

-- Location: LCCOMB_X24_Y23_N24
\dp|r|SRF|sGen:3:hsi|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux15~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(8))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(8),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(16),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux15~0_combout\);

-- Location: LCCOMB_X23_Y23_N0
\dp|r|SRF|sGen:3:hsi|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux11~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux11~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux11~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(20))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux11~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux15~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(20),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux11~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux11~1_combout\);

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(20),
	combout => \i_data~combout\(20));

-- Location: LCCOMB_X22_Y22_N22
\dp|r|SRF|r|rGen:0:regi|q~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~20_combout\ = (!\rst~combout\ & \i_data~combout\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(20),
	combout => \dp|r|SRF|r|rGen:0:regi|q~20_combout\);

-- Location: LCFF_X24_Y23_N11
\dp|r|SRF|r|rGen:1:regi|q[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~20_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(20));

-- Location: LCCOMB_X24_Y23_N4
\dp|r|SRF|sGen:1:hsi|Mux15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux15~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(12)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(20),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(12),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux15~3_combout\);

-- Location: LCCOMB_X24_Y23_N0
\dp|r|SRF|sGen:1:hsi|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux11~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:1:regi|q\(4)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:1:hsi|Mux15~3_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:1:hsi|Mux15~3_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(4),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux11~0_combout\);

-- Location: LCCOMB_X24_Y23_N20
\dp|r|SRF|sGen:1:hsi|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux11~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux11~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux11~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(20)))) # 
-- (!\dp|r|SRF|sGen:1:hsi|Mux11~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(20),
	datad => \dp|r|SRF|sGen:1:hsi|Mux11~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux11~1_combout\);

-- Location: LCCOMB_X31_Y24_N10
\dp|p|peRowGen:2:peColGen:1:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux11~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux11~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux11~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux11~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\);

-- Location: LCFF_X23_Y22_N31
\dp|r|SRF|r|rGen:0:regi|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~2_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(8));

-- Location: LCCOMB_X23_Y22_N0
\dp|r|SRF|sGen:0:hsi|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~2_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(8))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:0:regi|q\(8),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(16),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~2_combout\);

-- Location: LCFF_X23_Y22_N5
\dp|r|SRF|r|rGen:0:regi|q[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~20_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(20));

-- Location: LCFF_X23_Y22_N21
\dp|r|SRF|r|rGen:0:regi|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~0_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(12));

-- Location: LCCOMB_X23_Y22_N4
\dp|r|SRF|sGen:0:hsi|Mux15~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~6_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(12)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(20),
	datad => \dp|r|SRF|r|rGen:0:regi|q\(12),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~6_combout\);

-- Location: LCFF_X23_Y22_N19
\dp|r|SRF|r|rGen:0:regi|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~4_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(4));

-- Location: LCCOMB_X23_Y22_N18
\dp|r|SRF|sGen:0:hsi|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux11~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:0:regi|q\(4)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:0:hsi|Mux15~6_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~6_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(4),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux11~0_combout\);

-- Location: LCCOMB_X23_Y22_N6
\dp|r|SRF|sGen:0:hsi|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux11~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux11~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux11~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(20))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux11~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(20),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~2_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux11~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux11~1_combout\);

-- Location: LCFF_X22_Y22_N23
\dp|r|SRF|r|rGen:2:regi|q[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~20_combout\,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(20));

-- Location: LCFF_X22_Y22_N13
\dp|r|SRF|r|rGen:2:regi|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~4_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(4));

-- Location: LCCOMB_X22_Y22_N8
\dp|r|SRF|sGen:2:hsi|Mux15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux15~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(12)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(20),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(12),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux15~3_combout\);

-- Location: LCCOMB_X22_Y22_N12
\dp|r|SRF|sGen:2:hsi|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux11~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:2:regi|q\(4))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux15~3_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(4),
	datad => \dp|r|SRF|sGen:2:hsi|Mux15~3_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux11~0_combout\);

-- Location: LCCOMB_X22_Y22_N26
\dp|r|SRF|sGen:2:hsi|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux11~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux11~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux11~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(20))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux11~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux15~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|r|rGen:2:regi|q\(20),
	datac => \dp|r|SRF|sGen:2:hsi|Mux15~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux11~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux11~1_combout\);

-- Location: LCCOMB_X31_Y24_N24
\dp|p|peRowGen:3:peColGen:1:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux11~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux11~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux11~1_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux11~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\);

-- Location: LCCOMB_X30_Y23_N10
\dp|p|peRowGen:3:peColGen:1:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~1_combout\);

-- Location: LCFF_X30_Y23_N11
\dp|p|peRowGen:3:peColGen:1:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(0));

-- Location: LCCOMB_X30_Y23_N8
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(0),
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X30_Y23_N9
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(21),
	combout => \i_data~combout\(21));

-- Location: LCCOMB_X23_Y24_N16
\dp|r|SRF|r|rGen:0:regi|q~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~21_combout\ = (!\rst~combout\ & \i_data~combout\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(21),
	combout => \dp|r|SRF|r|rGen:0:regi|q~21_combout\);

-- Location: LCFF_X25_Y24_N9
\dp|r|SRF|r|rGen:3:regi|q[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~21_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(21));

-- Location: LCCOMB_X25_Y24_N8
\dp|r|SRF|sGen:3:hsi|Mux14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux14~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(13))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:3:regi|q\(13),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(21),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux14~3_combout\);

-- Location: LCFF_X25_Y24_N5
\dp|r|SRF|r|rGen:3:regi|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~9_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(5));

-- Location: LCCOMB_X25_Y24_N4
\dp|r|SRF|sGen:3:hsi|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux10~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:3:regi|q\(5)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:3:hsi|Mux14~3_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:3:hsi|Mux14~3_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(5),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux10~0_combout\);

-- Location: LCFF_X24_Y24_N5
\dp|r|SRF|r|rGen:3:regi|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~7_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(9));

-- Location: LCCOMB_X24_Y24_N14
\dp|r|SRF|sGen:3:hsi|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(9))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:3:regi|q\(9),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(17),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\);

-- Location: LCCOMB_X25_Y24_N2
\dp|r|SRF|sGen:3:hsi|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux10~1_combout\ = (\dp|r|SRF|sGen:3:hsi|Mux10~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(21)) # ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|r|SRF|sGen:3:hsi|Mux10~0_combout\ & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & 
-- \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(21),
	datab => \dp|r|SRF|sGen:3:hsi|Mux10~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux10~1_combout\);

-- Location: LCFF_X24_Y24_N1
\dp|r|SRF|r|rGen:1:regi|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~9_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(5));

-- Location: LCCOMB_X24_Y24_N0
\dp|r|SRF|sGen:1:hsi|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux10~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:1:regi|q\(5)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:1:hsi|Mux14~3_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:1:hsi|Mux14~3_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(5),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux10~0_combout\);

-- Location: LCCOMB_X24_Y24_N20
\dp|r|SRF|sGen:1:hsi|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux10~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux10~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux10~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(21))) # 
-- (!\dp|r|SRF|sGen:1:hsi|Mux10~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux14~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(21),
	datab => \dp|r|SRF|sGen:1:hsi|Mux14~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux10~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux10~1_combout\);

-- Location: LCCOMB_X31_Y24_N22
\dp|p|peRowGen:2:peColGen:1:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux10~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux10~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux10~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux10~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\);

-- Location: LCCOMB_X30_Y23_N4
\dp|p|peRowGen:3:peColGen:1:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~3_combout\);

-- Location: LCFF_X30_Y23_N5
\dp|p|peRowGen:3:peColGen:1:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(1));

-- Location: LCCOMB_X30_Y25_N16
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(1) $ (((\dp|p|peRowGen:3:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0),
	datab => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(1),
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X30_Y23_N26
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1) $ (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X30_Y23_N27
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1));

-- Location: LCFF_X23_Y25_N15
\dp|r|SRF|r|rGen:0:regi|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~14_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(6));

-- Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(22),
	combout => \i_data~combout\(22));

-- Location: LCCOMB_X24_Y25_N2
\dp|r|SRF|r|rGen:0:regi|q~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~22_combout\ = (!\rst~combout\ & \i_data~combout\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(22),
	combout => \dp|r|SRF|r|rGen:0:regi|q~22_combout\);

-- Location: LCFF_X23_Y25_N23
\dp|r|SRF|r|rGen:0:regi|q[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~22_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(22));

-- Location: LCCOMB_X23_Y25_N22
\dp|r|SRF|sGen:0:hsi|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux13~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(14))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(14),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(22),
	combout => \dp|r|SRF|sGen:0:hsi|Mux13~3_combout\);

-- Location: LCCOMB_X23_Y25_N14
\dp|r|SRF|sGen:0:hsi|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux9~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:0:regi|q\(6))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:0:hsi|Mux13~3_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(6),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~3_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux9~0_combout\);

-- Location: LCCOMB_X23_Y25_N0
\dp|r|SRF|sGen:0:hsi|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux9~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux9~0_combout\)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux9~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(22))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux9~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux13~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux9~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(22),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux9~1_combout\);

-- Location: LCFF_X24_Y25_N3
\dp|r|SRF|r|rGen:2:regi|q[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~22_combout\,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(22));

-- Location: LCFF_X24_Y25_N17
\dp|r|SRF|r|rGen:2:regi|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~14_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(6));

-- Location: LCCOMB_X24_Y25_N24
\dp|r|SRF|sGen:2:hsi|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux13~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(14)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(22),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(14),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux13~3_combout\);

-- Location: LCCOMB_X24_Y25_N28
\dp|r|SRF|sGen:2:hsi|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux9~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux13~3_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux13~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|sGen:2:hsi|Mux13~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux9~0_combout\);

-- Location: LCCOMB_X24_Y25_N16
\dp|r|SRF|sGen:2:hsi|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux9~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux9~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(22))) # (!\dp|r|SRF|sGen:2:hsi|Mux9~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(6)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:2:hsi|Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(22),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(6),
	datad => \dp|r|SRF|sGen:2:hsi|Mux9~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux9~1_combout\);

-- Location: LCCOMB_X31_Y23_N16
\dp|p|peRowGen:3:peColGen:1:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux9~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux9~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|sGen:0:hsi|Mux9~1_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux9~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\);

-- Location: LCFF_X23_Y25_N3
\dp|r|SRF|r|rGen:1:regi|q[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~22_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(22));

-- Location: LCCOMB_X23_Y25_N2
\dp|r|SRF|sGen:1:hsi|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(14))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(14),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(22),
	combout => \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\);

-- Location: LCCOMB_X23_Y25_N20
\dp|r|SRF|sGen:1:hsi|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux9~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((!\dp|hmode_cnt|cnt_out\(2) & \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux13~0_combout\) # 
-- ((\dp|hmode_cnt|cnt_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux13~0_combout\,
	datac => \dp|hmode_cnt|cnt_out\(2),
	datad => \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux9~0_combout\);

-- Location: LCCOMB_X23_Y25_N30
\dp|r|SRF|sGen:1:hsi|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux9~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux9~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(22))) # (!\dp|r|SRF|sGen:1:hsi|Mux9~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(6)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(22),
	datac => \dp|r|SRF|sGen:1:hsi|Mux9~0_combout\,
	datad => \dp|r|SRF|r|rGen:1:regi|q\(6),
	combout => \dp|r|SRF|sGen:1:hsi|Mux9~1_combout\);

-- Location: LCFF_X25_Y24_N29
\dp|r|SRF|r|rGen:3:regi|q[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~22_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(22));

-- Location: LCCOMB_X25_Y24_N28
\dp|r|SRF|sGen:3:hsi|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux13~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(14))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:3:regi|q\(14),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(22),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux13~3_combout\);

-- Location: LCFF_X25_Y24_N21
\dp|r|SRF|r|rGen:3:regi|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~14_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(6));

-- Location: LCCOMB_X25_Y24_N20
\dp|r|SRF|sGen:3:hsi|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux9~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:3:regi|q\(6)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:3:hsi|Mux13~3_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:3:hsi|Mux13~3_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(6),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux9~0_combout\);

-- Location: LCCOMB_X25_Y24_N22
\dp|r|SRF|sGen:3:hsi|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux9~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux9~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux9~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(22))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux9~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux13~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(22),
	datab => \dp|r|SRF|sGen:3:hsi|Mux13~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux9~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux9~1_combout\);

-- Location: LCCOMB_X31_Y23_N10
\dp|p|peRowGen:2:peColGen:1:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux9~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux9~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux9~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\);

-- Location: LCCOMB_X31_Y23_N14
\dp|p|peRowGen:3:peColGen:1:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~5_combout\);

-- Location: LCFF_X31_Y23_N15
\dp|p|peRowGen:3:peColGen:1:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(2));

-- Location: LCCOMB_X31_Y23_N8
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(2),
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N9
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2));

-- Location: LCCOMB_X30_Y23_N6
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(0),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y23_N0
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1))) # (!\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(1),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X30_Y23_N18
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y23_N26
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N27
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3));

-- Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(23),
	combout => \i_data~combout\(23));

-- Location: LCCOMB_X22_Y23_N2
\dp|r|SRF|r|rGen:0:regi|q~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~23_combout\ = (!\rst~combout\ & \i_data~combout\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datac => \i_data~combout\(23),
	combout => \dp|r|SRF|r|rGen:0:regi|q~23_combout\);

-- Location: LCFF_X22_Y24_N31
\dp|r|SRF|r|rGen:3:regi|q[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~23_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(23));

-- Location: LCFF_X22_Y24_N5
\dp|r|SRF|r|rGen:3:regi|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~19_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(7));

-- Location: LCCOMB_X22_Y24_N8
\dp|r|SRF|sGen:3:hsi|Mux12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux12~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(15)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(23),
	datad => \dp|r|SRF|r|rGen:3:regi|q\(15),
	combout => \dp|r|SRF|sGen:3:hsi|Mux12~3_combout\);

-- Location: LCCOMB_X22_Y24_N4
\dp|r|SRF|sGen:3:hsi|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux8~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:3:regi|q\(7))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & 
-- ((\dp|r|SRF|sGen:3:hsi|Mux12~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(7),
	datad => \dp|r|SRF|sGen:3:hsi|Mux12~3_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux8~0_combout\);

-- Location: LCCOMB_X22_Y24_N26
\dp|r|SRF|sGen:3:hsi|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux8~1_combout\ = (\dp|r|SRF|sGen:3:hsi|Mux8~0_combout\ & (((\dp|r|SRF|r|rGen:3:regi|q\(23)) # (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|r|SRF|sGen:3:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux12~0_combout\ & 
-- ((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux12~0_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(23),
	datac => \dp|r|SRF|sGen:3:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux8~1_combout\);

-- Location: LCFF_X22_Y25_N3
\dp|r|SRF|r|rGen:1:regi|q[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~23_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(23));

-- Location: LCFF_X22_Y25_N31
\dp|r|SRF|r|rGen:1:regi|q[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~15_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(15));

-- Location: LCCOMB_X22_Y25_N4
\dp|r|SRF|sGen:1:hsi|Mux12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux12~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(15)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(23),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(15),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux12~3_combout\);

-- Location: LCCOMB_X22_Y23_N0
\dp|r|SRF|sGen:1:hsi|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux8~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux12~3_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:1:hsi|Mux12~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux12~3_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux8~0_combout\);

-- Location: LCCOMB_X22_Y23_N4
\dp|r|SRF|sGen:1:hsi|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux8~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux8~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(23))) # (!\dp|r|SRF|sGen:1:hsi|Mux8~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(7)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(23),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(7),
	datad => \dp|r|SRF|sGen:1:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux8~1_combout\);

-- Location: LCCOMB_X31_Y24_N16
\dp|p|peRowGen:2:peColGen:1:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux8~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux8~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux8~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux8~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\);

-- Location: LCCOMB_X32_Y24_N24
\dp|p|peRowGen:3:peColGen:1:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~7_combout\);

-- Location: LCFF_X32_Y24_N25
\dp|p|peRowGen:3:peColGen:1:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3));

-- Location: LCCOMB_X31_Y23_N22
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y23_N4
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N5
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4));

-- Location: LCCOMB_X32_Y24_N16
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y23_N28
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4) & 
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3),
	datab => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X31_Y23_N6
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N7
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5));

-- Location: LCCOMB_X30_Y23_N30
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y23_N0
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N1
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6));

-- Location: LCCOMB_X30_Y23_N24
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y23_N2
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N3
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7));

-- Location: LCCOMB_X30_Y23_N2
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y23_N20
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X30_Y23_N21
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8));

-- Location: LCCOMB_X30_Y23_N12
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y23_N14
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X30_Y23_N15
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9));

-- Location: LCCOMB_X30_Y23_N22
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9) & ((\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9) & (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y23_N16
\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:1:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(10),
	datad => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X30_Y23_N17
\dp|p|peRowGen:3:peColGen:1:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(10));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(24),
	combout => \i_data~combout\(24));

-- Location: LCCOMB_X22_Y22_N18
\dp|r|SRF|r|rGen:0:regi|q~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~24_combout\ = (!\rst~combout\ & \i_data~combout\(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(24),
	combout => \dp|r|SRF|r|rGen:0:regi|q~24_combout\);

-- Location: LCFF_X24_Y23_N7
\dp|r|SRF|r|rGen:1:regi|q[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~24_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(24));

-- Location: LCCOMB_X24_Y23_N6
\dp|r|SRF|sGen:1:hsi|Mux15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux15~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(16))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:1:regi|q\(16),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(24),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux15~4_combout\);

-- Location: LCCOMB_X24_Y23_N8
\dp|r|SRF|sGen:1:hsi|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux7~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux15~4_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux15~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|sGen:1:hsi|Mux15~3_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux15~4_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux7~0_combout\);

-- Location: LCCOMB_X24_Y23_N28
\dp|r|SRF|sGen:1:hsi|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux7~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux7~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(24))) # (!\dp|r|SRF|sGen:1:hsi|Mux7~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(8)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(24),
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(8),
	datad => \dp|r|SRF|sGen:1:hsi|Mux7~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux7~1_combout\);

-- Location: LCFF_X23_Y23_N17
\dp|r|SRF|r|rGen:3:regi|q[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~24_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(24));

-- Location: LCCOMB_X23_Y23_N10
\dp|r|SRF|sGen:3:hsi|Mux15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux15~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(16)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(24),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(16),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux15~4_combout\);

-- Location: LCCOMB_X24_Y23_N26
\dp|r|SRF|sGen:3:hsi|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux7~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:3:regi|q\(8))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:3:hsi|Mux15~4_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|hmode_cnt|cnt_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(8),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|hmode_cnt|cnt_out\(2),
	datad => \dp|r|SRF|sGen:3:hsi|Mux15~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux7~0_combout\);

-- Location: LCCOMB_X24_Y23_N12
\dp|r|SRF|sGen:3:hsi|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux7~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux7~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux7~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(24))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux7~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux15~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(24),
	datac => \dp|r|SRF|sGen:3:hsi|Mux15~3_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux7~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux7~1_combout\);

-- Location: LCCOMB_X20_Y24_N18
\dp|p|peRowGen:2:peColGen:2:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux7~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux7~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux7~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\);

-- Location: LCCOMB_X20_Y26_N18
\dp|p|peRowGen:3:peColGen:2:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~1_combout\);

-- Location: LCFF_X20_Y26_N19
\dp|p|peRowGen:3:peColGen:2:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(0));

-- Location: LCCOMB_X20_Y26_N24
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(0),
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X20_Y26_N25
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(25),
	combout => \i_data~combout\(25));

-- Location: LCCOMB_X23_Y24_N20
\dp|r|SRF|r|rGen:0:regi|q~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~25_combout\ = (!\rst~combout\ & \i_data~combout\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => \i_data~combout\(25),
	combout => \dp|r|SRF|r|rGen:0:regi|q~25_combout\);

-- Location: LCFF_X23_Y24_N11
\dp|r|SRF|r|rGen:2:regi|q[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~25_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(25));

-- Location: LCCOMB_X23_Y24_N22
\dp|r|SRF|sGen:2:hsi|Mux14~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux14~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(17)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(25),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(17),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux14~4_combout\);

-- Location: LCCOMB_X23_Y24_N0
\dp|r|SRF|sGen:2:hsi|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux6~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux14~4_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux14~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux14~3_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux14~4_combout\,
	datac => \dp|hmode_cnt|cnt_out\(2),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux6~0_combout\);

-- Location: LCFF_X23_Y24_N5
\dp|r|SRF|r|rGen:2:regi|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~7_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(9));

-- Location: LCCOMB_X23_Y24_N4
\dp|r|SRF|sGen:2:hsi|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux6~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux6~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(25)))) # (!\dp|r|SRF|sGen:2:hsi|Mux6~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(9))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (\dp|r|SRF|sGen:2:hsi|Mux6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux6~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(9),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(25),
	combout => \dp|r|SRF|sGen:2:hsi|Mux6~1_combout\);

-- Location: LCFF_X23_Y24_N19
\dp|r|SRF|r|rGen:0:regi|q[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~25_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(25));

-- Location: LCCOMB_X23_Y24_N8
\dp|r|SRF|sGen:0:hsi|Mux14~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux14~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(17))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(17),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(25),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux14~4_combout\);

-- Location: LCCOMB_X22_Y22_N10
\dp|r|SRF|sGen:0:hsi|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux6~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:0:regi|q\(9))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:0:hsi|Mux14~4_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(9),
	datad => \dp|r|SRF|sGen:0:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux6~0_combout\);

-- Location: LCCOMB_X22_Y22_N20
\dp|r|SRF|sGen:0:hsi|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux6~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux6~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux6~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(25)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux6~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux14~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux14~3_combout\,
	datab => \dp|r|SRF|r|rGen:0:regi|q\(25),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux6~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux6~1_combout\);

-- Location: LCCOMB_X20_Y24_N12
\dp|p|peRowGen:3:peColGen:2:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux6~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux6~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux6~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\);

-- Location: LCFF_X24_Y24_N27
\dp|r|SRF|r|rGen:3:regi|q[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~25_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(25));

-- Location: LCCOMB_X24_Y24_N26
\dp|r|SRF|sGen:3:hsi|Mux14~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux14~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(17))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:3:regi|q\(17),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(25),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:3:hsi|Mux14~4_combout\);

-- Location: LCCOMB_X24_Y24_N4
\dp|r|SRF|sGen:3:hsi|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux6~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:3:regi|q\(9))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:3:hsi|Mux14~4_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(9),
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y24_N12
\dp|r|SRF|sGen:3:hsi|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux6~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux6~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux6~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(25))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux6~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux14~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(25),
	datab => \dp|r|SRF|sGen:3:hsi|Mux14~3_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux6~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux6~1_combout\);

-- Location: LCFF_X24_Y24_N23
\dp|r|SRF|r|rGen:1:regi|q[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~25_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(25));

-- Location: LCCOMB_X24_Y24_N22
\dp|r|SRF|sGen:1:hsi|Mux14~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux14~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(17))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:1:regi|q\(17),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(25),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux14~4_combout\);

-- Location: LCCOMB_X24_Y24_N24
\dp|r|SRF|sGen:1:hsi|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux6~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux14~4_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux14~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:1:hsi|Mux14~3_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y24_N28
\dp|r|SRF|sGen:1:hsi|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux6~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux6~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(25))) # (!\dp|r|SRF|sGen:1:hsi|Mux6~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(9)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(25),
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(9),
	datad => \dp|r|SRF|sGen:1:hsi|Mux6~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux6~1_combout\);

-- Location: LCCOMB_X20_Y24_N22
\dp|p|peRowGen:2:peColGen:2:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux6~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux6~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux6~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\);

-- Location: LCCOMB_X20_Y26_N20
\dp|p|peRowGen:3:peColGen:2:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~3_combout\);

-- Location: LCFF_X20_Y26_N21
\dp|p|peRowGen:3:peColGen:2:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(1));

-- Location: LCCOMB_X19_Y26_N2
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_im\(1) $ (((\dp|p|peRowGen:3:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(0),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0),
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X20_Y26_N26
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1) $ (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X20_Y26_N27
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1));

-- Location: LCCOMB_X20_Y26_N30
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N0
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1))))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1))) # (!\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(1),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(26),
	combout => \i_data~combout\(26));

-- Location: LCCOMB_X24_Y25_N4
\dp|r|SRF|r|rGen:0:regi|q~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~26_combout\ = (\i_data~combout\(26) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_data~combout\(26),
	datad => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~26_combout\);

-- Location: LCFF_X23_Y25_N17
\dp|r|SRF|r|rGen:0:regi|q[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~26_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(26));

-- Location: LCCOMB_X23_Y25_N16
\dp|r|SRF|sGen:0:hsi|Mux13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux13~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(18)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(26),
	datad => \dp|r|SRF|r|rGen:0:regi|q\(18),
	combout => \dp|r|SRF|sGen:0:hsi|Mux13~4_combout\);

-- Location: LCCOMB_X22_Y25_N12
\dp|r|SRF|r|rGen:0:regi|q~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~12_combout\ = (\i_data~combout\(10) & !\rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_data~combout\(10),
	datad => \rst~combout\,
	combout => \dp|r|SRF|r|rGen:0:regi|q~12_combout\);

-- Location: LCFF_X23_Y25_N29
\dp|r|SRF|r|rGen:0:regi|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~12_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(10));

-- Location: LCCOMB_X23_Y25_N28
\dp|r|SRF|sGen:0:hsi|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux5~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:0:regi|q\(10)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:0:hsi|Mux13~4_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:0:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(10),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux5~0_combout\);

-- Location: LCCOMB_X23_Y25_N10
\dp|r|SRF|sGen:0:hsi|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux5~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux5~0_combout\)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux5~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(26))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux5~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux13~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux5~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(26),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~3_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux5~1_combout\);

-- Location: LCFF_X24_Y25_N31
\dp|r|SRF|r|rGen:2:regi|q[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~26_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(26));

-- Location: LCCOMB_X24_Y25_N22
\dp|r|SRF|sGen:2:hsi|Mux13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux13~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(18)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(26),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(18),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux13~4_combout\);

-- Location: LCCOMB_X24_Y25_N8
\dp|r|SRF|sGen:2:hsi|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux5~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux13~4_combout\)) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux13~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux13~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux5~0_combout\);

-- Location: LCFF_X24_Y25_N13
\dp|r|SRF|r|rGen:2:regi|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~12_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(10));

-- Location: LCCOMB_X24_Y25_N12
\dp|r|SRF|sGen:2:hsi|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux5~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux5~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(26)))) # (!\dp|r|SRF|sGen:2:hsi|Mux5~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(10))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (\dp|r|SRF|sGen:2:hsi|Mux5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux5~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(10),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(26),
	combout => \dp|r|SRF|sGen:2:hsi|Mux5~1_combout\);

-- Location: LCCOMB_X21_Y25_N16
\dp|p|peRowGen:3:peColGen:2:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux5~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux5~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux5~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\);

-- Location: LCFF_X22_Y25_N5
\dp|r|SRF|r|rGen:1:regi|q[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~26_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(26));

-- Location: LCCOMB_X22_Y25_N14
\dp|r|SRF|sGen:1:hsi|Mux13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux13~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(18)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(26),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:1:regi|q\(18),
	combout => \dp|r|SRF|sGen:1:hsi|Mux13~4_combout\);

-- Location: LCCOMB_X22_Y25_N24
\dp|r|SRF|sGen:1:hsi|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux5~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux13~4_combout\)) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux13~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:1:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux13~3_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux5~0_combout\);

-- Location: LCFF_X22_Y25_N17
\dp|r|SRF|r|rGen:1:regi|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~12_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(10));

-- Location: LCCOMB_X22_Y25_N10
\dp|r|SRF|sGen:1:hsi|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux5~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux5~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(26))) # (!\dp|r|SRF|sGen:1:hsi|Mux5~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(10)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(26),
	datac => \dp|r|SRF|sGen:1:hsi|Mux5~0_combout\,
	datad => \dp|r|SRF|r|rGen:1:regi|q\(10),
	combout => \dp|r|SRF|sGen:1:hsi|Mux5~1_combout\);

-- Location: LCFF_X22_Y25_N15
\dp|r|SRF|r|rGen:3:regi|q[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~26_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(26));

-- Location: LCCOMB_X22_Y25_N16
\dp|r|SRF|sGen:3:hsi|Mux13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux13~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(18))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(18),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:3:regi|q\(26),
	combout => \dp|r|SRF|sGen:3:hsi|Mux13~4_combout\);

-- Location: LCCOMB_X25_Y24_N16
\dp|r|SRF|sGen:3:hsi|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux5~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:3:regi|q\(10))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:3:hsi|Mux13~4_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|hmode_cnt|cnt_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(10),
	datab => \dp|r|SRF|sGen:3:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:3:hsi|Mux5~0_combout\);

-- Location: LCCOMB_X22_Y25_N20
\dp|r|SRF|sGen:3:hsi|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux5~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux5~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux5~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(26)))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux5~0_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux13~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux13~3_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(26),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux5~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux5~1_combout\);

-- Location: LCCOMB_X21_Y25_N2
\dp|p|peRowGen:2:peColGen:2:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux5~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:1:hsi|Mux5~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:3:hsi|Mux5~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\);

-- Location: LCCOMB_X21_Y25_N6
\dp|p|peRowGen:3:peColGen:2:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~5_combout\);

-- Location: LCFF_X21_Y25_N7
\dp|p|peRowGen:3:peColGen:2:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(2));

-- Location: LCCOMB_X21_Y25_N8
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(2),
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N9
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2));

-- Location: LCFF_X22_Y24_N21
\dp|r|SRF|r|rGen:3:regi|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~17_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(11));

-- Location: LCFF_X22_Y24_N23
\dp|r|SRF|r|rGen:3:regi|q[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~18_combout\,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(19));

-- Location: LCCOMB_X22_Y24_N6
\dp|r|SRF|sGen:3:hsi|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux12~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(19)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:3:regi|q\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(27),
	datab => \dp|hmode_cnt|cnt_out\(1),
	datad => \dp|r|SRF|r|rGen:3:regi|q\(19),
	combout => \dp|r|SRF|sGen:3:hsi|Mux12~4_combout\);

-- Location: LCCOMB_X22_Y24_N16
\dp|r|SRF|sGen:3:hsi|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux4~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:3:regi|q\(11))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & 
-- ((\dp|r|SRF|sGen:3:hsi|Mux12~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(11),
	datad => \dp|r|SRF|sGen:3:hsi|Mux12~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux4~0_combout\);

-- Location: LCCOMB_X22_Y24_N10
\dp|r|SRF|sGen:3:hsi|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux4~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux4~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux4~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(27))) # 
-- (!\dp|r|SRF|sGen:3:hsi|Mux4~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux12~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(27),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux4~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux12~3_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux4~1_combout\);

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(27),
	combout => \i_data~combout\(27));

-- Location: LCCOMB_X22_Y24_N12
\dp|r|SRF|r|rGen:0:regi|q~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~27_combout\ = (!\rst~combout\ & \i_data~combout\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datac => \i_data~combout\(27),
	combout => \dp|r|SRF|r|rGen:0:regi|q~27_combout\);

-- Location: LCFF_X22_Y25_N7
\dp|r|SRF|r|rGen:1:regi|q[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~27_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(27));

-- Location: LCCOMB_X22_Y25_N8
\dp|r|SRF|sGen:1:hsi|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux12~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:1:regi|q\(19)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(27),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(19),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:1:hsi|Mux12~4_combout\);

-- Location: LCCOMB_X22_Y25_N0
\dp|r|SRF|sGen:1:hsi|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux4~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux12~4_combout\)) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux12~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:1:hsi|Mux12~4_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux12~3_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux4~0_combout\);

-- Location: LCCOMB_X22_Y25_N6
\dp|r|SRF|sGen:1:hsi|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux4~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:1:hsi|Mux4~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(27)))) # (!\dp|r|SRF|sGen:1:hsi|Mux4~0_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(11))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:1:hsi|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(11),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(27),
	datad => \dp|r|SRF|sGen:1:hsi|Mux4~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux4~1_combout\);

-- Location: LCCOMB_X20_Y24_N0
\dp|p|peRowGen:2:peColGen:2:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux4~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:3:hsi|Mux4~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:1:hsi|Mux4~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\);

-- Location: LCCOMB_X19_Y25_N16
\dp|p|peRowGen:3:peColGen:2:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\,
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~7_combout\);

-- Location: LCFF_X19_Y25_N17
\dp|p|peRowGen:3:peColGen:2:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3));

-- Location: LCCOMB_X20_Y26_N10
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y26_N24
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N25
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3));

-- Location: LCCOMB_X19_Y26_N26
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N27
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4));

-- Location: LCCOMB_X19_Y26_N28
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N29
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5));

-- Location: LCCOMB_X19_Y26_N30
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N31
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6));

-- Location: LCCOMB_X19_Y26_N0
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N1
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7));

-- Location: LCCOMB_X19_Y25_N0
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N28
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4) & 
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X20_Y26_N22
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N16
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N2
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7)) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7),
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N4
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X20_Y26_N5
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8));

-- Location: LCCOMB_X20_Y26_N12
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N14
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X20_Y26_N15
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9));

-- Location: LCCOMB_X20_Y26_N6
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9) & ((\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9) & (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y26_N8
\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:2:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(10),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X20_Y26_N9
\dp|p|peRowGen:3:peColGen:2:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(10));

-- Location: LCCOMB_X22_Y25_N18
\dp|r|SRF|sGen:0:hsi|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ = (\dp|hmode_cnt|cnt_out\(0)) # (\dp|hmode_cnt|cnt_out\(1) $ (!\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|hmode_cnt|cnt_out\(0),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\);

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(28),
	combout => \i_data~combout\(28));

-- Location: LCCOMB_X23_Y23_N16
\dp|r|SRF|r|rGen:0:regi|q~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~28_combout\ = (!\rst~combout\ & \i_data~combout\(28))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(28),
	combout => \dp|r|SRF|r|rGen:0:regi|q~28_combout\);

-- Location: LCFF_X24_Y23_N23
\dp|r|SRF|r|rGen:1:regi|q[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~28_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(28));

-- Location: LCCOMB_X24_Y23_N10
\dp|r|SRF|sGen:1:hsi|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux3~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(12)) # ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(20) & 
-- !\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:1:regi|q\(12),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(20),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux3~0_combout\);

-- Location: LCCOMB_X24_Y23_N22
\dp|r|SRF|sGen:1:hsi|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux3~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux3~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(28)))) # (!\dp|r|SRF|sGen:1:hsi|Mux3~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux15~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:1:hsi|Mux15~4_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(28),
	datad => \dp|r|SRF|sGen:1:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux3~1_combout\);

-- Location: LCCOMB_X22_Y22_N14
\dp|r|SRF|sGen:0:hsi|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ = (\dp|hmode_cnt|cnt_out\(2)) # ((!\dp|hmode_cnt|cnt_out\(0) & !\dp|hmode_cnt|cnt_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(0),
	datac => \dp|hmode_cnt|cnt_out\(2),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\);

-- Location: LCCOMB_X23_Y23_N12
\dp|r|SRF|sGen:3:hsi|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux3~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\) # (\dp|r|SRF|sGen:3:hsi|Mux15~4_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(20) & 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(20),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux15~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux3~0_combout\);

-- Location: LCCOMB_X23_Y23_N22
\dp|r|SRF|sGen:3:hsi|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux3~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(28))) # (!\dp|r|SRF|sGen:3:hsi|Mux3~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(12)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(28),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(12),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux3~1_combout\);

-- Location: LCCOMB_X29_Y23_N16
\dp|p|peRowGen:2:peColGen:3:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux3~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux3~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\);

-- Location: LCFF_X23_Y22_N23
\dp|r|SRF|r|rGen:0:regi|q[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~28_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(28));

-- Location: LCFF_X23_Y22_N9
\dp|r|SRF|r|rGen:0:regi|q[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~24_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(24));

-- Location: LCCOMB_X23_Y22_N8
\dp|r|SRF|sGen:0:hsi|Mux15~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux15~7_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(16))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:0:regi|q\(16),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(24),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux15~7_combout\);

-- Location: LCCOMB_X23_Y22_N28
\dp|r|SRF|sGen:0:hsi|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux3~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~7_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(20),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~7_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux3~2_combout\);

-- Location: LCCOMB_X23_Y22_N22
\dp|r|SRF|sGen:0:hsi|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux3~3_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~2_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(28)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~2_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(12))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:0:regi|q\(12),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(28),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~2_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux3~3_combout\);

-- Location: LCFF_X22_Y22_N3
\dp|r|SRF|r|rGen:2:regi|q[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~28_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(28));

-- Location: LCCOMB_X22_Y22_N0
\dp|r|SRF|sGen:2:hsi|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux3~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(12)) # ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:2:regi|q\(20) & 
-- !\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(12),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(20),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux3~0_combout\);

-- Location: LCCOMB_X22_Y22_N2
\dp|r|SRF|sGen:2:hsi|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux3~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux3~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(28)))) # (!\dp|r|SRF|sGen:2:hsi|Mux3~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux15~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(28),
	datad => \dp|r|SRF|sGen:2:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux3~1_combout\);

-- Location: LCCOMB_X29_Y24_N14
\dp|p|peRowGen:3:peColGen:3:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux3~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux3~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\);

-- Location: LCCOMB_X29_Y22_N28
\dp|p|peRowGen:3:peColGen:3:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~1_combout\);

-- Location: LCFF_X29_Y22_N29
\dp|p|peRowGen:3:peColGen:3:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(0));

-- Location: LCCOMB_X29_Y22_N0
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(0),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N1
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0));

-- Location: LCFF_X24_Y24_N9
\dp|r|SRF|r|rGen:1:regi|q[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~21_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(21));

-- Location: LCCOMB_X24_Y24_N8
\dp|r|SRF|sGen:1:hsi|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux2~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(13)) # ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(21) & 
-- !\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(13),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(21),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux2~0_combout\);

-- Location: LCCOMB_X24_Y24_N6
\dp|r|SRF|sGen:1:hsi|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux2~1_combout\ = (\dp|r|SRF|sGen:1:hsi|Mux2~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(29)) # ((!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:1:hsi|Mux2~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux14~4_combout\ & 
-- \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:1:regi|q\(29),
	datab => \dp|r|SRF|sGen:1:hsi|Mux14~4_combout\,
	datac => \dp|r|SRF|sGen:1:hsi|Mux2~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux2~1_combout\);

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(29),
	combout => \i_data~combout\(29));

-- Location: LCCOMB_X24_Y24_N16
\dp|r|SRF|r|rGen:0:regi|q~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~29_combout\ = (!\rst~combout\ & \i_data~combout\(29))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(29),
	combout => \dp|r|SRF|r|rGen:0:regi|q~29_combout\);

-- Location: LCFF_X25_Y24_N13
\dp|r|SRF|r|rGen:3:regi|q[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~29_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(29));

-- Location: LCCOMB_X25_Y24_N26
\dp|r|SRF|sGen:3:hsi|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux2~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux14~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(21),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux2~0_combout\);

-- Location: LCCOMB_X25_Y24_N12
\dp|r|SRF|sGen:3:hsi|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux2~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux2~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(29)))) # (!\dp|r|SRF|sGen:3:hsi|Mux2~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(13))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(13),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(29),
	datad => \dp|r|SRF|sGen:3:hsi|Mux2~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux2~1_combout\);

-- Location: LCCOMB_X29_Y24_N26
\dp|p|peRowGen:2:peColGen:3:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux2~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux2~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux2~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\);

-- Location: LCCOMB_X23_Y24_N28
\dp|r|SRF|sGen:2:hsi|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux2~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(13)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(21),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(13),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux2~0_combout\);

-- Location: LCFF_X23_Y24_N15
\dp|r|SRF|r|rGen:2:regi|q[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~29_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(29));

-- Location: LCCOMB_X23_Y24_N14
\dp|r|SRF|sGen:2:hsi|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux2~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux2~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(29))) # (!\dp|r|SRF|sGen:2:hsi|Mux2~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux14~4_combout\))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux2~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(29),
	datad => \dp|r|SRF|sGen:2:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux2~1_combout\);

-- Location: LCFF_X22_Y22_N7
\dp|r|SRF|r|rGen:0:regi|q[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~29_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(29));

-- Location: LCFF_X23_Y23_N3
\dp|r|SRF|r|rGen:0:regi|q[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~21_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(21));

-- Location: LCCOMB_X22_Y22_N28
\dp|r|SRF|sGen:0:hsi|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux2~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux14~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(21),
	datad => \dp|r|SRF|sGen:0:hsi|Mux14~4_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux2~0_combout\);

-- Location: LCCOMB_X22_Y22_N6
\dp|r|SRF|sGen:0:hsi|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux2~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux2~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(29)))) # (!\dp|r|SRF|sGen:0:hsi|Mux2~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(13))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(13),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(29),
	datad => \dp|r|SRF|sGen:0:hsi|Mux2~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux2~1_combout\);

-- Location: LCCOMB_X29_Y24_N24
\dp|p|peRowGen:3:peColGen:3:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux2~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux2~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux2~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\);

-- Location: LCCOMB_X29_Y22_N22
\dp|p|peRowGen:3:peColGen:3:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~3_combout\);

-- Location: LCFF_X29_Y22_N23
\dp|p|peRowGen:3:peColGen:3:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(1));

-- Location: LCCOMB_X29_Y22_N2
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:3:peij|q_im\(1) $ (((\dp|p|peRowGen:3:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(1),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(0),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X27_Y22_N16
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1) $ (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X27_Y22_N17
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1));

-- Location: LCCOMB_X23_Y25_N4
\dp|r|SRF|sGen:0:hsi|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux1~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux13~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(22),
	datad => \dp|r|SRF|sGen:0:hsi|Mux13~4_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux1~0_combout\);

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(30),
	combout => \i_data~combout\(30));

-- Location: LCCOMB_X25_Y23_N24
\dp|r|SRF|r|rGen:0:regi|q~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~30_combout\ = (!\rst~combout\ & \i_data~combout\(30))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \i_data~combout\(30),
	combout => \dp|r|SRF|r|rGen:0:regi|q~30_combout\);

-- Location: LCFF_X23_Y25_N7
\dp|r|SRF|r|rGen:0:regi|q[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~30_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(30));

-- Location: LCCOMB_X23_Y25_N6
\dp|r|SRF|sGen:0:hsi|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux1~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux1~0_combout\ & (((\dp|r|SRF|r|rGen:0:regi|q\(30)) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux1~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(14) & 
-- ((\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(14),
	datab => \dp|r|SRF|sGen:0:hsi|Mux1~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(30),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux1~1_combout\);

-- Location: LCFF_X24_Y25_N21
\dp|r|SRF|r|rGen:2:regi|q[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~30_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(30));

-- Location: LCCOMB_X24_Y25_N10
\dp|r|SRF|sGen:2:hsi|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux1~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\) # (\dp|r|SRF|r|rGen:2:regi|q\(14))))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(22) & 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:2:regi|q\(22),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datad => \dp|r|SRF|r|rGen:2:regi|q\(14),
	combout => \dp|r|SRF|sGen:2:hsi|Mux1~0_combout\);

-- Location: LCCOMB_X24_Y25_N20
\dp|r|SRF|sGen:2:hsi|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux1~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux1~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(30)))) # (!\dp|r|SRF|sGen:2:hsi|Mux1~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux13~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(30),
	datad => \dp|r|SRF|sGen:2:hsi|Mux1~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux1~1_combout\);

-- Location: LCCOMB_X27_Y22_N0
\dp|p|peRowGen:3:peColGen:3:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux1~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux1~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux1~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\);

-- Location: LCFF_X22_Y25_N29
\dp|r|SRF|r|rGen:1:regi|q[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~30_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(30));

-- Location: LCCOMB_X23_Y25_N24
\dp|r|SRF|sGen:1:hsi|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux1~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(14)) # (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (\dp|r|SRF|r|rGen:1:regi|q\(22) & 
-- ((!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:1:regi|q\(22),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(14),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux1~0_combout\);

-- Location: LCCOMB_X22_Y25_N28
\dp|r|SRF|sGen:1:hsi|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux1~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux1~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(30)))) # (!\dp|r|SRF|sGen:1:hsi|Mux1~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux13~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux13~4_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(30),
	datad => \dp|r|SRF|sGen:1:hsi|Mux1~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux1~1_combout\);

-- Location: LCCOMB_X25_Y24_N14
\dp|r|SRF|sGen:3:hsi|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux1~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux13~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(22),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux13~4_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux1~0_combout\);

-- Location: LCCOMB_X25_Y23_N10
\dp|r|SRF|sGen:3:hsi|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux1~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux1~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(30))) # (!\dp|r|SRF|sGen:3:hsi|Mux1~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(14)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:3:regi|q\(30),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(14),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux1~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux1~1_combout\);

-- Location: LCCOMB_X27_Y22_N26
\dp|p|peRowGen:2:peColGen:3:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux1~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux1~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux1~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\);

-- Location: LCCOMB_X27_Y22_N8
\dp|p|peRowGen:3:peColGen:3:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~5_combout\);

-- Location: LCFF_X27_Y22_N9
\dp|p|peRowGen:3:peColGen:3:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(2));

-- Location: LCCOMB_X26_Y22_N16
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y22_N18
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im\(1) & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:3:peColGen:3:peij|q_im\(1) & (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1))))) # (!\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im\(1) & 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(1),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X27_Y22_N2
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(2) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(2),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N3
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2));

-- Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\i_data[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_i_data(31),
	combout => \i_data~combout\(31));

-- Location: LCCOMB_X22_Y24_N30
\dp|r|SRF|r|rGen:0:regi|q~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|r|rGen:0:regi|q~31_combout\ = (!\rst~combout\ & \i_data~combout\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \i_data~combout\(31),
	combout => \dp|r|SRF|r|rGen:0:regi|q~31_combout\);

-- Location: LCFF_X22_Y24_N9
\dp|r|SRF|r|rGen:3:regi|q[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~31_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(31));

-- Location: LCCOMB_X22_Y24_N28
\dp|r|SRF|sGen:3:hsi|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux0~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux12~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(23),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux12~4_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux0~0_combout\);

-- Location: LCCOMB_X22_Y24_N14
\dp|r|SRF|sGen:3:hsi|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux0~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux0~0_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(31)))) # (!\dp|r|SRF|sGen:3:hsi|Mux0~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(15))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(15),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(31),
	datad => \dp|r|SRF|sGen:3:hsi|Mux0~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux0~1_combout\);

-- Location: LCFF_X22_Y25_N23
\dp|r|SRF|r|rGen:1:regi|q[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~31_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:1:regi|q\(31));

-- Location: LCCOMB_X22_Y25_N2
\dp|r|SRF|sGen:1:hsi|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux0~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(15)) # ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:1:regi|q\(23) & 
-- !\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datab => \dp|r|SRF|r|rGen:1:regi|q\(15),
	datac => \dp|r|SRF|r|rGen:1:regi|q\(23),
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux0~0_combout\);

-- Location: LCCOMB_X22_Y25_N22
\dp|r|SRF|sGen:1:hsi|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:1:hsi|Mux0~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux0~0_combout\ & ((\dp|r|SRF|r|rGen:1:regi|q\(31)))) # (!\dp|r|SRF|sGen:1:hsi|Mux0~0_combout\ & (\dp|r|SRF|sGen:1:hsi|Mux12~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:1:hsi|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux12~4_combout\,
	datac => \dp|r|SRF|r|rGen:1:regi|q\(31),
	datad => \dp|r|SRF|sGen:1:hsi|Mux0~0_combout\,
	combout => \dp|r|SRF|sGen:1:hsi|Mux0~1_combout\);

-- Location: LCCOMB_X26_Y24_N10
\dp|p|peRowGen:2:peColGen:3:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux0~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux0~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux0~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\);

-- Location: LCFF_X22_Y23_N7
\dp|r|SRF|r|rGen:2:regi|q[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~31_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(31));

-- Location: LCFF_X22_Y23_N3
\dp|r|SRF|r|rGen:2:regi|q[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|r|SRF|r|rGen:0:regi|q~23_combout\,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(23));

-- Location: LCCOMB_X22_Y23_N28
\dp|r|SRF|sGen:2:hsi|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux0~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(15)) # ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|r|rGen:2:regi|q\(23) & 
-- !\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(15),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(23),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux0~0_combout\);

-- Location: LCCOMB_X22_Y23_N6
\dp|r|SRF|sGen:2:hsi|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux0~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux0~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(31)))) # (!\dp|r|SRF|sGen:2:hsi|Mux0~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux12~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux12~4_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	datac => \dp|r|SRF|r|rGen:2:regi|q\(31),
	datad => \dp|r|SRF|sGen:2:hsi|Mux0~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux0~1_combout\);

-- Location: LCFF_X21_Y23_N5
\dp|r|SRF|r|rGen:0:regi|q[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~31_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(31));

-- Location: LCFF_X21_Y23_N21
\dp|r|SRF|r|rGen:0:regi|q[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~18_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(19));

-- Location: LCFF_X21_Y23_N31
\dp|r|SRF|r|rGen:0:regi|q[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~27_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(27));

-- Location: LCCOMB_X21_Y23_N8
\dp|r|SRF|sGen:0:hsi|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux12~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(19))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:0:regi|q\(19),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(27),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux12~4_combout\);

-- Location: LCCOMB_X21_Y23_N10
\dp|r|SRF|sGen:0:hsi|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux0~0_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux12~4_combout\))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(23),
	datab => \dp|r|SRF|sGen:0:hsi|Mux12~4_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux3~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux0~0_combout\);

-- Location: LCCOMB_X21_Y23_N4
\dp|r|SRF|sGen:0:hsi|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux0~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux0~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(31)))) # (!\dp|r|SRF|sGen:0:hsi|Mux0~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(15))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux3~1_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(15),
	datab => \dp|r|SRF|sGen:0:hsi|Mux3~1_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(31),
	datad => \dp|r|SRF|sGen:0:hsi|Mux0~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux0~1_combout\);

-- Location: LCCOMB_X26_Y24_N8
\dp|p|peRowGen:3:peColGen:3:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux0~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux0~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux0~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\);

-- Location: LCCOMB_X30_Y22_N14
\dp|p|peRowGen:3:peColGen:3:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|q_im~7_combout\);

-- Location: LCFF_X30_Y22_N15
\dp|p|peRowGen:3:peColGen:3:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3));

-- Location: LCCOMB_X30_Y22_N16
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X30_Y22_N17
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3));

-- Location: LCCOMB_X26_Y22_N20
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(2))))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(2),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y22_N26
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y22_N10
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X30_Y22_N11
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4));

-- Location: LCCOMB_X30_Y22_N20
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y22_N30
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4) & 
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X27_Y22_N4
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N5
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5));

-- Location: LCCOMB_X26_Y22_N8
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y22_N30
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N31
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6));

-- Location: LCCOMB_X26_Y22_N10
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y22_N24
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N25
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7));

-- Location: LCCOMB_X26_Y22_N4
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y22_N18
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N19
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8));

-- Location: LCCOMB_X26_Y22_N22
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y22_N20
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N21
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9));

-- Location: LCCOMB_X26_Y22_N24
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9) & ((\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9) & (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y22_N4
\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:3:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:3:peColGen:3:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(10),
	datad => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X30_Y22_N5
\dp|p|peRowGen:3:peColGen:3:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:3:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(10));

-- Location: LCCOMB_X24_Y22_N8
\dp|p|peRowGen:2:peColGen:0:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux63~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux63~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux63~5_combout\,
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux63~3_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|q_im~0_combout\);

-- Location: LCFF_X24_Y22_N9
\dp|p|peRowGen:2:peColGen:0:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(0));

-- Location: LCCOMB_X25_Y22_N26
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X25_Y22_N27
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0));

-- Location: LCCOMB_X25_Y22_N4
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1),
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X25_Y22_N5
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1));

-- Location: LCCOMB_X24_Y25_N14
\dp|r|Mux61~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(18)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:2:regi|q\(18) & \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(18),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(18),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	combout => \dp|r|Mux61~4_combout\);

-- Location: LCCOMB_X24_Y21_N4
\dp|r|Mux61~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~5_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux61~4_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux61~4_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux13~2_combout\)) # (!\dp|r|Mux61~4_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux13~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux61~4_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux13~2_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux13~2_combout\,
	combout => \dp|r|Mux61~5_combout\);

-- Location: LCCOMB_X24_Y21_N20
\dp|p|peRowGen:2:peColGen:0:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux61~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux61~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux61~5_combout\,
	datad => \dp|r|Mux61~3_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|q_im~2_combout\);

-- Location: LCFF_X24_Y21_N21
\dp|p|peRowGen:2:peColGen:0:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(2));

-- Location: LCCOMB_X24_Y22_N30
\dp|r|Mux62~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(17)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:2:regi|q\(17) & \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(17),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(17),
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	combout => \dp|r|Mux62~4_combout\);

-- Location: LCCOMB_X24_Y22_N16
\dp|r|Mux62~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~5_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux62~4_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux62~4_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux14~2_combout\))) # (!\dp|r|Mux62~4_combout\ & 
-- (\dp|r|SRF|sGen:2:hsi|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux62~4_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux14~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux14~2_combout\,
	combout => \dp|r|Mux62~5_combout\);

-- Location: LCCOMB_X25_Y22_N18
\dp|p|peRowGen:2:peColGen:0:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux62~3_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux62~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux62~3_combout\,
	datad => \dp|r|Mux62~5_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|q_im~1_combout\);

-- Location: LCFF_X25_Y22_N19
\dp|p|peRowGen:2:peColGen:0:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(1));

-- Location: LCCOMB_X26_Y22_N2
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y22_N12
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(1),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X25_Y22_N14
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(2) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(2),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X25_Y22_N15
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2));

-- Location: LCCOMB_X27_Y23_N22
\dp|r|Mux60~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~5_combout\ = (\dp|r|Mux60~4_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\) # ((\dp|r|SRF|sGen:0:hsi|Mux12~2_combout\)))) # (!\dp|r|Mux60~4_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux12~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux60~4_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux12~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux12~2_combout\,
	combout => \dp|r|Mux60~5_combout\);

-- Location: LCCOMB_X26_Y21_N8
\dp|p|peRowGen:2:peColGen:0:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux60~3_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux60~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|Mux60~3_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|r|Mux60~5_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|q_im~3_combout\);

-- Location: LCFF_X26_Y21_N9
\dp|p|peRowGen:2:peColGen:0:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3));

-- Location: LCCOMB_X26_Y21_N16
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N17
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3));

-- Location: LCCOMB_X26_Y22_N6
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(2))))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(2),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N12
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N2
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N3
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4));

-- Location: LCCOMB_X26_Y21_N30
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y22_N0
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3) & 
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3)) # 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X26_Y21_N4
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N5
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5));

-- Location: LCCOMB_X26_Y22_N26
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N6
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N7
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6));

-- Location: LCCOMB_X26_Y22_N28
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N24
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N25
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7));

-- Location: LCCOMB_X26_Y22_N14
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N10
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N11
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8));

-- Location: LCCOMB_X26_Y21_N0
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N20
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N21
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9));

-- Location: LCCOMB_X26_Y21_N18
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9) & ((\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9) & (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9),
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N14
\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:0:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(10),
	datad => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X26_Y21_N15
\dp|p|peRowGen:2:peColGen:0:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(10));

-- Location: LCCOMB_X31_Y24_N18
\dp|p|peRowGen:2:peColGen:1:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux11~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux11~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux11~1_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux11~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\);

-- Location: LCCOMB_X32_Y23_N10
\dp|p|peRowGen:2:peColGen:1:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~5_combout\);

-- Location: LCFF_X32_Y23_N11
\dp|p|peRowGen:2:peColGen:1:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(0));

-- Location: LCCOMB_X32_Y23_N16
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(0),
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X32_Y23_N17
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0));

-- Location: LCCOMB_X32_Y23_N26
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1),
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X32_Y23_N27
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1));

-- Location: LCCOMB_X32_Y23_N6
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N24
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1))) # (!\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(1),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X31_Y23_N28
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(2) $ (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(2),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X31_Y23_N29
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2));

-- Location: LCCOMB_X31_Y23_N20
\dp|p|peRowGen:2:peColGen:1:peij|q_im~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux9~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|sGen:0:hsi|Mux9~1_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux9~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\);

-- Location: LCCOMB_X31_Y23_N24
\dp|p|peRowGen:2:peColGen:1:peij|q_im~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~9_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~9_combout\);

-- Location: LCFF_X31_Y23_N25
\dp|p|peRowGen:2:peColGen:1:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_im~9_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(2));

-- Location: LCCOMB_X32_Y23_N18
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(2),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCFF_X22_Y23_N9
\dp|r|SRF|r|rGen:2:regi|q[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~15_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(15));

-- Location: LCCOMB_X22_Y23_N8
\dp|r|SRF|sGen:2:hsi|Mux12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux12~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(15)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(23),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(15),
	combout => \dp|r|SRF|sGen:2:hsi|Mux12~3_combout\);

-- Location: LCCOMB_X22_Y23_N20
\dp|r|SRF|sGen:2:hsi|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux8~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux12~3_combout\)) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux12~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux12~3_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux12~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux8~1_combout\);

-- Location: LCCOMB_X22_Y23_N22
\dp|r|SRF|sGen:2:hsi|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux8~2_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~1_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(23))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~1_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(7)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:2:hsi|Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(23),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~1_combout\,
	datad => \dp|r|SRF|r|rGen:2:regi|q\(7),
	combout => \dp|r|SRF|sGen:2:hsi|Mux8~2_combout\);

-- Location: LCFF_X21_Y23_N17
\dp|r|SRF|r|rGen:0:regi|q[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~23_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(23));

-- Location: LCCOMB_X21_Y23_N16
\dp|r|SRF|sGen:0:hsi|Mux12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux12~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(15))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(15),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(23),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux12~3_combout\);

-- Location: LCCOMB_X21_Y23_N22
\dp|r|SRF|sGen:0:hsi|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux8~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|r|rGen:0:regi|q\(7))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:0:hsi|Mux12~3_combout\))))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|hmode_cnt|cnt_out\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(7),
	datad => \dp|r|SRF|sGen:0:hsi|Mux12~3_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux8~0_combout\);

-- Location: LCFF_X21_Y23_N19
\dp|r|SRF|r|rGen:0:regi|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~17_combout\,
	sload => VCC,
	ena => \dp|r|Mux64~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:0:regi|q\(11));

-- Location: LCCOMB_X21_Y23_N6
\dp|r|SRF|sGen:0:hsi|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux12~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(11)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(19),
	datad => \dp|r|SRF|r|rGen:0:regi|q\(11),
	combout => \dp|r|SRF|sGen:0:hsi|Mux12~0_combout\);

-- Location: LCCOMB_X21_Y23_N26
\dp|r|SRF|sGen:0:hsi|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux8~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux8~0_combout\)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux8~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(23))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux12~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(23),
	datad => \dp|r|SRF|sGen:0:hsi|Mux12~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux8~1_combout\);

-- Location: LCCOMB_X32_Y24_N22
\dp|p|peRowGen:2:peColGen:1:peij|q_im~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux8~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux8~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~2_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux8~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\);

-- Location: LCCOMB_X32_Y24_N2
\dp|p|peRowGen:2:peColGen:1:peij|q_im~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|q_im~11_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|q_im~11_combout\);

-- Location: LCFF_X32_Y24_N3
\dp|p|peRowGen:2:peColGen:1:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_im~11_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3));

-- Location: LCCOMB_X33_Y23_N24
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N25
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3));

-- Location: LCCOMB_X33_Y23_N28
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3)) # (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y23_N18
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N19
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4));

-- Location: LCCOMB_X32_Y24_N10
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N28
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4) & 
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X33_Y23_N20
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N21
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5));

-- Location: LCCOMB_X32_Y23_N22
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y23_N30
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N31
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6));

-- Location: LCCOMB_X33_Y23_N8
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N9
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7));

-- Location: LCCOMB_X32_Y23_N0
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N2
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N4
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X32_Y23_N5
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8));

-- Location: LCCOMB_X32_Y23_N12
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N14
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X32_Y23_N15
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9));

-- Location: LCCOMB_X32_Y23_N30
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9) & ((\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9) & (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y23_N8
\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:1:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(10),
	datad => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X32_Y23_N9
\dp|p|peRowGen:2:peColGen:1:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(10));

-- Location: LCFF_X22_Y22_N5
\dp|r|SRF|r|rGen:2:regi|q[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~24_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(24));

-- Location: LCCOMB_X22_Y22_N30
\dp|r|SRF|sGen:2:hsi|Mux15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(16)))) # (!\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|hmode_cnt|cnt_out\(1),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(24),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(16),
	combout => \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\);

-- Location: LCCOMB_X22_Y22_N16
\dp|r|SRF|sGen:2:hsi|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux7~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((!\dp|hmode_cnt|cnt_out\(2) & \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux15~3_combout\) # 
-- ((\dp|hmode_cnt|cnt_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux15~3_combout\,
	datac => \dp|hmode_cnt|cnt_out\(2),
	datad => \dp|r|SRF|sGen:2:hsi|Mux15~4_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux7~0_combout\);

-- Location: LCCOMB_X22_Y22_N4
\dp|r|SRF|sGen:2:hsi|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux7~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux7~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(24)))) # (!\dp|r|SRF|sGen:2:hsi|Mux7~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(8))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:2:hsi|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:2:regi|q\(8),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(24),
	datad => \dp|r|SRF|sGen:2:hsi|Mux7~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux7~1_combout\);

-- Location: LCCOMB_X23_Y22_N30
\dp|r|SRF|sGen:0:hsi|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux7~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:0:regi|q\(8)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:0:hsi|Mux15~7_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~7_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:0:regi|q\(8),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux7~0_combout\);

-- Location: LCCOMB_X23_Y22_N26
\dp|r|SRF|sGen:0:hsi|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux7~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux7~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux7~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(24)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux7~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux15~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~6_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(24),
	datad => \dp|r|SRF|sGen:0:hsi|Mux7~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux7~1_combout\);

-- Location: LCCOMB_X20_Y24_N2
\dp|p|peRowGen:2:peColGen:2:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux7~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux7~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux7~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux7~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\);

-- Location: LCCOMB_X20_Y25_N18
\dp|p|peRowGen:2:peColGen:2:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~5_combout\);

-- Location: LCFF_X20_Y25_N19
\dp|p|peRowGen:2:peColGen:2:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(0));

-- Location: LCCOMB_X20_Y25_N24
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(0),
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X20_Y25_N25
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0));

-- Location: LCCOMB_X19_Y26_N14
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(1) $ (((\dp|p|peRowGen:2:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(0),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0),
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X20_Y25_N26
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1) $ (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X20_Y25_N27
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1));

-- Location: LCCOMB_X20_Y25_N30
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y25_N16
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1))))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1))) # (!\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(1),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X19_Y26_N18
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(2) $ (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(2),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N19
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2));

-- Location: LCCOMB_X21_Y25_N20
\dp|p|peRowGen:2:peColGen:2:peij|q_im~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux5~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux5~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux5~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\);

-- Location: LCCOMB_X21_Y25_N0
\dp|p|peRowGen:2:peColGen:2:peij|q_im~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~9_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~9_combout\);

-- Location: LCFF_X21_Y25_N1
\dp|p|peRowGen:2:peColGen:2:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_im~9_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(2));

-- Location: LCCOMB_X20_Y25_N10
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(2),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X21_Y25_N26
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N27
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3));

-- Location: LCCOMB_X21_Y25_N14
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X21_Y23_N18
\dp|r|SRF|sGen:0:hsi|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux4~0_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|r|rGen:0:regi|q\(11)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:0:hsi|Mux12~4_combout\)))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|hmode_cnt|cnt_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux12~4_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(11),
	datad => \dp|hmode_cnt|cnt_out\(2),
	combout => \dp|r|SRF|sGen:0:hsi|Mux4~0_combout\);

-- Location: LCCOMB_X21_Y23_N30
\dp|r|SRF|sGen:0:hsi|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux4~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux4~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux4~0_combout\ & ((\dp|r|SRF|r|rGen:0:regi|q\(27)))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux4~0_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux12~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux12~3_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(27),
	datad => \dp|r|SRF|sGen:0:hsi|Mux4~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux4~1_combout\);

-- Location: LCFF_X21_Y23_N13
\dp|r|SRF|r|rGen:2:regi|q[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~27_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:2:regi|q\(27));

-- Location: LCCOMB_X21_Y23_N12
\dp|r|SRF|sGen:2:hsi|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux12~4_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(19))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(19),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(27),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux12~4_combout\);

-- Location: LCCOMB_X22_Y23_N18
\dp|r|SRF|sGen:2:hsi|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux4~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux12~4_combout\))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (\dp|r|SRF|sGen:2:hsi|Mux12~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|sGen:2:hsi|Mux12~3_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux12~4_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux4~0_combout\);

-- Location: LCCOMB_X21_Y23_N0
\dp|r|SRF|sGen:2:hsi|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux4~1_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|sGen:2:hsi|Mux4~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(27))) # (!\dp|r|SRF|sGen:2:hsi|Mux4~0_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(11)))))) # (!\dp|hmode_cnt|cnt_out\(2) & 
-- (((\dp|r|SRF|sGen:2:hsi|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(27),
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(11),
	datad => \dp|r|SRF|sGen:2:hsi|Mux4~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux4~1_combout\);

-- Location: LCCOMB_X19_Y25_N6
\dp|p|peRowGen:2:peColGen:2:peij|q_im~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux4~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux4~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux4~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\);

-- Location: LCCOMB_X19_Y25_N10
\dp|p|peRowGen:2:peColGen:2:peij|q_im~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~11_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~3_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~11_combout\);

-- Location: LCFF_X19_Y25_N11
\dp|p|peRowGen:2:peColGen:2:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_im~11_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3));

-- Location: LCCOMB_X21_Y25_N4
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N5
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4));

-- Location: LCCOMB_X19_Y25_N18
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y25_N28
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3) & 
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3)) # 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X21_Y25_N22
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N23
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5));

-- Location: LCCOMB_X20_Y25_N22
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X21_Y25_N24
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N25
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6));

-- Location: LCCOMB_X20_Y25_N0
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X21_Y25_N18
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N19
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7));

-- Location: LCCOMB_X20_Y25_N2
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y25_N4
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X20_Y25_N5
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8));

-- Location: LCCOMB_X20_Y25_N12
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y25_N14
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X20_Y25_N15
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9));

-- Location: LCCOMB_X20_Y25_N6
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9) & ((\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9) & (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y25_N8
\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:2:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(10),
	datad => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X20_Y25_N9
\dp|p|peRowGen:2:peColGen:2:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(10));

-- Location: LCCOMB_X29_Y22_N26
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:3:peij|q_im\(0) $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N27
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0));

-- Location: LCCOMB_X29_Y23_N26
\dp|p|peRowGen:2:peColGen:3:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux3~3_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:0:hsi|Mux3~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux3~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\);

-- Location: LCCOMB_X29_Y22_N16
\dp|p|peRowGen:2:peColGen:3:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~5_combout\);

-- Location: LCFF_X29_Y22_N17
\dp|p|peRowGen:2:peColGen:3:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(0));

-- Location: LCCOMB_X29_Y24_N12
\dp|p|peRowGen:2:peColGen:3:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux2~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:2:hsi|Mux2~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:0:hsi|Mux2~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\);

-- Location: LCCOMB_X29_Y24_N22
\dp|p|peRowGen:2:peColGen:3:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~7_combout\);

-- Location: LCFF_X29_Y24_N23
\dp|p|peRowGen:2:peColGen:3:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(1));

-- Location: LCCOMB_X29_Y24_N0
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:2:peColGen:3:peij|q_im\(1) $ (((\dp|p|peRowGen:2:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(0),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(1),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X29_Y24_N8
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1) $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X29_Y24_N9
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1));

-- Location: LCCOMB_X29_Y22_N12
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y22_N30
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X27_Y22_N28
\dp|p|peRowGen:2:peColGen:3:peij|q_im~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux1~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:2:hsi|Mux1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:0:hsi|Mux1~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:2:hsi|Mux1~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\);

-- Location: LCCOMB_X27_Y22_N10
\dp|p|peRowGen:2:peColGen:3:peij|q_im~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~9_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~9_combout\);

-- Location: LCFF_X27_Y22_N11
\dp|p|peRowGen:2:peColGen:3:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_im~9_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(2));

-- Location: LCCOMB_X27_Y22_N14
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(2),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X27_Y22_N15
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2));

-- Location: LCCOMB_X30_Y22_N0
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N4
\dp|p|peRowGen:2:peColGen:3:peij|q_im~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux0~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux0~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux0~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\);

-- Location: LCCOMB_X30_Y22_N24
\dp|p|peRowGen:2:peColGen:3:peij|q_im~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|q_im~11_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~3_combout\,
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|q_im~11_combout\);

-- Location: LCFF_X30_Y22_N25
\dp|p|peRowGen:2:peColGen:3:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_im~11_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3));

-- Location: LCCOMB_X29_Y22_N20
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N21
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3));

-- Location: LCCOMB_X29_Y22_N30
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N14
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N15
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4));

-- Location: LCCOMB_X30_Y22_N2
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y22_N12
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3) & 
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3)) # 
-- (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4),
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X29_Y22_N8
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N9
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5));

-- Location: LCCOMB_X30_Y22_N22
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N18
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N19
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6));

-- Location: LCCOMB_X30_Y22_N8
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N4
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N5
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7));

-- Location: LCCOMB_X30_Y22_N18
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N6
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N7
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8));

-- Location: LCCOMB_X30_Y22_N28
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N24
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N25
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9));

-- Location: LCCOMB_X30_Y22_N6
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9) & ((\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9) & (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y22_N10
\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:2:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:2:peColGen:3:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(10),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X29_Y22_N11
\dp|p|peRowGen:2:peColGen:3:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:2:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(10));

-- Location: LCCOMB_X24_Y22_N26
\dp|r|Mux63~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~4_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:0:regi|q\(16))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|SRF|r|rGen:2:regi|q\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|r|rGen:0:regi|q\(16),
	datad => \dp|r|SRF|r|rGen:2:regi|q\(16),
	combout => \dp|r|Mux63~4_combout\);

-- Location: LCCOMB_X24_Y22_N12
\dp|r|Mux63~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~5_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (((\dp|r|Mux63~4_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux63~4_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux15~4_combout\)) # (!\dp|r|Mux63~4_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux15~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~4_combout\,
	datab => \dp|r|SRF|sGen:2:hsi|Mux15~2_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|Mux63~4_combout\,
	combout => \dp|r|Mux63~5_combout\);

-- Location: LCCOMB_X25_Y21_N26
\dp|p|peRowGen:1:peColGen:0:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux63~5_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux63~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux63~7_combout\,
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux63~5_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|q_im~0_combout\);

-- Location: LCFF_X25_Y21_N27
\dp|p|peRowGen:1:peColGen:0:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(0));

-- Location: LCCOMB_X25_Y21_N24
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X25_Y21_N25
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0));

-- Location: LCCOMB_X25_Y22_N28
\dp|r|Mux62~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:3:regi|q\(17)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(17) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(17),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:3:regi|q\(17),
	combout => \dp|r|Mux62~6_combout\);

-- Location: LCCOMB_X24_Y22_N14
\dp|r|Mux62~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux62~7_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux62~6_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux62~6_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux14~2_combout\))) # (!\dp|r|Mux62~6_combout\ & 
-- (\dp|r|SRF|sGen:1:hsi|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux62~6_combout\,
	datac => \dp|r|SRF|sGen:1:hsi|Mux14~2_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux14~2_combout\,
	combout => \dp|r|Mux62~7_combout\);

-- Location: LCCOMB_X25_Y21_N20
\dp|p|peRowGen:1:peColGen:0:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux62~5_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux62~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux62~7_combout\,
	datad => \dp|r|Mux62~5_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|q_im~1_combout\);

-- Location: LCFF_X25_Y21_N21
\dp|p|peRowGen:1:peColGen:0:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(1));

-- Location: LCCOMB_X24_Y21_N26
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_im\(1) $ (((\dp|p|peRowGen:1:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(0),
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(1),
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X25_Y21_N18
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1) $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X25_Y21_N19
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1));

-- Location: LCCOMB_X25_Y22_N6
\dp|r|Mux61~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:3:regi|q\(18)) # ((!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & \dp|r|SRF|r|rGen:1:regi|q\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:3:regi|q\(18),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:1:regi|q\(18),
	combout => \dp|r|Mux61~6_combout\);

-- Location: LCCOMB_X24_Y21_N30
\dp|r|Mux61~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux61~7_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (((\dp|r|Mux61~6_combout\)))) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux61~6_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux13~2_combout\)) # (!\dp|r|Mux61~6_combout\ & 
-- ((\dp|r|SRF|sGen:1:hsi|Mux13~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:3:hsi|Mux13~2_combout\,
	datab => \dp|r|SRF|sGen:1:hsi|Mux13~2_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|Mux61~6_combout\,
	combout => \dp|r|Mux61~7_combout\);

-- Location: LCCOMB_X24_Y21_N22
\dp|p|peRowGen:1:peColGen:0:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux61~5_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux61~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux61~5_combout\,
	datad => \dp|r|Mux61~7_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|q_im~2_combout\);

-- Location: LCFF_X24_Y21_N23
\dp|p|peRowGen:1:peColGen:0:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(2));

-- Location: LCCOMB_X25_Y21_N6
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y21_N8
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1))))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1))) # (!\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(1),
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X24_Y21_N16
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(2) $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(2),
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N17
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2));

-- Location: LCCOMB_X25_Y21_N10
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ & ((\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(2))))) # (!\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(2),
	datac => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y21_N22
\dp|r|Mux60~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux60~7_combout\ = (\dp|r|Mux60~6_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\) # ((\dp|r|SRF|sGen:3:hsi|Mux12~2_combout\)))) # (!\dp|r|Mux60~6_combout\ & (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|SRF|sGen:1:hsi|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux60~6_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux12~2_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux12~2_combout\,
	combout => \dp|r|Mux60~7_combout\);

-- Location: LCCOMB_X26_Y21_N26
\dp|p|peRowGen:1:peColGen:0:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux60~5_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux60~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|Mux60~7_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|r|Mux60~5_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|q_im~3_combout\);

-- Location: LCFF_X26_Y21_N27
\dp|p|peRowGen:1:peColGen:0:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3));

-- Location: LCCOMB_X24_Y21_N2
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N3
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3));

-- Location: LCCOMB_X24_Y21_N28
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3),
	datac => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X24_Y21_N12
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N13
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4));

-- Location: LCCOMB_X24_Y21_N6
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y21_N28
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4) & 
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3),
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4),
	datac => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X24_Y21_N14
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N15
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5));

-- Location: LCCOMB_X25_Y21_N22
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X24_Y21_N8
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N9
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6));

-- Location: LCCOMB_X25_Y21_N0
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X24_Y21_N18
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X24_Y21_N19
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7));

-- Location: LCCOMB_X25_Y21_N2
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y21_N4
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X25_Y21_N5
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8));

-- Location: LCCOMB_X25_Y21_N12
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y21_N14
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X25_Y21_N15
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9));

-- Location: LCCOMB_X25_Y21_N30
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9) & ((\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9) & (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X25_Y21_N16
\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:0:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(10),
	datad => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X25_Y21_N17
\dp|p|peRowGen:1:peColGen:0:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(10));

-- Location: LCCOMB_X31_Y24_N30
\dp|p|peRowGen:0:peColGen:1:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux11~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux11~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux11~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux11~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\);

-- Location: LCCOMB_X33_Y24_N10
\dp|p|peRowGen:1:peColGen:1:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:2:peColGen:1:peij|q_im~4_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|q_im~0_combout\);

-- Location: LCFF_X33_Y24_N11
\dp|p|peRowGen:1:peColGen:1:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(0));

-- Location: LCCOMB_X33_Y24_N16
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(0),
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X33_Y24_N17
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0));

-- Location: LCCOMB_X33_Y23_N14
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(1) $ (((\dp|p|peRowGen:1:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(1),
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X33_Y24_N18
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1) $ (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X33_Y24_N19
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1));

-- Location: LCCOMB_X31_Y23_N30
\dp|p|peRowGen:0:peColGen:1:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux9~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux9~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux9~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux9~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\);

-- Location: LCCOMB_X31_Y23_N18
\dp|p|peRowGen:1:peColGen:1:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:1:peij|q_im~8_combout\,
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|q_im~2_combout\);

-- Location: LCFF_X31_Y23_N19
\dp|p|peRowGen:1:peColGen:1:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(2));

-- Location: LCCOMB_X33_Y24_N6
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(0),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y24_N8
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1))) # (!\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(1),
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X33_Y23_N2
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(2) $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(2),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N3
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2));

-- Location: LCCOMB_X33_Y24_N26
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ & ((\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(2))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(2),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2),
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y24_N0
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X32_Y24_N1
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3));

-- Location: LCCOMB_X31_Y24_N2
\dp|p|peRowGen:0:peColGen:1:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux8~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux8~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux8~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\);

-- Location: LCCOMB_X32_Y24_N20
\dp|p|peRowGen:1:peColGen:1:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:1:peij|q_im~10_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|q_im~3_combout\);

-- Location: LCFF_X32_Y24_N21
\dp|p|peRowGen:1:peColGen:1:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3));

-- Location: LCCOMB_X32_Y24_N4
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y24_N26
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X32_Y24_N27
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4));

-- Location: LCCOMB_X33_Y24_N12
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4)) # ((\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3)) # 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4) & (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3) & 
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X33_Y23_N12
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N13
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5));

-- Location: LCCOMB_X33_Y23_N6
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N7
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6));

-- Location: LCCOMB_X33_Y24_N22
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y24_N0
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y23_N0
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N1
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7));

-- Location: LCCOMB_X33_Y24_N2
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y24_N20
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X33_Y24_N21
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8));

-- Location: LCCOMB_X33_Y24_N28
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y24_N14
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X33_Y24_N15
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9));

-- Location: LCCOMB_X33_Y24_N30
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9) & ((\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9) & (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9),
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y24_N24
\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:1:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:1:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(10),
	datad => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X33_Y24_N25
\dp|p|peRowGen:1:peColGen:1:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(10));

-- Location: LCCOMB_X20_Y24_N6
\dp|p|peRowGen:0:peColGen:2:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux7~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux7~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux7~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux7~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\);

-- Location: LCCOMB_X19_Y22_N18
\dp|p|peRowGen:1:peColGen:2:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|q_im~0_combout\);

-- Location: LCFF_X19_Y22_N19
\dp|p|peRowGen:1:peColGen:2:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(0));

-- Location: LCCOMB_X19_Y22_N24
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(0),
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X19_Y22_N25
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0));

-- Location: LCCOMB_X18_Y22_N16
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(1) $ (((\dp|p|peRowGen:1:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(1),
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0),
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X19_Y22_N10
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1) $ (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X19_Y22_N11
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1));

-- Location: LCCOMB_X20_Y24_N16
\dp|p|peRowGen:0:peColGen:2:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux6~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux6~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux6~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\);

-- Location: LCCOMB_X20_Y24_N28
\dp|p|peRowGen:2:peColGen:2:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux6~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux6~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux6~1_combout\,
	combout => \dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\);

-- Location: LCCOMB_X19_Y22_N4
\dp|p|peRowGen:1:peColGen:2:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|q_im~1_combout\);

-- Location: LCFF_X19_Y22_N5
\dp|p|peRowGen:1:peColGen:2:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(1));

-- Location: LCCOMB_X19_Y22_N6
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y22_N8
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1))) # (!\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1),
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X19_Y26_N4
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(2) $ (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(2),
	datab => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N5
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2));

-- Location: LCCOMB_X20_Y24_N10
\dp|p|peRowGen:0:peColGen:2:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux4~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:3:hsi|Mux4~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:1:hsi|Mux4~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\);

-- Location: LCCOMB_X19_Y25_N28
\dp|p|peRowGen:1:peColGen:2:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\,
	datad => \dp|p|peRowGen:2:peColGen:2:peij|q_im~10_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|q_im~3_combout\);

-- Location: LCFF_X19_Y25_N29
\dp|p|peRowGen:1:peColGen:2:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3));

-- Location: LCCOMB_X19_Y25_N24
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X19_Y25_N25
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3));

-- Location: LCCOMB_X19_Y25_N26
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X19_Y25_N27
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4));

-- Location: LCCOMB_X19_Y26_N22
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N23
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5));

-- Location: LCCOMB_X19_Y25_N22
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X21_Y25_N30
\dp|p|peRowGen:0:peColGen:2:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux5~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|sGen:1:hsi|Mux5~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(1),
	datad => \dp|r|SRF|sGen:3:hsi|Mux5~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\);

-- Location: LCCOMB_X21_Y25_N10
\dp|p|peRowGen:1:peColGen:2:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:2:peij|q_im~8_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|q_im~2_combout\);

-- Location: LCFF_X21_Y25_N11
\dp|p|peRowGen:1:peColGen:2:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(2));

-- Location: LCCOMB_X19_Y22_N26
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(2))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(2),
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y22_N12
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3) & 
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3)) # 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4),
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X19_Y22_N22
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y26_N8
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N9
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6));

-- Location: LCCOMB_X19_Y22_N0
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y26_N10
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N11
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7));

-- Location: LCCOMB_X19_Y22_N2
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y22_N20
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X19_Y22_N21
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8));

-- Location: LCCOMB_X19_Y22_N28
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y22_N14
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X19_Y22_N15
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9));

-- Location: LCCOMB_X19_Y22_N30
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9) & ((\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9) & (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9),
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y22_N16
\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:2:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(10),
	datad => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X19_Y22_N17
\dp|p|peRowGen:1:peColGen:2:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(10));

-- Location: LCCOMB_X30_Y24_N10
\dp|p|peRowGen:1:peColGen:3:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~4_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|q_im~0_combout\);

-- Location: LCFF_X30_Y24_N11
\dp|p|peRowGen:1:peColGen:3:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(0));

-- Location: LCCOMB_X30_Y24_N24
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(0),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X30_Y24_N25
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0));

-- Location: LCCOMB_X29_Y24_N10
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_im\(1) $ (((\dp|p|peRowGen:1:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(1),
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X30_Y24_N26
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1) $ (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X30_Y24_N27
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1));

-- Location: LCCOMB_X29_Y24_N30
\dp|p|peRowGen:0:peColGen:3:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux2~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux2~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux2~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\);

-- Location: LCCOMB_X30_Y24_N4
\dp|p|peRowGen:1:peColGen:3:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:2:peColGen:3:peij|q_im~6_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|q_im~1_combout\);

-- Location: LCFF_X30_Y24_N5
\dp|p|peRowGen:1:peColGen:3:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(1));

-- Location: LCCOMB_X30_Y24_N6
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(0),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y24_N0
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1)))) # (!\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(1),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X27_Y22_N22
\dp|p|peRowGen:0:peColGen:3:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:3:hsi|Mux1~1_combout\))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:1:hsi|Mux1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:1:hsi|Mux1~1_combout\,
	datad => \dp|r|SRF|sGen:3:hsi|Mux1~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\);

-- Location: LCCOMB_X27_Y22_N12
\dp|p|peRowGen:1:peColGen:3:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:2:peColGen:3:peij|q_im~8_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|q_im~2_combout\);

-- Location: LCFF_X27_Y22_N13
\dp|p|peRowGen:1:peColGen:3:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(2));

-- Location: LCCOMB_X29_Y24_N18
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(2),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N19
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2));

-- Location: LCCOMB_X26_Y24_N22
\dp|p|peRowGen:0:peColGen:3:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux0~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux0~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux0~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\);

-- Location: LCCOMB_X26_Y24_N28
\dp|p|peRowGen:1:peColGen:3:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:2:peColGen:3:peij|q_im~10_combout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|q_im~3_combout\);

-- Location: LCFF_X26_Y24_N29
\dp|p|peRowGen:1:peColGen:3:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3));

-- Location: LCCOMB_X26_Y24_N16
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N17
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3));

-- Location: LCCOMB_X30_Y24_N18
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(2))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(2),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N0
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N18
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N19
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4));

-- Location: LCCOMB_X26_Y24_N2
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y24_N28
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4) & 
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3),
	datab => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X29_Y24_N28
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N29
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5));

-- Location: LCCOMB_X30_Y24_N30
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y24_N6
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N7
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6));

-- Location: LCCOMB_X30_Y24_N8
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y24_N16
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N17
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7));

-- Location: LCCOMB_X30_Y24_N2
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y24_N20
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X30_Y24_N21
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8));

-- Location: LCCOMB_X30_Y24_N12
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y24_N14
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X30_Y24_N15
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9));

-- Location: LCCOMB_X30_Y24_N22
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9) & ((\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9) & (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9),
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X30_Y24_N16
\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:1:peColGen:3:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:1:peColGen:3:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(10),
	datad => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X30_Y24_N17
\dp|p|peRowGen:1:peColGen:3:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:1:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(10));

-- Location: LCCOMB_X24_Y22_N2
\dp|r|Mux63~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~6_combout\ = (\dp|wr_cnt|cnt_out\(1) & (((\dp|r|SRF|r|rGen:3:regi|q\(16)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))) # (!\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:1:regi|q\(16) & (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datab => \dp|r|SRF|r|rGen:1:regi|q\(16),
	datac => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datad => \dp|r|SRF|r|rGen:3:regi|q\(16),
	combout => \dp|r|Mux63~6_combout\);

-- Location: LCFF_X23_Y23_N25
\dp|r|SRF|r|rGen:3:regi|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	sdata => \dp|r|SRF|r|rGen:0:regi|q~1_combout\,
	sload => VCC,
	ena => \dp|r|Mux66~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|r|SRF|r|rGen:3:regi|q\(0));

-- Location: LCCOMB_X23_Y23_N26
\dp|r|SRF|sGen:3:hsi|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux15~1_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(12))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~0_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux15~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|sGen:0:hsi|Mux15~0_combout\,
	datac => \dp|r|SRF|r|rGen:3:regi|q\(12),
	datad => \dp|r|SRF|sGen:3:hsi|Mux15~0_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux15~1_combout\);

-- Location: LCCOMB_X23_Y23_N6
\dp|r|SRF|sGen:3:hsi|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:3:hsi|Mux15~2_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & ((\dp|r|SRF|sGen:3:hsi|Mux15~1_combout\ & (\dp|r|SRF|r|rGen:3:regi|q\(4))) # (!\dp|r|SRF|sGen:3:hsi|Mux15~1_combout\ & ((\dp|r|SRF|r|rGen:3:regi|q\(0)))))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux15~1_combout\ & (((\dp|r|SRF|sGen:3:hsi|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~1_combout\,
	datab => \dp|r|SRF|r|rGen:3:regi|q\(4),
	datac => \dp|r|SRF|r|rGen:3:regi|q\(0),
	datad => \dp|r|SRF|sGen:3:hsi|Mux15~1_combout\,
	combout => \dp|r|SRF|sGen:3:hsi|Mux15~2_combout\);

-- Location: LCCOMB_X24_Y22_N20
\dp|r|Mux63~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|Mux63~7_combout\ = (\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & (\dp|r|Mux63~6_combout\)) # (!\dp|r|SRF|sGen:0:hsi|Mux15~5_combout\ & ((\dp|r|Mux63~6_combout\ & (\dp|r|SRF|sGen:3:hsi|Mux15~2_combout\)) # (!\dp|r|Mux63~6_combout\ & 
-- ((\dp|r|SRF|sGen:1:hsi|Mux15~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:0:hsi|Mux15~5_combout\,
	datab => \dp|r|Mux63~6_combout\,
	datac => \dp|r|SRF|sGen:3:hsi|Mux15~2_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux15~2_combout\,
	combout => \dp|r|Mux63~7_combout\);

-- Location: LCCOMB_X31_Y22_N26
\dp|p|peRowGen:0:peColGen:0:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux63~7_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux63~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|Mux63~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|r|Mux63~7_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|q_im~0_combout\);

-- Location: LCFF_X31_Y22_N27
\dp|p|peRowGen:0:peColGen:0:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_im~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(0));

-- Location: LCCOMB_X31_Y22_N16
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(0),
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X31_Y22_N17
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0));

-- Location: LCCOMB_X31_Y22_N4
\dp|p|peRowGen:0:peColGen:0:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux62~7_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux62~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|r|Mux62~7_combout\,
	datad => \dp|r|Mux62~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|q_im~1_combout\);

-- Location: LCFF_X31_Y22_N5
\dp|p|peRowGen:0:peColGen:0:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_im~1_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(1));

-- Location: LCCOMB_X32_Y22_N8
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_im\(1) $ (((\dp|p|peRowGen:0:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(1),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0),
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X31_Y22_N10
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1),
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X31_Y22_N11
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1));

-- Location: LCCOMB_X24_Y21_N24
\dp|p|peRowGen:0:peColGen:0:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux61~7_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux61~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|Mux61~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|r|Mux61~7_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|q_im~2_combout\);

-- Location: LCFF_X24_Y21_N25
\dp|p|peRowGen:0:peColGen:0:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_im~2_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(2));

-- Location: LCCOMB_X32_Y22_N24
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(2),
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X32_Y22_N25
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2));

-- Location: LCCOMB_X27_Y23_N8
\dp|p|peRowGen:0:peColGen:0:peij|q_im~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|q_im~3_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|r|Mux60~7_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|r|Mux60~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|Mux60~1_combout\,
	datab => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|r|Mux60~7_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|q_im~3_combout\);

-- Location: LCFF_X27_Y23_N9
\dp|p|peRowGen:0:peColGen:0:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_im~3_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3));

-- Location: LCCOMB_X27_Y23_N10
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N11
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3));

-- Location: LCCOMB_X31_Y22_N6
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y22_N0
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1))) # (!\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X31_Y22_N18
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(2))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:1:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y23_N6
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y23_N28
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:3:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X27_Y23_N29
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4));

-- Location: LCCOMB_X27_Y23_N16
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y22_N28
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4) & 
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X32_Y22_N18
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X32_Y22_N19
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5));

-- Location: LCCOMB_X31_Y22_N22
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y22_N4
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X32_Y22_N5
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6));

-- Location: LCCOMB_X31_Y22_N8
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y22_N30
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X32_Y22_N31
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7));

-- Location: LCCOMB_X31_Y22_N2
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:6:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y22_N20
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X31_Y22_N21
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8));

-- Location: LCCOMB_X31_Y22_N12
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y22_N14
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X31_Y22_N15
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9));

-- Location: LCCOMB_X31_Y22_N30
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9) & ((\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9) & (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X31_Y22_N24
\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(10),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X31_Y22_N25
\dp|p|peRowGen:0:peColGen:0:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:0:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(10));

-- Location: LCCOMB_X33_Y22_N10
\dp|p|peRowGen:0:peColGen:1:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:3:peColGen:1:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~4_combout\);

-- Location: LCFF_X33_Y22_N11
\dp|p|peRowGen:0:peColGen:1:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_im~4_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(0));

-- Location: LCCOMB_X33_Y22_N16
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(0),
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X33_Y22_N17
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0));

-- Location: LCCOMB_X33_Y22_N26
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1),
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X33_Y22_N27
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1));

-- Location: LCCOMB_X23_Y24_N24
\dp|r|SRF|sGen:2:hsi|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux10~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|r|rGen:2:regi|q\(5)) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (\dp|r|SRF|sGen:2:hsi|Mux14~3_combout\ & 
-- ((\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|sGen:2:hsi|Mux14~3_combout\,
	datab => \dp|hmode_cnt|cnt_out\(2),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(5),
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux10~0_combout\);

-- Location: LCCOMB_X23_Y24_N6
\dp|r|SRF|sGen:2:hsi|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux14~0_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:2:regi|q\(9))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:2:regi|q\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|r|SRF|r|rGen:2:regi|q\(9),
	datac => \dp|r|SRF|r|rGen:2:regi|q\(17),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:2:hsi|Mux14~0_combout\);

-- Location: LCCOMB_X23_Y24_N12
\dp|r|SRF|sGen:2:hsi|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:2:hsi|Mux10~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:2:hsi|Mux10~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux10~0_combout\ & (\dp|r|SRF|r|rGen:2:regi|q\(21))) # 
-- (!\dp|r|SRF|sGen:2:hsi|Mux10~0_combout\ & ((\dp|r|SRF|sGen:2:hsi|Mux14~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:2:regi|q\(21),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|sGen:2:hsi|Mux10~0_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux14~0_combout\,
	combout => \dp|r|SRF|sGen:2:hsi|Mux10~1_combout\);

-- Location: LCCOMB_X23_Y23_N24
\dp|r|SRF|sGen:0:hsi|Mux14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux14~3_combout\ = (\dp|hmode_cnt|cnt_out\(1) & (\dp|r|SRF|r|rGen:0:regi|q\(13))) # (!\dp|hmode_cnt|cnt_out\(1) & ((\dp|r|SRF|r|rGen:0:regi|q\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(13),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(21),
	datad => \dp|hmode_cnt|cnt_out\(1),
	combout => \dp|r|SRF|sGen:0:hsi|Mux14~3_combout\);

-- Location: LCCOMB_X23_Y23_N28
\dp|r|SRF|sGen:0:hsi|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux10~0_combout\ = (\dp|hmode_cnt|cnt_out\(2) & ((\dp|r|SRF|r|rGen:0:regi|q\(5)) # ((!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\)))) # (!\dp|hmode_cnt|cnt_out\(2) & (((\dp|r|SRF|sGen:0:hsi|Mux14~3_combout\ & 
-- \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|hmode_cnt|cnt_out\(2),
	datab => \dp|r|SRF|r|rGen:0:regi|q\(5),
	datac => \dp|r|SRF|sGen:0:hsi|Mux14~3_combout\,
	datad => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux10~0_combout\);

-- Location: LCCOMB_X23_Y23_N30
\dp|r|SRF|sGen:0:hsi|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|r|SRF|sGen:0:hsi|Mux10~1_combout\ = (\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & (((\dp|r|SRF|sGen:0:hsi|Mux10~0_combout\)))) # (!\dp|r|SRF|sGen:2:hsi|Mux8~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux10~0_combout\ & (\dp|r|SRF|r|rGen:0:regi|q\(21))) # 
-- (!\dp|r|SRF|sGen:0:hsi|Mux10~0_combout\ & ((\dp|r|SRF|sGen:0:hsi|Mux14~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|r|SRF|r|rGen:0:regi|q\(21),
	datab => \dp|r|SRF|sGen:2:hsi|Mux8~0_combout\,
	datac => \dp|r|SRF|sGen:0:hsi|Mux14~0_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux10~0_combout\,
	combout => \dp|r|SRF|sGen:0:hsi|Mux10~1_combout\);

-- Location: LCCOMB_X31_Y24_N28
\dp|p|peRowGen:3:peColGen:1:peij|q_im~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux10~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux10~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux10~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux10~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\);

-- Location: LCCOMB_X31_Y24_N8
\dp|p|peRowGen:0:peColGen:1:peij|q_im~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux10~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux10~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux10~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux10~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\);

-- Location: LCCOMB_X33_Y22_N20
\dp|p|peRowGen:0:peColGen:1:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im~2_combout\,
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~5_combout\);

-- Location: LCFF_X33_Y22_N21
\dp|p|peRowGen:0:peColGen:1:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(1));

-- Location: LCCOMB_X33_Y22_N6
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y22_N24
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1)))) # (!\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(1),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X33_Y23_N10
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:1:peij|q_im\(2) $ (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(2),
	datab => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N11
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2));

-- Location: LCCOMB_X32_Y24_N30
\dp|p|peRowGen:0:peColGen:1:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:1:peij|q_im~6_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~7_combout\);

-- Location: LCFF_X32_Y24_N31
\dp|p|peRowGen:0:peColGen:1:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3));

-- Location: LCCOMB_X31_Y23_N12
\dp|p|peRowGen:0:peColGen:1:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:1:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|q_im~6_combout\);

-- Location: LCFF_X31_Y23_N13
\dp|p|peRowGen:0:peColGen:1:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_im~6_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(2));

-- Location: LCCOMB_X33_Y22_N18
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(2))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(2),
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y24_N28
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X32_Y24_N29
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3));

-- Location: LCCOMB_X32_Y24_N8
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X32_Y24_N6
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X32_Y24_N7
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4));

-- Location: LCCOMB_X32_Y24_N18
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y22_N28
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4) & 
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3),
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X33_Y23_N4
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N5
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5));

-- Location: LCCOMB_X33_Y22_N22
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y23_N22
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N23
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6));

-- Location: LCCOMB_X33_Y22_N0
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y23_N16
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X33_Y23_N17
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7));

-- Location: LCCOMB_X33_Y22_N2
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y22_N4
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X33_Y22_N5
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8));

-- Location: LCCOMB_X33_Y22_N12
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y22_N14
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X33_Y22_N15
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9));

-- Location: LCCOMB_X33_Y22_N30
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9) & ((\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9) & (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X33_Y22_N8
\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:1:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:1:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:1:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(10),
	datad => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X33_Y22_N9
\dp|p|peRowGen:0:peColGen:1:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:1:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(10));

-- Location: LCCOMB_X20_Y24_N24
\dp|p|peRowGen:3:peColGen:2:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:2:hsi|Mux7~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:0:hsi|Mux7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:2:hsi|Mux7~1_combout\,
	datad => \dp|r|SRF|sGen:0:hsi|Mux7~1_combout\,
	combout => \dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\);

-- Location: LCCOMB_X20_Y22_N2
\dp|p|peRowGen:0:peColGen:2:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~4_combout\);

-- Location: LCFF_X20_Y22_N3
\dp|p|peRowGen:0:peColGen:2:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_im~4_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(0));

-- Location: LCCOMB_X20_Y22_N24
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(0),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X20_Y22_N25
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0));

-- Location: LCCOMB_X20_Y22_N4
\dp|p|peRowGen:0:peColGen:2:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im~1_combout\,
	datac => \dp|wr_cnt|cnt_out\(0),
	datad => \dp|p|peRowGen:3:peColGen:2:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~5_combout\);

-- Location: LCFF_X20_Y22_N5
\dp|p|peRowGen:0:peColGen:2:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(1));

-- Location: LCCOMB_X19_Y23_N16
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_im\(1) $ (((\dp|p|peRowGen:0:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(1),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X20_Y22_N26
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1) $ (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X20_Y22_N27
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1));

-- Location: LCCOMB_X21_Y25_N12
\dp|p|peRowGen:0:peColGen:2:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:2:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~6_combout\);

-- Location: LCFF_X21_Y25_N13
\dp|p|peRowGen:0:peColGen:2:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_im~6_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(2));

-- Location: LCCOMB_X21_Y25_N28
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(2),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X21_Y25_N29
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2));

-- Location: LCCOMB_X19_Y25_N30
\dp|p|peRowGen:0:peColGen:2:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:3:peColGen:2:peij|q_im~6_combout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_im~3_combout\,
	datad => \dp|wr_cnt|cnt_out\(0),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|q_im~7_combout\);

-- Location: LCFF_X19_Y25_N31
\dp|p|peRowGen:0:peColGen:2:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3));

-- Location: LCCOMB_X19_Y25_N4
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X19_Y25_N5
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3));

-- Location: LCCOMB_X20_Y22_N30
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y22_N8
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & (!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)) # 
-- (!\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1)))))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- ((\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1)))) # (!\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(1),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X20_Y22_N18
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ & ((\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(2))))) # (!\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(2),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y25_N8
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y25_N14
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:3:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X19_Y25_N15
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4));

-- Location: LCCOMB_X19_Y26_N20
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N21
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5));

-- Location: LCCOMB_X19_Y25_N2
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y22_N28
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\) # ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\ & 
-- \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3))))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\) # 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4),
	datab => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X20_Y22_N22
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y26_N6
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N7
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6));

-- Location: LCCOMB_X20_Y22_N0
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X19_Y26_N16
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X19_Y26_N17
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7));

-- Location: LCCOMB_X20_Y22_N10
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y22_N20
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X20_Y22_N21
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8));

-- Location: LCCOMB_X20_Y22_N12
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y22_N14
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X20_Y22_N15
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9));

-- Location: LCCOMB_X20_Y22_N6
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9) & ((\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))) # (!\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9) & (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X20_Y22_N16
\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:2:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:2:peij|q_im\(3),
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(10),
	datad => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X20_Y22_N17
\dp|p|peRowGen:0:peColGen:2:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:2:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(10));

-- Location: LCCOMB_X29_Y23_N12
\dp|p|peRowGen:0:peColGen:3:peij|q_im~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\ = (\dp|wr_cnt|cnt_out\(1) & (\dp|r|SRF|sGen:3:hsi|Mux3~1_combout\)) # (!\dp|wr_cnt|cnt_out\(1) & ((\dp|r|SRF|sGen:1:hsi|Mux3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(1),
	datac => \dp|r|SRF|sGen:3:hsi|Mux3~1_combout\,
	datad => \dp|r|SRF|sGen:1:hsi|Mux3~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\);

-- Location: LCCOMB_X27_Y24_N26
\dp|p|peRowGen:0:peColGen:3:peij|q_im~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~4_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_im~0_combout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~4_combout\);

-- Location: LCFF_X27_Y24_N27
\dp|p|peRowGen:0:peColGen:3:peij|q_im[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_im~4_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(0));

-- Location: LCCOMB_X27_Y24_N16
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:0:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(0),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\);

-- Location: LCFF_X27_Y24_N17
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:0:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0));

-- Location: LCCOMB_X27_Y24_N20
\dp|p|peRowGen:0:peColGen:3:peij|q_im~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~5_combout\ = (\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\)) # (!\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im~1_combout\,
	datad => \dp|p|peRowGen:3:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~5_combout\);

-- Location: LCFF_X27_Y24_N21
\dp|p|peRowGen:0:peColGen:3:peij|q_im[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_im~5_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(1));

-- Location: LCCOMB_X29_Y24_N4
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:3:peij|q_im\(1) $ (((\dp|p|peRowGen:0:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(0),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\);

-- Location: LCCOMB_X27_Y24_N10
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~combout\ = \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1) $ (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~combout\);

-- Location: LCFF_X27_Y24_N11
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|sum~combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1));

-- Location: LCCOMB_X27_Y24_N6
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(0) & (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0) $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(0),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0),
	datad => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y24_N24
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((!\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\))) # 
-- (!\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_im\(1) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1))) # (!\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1),
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(1),
	datac => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\);

-- Location: LCCOMB_X27_Y22_N6
\dp|p|peRowGen:0:peColGen:3:peij|q_im~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~6_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|wr_cnt|cnt_out\(0),
	datab => \dp|p|peRowGen:3:peColGen:3:peij|q_im~4_combout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im~2_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~6_combout\);

-- Location: LCFF_X27_Y22_N7
\dp|p|peRowGen:0:peColGen:3:peij|q_im[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_im~6_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(2));

-- Location: LCCOMB_X29_Y24_N2
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(2),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N3
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2));

-- Location: LCCOMB_X27_Y24_N18
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ & ((\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2)) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(2))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2) & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(2),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:1:fai|c_out~1_combout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N30
\dp|p|peRowGen:0:peColGen:3:peij|q_im~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|q_im~7_combout\ = (\dp|wr_cnt|cnt_out\(0) & ((\dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\))) # (!\dp|wr_cnt|cnt_out\(0) & (\dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dp|wr_cnt|cnt_out\(0),
	datac => \dp|p|peRowGen:3:peColGen:3:peij|q_im~6_combout\,
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im~3_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|q_im~7_combout\);

-- Location: LCFF_X26_Y24_N31
\dp|p|peRowGen:0:peColGen:3:peij|q_im[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_im~7_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3));

-- Location: LCCOMB_X26_Y24_N12
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N13
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3));

-- Location: LCCOMB_X26_Y24_N6
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\ $ (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:3:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N7
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4));

-- Location: LCCOMB_X27_Y24_N12
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ & ((\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3)) # ((\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4)) # 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\)))) # (!\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3) & (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4) & 
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~0_combout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:2:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\);

-- Location: LCCOMB_X26_Y24_N24
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N25
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5));

-- Location: LCCOMB_X27_Y24_N22
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:4:fai|c_out~1_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\);

-- Location: LCCOMB_X26_Y24_N26
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\);

-- Location: LCFF_X26_Y24_N27
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6));

-- Location: LCCOMB_X27_Y24_N0
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:5:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\);

-- Location: LCCOMB_X29_Y24_N20
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\);

-- Location: LCFF_X29_Y24_N21
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7));

-- Location: LCCOMB_X27_Y24_N2
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:6:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y24_N4
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\);

-- Location: LCFF_X27_Y24_N5
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8));

-- Location: LCCOMB_X27_Y24_N28
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:7:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y24_N14
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\);

-- Location: LCFF_X27_Y24_N15
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9));

-- Location: LCCOMB_X27_Y24_N30
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\ = (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9) & ((\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\) # (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3))))) # (!\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9) & (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\ & (\dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:8:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\);

-- Location: LCCOMB_X27_Y24_N8
\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:10:fai|sum~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\ = \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\ $ (\dp|p|peRowGen:0:peColGen:3:peij|q_im\(3) $ (\dp|p|peRowGen:0:peColGen:3:peij|q_acc\(10) $ 
-- (\dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dp|p|peRowGen:0:peColGen:0:peij|q_k~regout\,
	datab => \dp|p|peRowGen:0:peColGen:3:peij|q_im\(3),
	datac => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(10),
	datad => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:9:fai|c_out~0_combout\,
	combout => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\);

-- Location: LCFF_X27_Y24_N9
\dp|p|peRowGen:0:peColGen:3:peij|q_acc[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ck~clkctrl_outclk\,
	datain => \dp|p|peRowGen:0:peColGen:3:peij|add|faGen:10:fai|sum~0_combout\,
	sclr => \rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(10));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(0));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(1));

-- Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(2));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(3));

-- Location: PIN_J20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(4));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(5));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(6));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(7));

-- Location: PIN_AB10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(8));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(9));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:0:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(10));

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(11));

-- Location: PIN_P15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(12));

-- Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(13));

-- Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(14));

-- Location: PIN_L19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(15));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(16));

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(17));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(18));

-- Location: PIN_AB15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(19));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(20));

-- Location: PIN_AA17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:1:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(21));

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(22));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(23));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(24));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(25));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(26));

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(27));

-- Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(28));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(29));

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(30));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(31));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:2:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(32));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(33));

-- Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(34));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(35));

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(36));

-- Location: PIN_K22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(37));

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(38));

-- Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(39));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(40));

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(41));

-- Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(42));

-- Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[3][43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:3:peColGen:3:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(3)(43));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(0));

-- Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(1));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(2));

-- Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(3));

-- Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(4));

-- Location: PIN_N21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(5));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(6));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(7));

-- Location: PIN_AA12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(8));

-- Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(9));

-- Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:0:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(10));

-- Location: PIN_G20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(11));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(12));

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(13));

-- Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(14));

-- Location: PIN_J21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(15));

-- Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(16));

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(17));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(18));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(19));

-- Location: PIN_W14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(20));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:1:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(21));

-- Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(22));

-- Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(23));

-- Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(24));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(25));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(26));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(27));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(28));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(29));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(30));

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(31));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:2:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(32));

-- Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(33));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(34));

-- Location: PIN_N22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(35));

-- Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(36));

-- Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(37));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(38));

-- Location: PIN_L18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(39));

-- Location: PIN_K20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(40));

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(41));

-- Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(42));

-- Location: PIN_P18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[2][43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:2:peColGen:3:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(2)(43));

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(0));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(1));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(2));

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(3));

-- Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(4));

-- Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(5));

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(6));

-- Location: PIN_P5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(7));

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(8));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(9));

-- Location: PIN_M19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:0:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(10));

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(11));

-- Location: PIN_R12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(12));

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(13));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(14));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(15));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(16));

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(17));

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(18));

-- Location: PIN_P17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(19));

-- Location: PIN_R18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(20));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:1:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(21));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(22));

-- Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(23));

-- Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(24));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(25));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(26));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(27));

-- Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(28));

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(29));

-- Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(30));

-- Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(31));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:2:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(32));

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(33));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(34));

-- Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(35));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(36));

-- Location: PIN_T21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(37));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(38));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(39));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(40));

-- Location: PIN_H18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(41));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(42));

-- Location: PIN_R13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[1][43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:1:peColGen:3:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(1)(43));

-- Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(0));

-- Location: PIN_U13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(1));

-- Location: PIN_AB16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(2));

-- Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(3));

-- Location: PIN_F22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(4));

-- Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(5));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(6));

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(7));

-- Location: PIN_N15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(8));

-- Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(9));

-- Location: PIN_K21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:0:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(10));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(11));

-- Location: PIN_AB14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(12));

-- Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(13));

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(14));

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(15));

-- Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(16));

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(17));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(18));

-- Location: PIN_AB17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(19));

-- Location: PIN_AA16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(20));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:1:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(21));

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(22));

-- Location: PIN_Y10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(23));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(24));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(25));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(26));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(27));

-- Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(28));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(29));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(30));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(31));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][32]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:2:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(32));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][33]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(33));

-- Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][34]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(34));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][35]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(35));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][36]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(36));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][37]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(37));

-- Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][38]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(38));

-- Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][39]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(39));

-- Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][40]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(40));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][41]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(41));

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][42]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(42));

-- Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\o_data[0][43]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dp|p|peRowGen:0:peColGen:3:peij|q_acc\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_o_data(0)(43));
END structure;


