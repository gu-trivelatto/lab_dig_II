library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

entity servo_medida is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        posicao: out std_logic_vector(2 downto 0);
        distancia: out std_logic_vector(11 downto 0);
        medida_pronto: out std_logic;
        db_estado_hscr04: out std_logic_vector(3 downto 0);
		  db_girar: out std_logic
    );
end entity;

architecture servo_medida_arch of servo_medida is

    component servo_medida_fd port(
        clock: in std_logic;
        reset: in std_logic;
        girar: in std_logic;
        medir: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
		  fim_girar: out std_logic;
        posicao: out std_logic_vector(2 downto 0);
        distancia: out std_logic_vector(11 downto 0);
        medida_pronto: out std_logic;
        db_estado_hscr04: out std_logic_vector(3 downto 0)
    );
    end component;

    component servo_medida_uc port(
        clock, reset, ligar, medida_pronto, fim_girar : in  std_logic;
        gira, mede :                                    out std_logic;
        estado_hex :                                    out std_logic_vector (3 downto 0)
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_girar, s_medir, s_pwm, s_medida_pronto, s_fim_girar : std_logic;
    signal s_posicao : std_logic_vector (2 downto 0);
    signal s_distancia : std_logic_vector (11 downto 0); 
    signal s_estado : std_logic_vector (3 downto 0);
    signal s_estado_hscr04 : std_logic_vector (3 downto 0);

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;

    FD: servo_medida_fd port map(clock, s_reset, s_girar, s_medir, s_echo, s_trigger, s_pwm, s_fim_girar, s_posicao, s_distancia, s_medida_pronto, s_estado_hscr04);

    UC: servo_medida_uc port map(clock, s_reset, s_ligar, s_medida_pronto, s_fim_girar, s_girar, s_medir, s_estado);

    posicao <= s_posicao;
    trigger <= s_trigger;
    pwm <= s_pwm;
    medida_pronto <= s_medida_pronto;
    db_estado_hscr04 <= s_estado_hscr04;
	 db_girar <= s_girar;
	 distancia <= s_distancia;

end architecture;