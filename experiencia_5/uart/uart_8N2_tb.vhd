library ieee;
use ieee.std_logic_1164.all;

entity uart_8N2_tb is
end uart_8N2_tb;

architecture tb of uart_8N2_tb is

    component uart_8N2
        port (clock             : in std_logic;
              reset             : in std_logic;
              transmite_dado    : in std_logic;
              dados_ascii       : in std_logic_vector (7 downto 0);
              dado_serial       : in std_logic;
              recebe_dado       : in std_logic;
              saida_serial      : out std_logic;
              pronto_tx         : out std_logic;
              dado_recebido_rx  : out std_logic_vector (7 downto 0);
              tem_dado          : out std_logic;
              pronto_rx         : out std_logic;
              db_transmite_dado : out std_logic;
              db_saida_serial   : out std_logic;
              db_estado_tx      : out std_logic_vector (3 downto 0);
              db_recebe_dado    : out std_logic;
              db_dado_serial    : out std_logic;
              db_estado_rx      : out std_logic_vector (3 downto 0);
              db_tx_unidade     : out std_logic_vector (6 downto 0);
              db_tx_decimal     : out std_logic_vector (6 downto 0);
              db_rx_unidade     : out std_logic_vector (6 downto 0);
              db_rx_decimal     : out std_logic_vector (6 downto 0);
              db_estado_tx_sseg : out std_logic_vector (6 downto 0);
              db_estado_rx_sseg : out std_logic_vector (6 downto 0));
    end component;

    signal clock             : std_logic;
    signal reset             : std_logic;
    signal transmite_dado    : std_logic;
    signal dados_ascii       : std_logic_vector (7 downto 0);
    signal dado_serial       : std_logic;
    signal recebe_dado       : std_logic;
    signal saida_serial      : std_logic;
    signal pronto_tx         : std_logic;
    signal dado_recebido_rx  : std_logic_vector (7 downto 0);
    signal tem_dado          : std_logic;
    signal pronto_rx         : std_logic;
    signal db_transmite_dado : std_logic;
    signal db_saida_serial   : std_logic;
    signal db_estado_tx      : std_logic_vector (3 downto 0);
    signal db_recebe_dado    : std_logic;
    signal db_dado_serial    : std_logic;
    signal db_estado_rx      : std_logic_vector (3 downto 0);
    signal db_tx_unidade     : std_logic_vector (6 downto 0);
    signal db_tx_decimal     : std_logic_vector (6 downto 0);
    signal db_rx_unidade     : std_logic_vector (6 downto 0);
    signal db_rx_decimal     : std_logic_vector (6 downto 0);
    signal db_estado_tx_sseg : std_logic_vector (6 downto 0);
    signal db_estado_rx_sseg : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 20 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : uart_8N2
    port map (clock             => clock,
              reset             => reset,
              transmite_dado    => transmite_dado,
              dados_ascii       => dados_ascii,
              dado_serial       => dado_serial,
              recebe_dado       => recebe_dado,
              saida_serial      => saida_serial,
              pronto_tx         => pronto_tx,
              dado_recebido_rx  => dado_recebido_rx,
              tem_dado          => tem_dado,
              pronto_rx         => pronto_rx,
              db_transmite_dado => db_transmite_dado,
              db_saida_serial   => db_saida_serial,
              db_estado_tx      => db_estado_tx,
              db_recebe_dado    => db_recebe_dado,
              db_dado_serial    => db_dado_serial,
              db_estado_rx      => db_estado_rx,
              db_tx_unidade     => db_tx_unidade,
              db_tx_decimal     => db_tx_decimal,
              db_rx_unidade     => db_rx_unidade,
              db_rx_decimal     => db_rx_decimal,
              db_estado_tx_sseg => db_estado_tx_sseg,
              db_estado_rx_sseg => db_estado_rx_sseg);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    clock <= TbClock;

    stimuli : process
    begin
        transmite_dado <= '0';
        dados_ascii <= (others => '0');
        dado_serial <= '0';
        recebe_dado <= '0';

        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;

        dados_ascii <= "00110101";
        wait for 10 * TbPeriod;
        transmite_dado <= '1';
        wait for 10 * TbPeriod;
        transmite_dado <= '0';

        wait until pronto_tx = '1';

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;