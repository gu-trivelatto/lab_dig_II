library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tx_serial_8N2 is
    port (
        clock, reset, partida: in  std_logic;
        dados_ascii:           in  std_logic_vector (7 downto 0);
        saida_serial, pronto : out std_logic;
        db_estado :            out std_logic_vector (3 downto 0)
    );
end entity;

architecture tx_serial_8N2_arch of tx_serial_8N2 is
     
    component tx_serial_tick_uc port ( 
            clock, reset, partida, tick, fim:      in  std_logic;
            zera, conta, carrega, desloca, pronto: out std_logic;
            estado_hex:                            out std_logic_vector (3 downto 0) 
    );
    end component;

    component tx_serial_8N2_fd port (
        clock, reset: in std_logic;
        zera, conta, carrega, desloca: in std_logic;
        dados_ascii: in std_logic_vector (7 downto 0);
        saida_serial, fim : out std_logic
    );
    end component;
    
    component contador_m
    generic (
        constant M: integer; 
        constant N: integer 
    );
    port (
        clock, zera, conta: in std_logic;
        Q: out std_logic_vector (N-1 downto 0);
        fim: out std_logic
    );
    end component;
    
    signal s_reset, s_partida, s_partida_ed: std_logic;
    signal s_zera, s_conta, s_carrega, s_desloca, s_tick, s_fim: std_logic;
    signal s_db_estado : std_logic_vector (3 downto 0);

begin

    -- sinais reset e partida mapeados na GPIO (ativos em alto)
    s_reset   <= reset;
    s_partida <= partida;

    -- unidade de controle
    U1_UC: tx_serial_tick_uc port map (clock, s_reset, s_partida_ed, s_tick, s_fim,
                                       s_zera, s_conta, s_carrega, s_desloca, pronto, s_db_estado);

    -- fluxo de dados
    U2_FD: tx_serial_8N2_fd port map (clock, s_reset, s_zera, s_conta, s_carrega, s_desloca, 
                                      dados_ascii, saida_serial, s_fim);

    -- gerador de tick
    -- fator de divisao 50MHz para 9.600 bauds (5208=50M/9600), 12 bits
    U3_TICK: contador_m generic map (M => 5208, N => 12) port map (clock, s_zera, '1', open, s_tick);

    db_estado <= s_db_estado;
    
end architecture;

