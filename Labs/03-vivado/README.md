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
| **Leds** | **Resistors (330Ω)** | **Connections** |
| :-:   | :-: | :-: |
| LED0  | R33 | H17 |
| LED1  | R34 | K15 |
| LED2  | R36 | J13 |
| LED3  | R39 | N14 |
| LED4  | R41 | R18 |
| LED5  | R44 | V17 |
| LED6  | R47 | U17 |
| LED7  | R50 | U16 |
| LED8  | R52 | V16 | 
| LED9  | R54 | T15 | 
| LED10 | R57 | U14 | 
| LED11 | R65 | T16 | 
| LED12 | R67 | V15 | 
| LED13 | R70 | V14 | 
| LED14 | R72 | V12 | 
| LED15 | R74 | V11 |

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





