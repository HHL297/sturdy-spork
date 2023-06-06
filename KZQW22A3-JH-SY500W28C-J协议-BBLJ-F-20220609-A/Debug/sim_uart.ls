   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2994                     	switch	.ubsct
2995  0000               _Current_temp:
2996  0000 0000000000    	ds.b	5
2997                     	xdef	_Current_temp
2998  0005               _TMM4_flag:
2999  0005 00            	ds.b	1
3000                     	xdef	_TMM4_flag
3001                     	switch	.bss
3002  0000               _uart_dan_mode:
3003  0000 00            	ds.b	1
3004                     	xdef	_uart_dan_mode
3005  0001               _sleep_count:
3006  0001 0000          	ds.b	2
3007                     	xdef	_sleep_count
3008  0003               _voltage_table:
3009  0003 000000000000  	ds.b	10
3010                     	xdef	_voltage_table
3030                     	end
