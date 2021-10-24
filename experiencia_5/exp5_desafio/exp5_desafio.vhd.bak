library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

entity exp5_desafio is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        posicao: out std_logic_vector(2 downto 0);
        distancia: out std_logic_vector(11 downto 0);
        distancia0: out std_logic_vector(6 downto 0);
        distancia1: out std_logic_vector(6 downto 0);
        distancia2: out std_logic_vector(6 downto 0);
        db_estado: out std_logic_vector(6 downto 0);
        db_posicao: out std_logic_vector(6 downto 0);
        db_reset: out std_logic;
        db_ligar: out std_logic
    );
end entity;

architecture exp5_desafio_arch of exp5_desafio is

    component exp5_desafio_fd port(
        clock: in std_logic;
        reset: in std_logic;
        girar: in std_logic;
        medir: in std_logic;
        echo: in std_logic;
        trigger: out std_logic;
        pwm: out std_logic;
        posicao: out std_logic_vector(2 downto 0);
        distancia: out std_logic_vector(11 downto 0);
        medida_pronto: out std_logic
    );
    end component;

    component exp5_desafio_uc port(
        clock, reset, ligar, medida_pronto : in  std_logic;
        gira, mede :                         out std_logic;
        estado_hex :                         out std_logic_vector (3 downto 0)
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    signal s_reset, s_ligar, s_echo, s_trigger, s_girar, s_medir, s_pwm, s_medida_pronto : std_logic;
    signal s_posicao : std_logic_vector (2 downto 0);
    signal s_posicao_4bits : std_logic_vector (3 downto 0);
    signal s_distancia : std_logic_vector (11 downto 0); 
    signal s_estado : std_logic_vector (3 downto 0);

begin

    s_reset <= reset;
    s_ligar <= ligar;
    s_echo <= echo;

    FD: exp5_desafio_fd port map(clock, s_reset, s_girar, s_medir, s_echo, s_trigger, s_pwm, s_posicao, s_distancia, s_medida_pronto);

    UC: exp5_desafio_uc port map(clock, s_reset, s_ligar, s_medida_pronto, s_girar, s_medir, s_estado);

    SSEG_POS: hex7seg port map(s_posicao_4bits, db_posicao);

    SSEG_D0: hex7seg port map(s_distancia(3 downto 0), distancia0);
    
    SSEG_D1: hex7seg port map(s_distancia(7 downto 4), distancia1);
    
    SSEG_D2: hex7seg port map(s_distancia(11 downto 8), distancia2);

    SSEG_UC: hex7seg port map(s_estado, db_estado);

    s_posicao_4bits <= '0' & s_posicao;
    trigger <= s_trigger;
    pwm <= s_pwm;

end architecture;