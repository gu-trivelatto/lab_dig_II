library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuito_exp1 is
port (
    clock       : in std_logic;
    reset       : in std_logic;
    posicao     : in std_logic_vector(2 downto 0);
    pwm         : out std_logic; 
	 pwm_osc     : out std_logic;
    reset_out   : out std_logic;
    posicao_out : out std_logic_vector(2 downto 0);
	 slider      : out std_logic_vector(2 downto 0)
	 
	 );
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
		pwm_osc     <= '0';
      largura_pwm <= s_largura;
    elsif(rising_edge(clock)) then
        -- saida
        if(contagem < largura_pwm) then
          pwm  <= '1';
			 pwm_osc <= '1';
        else
          pwm  <= '0';
			 pwm_osc <= '0';
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
      when "001" =>    s_largura <=  50000 ;  -- pulso de 1 ms
      when "010" =>    s_largura <=  58000 ;  -- pulso de 1,125 ms
      when "011" =>    s_largura <=  66000 ;  -- pulso de 1,25 ms
      when "100" =>    s_largura <=  74000 ;  -- pulso de 1,375 ms
      when "101" =>    s_largura <=  82000 ;  -- pulso de 1,5 ms
      when "110" =>    s_largura <=  90000 ;  -- pulso de 1,625 ms
      when "111" =>    s_largura <=  100000 ; -- pulso de 2 ms
      when others =>  s_largura <=       0;  -- nulo saida 0
    end case;
  end process;
  
  reset_out <= reset;
  posicao_out <= posicao;
  slider <= posicao;

end rtl;