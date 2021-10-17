library ieee;
use ieee.std_logic_1164.all;

entity tb_teste_tx_dados_sonar is
end tb_teste_tx_dados_sonar;

architecture tb of tb_teste_tx_dados_sonar is

    component teste_tx_dados_sonar
        port (clock        : in std_logic;
              reset        : in std_logic;
              enviar       : in std_logic;
              saida_serial : out std_logic;
              pronto       : out std_logic;
              db_enviar    : out std_logic;
              db_estado    : out std_logic_vector (3 downto 0);
              db_reset     : out std_logic);
    end component;

    signal clock        : std_logic;
    signal reset        : std_logic;
    signal enviar       : std_logic;
    signal saida_serial : std_logic;
    signal pronto       : std_logic;
    signal db_enviar    : std_logic;
    signal db_estado    : std_logic_vector (3 downto 0);
    signal db_reset     : std_logic;

    constant TbPeriod : time := 20 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : teste_tx_dados_sonar
    port map (clock        => clock,
              reset        => reset,
              enviar       => enviar,
              saida_serial => saida_serial,
              pronto       => pronto,
              db_enviar    => db_enviar,
              db_estado    => db_estado,
              db_reset     => db_reset);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    clock <= TbClock;

    stimuli : process
    begin
        enviar <= '0';

        reset <= '1';
        wait for 5 * TbPeriod;
        reset <= '0';
        wait for 5 * TbPeriod;

        enviar <= '1';
        wait for 100 * TbPeriod;
        enviar <= '0';
        wait for 100 * TbPeriod;
    
        wait until pronto = '1';
        
        TbSimEnded <= '1';
        wait;
    end process;

end tb;