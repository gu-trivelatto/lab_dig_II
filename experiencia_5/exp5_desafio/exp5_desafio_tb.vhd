-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.10.2021 20:57:40 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_exp5_desafio is
end tb_exp5_desafio;

architecture tb of tb_exp5_desafio is

    component exp5_desafio
        port (clock      : in std_logic;
              reset      : in std_logic;
              ligar      : in std_logic;
              echo       : in std_logic;
              trigger    : out std_logic;
              pwm        : out std_logic;
              posicao    : out std_logic_vector (2 downto 0);
              distancia  : out std_logic_vector (11 downto 0);
              distancia0 : out std_logic_vector (6 downto 0);
              distancia1 : out std_logic_vector (6 downto 0);
              distancia2 : out std_logic_vector (6 downto 0);
              db_estado  : out std_logic_vector (6 downto 0);
              db_posicao : out std_logic_vector (6 downto 0);
              db_reset   : out std_logic;
              db_ligar   : out std_logic);
    end component;

    signal clock      : std_logic;
    signal reset      : std_logic;
    signal ligar      : std_logic;
    signal echo       : std_logic;
    signal trigger    : std_logic;
    signal pwm        : std_logic;
    signal posicao    : std_logic_vector (2 downto 0);
    signal distancia  : std_logic_vector (11 downto 0);
    signal distancia0 : std_logic_vector (6 downto 0);
    signal distancia1 : std_logic_vector (6 downto 0);
    signal distancia2 : std_logic_vector (6 downto 0);
    signal db_estado  : std_logic_vector (6 downto 0);
    signal db_posicao : std_logic_vector (6 downto 0);
    signal db_reset   : std_logic;
    signal db_ligar   : std_logic;

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : exp5_desafio
    port map (clock      => clock,
              reset      => reset,
              ligar      => ligar,
              echo       => echo,
              trigger    => trigger,
              pwm        => pwm,
              posicao    => posicao,
              distancia  => distancia,
              distancia0 => distancia0,
              distancia1 => distancia1,
              distancia2 => distancia2,
              db_estado  => db_estado,
              db_posicao => db_posicao,
              db_reset   => db_reset,
              db_ligar   => db_ligar);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock is really your main clock signal
    clock <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        ligar <= '0';
        echo <= '0';

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;

        ligar <= '1';
        wait until trigger = '1';
        wait for 50*TbPeriod;
        echo <= '1';
        wait for 700000 ns;
        echo <= '0';
        wait until trigger = '1';
        wait for 50*TbPeriod;
        echo <= '1';
        wait for 800000 ns;
        echo <= '0';
        wait until trigger = '1';
        wait for 50*TbPeriod;
        echo <= '1';
        wait for 900000 ns;
        echo <= '0';

        -- EDIT Add stimuli here
        wait for 1000*TbPeriod;
        ligar <= '0';
        wait for 5*TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_exp5_desafio of tb_exp5_desafio is
    for tb
    end for;
end cfg_tb_exp5_desafio;