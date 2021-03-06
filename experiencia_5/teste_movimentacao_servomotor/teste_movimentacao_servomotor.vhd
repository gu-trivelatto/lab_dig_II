library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity teste_movimentacao_servomotor is
port (
    clock, ligar, reset : in std_logic;
    db_ligar, db_pwm, pwm, db_reset : out std_logic;
    posicao, slider : out std_logic_vector (2 downto 0);
    db_posicao_sseg : out std_logic_vector (6 downto 0)
);
end teste_movimentacao_servomotor;

architecture teste_movimentacao_servomotor_arch of teste_movimentacao_servomotor is

    component controle_servo_3 port (
        clock       : in std_logic;
        reset       : in std_logic;
        posicao     : in std_logic_vector(2 downto 0);
        pwm         : out std_logic;
        db_reset    : out std_logic;
        db_pwm      : out std_logic;
        db_posicao  : out std_logic_vector(2 downto 0);
	    slider      : out std_logic_vector(2 downto 0)
    );
    end component;

    component contadorg_m
    generic (
        constant M: integer
    );
    port (
        clock, zera_as, zera_s, conta: in std_logic;
        Q: out std_logic_vector (natural(ceil(log2(real(M))))-1 downto 0);
        fim, meio: out std_logic
    );
    end component;
    
    component contadorg_updown_m 
    generic (
        constant M: integer := 50 -- modulo do contador
    );
    port (
        clock:   in  std_logic;
        zera_as: in  std_logic;
        zera_s:  in  std_logic;
        conta:   in  std_logic;
        Q:       out std_logic_vector (natural(ceil(log2(real(M))))-1 downto 0);
        inicio:  out std_logic;
        fim:     out std_logic;
        meio:    out std_logic 
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    signal s_reset, s_pwm, s_db_pwm, s_ligar, s_fim : std_logic;
    signal s_posicao : std_logic_vector (2 downto 0);
    signal s_posicao_4_bits : std_logic_vector (3 downto 0);

begin

    s_ligar <= ligar;
    s_reset <= reset;
    s_posicao_4_bits <= '0' & s_posicao;

    CS: controle_servo_3 port map (clock, s_reset, s_posicao, s_pwm, open, s_db_pwm, open, open);

    ONE_SEC: contadorg_m generic map (M => 50000000) port map (clock, s_reset, '0', s_ligar, open, s_fim, open);

    UPDOWN: contadorg_updown_m generic map (M => 8) port map (clock, s_reset, '0', s_fim, s_posicao, open, open, open);

    SSEG: hex7seg port map (s_posicao_4_bits, db_posicao_sseg);

    slider <= s_posicao;
    posicao <= s_posicao;
    pwm <= s_pwm;
    db_ligar <= ligar;
    db_reset <= reset;
    db_pwm <= s_pwm;


end architecture;