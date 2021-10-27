library ieee;
use ieee.std_logic_1164.all;

entity sonar is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        recebe_dado: in std_logic;
        entrada_serial: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        saida_serial: out std_logic;
        alerta_proximidade: out std_logic;
        -- fazer sinais de db
        selector: in std_logic_vector (1 downto 0);
        sseg_1, sseg_2, sseg_3, sseg_4, sseg_5, sseg_6 : out std_logic_vector (6 downto 0);
		  db_reset, db_ligar: out std_logic;
		  db_selector: out std_logic_vector (1 downto 0);
		  db_girar: out std_logic;
		  db_saida_serial, db_recebe_dado, db_ligar_sonar: out std_logic;
		  scope_pwm, scope_saida_serial: out std_logic;
		  db_alerta_proximidade, db_halt: out std_logic
    );
end entity;

architecture sonar_arch of sonar is

    component sonar_uc port(
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        medida_pronto: in std_logic;
        tx_pronto: in std_logic;
        transmitir: out std_logic;
        ligar_sonar: out std_logic;
		  estado_hex: out std_logic_vector (3 downto 0);
          dado_recebido: in std_logic_vector (7 downto 0);
          enable_reg: out std_logic;
          halt: in std_logic
    );
    end component;

    component sonar_fd port(
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        transmitir: in std_logic;
        recebe_dado: in std_logic;
        entrada_serial: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        saida_serial: out std_logic;
        dado_recebido: out std_logic_vector (7 downto 0);
        medida_pronto: out std_logic;
        tx_pronto: out std_logic;
        rx_pronto: out std_logic;
        alerta_proximidade: out std_logic;
        db_angulo: out std_logic_vector (23 downto 0);
        db_distancia: out std_logic_vector (11 downto 0);
        db_posicao: out std_logic_vector (3 downto 0);
		  db_dado_tx: out std_logic_vector (7 downto 0);
        db_estado_tx_dados_sonar, db_estado_tx, db_estado_rx: out std_logic_vector (3 downto 0);
        db_estado_hscr04: out std_logic_vector(3 downto 0);
		  db_girar: out std_logic;
          enable_reg: in std_logic;
          halt: out std_logic
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    component mux_4x1_n is 
        generic (
            BITS: integer
        );
        port (
            D0 :     in  std_logic_vector (BITS-1 downto 0);
            D1 :     in  std_logic_vector (BITS-1 downto 0);
            D2 :     in  std_logic_vector (BITS-1 downto 0);
            D3 :     in  std_logic_vector (BITS-1 downto 0);
            SEL:     in  std_logic_vector (1 downto 0);
            MUX_OUT: out std_logic_vector (BITS-1 downto 0)
        );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_pwm, s_saida_serial, s_alerta_proximidade, s_rx_pronto, s_entrada_serial, s_recebe_dado : std_logic;
    signal s_medida_pronto, s_tx_pronto, s_transmitir, s_ligar_sonar, s_girar, s_enable_reg, s_halt : std_logic;
    signal s_dado_tx, s_dado_recebido : std_logic_vector (7 downto 0);
    signal hex1, hex2, hex3, hex4, hex5, hex6 : std_logic_vector (3 downto 0);
    signal s_db_estado, s_db_posicao : std_logic_vector (3 downto 0);
    signal s_db_angulo : std_logic_vector (23 downto 0);
    signal s_db_distancia : std_logic_vector (11 downto 0);
    signal s_estado_tx_dados_sonar, s_estado_tx, s_estado_rx : std_logic_vector (3 downto 0);
    signal s_estado_hscr04 : std_logic_vector (3 downto 0);

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;
	s_recebe_dado <= recebe_dado;
	s_entrada_serial <= entrada_serial;

    UC: sonar_uc port map(clock, s_reset, s_ligar, s_medida_pronto, s_tx_pronto,
                          s_transmitir, s_ligar_sonar, s_db_estado, s_dado_recebido, s_enable_reg, s_halt);

    FD: sonar_fd port map(clock, s_reset, s_ligar_sonar, s_echo, s_transmitir, s_recebe_dado, s_entrada_serial,
                          s_trigger, s_pwm, s_saida_serial, s_dado_recebido, s_medida_pronto, s_tx_pronto, s_rx_pronto, s_alerta_proximidade,
                          s_db_angulo, s_db_distancia, s_db_posicao, s_dado_tx, s_estado_tx_dados_sonar, s_estado_tx, s_estado_rx, s_estado_hscr04, s_girar, s_enable_reg, s_halt);

    MUX1: mux_4x1_n generic map(BITS => 4) port map(s_db_posicao, s_estado_tx, s_estado_tx_dados_sonar, s_db_estado, selector, hex1);
    
    MUX2: mux_4x1_n generic map(BITS => 4) port map(s_estado_hscr04, s_dado_tx(7 downto 4), s_db_posicao, "1111", selector, hex2);
    
    MUX3: mux_4x1_n generic map(BITS => 4) port map("1111", s_dado_tx(3 downto 0), s_dado_tx(7 downto 4), "1111", selector, hex3);
    
    MUX4: mux_4x1_n generic map(BITS => 4) port map(s_db_distancia(11 downto 8), s_estado_rx, s_dado_tx(3 downto 0), s_db_angulo(19 downto 16), selector, hex4);
    
    MUX5: mux_4x1_n generic map(BITS => 4) port map(s_db_distancia(7 downto 4), s_dado_recebido(7 downto 4), "1111", s_db_angulo(11 downto 8), selector, hex5);

    MUX6: mux_4x1_n generic map(BITS => 4) port map(s_db_distancia(3 downto 0), s_dado_recebido(3 downto 0), "1111", s_db_angulo(3 downto 0), selector, hex6);

    SSEG1: hex7seg port map(hex1, sseg_1);
    
    SSEG2: hex7seg port map(hex2, sseg_2);
    
    SSEG3: hex7seg port map(hex3, sseg_3);
    
    SSEG4: hex7seg port map(hex4, sseg_4);
    
    SSEG5: hex7seg port map(hex5, sseg_5);
    
    SSEG6: hex7seg port map(hex6, sseg_6);

    trigger <= s_trigger;
    pwm <= s_pwm;
    saida_serial <= s_saida_serial;
	 
	 db_reset <= reset;
	 db_ligar <= ligar;
	 db_selector <= selector;
	 db_girar <= s_girar;
	 db_recebe_dado <= recebe_dado;
	 db_saida_serial <= s_saida_serial;
	 db_ligar_sonar <= s_ligar_sonar;
	 alerta_proximidade <= s_alerta_proximidade;
	 db_alerta_proximidade <= s_alerta_proximidade;
	 
	 scope_pwm <= s_pwm;
	 scope_saida_serial <= s_saida_serial;
	 db_halt <= s_halt;
	 

end architecture;