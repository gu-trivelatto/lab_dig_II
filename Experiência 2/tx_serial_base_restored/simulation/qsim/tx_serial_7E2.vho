-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "09/17/2021 11:22:14"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	tx_serial_7E2 IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	partida : IN std_logic;
	dados_ascii : IN std_logic_vector(6 DOWNTO 0);
	saida_serial : OUT std_logic;
	pronto : OUT std_logic
	);
END tx_serial_7E2;

-- Design Ports Information
-- saida_serial	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pronto	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- partida	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[0]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[1]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[3]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[4]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[5]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_ascii[6]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF tx_serial_7E2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_partida : std_logic;
SIGNAL ww_dados_ascii : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_saida_serial : std_logic;
SIGNAL ww_pronto : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \partida~input_o\ : std_logic;
SIGNAL \U4_ED|signal_d~q\ : std_logic;
SIGNAL \U3_TICK|Add0~1_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~26\ : std_logic;
SIGNAL \U3_TICK|Add0~21_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~22\ : std_logic;
SIGNAL \U3_TICK|Add0~17_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~18\ : std_logic;
SIGNAL \U3_TICK|Add0~13_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~14\ : std_logic;
SIGNAL \U3_TICK|Add0~9_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~10\ : std_logic;
SIGNAL \U3_TICK|Add0~5_sumout\ : std_logic;
SIGNAL \U3_TICK|Equal0~0_combout\ : std_logic;
SIGNAL \U3_TICK|Equal0~2_combout\ : std_logic;
SIGNAL \U3_TICK|Add0~2\ : std_logic;
SIGNAL \U3_TICK|Add0~33_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~34\ : std_logic;
SIGNAL \U3_TICK|Add0~29_sumout\ : std_logic;
SIGNAL \U3_TICK|Add0~30\ : std_logic;
SIGNAL \U3_TICK|Add0~25_sumout\ : std_logic;
SIGNAL \U3_TICK|Equal0~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \U1_UC|Eatual.espera~DUPLICATE_q\ : std_logic;
SIGNAL \U1_UC|Eprox.transmissao~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.transmissao~q\ : std_logic;
SIGNAL \U2_FD|U2|IQ[1]~3_combout\ : std_logic;
SIGNAL \U2_FD|U2|IQ~0_combout\ : std_logic;
SIGNAL \U2_FD|U2|IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U2_FD|U2|IQ~2_combout\ : std_logic;
SIGNAL \U2_FD|U2|IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \U2_FD|U2|IQ~1_combout\ : std_logic;
SIGNAL \U2_FD|U2|Equal0~0_combout\ : std_logic;
SIGNAL \U1_UC|Selector1~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.espera~q\ : std_logic;
SIGNAL \U1_UC|Selector2~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.final~DUPLICATE_q\ : std_logic;
SIGNAL \U1_UC|Selector0~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.inicial~q\ : std_logic;
SIGNAL \U1_UC|Eprox.preparacao~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.preparacao~q\ : std_logic;
SIGNAL \dados_ascii[0]~input_o\ : std_logic;
SIGNAL \dados_ascii[1]~input_o\ : std_logic;
SIGNAL \dados_ascii[2]~input_o\ : std_logic;
SIGNAL \dados_ascii[3]~input_o\ : std_logic;
SIGNAL \dados_ascii[4]~input_o\ : std_logic;
SIGNAL \dados_ascii[5]~input_o\ : std_logic;
SIGNAL \dados_ascii[6]~input_o\ : std_logic;
SIGNAL \U2_FD|s_dados[9]~0_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~10_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ[0]~1_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~9_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~8_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~7_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~6_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~5_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~4_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~3_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~2_combout\ : std_logic;
SIGNAL \U2_FD|U1|IQ~0_combout\ : std_logic;
SIGNAL \U1_UC|Eatual.final~q\ : std_logic;
SIGNAL \U3_TICK|IQ\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \U2_FD|U1|IQ\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \U2_FD|U2|IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U3_TICK|ALT_INV_IQ\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \U2_FD|U1|ALT_INV_IQ\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \U1_UC|ALT_INV_Eatual.espera~DUPLICATE_q\ : std_logic;
SIGNAL \U2_FD|U2|ALT_INV_IQ[2]~DUPLICATE_q\ : std_logic;
SIGNAL \U2_FD|U2|ALT_INV_IQ[0]~DUPLICATE_q\ : std_logic;
SIGNAL \U1_UC|ALT_INV_Eatual.final~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dados_ascii[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_partida~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \U2_FD|ALT_INV_s_dados[9]~0_combout\ : std_logic;
SIGNAL \U4_ED|ALT_INV_signal_d~q\ : std_logic;
SIGNAL \U1_UC|ALT_INV_Eatual.inicial~q\ : std_logic;
SIGNAL \U3_TICK|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \U3_TICK|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \U1_UC|ALT_INV_Eatual.espera~q\ : std_logic;
SIGNAL \U2_FD|U2|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \U2_FD|U2|ALT_INV_IQ\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U1_UC|ALT_INV_Eatual.transmissao~q\ : std_logic;
SIGNAL \U1_UC|ALT_INV_Eatual.preparacao~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_partida <= partida;
ww_dados_ascii <= dados_ascii;
saida_serial <= ww_saida_serial;
pronto <= ww_pronto;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\U3_TICK|ALT_INV_IQ\(0) <= NOT \U3_TICK|IQ\(0);
\U3_TICK|ALT_INV_IQ\(8) <= NOT \U3_TICK|IQ\(8);
\U3_TICK|ALT_INV_IQ\(7) <= NOT \U3_TICK|IQ\(7);
\U3_TICK|ALT_INV_IQ\(6) <= NOT \U3_TICK|IQ\(6);
\U3_TICK|ALT_INV_IQ\(5) <= NOT \U3_TICK|IQ\(5);
\U3_TICK|ALT_INV_IQ\(4) <= NOT \U3_TICK|IQ\(4);
\U3_TICK|ALT_INV_IQ\(2) <= NOT \U3_TICK|IQ\(2);
\U3_TICK|ALT_INV_IQ\(3) <= NOT \U3_TICK|IQ\(3);
\U3_TICK|ALT_INV_IQ\(1) <= NOT \U3_TICK|IQ\(1);
\U2_FD|U1|ALT_INV_IQ\(0) <= NOT \U2_FD|U1|IQ\(0);
\U1_UC|ALT_INV_Eatual.espera~DUPLICATE_q\ <= NOT \U1_UC|Eatual.espera~DUPLICATE_q\;
\U2_FD|U2|ALT_INV_IQ[2]~DUPLICATE_q\ <= NOT \U2_FD|U2|IQ[2]~DUPLICATE_q\;
\U2_FD|U2|ALT_INV_IQ[0]~DUPLICATE_q\ <= NOT \U2_FD|U2|IQ[0]~DUPLICATE_q\;
\U1_UC|ALT_INV_Eatual.final~DUPLICATE_q\ <= NOT \U1_UC|Eatual.final~DUPLICATE_q\;
\ALT_INV_dados_ascii[6]~input_o\ <= NOT \dados_ascii[6]~input_o\;
\ALT_INV_dados_ascii[5]~input_o\ <= NOT \dados_ascii[5]~input_o\;
\ALT_INV_dados_ascii[4]~input_o\ <= NOT \dados_ascii[4]~input_o\;
\ALT_INV_dados_ascii[3]~input_o\ <= NOT \dados_ascii[3]~input_o\;
\ALT_INV_dados_ascii[2]~input_o\ <= NOT \dados_ascii[2]~input_o\;
\ALT_INV_dados_ascii[1]~input_o\ <= NOT \dados_ascii[1]~input_o\;
\ALT_INV_dados_ascii[0]~input_o\ <= NOT \dados_ascii[0]~input_o\;
\ALT_INV_partida~input_o\ <= NOT \partida~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\U2_FD|ALT_INV_s_dados[9]~0_combout\ <= NOT \U2_FD|s_dados[9]~0_combout\;
\U2_FD|U1|ALT_INV_IQ\(9) <= NOT \U2_FD|U1|IQ\(9);
\U2_FD|U1|ALT_INV_IQ\(8) <= NOT \U2_FD|U1|IQ\(8);
\U2_FD|U1|ALT_INV_IQ\(7) <= NOT \U2_FD|U1|IQ\(7);
\U2_FD|U1|ALT_INV_IQ\(6) <= NOT \U2_FD|U1|IQ\(6);
\U2_FD|U1|ALT_INV_IQ\(5) <= NOT \U2_FD|U1|IQ\(5);
\U2_FD|U1|ALT_INV_IQ\(4) <= NOT \U2_FD|U1|IQ\(4);
\U2_FD|U1|ALT_INV_IQ\(3) <= NOT \U2_FD|U1|IQ\(3);
\U4_ED|ALT_INV_signal_d~q\ <= NOT \U4_ED|signal_d~q\;
\U1_UC|ALT_INV_Eatual.inicial~q\ <= NOT \U1_UC|Eatual.inicial~q\;
\U2_FD|U1|ALT_INV_IQ\(2) <= NOT \U2_FD|U1|IQ\(2);
\U3_TICK|ALT_INV_Equal0~1_combout\ <= NOT \U3_TICK|Equal0~1_combout\;
\U3_TICK|ALT_INV_Equal0~0_combout\ <= NOT \U3_TICK|Equal0~0_combout\;
\U1_UC|ALT_INV_Eatual.espera~q\ <= NOT \U1_UC|Eatual.espera~q\;
\U2_FD|U2|ALT_INV_Equal0~0_combout\ <= NOT \U2_FD|U2|Equal0~0_combout\;
\U2_FD|U2|ALT_INV_IQ\(1) <= NOT \U2_FD|U2|IQ\(1);
\U2_FD|U2|ALT_INV_IQ\(2) <= NOT \U2_FD|U2|IQ\(2);
\U2_FD|U2|ALT_INV_IQ\(3) <= NOT \U2_FD|U2|IQ\(3);
\U2_FD|U2|ALT_INV_IQ\(0) <= NOT \U2_FD|U2|IQ\(0);
\U1_UC|ALT_INV_Eatual.transmissao~q\ <= NOT \U1_UC|Eatual.transmissao~q\;
\U1_UC|ALT_INV_Eatual.preparacao~q\ <= NOT \U1_UC|Eatual.preparacao~q\;
\U2_FD|U1|ALT_INV_IQ\(1) <= NOT \U2_FD|U1|IQ\(1);

-- Location: IOOBUF_X54_Y19_N22
\saida_serial~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U2_FD|U1|ALT_INV_IQ\(0),
	devoe => ww_devoe,
	o => ww_saida_serial);

