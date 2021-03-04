# Labs 03-vivado

## 1) Obrázek s připojeními




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
