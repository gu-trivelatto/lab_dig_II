library ieee;
use ieee.std_logic_1164.all;

entity sonar_fd is
    port (
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
        -- SINAIS DE DEPURAÇÃO
        db_angulo: out std_logic_vector (23 downto 0);
        db_distancia: out std_logic_vector (11 downto 0);
        db_posicao: out std_logic_vector (3 downto 0);
		  db_dado_tx: out std_logic_vector (7 downto 0);
        db_estado_tx_dados_sonar, db_estado_tx, db_estado_rx: out std_logic_vector (3 downto 0);
        db_estado_hscr04: out std_logic_vector(3 downto 0)
    );
end entity;

architecture sonar_fd_arch of sonar_fd is

    component servo_medida port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        posicao: out std_logic_vector(2 downto 0);
        distancia: out std_logic_vector(11 downto 0);
        medida_pronto: out std_logic;
        db_estado_hscr04: out std_logic_vector(3 downto 0)
    );
    end component;

    component rom_8x24 port (
        endereco: in  std_logic_vector(2 downto 0);
        saida   : out std_logic_vector(23 downto 0)
    );
    end component;

    component tx_dados_sonar port (
        clock: in std_logic;
        reset: in std_logic;
        transmitir: in std_logic;
        recebe_dado: in std_logic;
        entrada_serial: in std_logic;
        angulo2: in std_logic_vector(7 downto 0); -- digitos BCD
        angulo1: in std_logic_vector(7 downto 0); -- de angulo
        angulo0: in std_logic_vector(7 downto 0);
        distancia2: in std_logic_vector(3 downto 0); -- e de distancia
        distancia1: in std_logic_vector(3 downto 0);
        distancia0: in std_logic_vector(3 downto 0);
        saida_serial: out std_logic;
        dado_recebido: out std_logic_vector (7 downto 0);
        pronto: out std_logic;
        pronto_rx: out std_logic;
		  db_dado_tx: out std_logic_vector (7 downto 0);
        db_estado_tx_dados_sonar, db_estado_tx, db_estado_rx: out std_logic_vector (3 downto 0)
    );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_pwm, s_entrada_serial, s_recebe_dado, s_rx_pronto : std_logic;
    signal s_transmitir, s_saida_serial, s_tx_pronto, s_medida_pronto : std_logic;
    signal s_posicao: std_logic_vector (2 downto 0);
    signal s_distancia: std_logic_vector (11 downto 0);
	signal s_angulo: std_logic_vector (23 downto 0); 
    signal s_dado_recebido: std_logic_vector (7 downto 0);
	 signal s_dado_tx: std_logic_vector (7 downto 0);
    signal s_estado_tx_dados_sonar, s_estado_tx, s_estado_rx : std_logic_vector (3 downto 0);
    signal s_estado_hscr04 : std_logic_vector (3 downto 0);

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;
    s_transmitir <= transmitir;
    s_recebe_dado <= recebe_dado;
    s_entrada_serial <= entrada_serial;

    SERVO: servo_medida port map(clock, s_reset, s_ligar, s_echo, s_trigger,
                                 s_pwm, s_posicao, s_distancia, s_medida_pronto, s_estado_hscr04);

    TX: tx_dados_sonar port map(clock, s_reset, s_transmitir, s_recebe_dado, s_entrada_serial,
                                s_angulo(23 downto 16), s_angulo(15 downto 8), s_angulo(7 downto 0), 
                                s_distancia(11 downto 8), s_distancia(7 downto 4), 
                                s_distancia(3 downto 0), s_saida_serial, s_dado_recebido, s_tx_pronto, s_rx_pronto,
                                s_dado_tx, s_estado_tx_dados_sonar, s_estado_tx, s_estado_rx);

    ROM: rom_8x24 port map(s_posicao, s_angulo);

    trigger <= s_trigger;
    pwm <= s_pwm;
    saida_serial <= s_saida_serial;
    tx_pronto <= s_tx_pronto;
    rx_pronto <= s_rx_pronto;
    dado_recebido <= s_dado_recebido;
    medida_pronto <= s_medida_pronto;
    db_angulo <= s_angulo;
    db_distancia <= s_distancia;
    db_posicao <= '0' & s_posicao;
    db_estado_tx <= s_estado_tx;
    db_estado_rx <= s_estado_rx;
    db_dado_tx <= s_dado_tx;
    db_estado_tx_dados_sonar <= s_estado_tx_dados_sonar;
    db_estado_hscr04 <= s_estado_hscr04;

    process (s_distancia)
    begin
        if s_distancia(11 downto 8) > "0000" then
            alerta_proximidade <= '1';
        elsif s_distancia(7 downto 4) > "0001" then
            alerta_proximidade <= '1';
        else
            alerta_proximidade <= '0';
        end if;
    end process;

end architecture;