----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 12:51:21
-- Design Name: 
-- Module Name: tb_hex_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_dig_decoder is
--  Port ( );
end tb_dig_decoder;

architecture Behavioral of tb_dig_decoder is
 -- Local signals
    signal s_dig_i      : std_logic_vector(4 - 1 downto 0);
    signal s_dig_bin_3 : STD_LOGIC;
    signal s_dig_bin_2 : STD_LOGIC;
    signal s_dig_bin_1 : STD_LOGIC;
    signal s_dig_bin_0 : STD_LOGIC;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_dig_decoder : entity work.dig_decoder
        port map(
            dig_i           => s_dig_i,
            dig_bin_3       => s_dig_bin_3,
            dig_bin_2       => s_dig_bin_2,
            dig_bin_1       => s_dig_bin_1,
            dig_bin_0       => s_dig_bin_0
        );
        
 p_stimulus : process
 begin
        
 s_dig_i <= "0101" ;

        wait;
    end process p_stimulus;




end Behavioral;