-- Location: IOOBUF_X54_Y20_N56
\pronto~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \U1_UC|Eatual.final~q\,
	devoe => ww_devoe,
	o => ww_pronto);

-- Location: IOIBUF_X54_Y18_N61
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X54_Y19_N55
\partida~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_partida,
	o => \partida~input_o\);

-- Location: FF_X53_Y23_N53
\U4_ED|signal_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \partida~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U4_ED|signal_d~q\);

-- Location: LABCELL_X52_Y23_N30
\U3_TICK|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~1_sumout\ = SUM(( \U3_TICK|IQ\(0) ) + ( VCC ) + ( !VCC ))
-- \U3_TICK|Add0~2\ = CARRY(( \U3_TICK|IQ\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(0),
	cin => GND,
	sumout => \U3_TICK|Add0~1_sumout\,
	cout => \U3_TICK|Add0~2\);

-- Location: LABCELL_X52_Y23_N39
\U3_TICK|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~25_sumout\ = SUM(( \U3_TICK|IQ\(3) ) + ( GND ) + ( \U3_TICK|Add0~30\ ))
-- \U3_TICK|Add0~26\ = CARRY(( \U3_TICK|IQ\(3) ) + ( GND ) + ( \U3_TICK|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(3),
	cin => \U3_TICK|Add0~30\,
	sumout => \U3_TICK|Add0~25_sumout\,
	cout => \U3_TICK|Add0~26\);

-- Location: LABCELL_X52_Y23_N42
\U3_TICK|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~21_sumout\ = SUM(( \U3_TICK|IQ\(4) ) + ( GND ) + ( \U3_TICK|Add0~26\ ))
-- \U3_TICK|Add0~22\ = CARRY(( \U3_TICK|IQ\(4) ) + ( GND ) + ( \U3_TICK|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(4),
	cin => \U3_TICK|Add0~26\,
	sumout => \U3_TICK|Add0~21_sumout\,
	cout => \U3_TICK|Add0~22\);

-- Location: FF_X52_Y23_N44
\U3_TICK|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~21_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(4));

-- Location: LABCELL_X52_Y23_N45
\U3_TICK|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~17_sumout\ = SUM(( \U3_TICK|IQ\(5) ) + ( GND ) + ( \U3_TICK|Add0~22\ ))
-- \U3_TICK|Add0~18\ = CARRY(( \U3_TICK|IQ\(5) ) + ( GND ) + ( \U3_TICK|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(5),
	cin => \U3_TICK|Add0~22\,
	sumout => \U3_TICK|Add0~17_sumout\,
	cout => \U3_TICK|Add0~18\);

-- Location: FF_X52_Y23_N47
\U3_TICK|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~17_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(5));

-- Location: LABCELL_X52_Y23_N48
\U3_TICK|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~13_sumout\ = SUM(( \U3_TICK|IQ\(6) ) + ( GND ) + ( \U3_TICK|Add0~18\ ))
-- \U3_TICK|Add0~14\ = CARRY(( \U3_TICK|IQ\(6) ) + ( GND ) + ( \U3_TICK|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(6),
	cin => \U3_TICK|Add0~18\,
	sumout => \U3_TICK|Add0~13_sumout\,
	cout => \U3_TICK|Add0~14\);

-- Location: FF_X52_Y23_N50
\U3_TICK|IQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~13_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(6));

-- Location: LABCELL_X52_Y23_N51
\U3_TICK|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~9_sumout\ = SUM(( \U3_TICK|IQ\(7) ) + ( GND ) + ( \U3_TICK|Add0~14\ ))
-- \U3_TICK|Add0~10\ = CARRY(( \U3_TICK|IQ\(7) ) + ( GND ) + ( \U3_TICK|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(7),
	cin => \U3_TICK|Add0~14\,
	sumout => \U3_TICK|Add0~9_sumout\,
	cout => \U3_TICK|Add0~10\);

-- Location: FF_X52_Y23_N53
\U3_TICK|IQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~9_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(7));

-- Location: LABCELL_X52_Y23_N54
\U3_TICK|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~5_sumout\ = SUM(( \U3_TICK|IQ\(8) ) + ( GND ) + ( \U3_TICK|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(8),
	cin => \U3_TICK|Add0~10\,
	sumout => \U3_TICK|Add0~5_sumout\);

-- Location: FF_X52_Y23_N56
\U3_TICK|IQ[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~5_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(8));

-- Location: LABCELL_X52_Y23_N0
\U3_TICK|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Equal0~0_combout\ = ( \U3_TICK|IQ\(5) & ( \U3_TICK|IQ\(7) & ( (\U3_TICK|IQ\(8) & (\U3_TICK|IQ\(0) & (!\U3_TICK|IQ\(6) & \U3_TICK|IQ\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U3_TICK|ALT_INV_IQ\(8),
	datab => \U3_TICK|ALT_INV_IQ\(0),
	datac => \U3_TICK|ALT_INV_IQ\(6),
	datad => \U3_TICK|ALT_INV_IQ\(4),
	datae => \U3_TICK|ALT_INV_IQ\(5),
	dataf => \U3_TICK|ALT_INV_IQ\(7),
	combout => \U3_TICK|Equal0~0_combout\);

-- Location: LABCELL_X52_Y23_N21
\U3_TICK|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Equal0~2_combout\ = ( \U3_TICK|Equal0~1_combout\ & ( \U3_TICK|Equal0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_Equal0~0_combout\,
	dataf => \U3_TICK|ALT_INV_Equal0~1_combout\,
	combout => \U3_TICK|Equal0~2_combout\);

-- Location: FF_X52_Y23_N32
\U3_TICK|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~1_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(0));

-- Location: LABCELL_X52_Y23_N33
\U3_TICK|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~33_sumout\ = SUM(( \U3_TICK|IQ\(1) ) + ( GND ) + ( \U3_TICK|Add0~2\ ))
-- \U3_TICK|Add0~34\ = CARRY(( \U3_TICK|IQ\(1) ) + ( GND ) + ( \U3_TICK|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(1),
	cin => \U3_TICK|Add0~2\,
	sumout => \U3_TICK|Add0~33_sumout\,
	cout => \U3_TICK|Add0~34\);

-- Location: FF_X52_Y23_N35
\U3_TICK|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~33_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(1));

-- Location: LABCELL_X52_Y23_N36
\U3_TICK|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Add0~29_sumout\ = SUM(( \U3_TICK|IQ\(2) ) + ( GND ) + ( \U3_TICK|Add0~34\ ))
-- \U3_TICK|Add0~30\ = CARRY(( \U3_TICK|IQ\(2) ) + ( GND ) + ( \U3_TICK|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_IQ\(2),
	cin => \U3_TICK|Add0~34\,
	sumout => \U3_TICK|Add0~29_sumout\,
	cout => \U3_TICK|Add0~30\);

-- Location: FF_X52_Y23_N38
\U3_TICK|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~29_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(2));

-- Location: FF_X52_Y23_N41
\U3_TICK|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U3_TICK|Add0~25_sumout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	sclr => \U3_TICK|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U3_TICK|IQ\(3));

-- Location: LABCELL_X52_Y23_N9
\U3_TICK|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U3_TICK|Equal0~1_combout\ = ( !\U3_TICK|IQ\(1) & ( (!\U3_TICK|IQ\(3) & !\U3_TICK|IQ\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U3_TICK|ALT_INV_IQ\(3),
	datad => \U3_TICK|ALT_INV_IQ\(2),
	dataf => \U3_TICK|ALT_INV_IQ\(1),
	combout => \U3_TICK|Equal0~1_combout\);

-- Location: IOIBUF_X54_Y20_N38
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X53_Y23_N43
\U1_UC|Eatual.espera~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.espera~DUPLICATE_q\);

-- Location: LABCELL_X53_Y23_N3
\U1_UC|Eprox.transmissao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1_UC|Eprox.transmissao~0_combout\ = ( \U1_UC|Eatual.espera~DUPLICATE_q\ & ( \U3_TICK|Equal0~0_combout\ & ( \U3_TICK|Equal0~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U3_TICK|ALT_INV_Equal0~1_combout\,
	datae => \U1_UC|ALT_INV_Eatual.espera~DUPLICATE_q\,
	dataf => \U3_TICK|ALT_INV_Equal0~0_combout\,
	combout => \U1_UC|Eprox.transmissao~0_combout\);

-- Location: FF_X53_Y23_N5
\U1_UC|Eatual.transmissao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Eprox.transmissao~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.transmissao~q\);

-- Location: FF_X52_Y23_N25
\U2_FD|U2|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ~0_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	ena => \U1_UC|Eatual.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ\(0));

-- Location: LABCELL_X52_Y23_N6
\U2_FD|U2|IQ[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U2|IQ[1]~3_combout\ = ( \U2_FD|U2|IQ\(0) & ( !\U1_UC|Eatual.transmissao~q\ $ (!\U2_FD|U2|IQ\(1)) ) ) # ( !\U2_FD|U2|IQ\(0) & ( \U2_FD|U2|IQ\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1_UC|ALT_INV_Eatual.transmissao~q\,
	datad => \U2_FD|U2|ALT_INV_IQ\(1),
	dataf => \U2_FD|U2|ALT_INV_IQ\(0),
	combout => \U2_FD|U2|IQ[1]~3_combout\);

-- Location: FF_X52_Y23_N8
\U2_FD|U2|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ[1]~3_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ\(1));

-- Location: LABCELL_X52_Y23_N24
\U2_FD|U2|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U2|IQ~0_combout\ = ( \U2_FD|U2|IQ\(3) & ( (!\U2_FD|U2|IQ\(0) & ((!\U2_FD|U2|IQ[2]~DUPLICATE_q\) # (\U2_FD|U2|IQ\(1)))) ) ) # ( !\U2_FD|U2|IQ\(3) & ( !\U2_FD|U2|IQ\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011110011000000001111001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2_FD|U2|ALT_INV_IQ\(1),
	datac => \U2_FD|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datad => \U2_FD|U2|ALT_INV_IQ\(0),
	dataf => \U2_FD|U2|ALT_INV_IQ\(3),
	combout => \U2_FD|U2|IQ~0_combout\);

-- Location: FF_X52_Y23_N26
\U2_FD|U2|IQ[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ~0_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	ena => \U1_UC|Eatual.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ[0]~DUPLICATE_q\);

-- Location: FF_X52_Y23_N19
\U2_FD|U2|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ~2_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	ena => \U1_UC|Eatual.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ\(2));

-- Location: LABCELL_X52_Y23_N18
\U2_FD|U2|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U2|IQ~2_combout\ = ( \U2_FD|U2|IQ\(1) & ( !\U2_FD|U2|IQ[0]~DUPLICATE_q\ $ (!\U2_FD|U2|IQ\(2)) ) ) # ( !\U2_FD|U2|IQ\(1) & ( (\U2_FD|U2|IQ\(2) & ((!\U2_FD|U2|IQ\(3)) # (\U2_FD|U2|IQ[0]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001111000000001100111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \U2_FD|U2|ALT_INV_IQ\(3),
	datac => \U2_FD|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	datad => \U2_FD|U2|ALT_INV_IQ\(2),
	dataf => \U2_FD|U2|ALT_INV_IQ\(1),
	combout => \U2_FD|U2|IQ~2_combout\);

-- Location: FF_X52_Y23_N20
\U2_FD|U2|IQ[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ~2_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	ena => \U1_UC|Eatual.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ[2]~DUPLICATE_q\);

-- Location: LABCELL_X52_Y23_N27
\U2_FD|U2|IQ~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U2|IQ~1_combout\ = ( \U2_FD|U2|IQ\(0) & ( !\U2_FD|U2|IQ\(3) $ (((!\U2_FD|U2|IQ[2]~DUPLICATE_q\) # (!\U2_FD|U2|IQ\(1)))) ) ) # ( !\U2_FD|U2|IQ\(0) & ( (\U2_FD|U2|IQ\(3) & ((!\U2_FD|U2|IQ[2]~DUPLICATE_q\) # (\U2_FD|U2|IQ\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101111000000001010111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2_FD|U2|ALT_INV_IQ[2]~DUPLICATE_q\,
	datac => \U2_FD|U2|ALT_INV_IQ\(1),
	datad => \U2_FD|U2|ALT_INV_IQ\(3),
	dataf => \U2_FD|U2|ALT_INV_IQ\(0),
	combout => \U2_FD|U2|IQ~1_combout\);

-- Location: FF_X52_Y23_N29
\U2_FD|U2|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U2|IQ~1_combout\,
	clrn => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	ena => \U1_UC|Eatual.transmissao~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U2|IQ\(3));

-- Location: LABCELL_X52_Y23_N15
\U2_FD|U2|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U2|Equal0~0_combout\ = ( !\U2_FD|U2|IQ[0]~DUPLICATE_q\ & ( (\U2_FD|U2|IQ\(3) & (\U2_FD|U2|IQ\(2) & !\U2_FD|U2|IQ\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U2_FD|U2|ALT_INV_IQ\(3),
	datab => \U2_FD|U2|ALT_INV_IQ\(2),
	datac => \U2_FD|U2|ALT_INV_IQ\(1),
	dataf => \U2_FD|U2|ALT_INV_IQ[0]~DUPLICATE_q\,
	combout => \U2_FD|U2|Equal0~0_combout\);

-- Location: LABCELL_X53_Y23_N42
\U1_UC|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1_UC|Selector1~0_combout\ = ( \U1_UC|Eatual.espera~q\ & ( \U1_UC|Eatual.transmissao~q\ & ( (!\U2_FD|U2|Equal0~0_combout\) # (\U1_UC|Eatual.preparacao~q\) ) ) ) # ( !\U1_UC|Eatual.espera~q\ & ( \U1_UC|Eatual.transmissao~q\ & ( 
-- (!\U2_FD|U2|Equal0~0_combout\) # (\U1_UC|Eatual.preparacao~q\) ) ) ) # ( \U1_UC|Eatual.espera~q\ & ( !\U1_UC|Eatual.transmissao~q\ & ( ((!\U2_FD|U2|Equal0~0_combout\ & ((!\U3_TICK|Equal0~1_combout\) # (!\U3_TICK|Equal0~0_combout\)))) # 
-- (\U1_UC|Eatual.preparacao~q\) ) ) ) # ( !\U1_UC|Eatual.espera~q\ & ( !\U1_UC|Eatual.transmissao~q\ & ( \U1_UC|Eatual.preparacao~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111111000001111111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U3_TICK|ALT_INV_Equal0~1_combout\,
	datab => \U3_TICK|ALT_INV_Equal0~0_combout\,
	datac => \U2_FD|U2|ALT_INV_Equal0~0_combout\,
	datad => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datae => \U1_UC|ALT_INV_Eatual.espera~q\,
	dataf => \U1_UC|ALT_INV_Eatual.transmissao~q\,
	combout => \U1_UC|Selector1~0_combout\);

-- Location: FF_X53_Y23_N44
\U1_UC|Eatual.espera\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Selector1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.espera~q\);

-- Location: LABCELL_X53_Y23_N54
\U1_UC|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1_UC|Selector2~0_combout\ = ( \U3_TICK|Equal0~0_combout\ & ( (\U2_FD|U2|Equal0~0_combout\ & (((!\U3_TICK|Equal0~1_combout\ & \U1_UC|Eatual.espera~q\)) # (\U1_UC|Eatual.transmissao~q\))) ) ) # ( !\U3_TICK|Equal0~0_combout\ & ( 
-- (\U2_FD|U2|Equal0~0_combout\ & ((\U1_UC|Eatual.transmissao~q\) # (\U1_UC|Eatual.espera~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111111000000000011111100000000001011110000000000101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U3_TICK|ALT_INV_Equal0~1_combout\,
	datab => \U1_UC|ALT_INV_Eatual.espera~q\,
	datac => \U1_UC|ALT_INV_Eatual.transmissao~q\,
	datad => \U2_FD|U2|ALT_INV_Equal0~0_combout\,
	dataf => \U3_TICK|ALT_INV_Equal0~0_combout\,
	combout => \U1_UC|Selector2~0_combout\);

-- Location: FF_X53_Y23_N56
\U1_UC|Eatual.final~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.final~DUPLICATE_q\);

-- Location: LABCELL_X53_Y23_N6
\U1_UC|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1_UC|Selector0~0_combout\ = ( !\U1_UC|Eatual.final~DUPLICATE_q\ & ( ((\partida~input_o\ & !\U4_ED|signal_d~q\)) # (\U1_UC|Eatual.inicial~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111111010100001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_partida~input_o\,
	datac => \U4_ED|ALT_INV_signal_d~q\,
	datad => \U1_UC|ALT_INV_Eatual.inicial~q\,
	dataf => \U1_UC|ALT_INV_Eatual.final~DUPLICATE_q\,
	combout => \U1_UC|Selector0~0_combout\);

-- Location: FF_X53_Y23_N8
\U1_UC|Eatual.inicial\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Selector0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.inicial~q\);

-- Location: LABCELL_X53_Y23_N57
\U1_UC|Eprox.preparacao~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U1_UC|Eprox.preparacao~0_combout\ = ( !\U4_ED|signal_d~q\ & ( (!\U1_UC|Eatual.inicial~q\ & \partida~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \U1_UC|ALT_INV_Eatual.inicial~q\,
	datad => \ALT_INV_partida~input_o\,
	dataf => \U4_ED|ALT_INV_signal_d~q\,
	combout => \U1_UC|Eprox.preparacao~0_combout\);

-- Location: FF_X52_Y23_N17
\U1_UC|Eatual.preparacao\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \U1_UC|Eprox.preparacao~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.preparacao~q\);

-- Location: IOIBUF_X54_Y21_N55
\dados_ascii[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(0),
	o => \dados_ascii[0]~input_o\);

-- Location: IOIBUF_X54_Y21_N4
\dados_ascii[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(1),
	o => \dados_ascii[1]~input_o\);

-- Location: IOIBUF_X54_Y21_N21
\dados_ascii[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(2),
	o => \dados_ascii[2]~input_o\);

-- Location: IOIBUF_X54_Y20_N4
\dados_ascii[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(3),
	o => \dados_ascii[3]~input_o\);

-- Location: IOIBUF_X54_Y19_N4
\dados_ascii[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(4),
	o => \dados_ascii[4]~input_o\);

-- Location: IOIBUF_X54_Y21_N38
\dados_ascii[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(5),
	o => \dados_ascii[5]~input_o\);

-- Location: IOIBUF_X54_Y20_N21
\dados_ascii[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_ascii(6),
	o => \dados_ascii[6]~input_o\);

-- Location: LABCELL_X53_Y23_N9
\U2_FD|s_dados[9]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|s_dados[9]~0_combout\ = ( \dados_ascii[1]~input_o\ & ( !\dados_ascii[3]~input_o\ $ (!\dados_ascii[2]~input_o\ $ (!\dados_ascii[0]~input_o\)) ) ) # ( !\dados_ascii[1]~input_o\ & ( !\dados_ascii[3]~input_o\ $ (!\dados_ascii[2]~input_o\ $ 
-- (\dados_ascii[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011001111001100001111000011001111001100001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_dados_ascii[3]~input_o\,
	datac => \ALT_INV_dados_ascii[2]~input_o\,
	datad => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \ALT_INV_dados_ascii[1]~input_o\,
	combout => \U2_FD|s_dados[9]~0_combout\);

-- Location: LABCELL_X53_Y23_N33
\U2_FD|U1|IQ~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~10_combout\ = ( \U2_FD|s_dados[9]~0_combout\ & ( (\U1_UC|Eatual.preparacao~q\ & (!\dados_ascii[6]~input_o\ $ (!\dados_ascii[4]~input_o\ $ (\dados_ascii[5]~input_o\)))) ) ) # ( !\U2_FD|s_dados[9]~0_combout\ & ( (\U1_UC|Eatual.preparacao~q\ & 
-- (!\dados_ascii[6]~input_o\ $ (!\dados_ascii[4]~input_o\ $ (!\dados_ascii[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000100010100010000010001010000010100010000010001010001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datab => \ALT_INV_dados_ascii[6]~input_o\,
	datac => \ALT_INV_dados_ascii[4]~input_o\,
	datad => \ALT_INV_dados_ascii[5]~input_o\,
	dataf => \U2_FD|ALT_INV_s_dados[9]~0_combout\,
	combout => \U2_FD|U1|IQ~10_combout\);

-- Location: LABCELL_X52_Y23_N12
\U2_FD|U1|IQ[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ[0]~1_combout\ = ( \U1_UC|Eatual.preparacao~q\ ) # ( !\U1_UC|Eatual.preparacao~q\ & ( \U1_UC|Eatual.transmissao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \U1_UC|ALT_INV_Eatual.transmissao~q\,
	dataf => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	combout => \U2_FD|U1|IQ[0]~1_combout\);

-- Location: FF_X53_Y23_N35
\U2_FD|U1|IQ[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~10_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(9));

-- Location: LABCELL_X53_Y23_N30
\U2_FD|U1|IQ~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~9_combout\ = ( \U2_FD|U1|IQ\(9) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[6]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(9) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datab => \ALT_INV_dados_ascii[6]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(9),
	combout => \U2_FD|U1|IQ~9_combout\);

-- Location: FF_X53_Y23_N31
\U2_FD|U1|IQ[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~9_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(8));

-- Location: LABCELL_X53_Y23_N15
\U2_FD|U1|IQ~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~8_combout\ = ( \U2_FD|U1|IQ\(8) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[5]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(8) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[5]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000011111111101010101111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datad => \ALT_INV_dados_ascii[5]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(8),
	combout => \U2_FD|U1|IQ~8_combout\);

-- Location: FF_X53_Y23_N16
\U2_FD|U1|IQ[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~8_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(7));

-- Location: LABCELL_X53_Y23_N12
\U2_FD|U1|IQ~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~7_combout\ = ( \U2_FD|U1|IQ\(7) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[4]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(7) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000011111111101010101111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datad => \ALT_INV_dados_ascii[4]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(7),
	combout => \U2_FD|U1|IQ~7_combout\);

-- Location: FF_X53_Y23_N14
\U2_FD|U1|IQ[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~7_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(6));

-- Location: LABCELL_X53_Y23_N21
\U2_FD|U1|IQ~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~6_combout\ = ( \U2_FD|U1|IQ\(6) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[3]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(6) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datac => \ALT_INV_dados_ascii[3]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(6),
	combout => \U2_FD|U1|IQ~6_combout\);

-- Location: FF_X53_Y23_N22
\U2_FD|U1|IQ[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~6_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(5));

-- Location: LABCELL_X53_Y23_N18
\U2_FD|U1|IQ~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~5_combout\ = ( \U2_FD|U1|IQ\(5) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[2]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(5) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datac => \ALT_INV_dados_ascii[2]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(5),
	combout => \U2_FD|U1|IQ~5_combout\);

-- Location: FF_X53_Y23_N19
\U2_FD|U1|IQ[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~5_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(4));

-- Location: LABCELL_X53_Y23_N27
\U2_FD|U1|IQ~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~4_combout\ = ( \U2_FD|U1|IQ\(4) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[1]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(4) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datac => \ALT_INV_dados_ascii[1]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(4),
	combout => \U2_FD|U1|IQ~4_combout\);

-- Location: FF_X53_Y23_N28
\U2_FD|U1|IQ[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~4_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(3));

-- Location: LABCELL_X53_Y23_N24
\U2_FD|U1|IQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~3_combout\ = ( \U2_FD|U1|IQ\(3) & ( (!\U1_UC|Eatual.preparacao~q\) # (!\dados_ascii[0]~input_o\) ) ) # ( !\U2_FD|U1|IQ\(3) & ( (\U1_UC|Eatual.preparacao~q\ & !\dados_ascii[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	datac => \ALT_INV_dados_ascii[0]~input_o\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(3),
	combout => \U2_FD|U1|IQ~3_combout\);

-- Location: FF_X53_Y23_N25
\U2_FD|U1|IQ[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(2));

-- Location: LABCELL_X53_Y23_N39
\U2_FD|U1|IQ~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~2_combout\ = ( \U2_FD|U1|IQ\(2) ) # ( !\U2_FD|U1|IQ\(2) & ( \U1_UC|Eatual.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(2),
	combout => \U2_FD|U1|IQ~2_combout\);

-- Location: FF_X53_Y23_N41
\U2_FD|U1|IQ[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(1));

-- Location: LABCELL_X53_Y23_N36
\U2_FD|U1|IQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \U2_FD|U1|IQ~0_combout\ = ( \U2_FD|U1|IQ\(1) & ( !\U1_UC|Eatual.preparacao~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \U1_UC|ALT_INV_Eatual.preparacao~q\,
	dataf => \U2_FD|U1|ALT_INV_IQ\(1),
	combout => \U2_FD|U1|IQ~0_combout\);

-- Location: FF_X53_Y23_N37
\U2_FD|U1|IQ[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U2_FD|U1|IQ~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \U2_FD|U1|IQ[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2_FD|U1|IQ\(0));

-- Location: FF_X53_Y23_N55
\U1_UC|Eatual.final\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \U1_UC|Selector2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1_UC|Eatual.final~q\);

-- Location: LABCELL_X47_Y24_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


