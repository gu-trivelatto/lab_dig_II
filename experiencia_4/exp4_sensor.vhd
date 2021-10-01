library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;


entity exp4_sensor is
    port (
        clock, reset, medir :          in  std_logic;
        echo :                         in  std_logic;
        trigger :                      out std_logic;
        hex0, hex1, hex2 :             out std_logic_vector (6 downto 0);
        pronto :                       out std_logic;
        db_medir, db_reset :           out std_logic;
        db_trigger, db_echo :          out std_logic;
        db_estado :                    out std_logic_vector (6 downto 0)
    );
end entity;

architecture exp4_sensor_arch of exp4_sensor is
     
    component interface_hcsr04 port (
        clock, reset, medir :          in  std_logic;
        echo :                         in  std_logic;
        trigger :                      out std_logic;
        medida :                       out std_logic_vector (11 downto 0);
        db_estado :                    out std_logic_vector (3 downto 0);
        pronto :                       out std_logic;
        db_dist0, db_dist1, db_dist2 : out std_logic_vector (3 downto 0);
        db_medir, db_reset :           out std_logic;
        db_trigger, db_echo :          out std_logic
    );
    end component;
    
    component edge_detector is port ( 
             clk         : in   std_logic;
             signal_in   : in   std_logic;
             output      : out  std_logic
    );
    end component;

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;
    
    signal s_reset, s_limpa, s_registra, s_zera, s_echo : std_logic;
    signal s_conta, s_gera, s_medir, s_medir_ed, s_trigger : std_logic;
    signal s_db_dist0, s_db_dist1, s_db_dist2 : std_logic_vector (3 downto 0);
    signal s_db_estado : std_logic_vector (3 downto 0);

begin

    -- sinais mapeados na GPIO (ativos em alto)
    s_reset  <= reset;
    s_echo   <= echo;
    s_medir  <= medir;

    -- interface
    U1: interface_hcsr04 port map (clock, s_reset, s_medir_ed, s_echo, s_trigger, open, s_db_estado,
                                   pronto, s_db_dist0, s_db_dist1, s_db_dist2, open, open, open, open);

    U3_ED: edge_detector port map (clock, s_medir, s_medir_ed);

    -- conversor de 7 segmentos para o estado da UC
    U4_SSEG: hex7seg port map (s_db_estado, db_estado);

    -- conversores de 7 segmentos para a distância
    U5_SSEG: hex7seg port map (s_db_dist0, hex0);

    U6_SSEG: hex7seg port map (s_db_dist1, hex1);

    U7_SSEG: hex7seg port map (s_db_dist2, hex2);

    db_reset <= s_reset;
    db_medir <= s_medir;
    db_echo  <= s_echo;
    db_trigger <= s_trigger;
    trigger <= s_trigger;
    
end architecture;

