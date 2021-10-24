library ieee;
use ieee.std_logic_1164.all;

entity sonar_uc is
    port (
        clock: in std_logic;
        reset: in std_logic;
        ligar: in std_logic;
        medida_pronto: in std_logic;
        tx_pronto: in std_logic;
        transmitir: out std_logic;
        ligar_sonar: out std_logic
    );
end entity;

architecture sonar_uc_arch of sonar_uc is
    type tipo_estado is (inicial, mede, transmite);
    signal Eatual: tipo_estado;  -- estado atual
    signal Eprox:  tipo_estado;  -- proximo estado

begin

    -- memoria de estado
    process (reset, clock)
    begin
        if reset = '1' then
            Eatual <= inicial;
        elsif clock'event and clock = '1' then
            Eatual <= Eprox; 
        end if;
    end process;

  -- logica de proximo estado
    process (ligar, medida_pronto, tx_pronto, Eatual) 
    begin

      case Eatual is

        when inicial =>          if ligar='1' then Eprox <= mede;
                                 else              Eprox <= inicial;
                                 end if;


        when mede =>             if ligar='0'            then Eprox <= inicial;
                                 elsif medida_pronto='1' then Eprox <= transmite;
                                 else                         Eprox <= ligado;
                                 end if;

        when transmite =>        if ligar='0'        then Eprox <= inicial;
                                 elsif tx_pronto='1' then Eprox <= mede;
                                 else                then Eprox <= transmite;
                                 end if;

        when others =>           Eprox <= inicial;

      end case;

    end process;

    -- logica de saida (Moore)
    with Eatual select
        ligar_sonar <= '1' when mede, '0' when others;
    
    with Eatual select
        transmitir <= '1' when transmite, '0' when others;

    -- logica de estado para o debugger
    process (Eatual)
    begin
        case Eatual is
            when inicial => estado_hex <= "0000";
            when mede => estado_hex <= "0001";
            when transmite => estado_hex <= "0010";
            when others => estado_hex <= "1111";
        end case;
    end process;


end architecture