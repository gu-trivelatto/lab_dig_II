library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity rx_serial_8N2 is
    port (
        clock, reset, dado_serial, recebe_dado, pronto_rx, tem_dado : in  std_logic;
        dado_recebido :                                               in  std_logic_vector (7 downto 0);
        db_estado :                                                   out std_logic (6 downto 0)
    );
end entity;

architecture rx_serial_8N2_arch of rx_serial_8N2 is
     
    component rx_serial_tick_uc port ( 
            clock, reset, partida, tick, fim, recebe_dado: in  std_logic;
            zera, limpa, conta, carrega, desloca, pronto, registra, tem_dado: out std_logic ;
            estado_hex: out std_logic_vector (3 downto 0)
    );
    end component;

    component rx_serial_8N2_fd port (
        clock, reset, limpa, registra: in std_logic;
        zera, conta, carrega, desloca: in std_logic;
        dados_ascii: in std_logic_vector (7 downto 0);
        saida_serial, fim : out std_logic
    );
    end component;
    
    component contadorg_m
    generic (
        constant M: integer
    );
    port (
        clock, zera_as, zera_s, conta: in std_logic;
        Q: out std_logic_vector (N-1 downto 0);
        fim, meio: out std_logic
    );
    end component;
    
    component edge_detector is port ( 
             clk         : in   std_logic;
             signal_in   : in   std_logic;
             output      : out  std_logic
    );
    end component;
    
    signal s_reset, s_partida, s_partida_ed, s_limpa, s_registra: std_logic;
    signal s_zera, s_conta, s_carrega, s_desloca, s_tick, s_fim: std_logic;

begin

    -- sinais reset e partida mapeados na GPIO (ativos em alto)
    s_reset       <= reset;
    s_partida     <= partida;
    s_recebe_dado <= recebe_dado

    -- unidade de controle
    U1_UC: tx_serial_tick_uc port map (clock, s_reset, s_partida_ed, s_tick, s_fim, s_recebe_dado,
                                       s_zera, s_limpa, s_conta, s_carrega, s_desloca, pronto, s_registra, db_estado);

    -- fluxo de dados
    U2_FD: tx_serial_8N2_fd port map (clock, s_reset, s_limpa, s_registra, s_zera, s_conta, s_carrega, s_desloca, 
                                      dados_ascii, saida_serial, s_fim);

    -- gerador de tick
    -- fator de divisao 50MHz para 9.600 bauds (5208=50M/9600)
    U3_TICK: contadorg_m generic map (M => 5208) port map (clock, s_zera, s_zera, '1', open, open, s_tick);
 
    -- detetor de borda para tratar pulsos largos
    U4_ED: edge_detector port map (clock, s_partida, s_partida_ed);
    
end architecture;

