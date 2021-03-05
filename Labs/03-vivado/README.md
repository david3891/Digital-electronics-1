# Labs 03-vivado

## 1) Obrázek s připojeními

![obrázek s připojeními 1](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/03-vivado/images/2.png)

![obrázek s připojeními 2](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/03-vivado/images/n4r.png)

### Switches
| **Switches** | **Resistors (10kΩ)** | **Connections** |
| :-:  | :-: | :-: |
| SW0  | R35 | J15 |
| SW1  | R37 | L16 |
| SW2  | R38 | M13 |
| SW3  | R40 | R15 |
| SW4  | R42 | R17 |
| SW5  | R43 | T18 |
| SW6  | R46 | U18 |
| SW7  | R48 | R13 |
| SW8  | R56 | T8  |
| SW9  | R58 | U8  | 
| SW10 | R64 | R16 |
| SW11 | R66 | T13 |
| SW12 | R68 | H6  |
| SW13 | R69 | U12 | 
| SW14 | R71 | U11 |
| SW15 | R73 | V10 |

### LEDs
| **Leds** | **Connections** | **Resistors (330Ω)** |
| :-: | :-: | :-: |
| LED0 | H17 | R33 |
| LED1 | K15 | R34 |
| LED2 | J13 | R36 |
| LED3 | N14 | R39 |
| LED4 | R18 | R41 |
| LED5 | V17 | R44 |
| LED6 | U17 | R47 |
| LED7 | U16 | R50 |
| LED8 | V16 | R52 | 
| LED9 | T15 | R54 | 
| LED10 | U14 | R57 | 
| LED11 | T16 | R65 | 
| LED12 | V15 | R67 | 
| LED13 | V14 | R70 | 
| LED14 | V12 | R72 | 
| LED15 | V11 | R74 |

## 2) Dvoubitový široký multiplexer 4 na 1

### a) Výpis architektury VHDL ze zdrojového souboru

```VHDL
architecture Behavioral of mux_2bit_4to1 is
begin
 
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;


    -- WRITE "GREATER" AND "EQUALS" ASSIGNMENTS HERE


end architecture Behavioral;
```

### b) Výpis stimulačního procesu VHDL ze souboru testbench

```VHDL
       p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "00"; wait for 10 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "00"; wait for 10 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11"; 
        s_sel <= "00"; wait for 10 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "01"; wait for 10 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "11"; s_a <= "00"; 
        s_sel <= "01"; wait for 10 ns;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### c) Screenshot se simulovanými časovými průběhy

![obrázek simulace multiplexer 4 na 1](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/03-vivado/images/simulace.PNG)

## 3) Výukový program Vivado (návod na základy Vivada)

 (https://github.com/david3891/Digital-electronics-1/blob/main/Labs/03-vivado/n%C3%A1vod_vivado.pdf)





