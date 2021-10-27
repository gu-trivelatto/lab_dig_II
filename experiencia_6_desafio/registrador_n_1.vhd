-----------------Laboratorio Digital-------------------------------------
-- Arquivo   : registrador_n.vhd
-- Projeto   : Experiencia 3 - Recepcao Serial Assincrona
-------------------------------------------------------------------------
-- Descricao : registrador com numero de bits N como generic
--             com clear assincrono e carga sincrona
--             baseado no codigo vreg16.vhd do livro
--             J. Wakerly, Digital design: principles and practices 4e
-------------------------------------------------------------------------
-- Revisoes  :
--     Data        Versao  Autor             Descricao
--     09/09/2019  1.0     Edson Midorikawa  criacao
--     08/06/2020  1.1     Edson Midorikawa  revisao e melhoria de codigo 
--     09/09/2020  1.2     Edson Midorikawa  revisao 
--     09/09/2021  1.3     Edson Midorikawa  revisao 
-------------------------------------------------------------------------
--

library IEEE;
use IEEE.std_logic_1164.all;

entity registrador_n_1 is
    port (
       clock:  in  std_logic;
       clear:  in  std_logic;
       enable: in  std_logic;
       D:      in  std_logic;
       Q:      out std_logic 
    );
end registrador_n_1;

architecture registrador_n_1 of registrador_n_1 is
    signal IQ: std_logic;
begin

process(clock, clear, enable, IQ)
    begin
        if (clear = '1') then IQ <= '0';
        elsif (clock'event and clock='1') then
            if (enable='1') then IQ <= D; 
	        else IQ <= IQ;
	        end if;
        end if;
        Q <= IQ;
  end process;
  
end registrador_n_1;
