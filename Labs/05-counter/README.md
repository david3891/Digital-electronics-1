# Labs 05-counter

## 1)

### a) Obrázek s připojením tlačítek na desce

![obrázek s připojením](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/05-counter/images/n4r.png)

Když je tlačitko (např. BTNL) rozpojeno, je na vstupu (např. P17) logická 0, jeli sepnuto, je na vstupu logická 1

### b) Tabulka s vypočítanými hodnotami

 | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
 | :-: | :-: | :-: | :-: |
 | 2&nbsp;ms      | 200 000       | `x"3_0d40"`     | `b"0011_0000_1101_0100_0000"`           |
 | 4&nbsp;ms      | 400 000       | `x"6_1A80"`     | `b"1100001101010000000"`                |
 | 10&nbsp;ms     | 1 000 000     | `x"F_4240"`     | `b"11110100001001000000"`               | 
 | 250&nbsp;ms    | 25 000 000    | `x"17D_7840"`   | `b"1011111010111100001000000"`          |
 | 500&nbsp;ms    | 50 000 000    | `x"2FA_F080"`   | `b"10111110101111000010000000"`         |
 | 1&nbsp;sec     | 100 000 000   | `x"5F5_E100"`   | `b"0101_1111_0101_1110_0001_0000_0000"` |

## 2)

### a) Výpis VHDL kódu procesu

```VHDL
p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then               -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then       -- Test if counter is enabled
                s_cnt_local <= (others => '0');
                               

             if (cnt_up_i = '1') then
                s_cnt_local <= s_cnt_local + 1;
                
             else             
                s_cnt_local <= s_cnt_local - 1;
                
             end if;


            end if;
        end if;
    end process p_cnt_up_down;
```

### b) Výpis resetovacích a stimulačních procesů VHDL ze souboru testbench

#### reset

```VHDL
p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 73 ns;

        s_reset <= '0';
        wait;
    end process p_reset_gen;
```

#### stimul

```VHDL
p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- Enable counting
        s_en     <= '1';
        
        -- Change counter direction
        s_cnt_up <= '1';
        wait for 380 ns;
        s_cnt_up <= '0';
        wait for 220 ns;

        -- Disable counting
        s_en     <= '0';

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### c) Screenshot se simulovanými časovými průběhy

![obrázek se simlací číst 1](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/05-counter/images/simulace_1.PNG)

![obrázek se simlací část 2](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/05-counter/images/simulace_2.PNG)

## 3)

### a)

```VHDL
--------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 100000000
        )
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            ce_o  => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 4
        )
        port map(
            clk      => CLK100MHZ,
            reset    => BTNC,
            en_i     => s_en,
            cnt_up_i => SW (0),
            cnt_o    => s_cnt
        );

    -- Display input value on LEDs
    LED(3 downto 0) <= s_cnt;

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => s_cnt,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";
```

### b) Obrázek horní vrstvy včetně obou čítačů

![obrázek s nákresy čitačů](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/05-counter/images/nakres.png)









