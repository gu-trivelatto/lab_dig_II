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
        ligar_sonar: out std_logic;
		  estado_hex: out std_logic_vector (3 downto 0);
          dado_recebido: in std_logic_vector (7 downto 0);
          enable_reg: out std_logic;
          halt: in std_logic
    );
end entity;

architecture sonar_uc_arch of sonar_uc is
    type tipo_estado is (inicial, caractere, registra, mede, transmite);
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
    process (ligar, medida_pronto, tx_pronto, dado_recebido, Eatual) 
    begin

      case Eatual is

        when inicial =>          if ligar='1' then   Eprox <= caractere;
                                 elsif halt='1' then Eprox <= inicial;
                                 else                Eprox <= inicial;
                                 end if;

        when caractere =>        if dado_recebido="01110000"    then Eprox <= registra;
                                 elsif dado_recebido="01100011" then Eprox <= registra;
                                 else                                Eprox <= mede;
                                 end if;

        when registra =>         Eprox <= mede;

        when mede =>             if ligar='0'            then Eprox <= inicial;
                                 elsif halt='1'          then Eprox <= inicial;
                                 elsif medida_pronto='1' then Eprox <= transmite;
                                 else                         Eprox <= mede;
                                 end if;

        when transmite =>        if ligar='0'        then Eprox <= inicial;
                                 elsif tx_pronto='1' then Eprox <= caractere;
                                 else                     Eprox <= transmite;
                                 end if;

        when others =>           Eprox <= inicial;

      end case;

    end process;

    -- logica de saida (Moore)
		  
	 with Eatual select
        ligar_sonar <= '1' when mede, '0' when others;
    
    with Eatual select
        transmitir <= '1' when transmite, '0' when others;

    with Eatual select
        enable_reg <= '1' when registra, '0' when others;

    -- logica de estado para o debugger
    process (Eatual)
    begin
        case Eatual is
            when inicial => estado_hex <= "0000";
            when caractere => estado_hex <= "0001";
            when registra => estado_hex <= "0010";
            when mede => estado_hex <= "0011";
            when transmite => estado_hex <= "0100";
            when others => estado_hex <= "1111";
        end case;
    end process;


end architecture;