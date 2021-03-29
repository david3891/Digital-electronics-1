# Labs 07-ffs

## 1) Charakteristické rovnice a dokončené tabulky pro klopné obvody D, JK, T

### a) klopný obvod D

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 0 | 0 | Clear (Reset) |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 1 | 0 | Clear (Reset) |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 0 | 1 | Set |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 1 | 1 | Set |

q_{n+1}^D = d 

### b) klopný obvod JK

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 1 | 0 | 0 | Reset |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 1 | 1 | 0 | Reset |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 0 | 0 | 1 | Set |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 0 | 1 | 1 | Set |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle |

q_{n+1}^{JK} = j*/qn + /k*qn

### c) klopný obvod T

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 0 | 0 | No change |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 0 | 1 | 1 | No change |
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 1 | 1 | Invert(Toggle)|
   | ![rising](https://github.com/xsedla1l/Digital-electronics-1/blob/main/Labs/07-ffs/image/eq_uparrow.png) | 1 | 0 | 0 | Invert(Toggle)|

q_{n+1}^T = t*/qn + /t*qn

## 2) D latch

### a) Výpis kódu VHDL procesu p_d_latch

```VHDL
    p_d_latch : process (d, arst, en)
    begin
       if (arst = '1') then
           q     <= '0';
           q_bar <= '1';
       elsif (en = '1') then
           q     <= d;
           q_bar <= not d;
       end if;
    end process p_d_latch;
```

### b) Výpis resetovacích a stimulačních procesů VHDL ze souboru testbench tb_d_latch.vhd

```VHDL
p_arst_gen : process
    begin
        s_arst <= '0';
        wait for 10 ns;        
        
        -- arst activated
        s_arst <= '1';
        wait for 10 ns;

        -- arst deactivated
        s_arst <= '0';
        wait for 200 ns;
        
        s_arst <= '1';         

        wait;
    end process p_arst_gen;

         p_stimulus : process
    begin
        report "Stimulus process started" severity note;
            
          s_en <= '0';
          s_d <= '0';         
         
          wait for 6 ns;          
          s_d   <= '1';
          wait for 5 ns;
          s_d   <= '0';
          wait for 8 ns;
           s_d  <= '1';
          wait for 6 ns;
          s_d   <= '0';
          wait for 9 ns;
          s_d   <= '1';
          wait for 4 ns;
          s_d   <= '0';
          wait for 5 ns;          
          
          s_en  <= '1';
          wait for 6 ns;          
          s_d   <= '1';
          wait for 3 ns;
          s_d   <= '0';
          wait for 10 ns;
          s_d   <= '1';
          wait for 5 ns;
          s_d   <= '0';
          wait for 6 ns;
          s_d  <= '1';
          wait for 25 ns;
          s_d   <= '0';
          wait for 15 ns;
          s_en  <= '0';
          wait for 4 ns;
          s_d  <= '1';
          wait for 16 ns;
          
          s_en  <= '1';
          wait for 6 ns;          
          s_d   <= '1';
          wait for 5 ns;
          s_d   <= '0';
          wait for 5 ns;
           s_d  <= '1';
          wait for 5 ns;
          s_d   <= '0';
          wait for 5 ns;
           s_d  <= '1';
          wait for 5 ns;
          s_d   <= '0';
          wait for 17 ns;
          
          s_d   <= '1';
          wait for 10 ns;
          s_en  <= '0';
          wait for 10 ns;
          s_d   <= '0';          
          wait for 6 ns;          
          s_d   <= '1';
          wait for 15 ns;
          s_d   <= '0';
          wait for 6 ns;
           s_d  <= '1';
           wait for 5 ns;
          s_en  <= '1';
          wait for 3 ns;
          s_d   <= '0';
          wait for 5 ns;
           s_d  <= '1';
          wait for 8 ns;
          s_d   <= '0';
          wait for 15 ns;
         
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
   p_assert : process
    begin
      wait for 80 ns;
              
        -- assert in 80 ns
        assert(s_q = '1' and s_q_bar = '0')
        report "Error - conditions in 80 ns are not met" severity error;
        
      wait for 45 ns;
         -- assert in 125 ns
        assert(s_q = '0' and s_q_bar = '1')
        report "Error - conditions in 125 ns are not met" severity error;
       
    end process p_assert;
```

### c) Screenshot se simulovanými časovými průběhy

![obrázelk se simulací](https://github.com/david3891/Digital-electronics-1/blob/main/Labs/07-ffs/images/simulace1.PNG)

## 3) Flip-flops

### a) VHDL kód výpis procesů 

#### p_d_ff_arst

```VHDL

```













