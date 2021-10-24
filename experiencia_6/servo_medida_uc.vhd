library ieee;
use ieee.std_logic_1164.all;

entity servo_medida_uc is 
    port ( 
        clock, reset, ligar, medida_pronto : in  std_logic;
        gira, mede :                         out std_logic;
        estado_hex :                         out std_logic_vector (3 downto 0)
    );
end entity;

architecture servo_medida_uc_arch of servo_medida_uc is

    type tipo_estado is (inicial, medicao, aguarda_medida, girar);
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
    process (ligar, medida_pronto, Eatual) 
    begin

      case Eatual is

        when inicial =>          if ligar='1' then Eprox <= medicao;
                                 else              Eprox <= inicial;
                                 end if;


        when medicao =>          if ligar='0' then Eprox <= inicial;
                                 else              Eprox <= aguarda_medida;
                                 end if;

        when aguarda_medida =>   if medida_pronto='1' then Eprox <= girar;
                                 elsif ligar='0' then      Eprox <= inicial;
                                 else                      Eprox <= aguarda_medida;
                                 end if;

        when girar =>            Eprox <= inicial;

        when others =>           Eprox <= inicial;

      end case;

    end process;

    -- logica de saida (Moore)
    with Eatual select
        gira <= '1' when girar, '0' when others;
    
    with Eatual select
        mede <= '1' when medicao, '0' when others;

    -- logica de estado para o debugger
    process (Eatual)
    begin
        case Eatual is
            when inicial => estado_hex <= "0000";
            when medicao => estado_hex <= "0001";
            when aguarda_medida => estado_hex <= "0010";
            when girar => estado_hex <= "0011";
            when others => estado_hex <= "1111";
        end case;
    end process;


end servo_medida_uc_arch;
