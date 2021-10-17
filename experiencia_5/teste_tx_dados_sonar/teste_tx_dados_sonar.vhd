library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity teste_tx_dados_sonar is
    port (
        clock: in std_logic;
        reset: in std_logic;
        enviar: in std_logic;
        saida_serial: out std_logic;
        pronto: out std_logic;
        db_enviar: out std_logic;
        db_estado: out std_logic_vector(3 downto 0);
        db_reset: out std_logic
    );
end entity;

architecture teste_tx_dados_sonar_arch of teste_tx_dados_sonar is

    component edge_detector is port ( 
        clk         : in   std_logic;
        signal_in   : in   std_logic;
        output      : out  std_logic
    );
    end component;

    component tx_dados_sonar port (
        clock: in std_logic;
        reset: in std_logic;
        transmitir: in std_logic;
        angulo2: in std_logic_vector(3 downto 0); -- digitos BCD
        angulo1: in std_logic_vector(3 downto 0); -- de angulo
        angulo0: in std_logic_vector(3 downto 0);
        distancia2: in std_logic_vector(3 downto 0); -- e de distancia
        distancia1: in std_logic_vector(3 downto 0);
        distancia0: in std_logic_vector(3 downto 0);
        saida_serial: out std_logic;
        pronto: out std_logic;
        db_transmitir: out std_logic;
        db_saida_serial: out std_logic;
        db_estado: out std_logic_vector(3 downto 0);
        db_angulo2: out std_logic_vector(6 downto 0);
        db_angulo1: out std_logic_vector(6 downto 0);
        db_angulo0: out std_logic_vector(6 downto 0);
        db_distancia2: out std_logic_vector(6 downto 0);
        db_distancia1: out std_logic_vector(6 downto 0);
        db_distancia0: out std_logic_vector(6 downto 0);
        db_reset: out std_logic
    );
    end component;

    signal s_reset, s_enviar, s_enviar_ed, s_saida_serial, s_pronto : std_logic;

begin

    s_reset <= reset;
    s_enviar <= enviar;

    ED: edge_detector port map (clock, s_enviar, s_enviar_ed);

    TX: tx_dados_sonar port map (clock, s_reset, s_enviar_ed, "0011", "0101", "0001", "0111", "0001", "0000", s_saida_serial, s_pronto,
                                 db_enviar, open, db_estado, open, open, open, open, open, open, db_reset);

    saida_serial <= s_saida_serial;
    pronto <= s_pronto;

end architecture;