----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2021 10:53:49
-- Design Name: 
-- Module Name: dig_decoder - Behavioral
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

entity dig_decoder is
    Port (
        dig_i : in STD_LOGIC_VECTOR  (4 - 1 downto 0);
        dig_bin_3 : out STD_LOGIC;
        dig_bin_2 : out STD_LOGIC;
        dig_bin_1 : out STD_LOGIC;
        dig_bin_0 : out STD_LOGIC
    
     );
end entity dig_decoder;

architecture Behavioral of dig_decoder is

begin

    p_dig_decoder : process (dig_i)

begin

    dig_bin_3 <= dig_i(3);
    dig_bin_2 <= dig_i(2);
    dig_bin_1 <= dig_i(1);
    dig_bin_0 <= dig_i(0);
    

end process p_dig_decoder;


end Behavioral;
