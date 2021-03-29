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

## 2) D západka

### a) Výpis kódu VHDL procesu p_d_latch














