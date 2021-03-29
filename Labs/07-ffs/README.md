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
