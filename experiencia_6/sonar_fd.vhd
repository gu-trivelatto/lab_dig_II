library ieee;
use ieee.std_logic_1164.all;

entity sonar_fd is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        transmitir: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        saida_serial: out std_logic;
        medida_pronto: out std_logic;
        tx_pronto: out std_logic;
        alerta_proximidade: out std_logic
        -- SINAIS DE DEPURAÇÃO A SEREM ADICIONADOS
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
        medida_pronto: out std_logic
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
        angulo2: in std_logic_vector(7 downto 0); -- digitos BCD
        angulo1: in std_logic_vector(7 downto 0); -- de angulo
        angulo0: in std_logic_vector(7 downto 0);
        distancia2: in std_logic_vector(3 downto 0); -- e de distancia
        distancia1: in std_logic_vector(3 downto 0);
        distancia0: in std_logic_vector(3 downto 0);
        saida_serial: out std_logic;
        pronto: out std_logic
    );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_pwm : std_logic;
    signal s_transmitir, s_saida_serial, s_tx_pronto, s_medida_pronto : std_logic;
    signal s_posicao: std_logic_vector (2 downto 0);
    signal s_distancia: std_logic_vector (11 downto 0); 

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;
    s_transmitir <= transmitir;

    SERVO: servo_medida port map(clock, s_reset, s_ligar, s_echo, s_trigger,
                                 s_pwm, s_posicao, s_distancia, s_medida_pronto);

    TX: tx_dados_sonar port map(clock, s_reset, s_transmitir, s_angulo(23 downto 16),
                                s_angulo(15 downto 8), s_angulo(7 downto 0), 
                                s_distancia(11 downto 8), s_distancia(7 downto 4), 
                                s_distancia(3 downto 0), s_saida_serial, s_tx_pronto);

    ROM: rom_8x24 port map(s_posicao, s_angulo);

    trigger <= s_trigger;
    pwm <= s_pwm;
    saida_serial <= s_saida_serial;
    tx_pronto <= s_tx_pronto;
    medida_pronto <= s_medida_pronto;

    process (s_distancia)
    begin
        if s_distancia(11 downto 8) > "0000" then
            alerta_proximidade='1';
        elsif s_distancia(7 downto 4) > "0001" then
            alerta_proximidade='1';
        else
            alerta_proximidade='0';
        end if;
    end process;

end architecture