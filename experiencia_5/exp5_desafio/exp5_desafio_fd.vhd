library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

entity exp5_desafio_fd is
    port (
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
end entity;

architecture exp5_desafio_fd_arch of exp5_desafio_fd is

    component interface_hcsr04 port(
        clock, reset, medir :          in  std_logic;
        echo :                         in  std_logic;
        trigger :                      out std_logic;
        medida :                       out std_logic_vector (11 downto 0);
        pronto :                       out std_logic;
        db_estado :                    out std_logic_vector (3 downto 0)
    );
    end component;

    component teste_movimentacao_servomotor port(
        clock, ligar, reset : in std_logic;
        pwm : out std_logic;
        posicao, slider : out std_logic_vector (2 downto 0)
    );
    end component;

    signal s_reset, s_girar, s_echo, s_medir, s_trigger, s_pronto, s_pwm : std_logic;
    signal s_posicao : std_logic_vector (2 downto 0);
    signal s_distancia : std_logic_vector (11 downto 0);

begin

    s_reset <= reset;
    s_girar <= girar;
    s_echo <= echo;
    s_medir <= medir;

    HCSR: interface_hcsr04 port map(clock, s_reset, s_medir, s_echo, s_trigger, s_distancia, s_pronto, open);

    SERVO: teste_movimentacao_servomotor port map(clock, s_girar, s_reset, s_pwm, s_posicao, open);

    trigger <= s_trigger;
    posicao <= s_posicao;
    distancia <= s_distancia;
    medida_pronto <= s_pronto;
    pwm <= s_pwm;

end architecture;