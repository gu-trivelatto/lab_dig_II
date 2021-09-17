library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuito_exp1 is
port (
    clock   : in std_logic;
    reset   : in std_logic;
    posicao : in std_logic_vector(1 downto 0);
    pwm     : out std_logic );
end circuito_exp1;

architecture rtl of circuito_exp1 is

  constant CONTAGEM_MAXIMA : integer := 1000000;  -- definição de um ciclo de 20ms                                            
  signal contagem     : integer range 0 to CONTAGEM_MAXIMA-1;
  signal largura_pwm  : integer range 0 to CONTAGEM_MAXIMA-1;
  signal s_largura    : integer range 0 to CONTAGEM_MAXIMA-1;

begin

  process(clock,reset,posicao)
  begin
    -- inicia contagem e largura
    if(reset='1') then
      contagem    <= 0;
      pwm         <= '0';
      largura_pwm <= s_largura;
    elsif(rising_edge(clock)) then
        -- saida
        if(contagem < largura_pwm) then
          pwm  <= '1';
        else
          pwm  <= '0';
        end if;
        -- atualiza contagem e largura
        if(contagem=CONTAGEM_MAXIMA-1) then
          contagem   <= 0;
          largura_pwm <= s_largura;
        else
          contagem   <= contagem + 1;
        end if;
    end if;
  end process;

  process(posicao)
  begin
    case posicao is
      when "01" =>    s_largura <=   50000;  -- pulso de   1 ms
      when "10" =>    s_largura <=   75000;  -- pulso de 1,5 ms
      when "11" =>    s_largura <=  100000;  -- pulso de   2 ms
      when others =>  s_largura <=       0;  -- nulo saida 0
    end case;
  end process;

end rtl;