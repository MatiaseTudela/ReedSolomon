library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aleatorio is
  PORT (rst,clk:in std_logic;
       seed   : in std_logic_vector (15 downto 0);
       count  : out std_logic_vector (15 downto 0));
end aleatorio;

architecture rtl of aleatorio is
  signal count_i      : std_logic_vector (15 downto 0);
  signal feedback     : std_logic;

begin
  feedback <= count_i(10) xor count_i(12) xor count_i(11) xor count_i(15);
  count <= count_i;

process(clk,rst) begin
	 if rst = '1' then
    count_i <= seed;
  elsif clk' event and clk='1' then
    count_i <= count_i(14 downto 0) & feedback;
  end if;
end process;
end architecture;
