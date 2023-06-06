   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2806                     ; 13 @far @interrupt void NonHandledInterrupt (void)
2806                     ; 14 {
2807                     	switch	.text
2808  0000               f_NonHandledInterrupt:
2812                     ; 18 	return;
2815  0000 80            	iret	
2838                     ; 21 @far @interrupt void NonHandledInterrupt1 (void)
2838                     ; 22 {
2839                     	switch	.text
2840  0001               f_NonHandledInterrupt1:
2844                     ; 26 	return;
2847  0001 80            	iret	
2849                     .const:	section	.text
2850  0000               __vectab:
2851  0000 82            	dc.b	130
2853  0001 00            	dc.b	page(__stext)
2854  0002 0000          	dc.w	__stext
2855  0004 82            	dc.b	130
2857  0005 00            	dc.b	page(f_NonHandledInterrupt)
2858  0006 0000          	dc.w	f_NonHandledInterrupt
2859  0008 82            	dc.b	130
2861  0009 00            	dc.b	page(f_NonHandledInterrupt)
2862  000a 0000          	dc.w	f_NonHandledInterrupt
2863  000c 82            	dc.b	130
2865  000d 00            	dc.b	page(f_NonHandledInterrupt)
2866  000e 0000          	dc.w	f_NonHandledInterrupt
2867  0010 82            	dc.b	130
2869  0011 00            	dc.b	page(f_NonHandledInterrupt)
2870  0012 0000          	dc.w	f_NonHandledInterrupt
2871  0014 82            	dc.b	130
2873  0015 00            	dc.b	page(f_NonHandledInterrupt)
2874  0016 0000          	dc.w	f_NonHandledInterrupt
2875  0018 82            	dc.b	130
2877  0019 00            	dc.b	page(f_NonHandledInterrupt)
2878  001a 0000          	dc.w	f_NonHandledInterrupt
2879  001c 82            	dc.b	130
2881  001d 00            	dc.b	page(f_NonHandledInterrupt)
2882  001e 0000          	dc.w	f_NonHandledInterrupt
2883  0020 82            	dc.b	130
2885  0021 00            	dc.b	page(f_NonHandledInterrupt)
2886  0022 0000          	dc.w	f_NonHandledInterrupt
2887  0024 82            	dc.b	130
2889  0025 01            	dc.b	page(f_NonHandledInterrupt1)
2890  0026 0001          	dc.w	f_NonHandledInterrupt1
2891  0028 82            	dc.b	130
2893  0029 00            	dc.b	page(f_NonHandledInterrupt)
2894  002a 0000          	dc.w	f_NonHandledInterrupt
2895  002c 82            	dc.b	130
2897  002d 00            	dc.b	page(f_NonHandledInterrupt)
2898  002e 0000          	dc.w	f_NonHandledInterrupt
2899  0030 82            	dc.b	130
2901  0031 00            	dc.b	page(f_NonHandledInterrupt)
2902  0032 0000          	dc.w	f_NonHandledInterrupt
2903  0034 82            	dc.b	130
2905  0035 00            	dc.b	page(f_TIM1_PWM_IRQ)
2906  0036 0000          	dc.w	f_TIM1_PWM_IRQ
2907  0038 82            	dc.b	130
2909  0039 00            	dc.b	page(f_NonHandledInterrupt)
2910  003a 0000          	dc.w	f_NonHandledInterrupt
2911  003c 82            	dc.b	130
2913  003d 00            	dc.b	page(f_NonHandledInterrupt)
2914  003e 0000          	dc.w	f_NonHandledInterrupt
2915  0040 82            	dc.b	130
2917  0041 00            	dc.b	page(f_NonHandledInterrupt)
2918  0042 0000          	dc.w	f_NonHandledInterrupt
2919  0044 82            	dc.b	130
2921  0045 00            	dc.b	page(f_NonHandledInterrupt)
2922  0046 0000          	dc.w	f_NonHandledInterrupt
2923  0048 82            	dc.b	130
2925  0049 00            	dc.b	page(f_NonHandledInterrupt)
2926  004a 0000          	dc.w	f_NonHandledInterrupt
2927  004c 82            	dc.b	130
2929  004d 00            	dc.b	page(f_NonHandledInterrupt)
2930  004e 0000          	dc.w	f_NonHandledInterrupt
2931  0050 82            	dc.b	130
2933  0051 00            	dc.b	page(f_NonHandledInterrupt)
2934  0052 0000          	dc.w	f_NonHandledInterrupt
2935  0054 82            	dc.b	130
2937  0055 00            	dc.b	page(f_NonHandledInterrupt)
2938  0056 0000          	dc.w	f_NonHandledInterrupt
2939  0058 82            	dc.b	130
2941  0059 00            	dc.b	page(f_NonHandledInterrupt)
2942  005a 0000          	dc.w	f_NonHandledInterrupt
2943  005c 82            	dc.b	130
2945  005d 00            	dc.b	page(f_NonHandledInterrupt)
2946  005e 0000          	dc.w	f_NonHandledInterrupt
2947  0060 82            	dc.b	130
2949  0061 00            	dc.b	page(f_ADC_IRQ)
2950  0062 0000          	dc.w	f_ADC_IRQ
2951  0064 82            	dc.b	130
2953  0065 00            	dc.b	page(f_NonHandledInterrupt)
2954  0066 0000          	dc.w	f_NonHandledInterrupt
2955  0068 82            	dc.b	130
2957  0069 00            	dc.b	page(f_NonHandledInterrupt)
2958  006a 0000          	dc.w	f_NonHandledInterrupt
2959  006c 82            	dc.b	130
2961  006d 00            	dc.b	page(f_NonHandledInterrupt)
2962  006e 0000          	dc.w	f_NonHandledInterrupt
2963  0070 82            	dc.b	130
2965  0071 00            	dc.b	page(f_NonHandledInterrupt)
2966  0072 0000          	dc.w	f_NonHandledInterrupt
2967  0074 82            	dc.b	130
2969  0075 00            	dc.b	page(f_NonHandledInterrupt)
2970  0076 0000          	dc.w	f_NonHandledInterrupt
2971  0078 82            	dc.b	130
2973  0079 00            	dc.b	page(f_NonHandledInterrupt)
2974  007a 0000          	dc.w	f_NonHandledInterrupt
2975  007c 82            	dc.b	130
2977  007d 00            	dc.b	page(f_NonHandledInterrupt)
2978  007e 0000          	dc.w	f_NonHandledInterrupt
3029                     	xdef	__vectab
3030                     	xref	__stext
3031                     	xref	f_ADC_IRQ
3032                     	xref	f_TIM1_PWM_IRQ
3033                     	xdef	f_NonHandledInterrupt1
3034                     	xdef	f_NonHandledInterrupt
3053                     	end
