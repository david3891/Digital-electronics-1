------------------------------------------------------------------------
--
-- Traffic lights controller testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------

entity tb_p_smart_traffic_fsm is
--  Port ( );
end tb_p_smart_traffic_fsm;

architecture Behavioral of tb_p_smart_traffic_fsm is
         constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_south      : std_logic_vector(3 - 1 downto 0);
    signal s_west       : std_logic_vector(3 - 1 downto 0);
    signal s_sens_S   : std_logic;
    signal s_sens_W   : std_logic;
    
begin

         uut_p_smart_traffic_fsm : entity work.p_smart_traffic_fsm
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            south_o => s_south,
            west_o  => s_west,
            sens_S_i => s_sens_S,
            sens_W_i => s_sens_W
        );
        
         --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 200 ns;
        
        -- Reset activated
        s_reset <= '1'; wait for 500 ns;
        
        -- Reset deactivated
        s_reset <= '0';
        wait;
        
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        
        s_sens_S <= '1';        
        s_sens_W <= '1';
        
        wait for 1200 ns;
        
        s_sens_S <= '1';        
        s_sens_W <= '0';
        
        wait for 2000 ns;
        
        s_sens_S <= '0';        
        s_sens_W <= '1';
        
        wait for 2000 ns;
        
        s_sens_S <= '0';
        s_sens_W <= '0';
        
        wait for 2000 ns;
        
        s_sens_S <= '1';
        s_sens_W <= '1';
        
        wait;
    end process p_stimulus;


end Behavioral;