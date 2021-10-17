library ieee;
use ieee.std_logic_1164.all;

entity tx_dados_sonar_uc is
    port (
        clock, reset, transmitir, tick, fim : in std_logic;
        pronto, transmite, zera, proximo : out std_logic;
        estado_hex : out std_logic_vector (3 downto 0)
    );
end entity;

architecture tx_dados_sonar_uc_arch of tx_dados_sonar_uc is

    type tipo_estado is (inicial, preparacao, espera, atualiza_dado, transmissao, final);
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
    process (transmitir, tick, fim, Eatual) 
    begin

      case Eatual is

        when inicial =>          if transmitir='1' then Eprox <= preparacao;
                                 else                   Eprox <= inicial;
                                 end if;

        when preparacao =>       Eprox <= espera;

        when espera =>           if tick='1' then   Eprox <= atualiza_dado;
                                 elsif fim='0' then Eprox <= espera;
                                 else               Eprox <= final;
                                 end if;

        when atualiza_dado =>    Eprox <= transmissao;

        when transmissao =>      if fim='0' then Eprox <= espera;
                                 else            Eprox <= final;
                                 end if;    
 
        when final =>            Eprox <= inicial;

        when others =>           Eprox <= inicial;

      end case;

    end process;

    -- logica de saida (Moore)
    with Eatual select
        zera <= '1' when preparacao, '0' when others;

    with Eatual select
        proximo <= '1' when atualiza_dado, '0' when others;

    with Eatual select
        transmite <= '1' when transmissao, '0' when others;

    with Eatual select
        pronto <= '1' when final, '0' when others;

    -- logica de estado para o debugger
    process (Eatual)
    begin
        case Eatual is
            when inicial => estado_hex <= "0000";
            when preparacao => estado_hex <= "0001";
            when espera => estado_hex <= "0010";
            when atualiza_dado => estado_hex <= "0011";
            when transmissao => estado_hex <= "0100";
            when final => estado_hex <= "0101";
            when others => estado_hex <= "1111";
        end case;
    end process;

end tx_dados_sonar_uc_arch;