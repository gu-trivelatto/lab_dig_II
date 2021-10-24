library ieee;
use ieee.std_logic_1164.all;

entity sonar is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        saida_serial: out std_logic;
        alerta_proximidade: out std_logic
        -- fazer sinais de db
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
        ligar_sonar: out std_logic
    );
    end component;

    component sonar_fd port(
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        transmitir: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        saida_serial: out std_logic;
        medida_pronto: out std_logic;
        alerta_proximidade: out std_logic
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_pwm, s_saida_serial, s_alerta_proximidade : std_logic;
    signal s_medida_pronto, s_tx_pronto, s_transmitir, s_ligar_sonar : std_logic;

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;

    UC: sonar_uc port map(clock, s_reset, s_ligar, s_medida_pronto, s_tx_pronto,
                          s_transmitir, s_ligar_sonar);

    FD: sonar_fd port map(clock, s_reset, s_ligar_sonar, s_echo, s_transmitir,
                          s_trigger, s_pwm, s_saida_serial, s_medida_pronto, alerta_proximidade);

    trigger <= s_trigger;
    pwm <= s_pwm;
    saida_serial <= s_saida_serial;

end architecture