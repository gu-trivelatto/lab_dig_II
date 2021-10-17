library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity tx_dados_sonar is
    port (
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
end entity;

architecture tx_dados_sonar_arch of tx_dados_sonar is

    component tx_dados_sonar_fd
        port (
            clock: in std_logic;
            reset: in std_logic;
            transmite: in std_logic;
				proximo: in std_logic;
            angulo2: in std_logic_vector(3 downto 0); -- digitos BCD
            angulo1: in std_logic_vector(3 downto 0); -- de angulo
            angulo0: in std_logic_vector(3 downto 0);
            distancia2: in std_logic_vector(3 downto 0); -- e de distancia
            distancia1: in std_logic_vector(3 downto 0);
            distancia0: in std_logic_vector(3 downto 0);
            saida_serial: out std_logic;
            fim: out std_logic
        );
    end component;

    component tx_dados_sonar_uc
        port (
            clock, reset, transmitir, tick, fim : in std_logic;
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

    signal s_reset, s_transmitir, s_saida_serial, s_pronto, s_fim, s_tick, s_zera, s_transmite, s_proximo : std_logic;
    signal s_angulo2, s_angulo1, s_angulo0, s_distancia2, s_distancia1, s_distancia0 : std_logic_vector (3 downto 0);

begin

    s_angulo2 <= angulo2;
    s_angulo1 <= angulo1;
    s_angulo0 <= angulo0;
    s_distancia2 <= distancia2;
    s_distancia1 <= distancia1;
    s_distancia0 <= distancia0;

    s_reset <= reset;
    s_transmitir <= transmitir;

    FD: tx_dados_sonar_fd port map (clock, s_zera, s_transmite, s_proximo, s_angulo2, s_angulo1, s_angulo0, s_distancia2, s_distancia1, s_distancia0, s_saida_serial, s_fim); 
    
    UC: tx_dados_sonar_uc port map (clock, s_reset, s_transmitir, s_tick, s_fim, s_pronto, s_transmite, s_zera, s_proximo, db_estado);

    TICK: contadorg_m generic map (M => 5208) port map (clock, s_reset, '0', s_transmitir, open, s_tick, open);

    A0: hex7seg port map (s_angulo0, db_angulo0);
    
    A1: hex7seg port map (s_angulo1, db_angulo1);
    
    A2: hex7seg port map (s_angulo2, db_angulo2);
    
    D0: hex7seg port map (s_distancia0, db_distancia0);

    D1: hex7seg port map (s_distancia1, db_distancia1);
    
    D2: hex7seg port map (s_distancia2, db_distancia2);

    saida_serial <= s_saida_serial;
    pronto <= s_pronto;
    db_transmitir <= transmitir;
    db_saida_serial <= s_saida_serial;
    db_reset <= reset;

end architecture;