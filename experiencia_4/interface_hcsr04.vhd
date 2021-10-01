library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;


entity interface_hcsr04 is
    port (
        clock, reset, medir :          in  std_logic;
        echo :                         in  std_logic;
        trigger :                      out std_logic;
        medida :                       out std_logic_vector (11 downto 0);
        db_estado :                    out std_logic_vector (3 downto 0);
        pronto :                       out std_logic;
        -- debuggers para a distância em sseg
        db_dist0, db_dist1, db_dist2 : out std_logic_vector (6 downto 0);
        -- outros debuggers
        db_medir, db_reset :           out std_logic;
        db_trigger, db_echo :          out std_logic;
        db_estado_sseg :               out std_logic_vector (6 downto 0)
    );
end entity;

architecture interface_hcsr04_arch of interface_hcsr04 is
     
    component interface_hcsr04_uc port ( 
            clock, reset, medir, echo :           in  std_logic;
            conta, pronto, registra, gera, zera : out std_logic;
            estado_hex :                          out std_logic_vector (3 downto 0)
    );
    end component;

    component interface_hcsr04_fd port (
            clock, zera, conta : in  std_logic;
            registra, gera :     in  std_logic;
            distancia :          out std_logic_vector (11 downto 0);
            fim, trigger :       out std_logic;
            db_trigger :         out std_logic
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
    signal s_db_estado : std_logic_vector (3 downto 0);
    signal s_medida : std_logic_vector (11 downto 0);

begin

    -- sinais mapeados na GPIO (ativos em alto)
    s_reset  <= reset;
    s_echo   <= echo;
    s_medir  <= medir;

    -- unidade de controle
    U1_UC: interface_hcsr04_uc port map (clock, s_reset, s_medir_ed, s_echo, s_conta,
                                         pronto, s_registra, s_gera, s_zera, s_db_estado);

    -- fluxo de dados
    U2_FD: interface_hcsr04_fd port map (clock, s_zera, s_conta, s_registra, s_gera, 
                                         s_medida, open, s_trigger);

    U3_ED: edge_detector port map (clock, s_medir, s_medir_ed);

    -- conversor de 7 segmentos para o estado da UC
    U4_SSEG: hex7seg port map (s_db_estado, db_estado_sseg);

    -- conversores de 7 segmentos para a distância
    U5_SSEG: hex7seg port map (s_medida(3 downto 0), db_dist0);

    U6_SSEG: hex7seg port map (s_medida(7 downto 4), db_dist1);

    U7_SSEG: hex7seg port map (s_medida(11 downto 8), db_dist2);

    db_reset <= reset;
    db_medir <= medir;
    db_echo  <= echo;
    db_estado <= s_db_estado;
    db_trigger <= s_trigger;
    trigger <= s_trigger;
    medida <= s_medida;
    
end architecture;

