library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity tx_dados_sonar is
    port (
        clock: in std_logic;
        reset: in std_logic;
        transmitir: in std_logic;
        angulo2: in std_logic_vector(7 downto 0); -- digitos BCD
        angulo1: in std_logic_vector(7 downto 0); -- de angulo
        angulo0: in std_logic_vector(7 downto 0);
        distancia2: in std_logic_vector(3 downto 0); -- e de distancia
        distancia1: in std_logic_vector(3 downto 0);
        distancia0: in std_logic_vector(3 downto 0);
        saida_serial: out std_logic;
        pronto: out std_logic
    );
end entity;

architecture tx_dados_sonar_arch of tx_dados_sonar is

    component tx_dados_sonar_fd
        port (
            clock: in std_logic;
            reset: in std_logic;
            transmite: in std_logic;
			proximo: in std_logic;
            angulo2: in std_logic_vector(7 downto 0); -- digitos BCD
            angulo1: in std_logic_vector(7 downto 0); -- de angulo
            angulo0: in std_logic_vector(7 downto 0);
            distancia2: in std_logic_vector(3 downto 0); -- e de distancia
            distancia1: in std_logic_vector(3 downto 0);
            distancia0: in std_logic_vector(3 downto 0);
            saida_serial: out std_logic;
            fim: out std_logic;
            pronto: out std_logic
        );
    end component;

    component tx_dados_sonar_uc
        port (
            clock, reset, transmitir, tick, fim, pronto_tx : in std_logic;
            pronto, transmite, zera, proximo : out std_logic;
            estado_hex : out std_logic_vector (3 downto 0)
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

    component hex7seg is port (
        hexa: in std_logic_vector (3 downto 0);
        sseg: out std_logic_vector (6 downto 0)
    );
    end component;

    signal s_reset, s_transmitir, s_saida_serial, s_pronto, s_fim, s_tick, s_zera, s_transmite, s_proximo, s_pronto_tx : std_logic;
    signal s_angulo2, s_angulo1, s_angulo0, s_distancia2, s_distancia1, s_distancia0, s_db_estado : std_logic_vector (3 downto 0);

begin

    s_angulo2 <= angulo2;
    s_angulo1 <= angulo1;
    s_angulo0 <= angulo0;
    s_distancia2 <= distancia2;
    s_distancia1 <= distancia1;
    s_distancia0 <= distancia0;

    s_reset <= reset;
    s_transmitir <= transmitir;

    FD: tx_dados_sonar_fd port map (clock, s_zera, s_transmite, s_proximo, s_angulo2, s_angulo1, s_angulo0, s_distancia2, s_distancia1, s_distancia0, s_saida_serial, s_fim, s_pronto_tx); 
    
    UC: tx_dados_sonar_uc port map (clock, s_reset, s_transmitir, s_tick, s_fim, s_pronto_tx, s_pronto, s_transmite, s_zera, s_proximo, s_db_estado);

    TICK: contadorg_m generic map (M => 5208) port map (clock, s_reset, '0', '1', open, s_tick, open);

    saida_serial <= s_saida_serial;
    pronto <= s_pronto;

end architecture;