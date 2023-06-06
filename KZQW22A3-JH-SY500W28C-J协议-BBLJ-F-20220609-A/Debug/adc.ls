   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2777                     	bsct
2778  0000               _sc_count:
2779  0000 00            	dc.b	0
2780                     	switch	.data
2781  0000               _temperature_average:
2782  0000 ff            	dc.b	255
2783                     	bsct
2784  0001               _temp_over_count:
2785  0001 00            	dc.b	0
2786  0002               _temp_normal_count:
2787  0002 00            	dc.b	0
2788  0003               _temp_sdow_mode:
2789  0003 00            	dc.b	0
2790                     	switch	.data
2791  0001               _temp_sun:
2792  0001 0000          	dc.w	0
2793                     	bsct
2794  0004               _temp_count:
2795  0004 00            	dc.b	0
2796                     	switch	.data
2797  0003               _speed_ad_sun:
2798  0003 0000          	dc.w	0
2799                     	bsct
2800  0005               _speed_ad_count:
2801  0005 00            	dc.b	0
2838                     .const:	section	.text
2839  0000               L6:
2840  0000 000088b8      	dc.l	35000
2841                     ; 214 void AD_INI(void)
2841                     ; 215 {
2842                     	scross	off
2843                     	switch	.text
2844  0000               _AD_INI:
2848                     ; 216 	CLK_PCKENR2 |= 0x08;	//¨º1?¨¹ADC¨º¡À?¨®
2850  0000 721650ca      	bset	_CLK_PCKENR2,#3
2851                     ; 218 	ADC_CR2 = 0x00;			//???1¡ä£¤¡¤¡é??
2853  0004 725f5402      	clr	_ADC_CR2
2854                     ; 222 	ADC_CR1 = 0x21;			//3.5us fclk = fmast/4
2856  0008 35215401      	mov	_ADC_CR1,#33
2857                     ; 227 	ADC_TDRL |= 0xf8;		//AN4,AN5....AN9
2859  000c c65407        	ld	a,_ADC_TDRL
2860  000f aaf8          	or	a,#248
2861  0011 c75407        	ld	_ADC_TDRL,a
2862                     ; 228 	ADC_TDRH |= 0x03;		//
2864  0014 c65406        	ld	a,_ADC_TDRH
2865  0017 aa03          	or	a,#3
2866  0019 c75406        	ld	_ADC_TDRH,a
2867                     ; 231 	sys_step = 0;
2869  001c 3f00          	clr	_sys_step
2870                     ; 232 	for(temp_sun = 0;temp_sun < 35000; temp_sun ++)
2872  001e 5f            	clrw	x
2873  001f cf0001        	ldw	_temp_sun,x
2874  0022               L5771:
2875                     ; 234 		WDT_FLASH();
2877  0022 35aa50e0      	mov	_IWDG_KR,#170
2878                     ; 232 	for(temp_sun = 0;temp_sun < 35000; temp_sun ++)
2880  0026 ce0001        	ldw	x,_temp_sun
2881  0029 5c            	incw	x
2882  002a cf0001        	ldw	_temp_sun,x
2885  002d cd0000        	call	c_uitolx
2887  0030 ae0000        	ldw	x,#L6
2888  0033 cd0000        	call	c_lcmp
2890  0036 2fea          	jrslt	L5771
2891                     ; 236 	temp_sun = 0;
2893  0038 5f            	clrw	x
2894  0039 cf0001        	ldw	_temp_sun,x
2895                     ; 237 }
2898  003c 81            	ret	
2940                     ; 243 void adc_sample(void)
2940                     ; 244 {
2941                     	switch	.text
2942  003d               _adc_sample:
2944       00000002      OFST:	set	2
2947                     ; 245 	if(sys_step == 56)
2949  003d b600          	ld	a,_sys_step
2950  003f a138          	cp	a,#56
2951  0041 261f          	jrne	L3102
2953  0043               L7102:
2954                     ; 247 		while(((ADC_CSR & 0x80) == 0x00));		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
2956  0043 720f5400fb    	btjf	_ADC_CSR,#7,L7102
2957                     ; 248 		ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????
2959  0048 721f5400      	bres	_ADC_CSR,#7
2960                     ; 249 		voltage_average = ADC_DRH;					//????ad????
2962  004c c65404        	ld	a,_ADC_DRH
2963  004f 5f            	clrw	x
2964  0050 97            	ld	xl,a
2965  0051 bf47          	ldw	_voltage_average,x
2966                     ; 252 		voltage_average = (voltage_average * 4) + ADC_DRL;//????10??ad?¦Ì	
2968  0053 58            	sllw	x
2969  0054 58            	sllw	x
2970  0055 01            	rrwa	x,a
2971  0056 cb5405        	add	a,_ADC_DRL
2972  0059 2401          	jrnc	L21
2973  005b 5c            	incw	x
2974  005c               L21:
2975  005c b748          	ld	_voltage_average+1,a
2976  005e 9f            	ld	a,xl
2977  005f b747          	ld	_voltage_average,a
2980  0061 81            	ret	
2981  0062               L3102:
2982                     ; 254 	else if(sys_step == 40)
2984  0062 a128          	cp	a,#40
2985  0064 2618          	jrne	L5202
2987  0066               L1302:
2988                     ; 256 		while((ADC_CSR & 0x80) == 0x00);		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
2990  0066 720f5400fb    	btjf	_ADC_CSR,#7,L1302
2991                     ; 257 		ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????	
2993  006b 721f5400      	bres	_ADC_CSR,#7
2994                     ; 264 		speed_ad_sun += ADC_DRH;
2996  006f c65404        	ld	a,_ADC_DRH
2997  0072 5f            	clrw	x
2998  0073 97            	ld	xl,a
3000  0074 72bb0003      	addw	x,_speed_ad_sun
3001  0078 cf0003        	ldw	_speed_ad_sun,x
3002                     ; 265 		speed_ad_count ++;
3004  007b 3c05          	inc	_speed_ad_count
3007  007d 81            	ret	
3008  007e               L5202:
3009                     ; 267 	else if(sys_step == 6)//XZ 	//LJ 
3011  007e a106          	cp	a,#6
3012  0080 266a          	jrne	L7302
3014  0082               L3402:
3015                     ; 269 		while((ADC_CSR & 0x80) == 0x00);		
3017  0082 720f5400fb    	btjf	_ADC_CSR,#7,L3402
3018                     ; 270 		ADC_CSR &= 0x7f;						
3020  0087 721f5400      	bres	_ADC_CSR,#7
3021                     ; 271 		AD_ValueH = ADC_DRH;	
3023  008b c65404        	ld	a,_ADC_DRH
3024  008e 5f            	clrw	x
3025  008f 97            	ld	xl,a
3026  0090 bf1f          	ldw	_AD_ValueH,x
3027                     ; 272 		lj_ad_app = (AD_ValueH << 2) + ADC_DRL;
3029  0092 58            	sllw	x
3030  0093 58            	sllw	x
3031  0094 01            	rrwa	x,a
3032  0095 cb5405        	add	a,_ADC_DRL
3033  0098 2401          	jrnc	L41
3034  009a 5c            	incw	x
3035  009b               L41:
3036  009b c700e4        	ld	_lj_ad_app+1,a
3037  009e 9f            	ld	a,xl
3038  009f c700e3        	ld	_lj_ad_app,a
3039                     ; 312 			/**/if(current_ph_lj_time <= 436)
3041  00a2 ce00e7        	ldw	x,_current_ph_lj_time
3042  00a5 a301b5        	cpw	x,#437
3043  00a8 2407          	jruge	L7402
3044                     ; 314 				control_lj_temp_table[1] = lj_ad_app; //????10??ad?|¡§?	
3046  00aa ce00e3        	ldw	x,_lj_ad_app
3047  00ad cf00f9        	ldw	_control_lj_temp_table+2,x
3050  00b0 81            	ret	
3051  00b1               L7402:
3052                     ; 318 				if(control_lj_temp_table[1] < lj_ad_app)
3054  00b1 ce00f9        	ldw	x,_control_lj_temp_table+2
3055  00b4 c300e3        	cpw	x,_lj_ad_app
3056  00b7 2407          	jruge	L3502
3057                     ; 320 					control_lj_temp_table[1] = lj_ad_app; 
3059  00b9 ce00e3        	ldw	x,_lj_ad_app
3060  00bc cf00f9        	ldw	_control_lj_temp_table+2,x
3063  00bf 81            	ret	
3064  00c0               L3502:
3065                     ; 324 				else if(control_lj_temp_table[1] > lj_ad_app)
3067  00c0 c300e3        	cpw	x,_lj_ad_app
3068  00c3 2203cc0162    	jrule	L3202
3069                     ; 326 					if((control_lj_temp_table[1] - lj_ad_app) > 63)control_lj_temp_table[1] = control_lj_temp_table[1] - ((control_lj_temp_table[1] - lj_ad_app) >> 6);
3071  00c8 72b000e3      	subw	x,_lj_ad_app
3072  00cc a30040        	cpw	x,#64
3073  00cf ce00f9        	ldw	x,_control_lj_temp_table+2
3074  00d2 2513          	jrult	L1602
3077  00d4 72b000e3      	subw	x,_lj_ad_app
3078  00d8 a606          	ld	a,#6
3079  00da               L61:
3080  00da 54            	srlw	x
3081  00db 4a            	dec	a
3082  00dc 26fc          	jrne	L61
3083  00de 72b000f9      	subw	x,_control_lj_temp_table+2
3084  00e2 50            	negw	x
3085  00e3 cf00f9        	ldw	_control_lj_temp_table+2,x
3088  00e6 81            	ret	
3089  00e7               L1602:
3090                     ; 327 					else control_lj_temp_table[1] --;
3092  00e7 5a            	decw	x
3093  00e8 cf00f9        	ldw	_control_lj_temp_table+2,x
3095  00eb 81            	ret	
3096  00ec               L7302:
3097                     ; 389 	else if(sys_step == 26)
3099  00ec a11a          	cp	a,#26
3100  00ee 2639          	jrne	L7602
3102  00f0               L3702:
3103                     ; 391 		while((ADC_CSR & 0x80) == 0x00);		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
3105  00f0 720f5400fb    	btjf	_ADC_CSR,#7,L3702
3106                     ; 392 		ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????	
3108  00f5 721f5400      	bres	_ADC_CSR,#7
3109                     ; 393 		AD_ValueH = ADC_DRH;					//????ad????
3111  00f9 c65404        	ld	a,_ADC_DRH
3112  00fc 5f            	clrw	x
3113  00fd 97            	ld	xl,a
3114  00fe bf1f          	ldw	_AD_ValueH,x
3115                     ; 396 		control_temp_table[1] = (AD_ValueH * 4) + ADC_DRL;//????10??ad?¦Ì	
3117  0100 58            	sllw	x
3118  0101 58            	sllw	x
3119  0102 01            	rrwa	x,a
3120  0103 cb5405        	add	a,_ADC_DRL
3121  0106 2401          	jrnc	L02
3122  0108 5c            	incw	x
3123  0109               L02:
3124  0109 c70078        	ld	_control_temp_table+3,a
3125  010c 9f            	ld	a,xl
3126  010d c70077        	ld	_control_temp_table+2,a
3127                     ; 397 		test_control_temp = control_temp;	//JIN	//jicf
3129  0110 be30          	ldw	x,_control_temp
3130  0112 cf009f        	ldw	_test_control_temp,x
3131                     ; 398 		if(control_temp_table[0] < control_temp_table[1])
3133  0115 ce0075        	ldw	x,_control_temp_table
3134  0118 c30077        	cpw	x,_control_temp_table+2
3135                     ; 399 			control_temp =  control_temp_table[0];
3137  011b 2503          	jrult	L1012
3138                     ; 401 			control_temp =  control_temp_table[1];
3140  011d ce0077        	ldw	x,_control_temp_table+2
3141  0120               L1012:
3143  0120 bf30          	ldw	_control_temp,x
3144                     ; 402 		control_temp_table[0] = control_temp_table[1];
3146  0122 ce0077        	ldw	x,_control_temp_table+2
3147  0125 cf0075        	ldw	_control_temp_table,x
3150  0128 81            	ret	
3151  0129               L7602:
3152                     ; 405 	else if(sys_step == 12)
3154  0129 a10c          	cp	a,#12
3155  012b 261a          	jrne	L5012
3157  012d               L1112:
3158                     ; 407 		while((ADC_CSR & 0x80) == 0x00);		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
3160  012d 720f5400fb    	btjf	_ADC_CSR,#7,L1112
3161                     ; 408 		ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????	
3163  0132 721f5400      	bres	_ADC_CSR,#7
3164                     ; 409 		AD_ValueH = ADC_DRH;					//????ad????
3166  0136 c65404        	ld	a,_ADC_DRH
3167  0139 5f            	clrw	x
3168  013a 97            	ld	xl,a
3169  013b bf1f          	ldw	_AD_ValueH,x
3170                     ; 413      temp_sun += AD_ValueH;
3172  013d 72bb0001      	addw	x,_temp_sun
3173  0141 cf0001        	ldw	_temp_sun,x
3174                     ; 414 		 temp_count++;
3176  0144 3c04          	inc	_temp_count
3179  0146 81            	ret	
3180  0147               L5012:
3181                     ; 417 	else if((sys_step & 0x03) == 0x03)
3183  0147 a403          	and	a,#3
3184  0149 a103          	cp	a,#3
3185  014b 2615          	jrne	L3202
3187  014d               L3212:
3188                     ; 420 		while((ADC_CSR & 0x80) == 0x00);		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
3190  014d 720f5400fb    	btjf	_ADC_CSR,#7,L3212
3191                     ; 421 		ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????	
3193  0152 721f5400      	bres	_ADC_CSR,#7
3194                     ; 422 		AD_Value = ADC_DRH;					//????ad????
3196  0156 c65404        	ld	a,_ADC_DRH
3197  0159 5f            	clrw	x
3198  015a 97            	ld	xl,a
3199  015b bf50          	ldw	_AD_Value,x
3200                     ; 427 			current_sample_average[2] = AD_Value;
3202  015d 5500510074    	mov	_current_sample_average+2,_AD_Value+1
3203  0162               L3202:
3204                     ; 433 }
3207  0162 81            	ret	
3301                     ; 436 void ad_data(void)
3301                     ; 437 {
3302                     	switch	.text
3303  0163               _ad_data:
3307                     ; 438 	if(sys_step == 62)
3309  0163 b600          	ld	a,_sys_step
3310  0165 a13e          	cp	a,#62
3311  0167 2703cc01f1    	jrne	L7312
3312                     ; 459 		if(temp_count >63)//???¨¨¡À¡ê?¡è
3314  016c b604          	ld	a,_temp_count
3315  016e a140          	cp	a,#64
3316  0170 2403cc0547    	jrult	L1712
3317                     ; 461 			temperature_average = (temp_sun/64);
3319  0175 ce0001        	ldw	x,_temp_sun
3320  0178 a606          	ld	a,#6
3321  017a               L42:
3322  017a 54            	srlw	x
3323  017b 4a            	dec	a
3324  017c 26fc          	jrne	L42
3325  017e 01            	rrwa	x,a
3326  017f c70000        	ld	_temperature_average,a
3327                     ; 462 			temp_sun = 0;
3329  0182 5f            	clrw	x
3330  0183 cf0001        	ldw	_temp_sun,x
3331                     ; 463 			temp_count = 0;
3333  0186 3f04          	clr	_temp_count
3334                     ; 465 			if(temperature_average < 161)// 169 161)			//85
3336  0188 a1a1          	cp	a,#161
3337  018a 2428          	jruge	L3412
3338                     ; 467 				if(temp_over_count == 20)
3340  018c b601          	ld	a,_temp_over_count
3341  018e a114          	cp	a,#20
3342  0190 2620          	jrne	L5412
3343                     ; 469 					temp_sdow_mode = ((176 - temperature_average)/6);		// 185 176
3345  0192 4f            	clr	a
3346  0193 97            	ld	xl,a
3347  0194 a6b0          	ld	a,#176
3348  0196 c00000        	sub	a,_temperature_average
3349  0199 2401          	jrnc	L62
3350  019b 5a            	decw	x
3351  019c               L62:
3352  019c 02            	rlwa	x,a
3353  019d a606          	ld	a,#6
3354  019f cd0000        	call	c_sdivx
3356  01a2 01            	rrwa	x,a
3357  01a3 b703          	ld	_temp_sdow_mode,a
3358                     ; 470 					if(temperature_average < 122)	//122		//temp over  95  ¨°?¨¦?¨º¦Ì2a
3360  01a5 c60000        	ld	a,_temperature_average
3361  01a8 a17a          	cp	a,#122
3362  01aa 2408          	jruge	L3412
3363                     ; 471 						error_bank.bit.temperature_flag = 1;   /////??¨®D¨¨¨¨??¦Ì?¡Á¨¨
3365  01ac 72120000      	bset	_error_bank,#1
3366  01b0 2002          	jra	L3412
3367  01b2               L5412:
3368                     ; 474 					temp_over_count ++;
3370  01b2 3c01          	inc	_temp_over_count
3371  01b4               L3412:
3372                     ; 476 			if(error_bank.bit.temperature_flag == 1)
3374  01b4 720300001d    	btjf	_error_bank,#1,L3512
3375                     ; 478 				if(temperature_average > 127)	//127				//		80
3377  01b9 c60000        	ld	a,_temperature_average
3378  01bc a180          	cp	a,#128
3379  01be 2518          	jrult	L3612
3380                     ; 480 					if(temp_normal_count == 100)
3382  01c0 b602          	ld	a,_temp_normal_count
3383  01c2 a164          	cp	a,#100
3384  01c4 260c          	jrne	L7512
3385                     ; 482 						temp_normal_count = 0;
3387  01c6 3f02          	clr	_temp_normal_count
3388                     ; 483 						error_bank.bit.temperature_flag = 0;
3390  01c8 72130000      	bres	_error_bank,#1
3391                     ; 484 						temp_sdow_mode = 0;
3393  01cc 3f03          	clr	_temp_sdow_mode
3394                     ; 485 						temp_over_count = 0;
3396  01ce 3f01          	clr	_temp_over_count
3398  01d0 2006          	jra	L3612
3399  01d2               L7512:
3400                     ; 488 						temp_normal_count ++;
3402  01d2 3c02          	inc	_temp_normal_count
3403  01d4 2002          	jra	L3612
3404  01d6               L3512:
3405                     ; 492 				temp_normal_count = 0;	
3407  01d6 3f02          	clr	_temp_normal_count
3408  01d8               L3612:
3409                     ; 494 			if(temp_sdow_mode < 9)//10)
3411  01d8 b603          	ld	a,_temp_sdow_mode
3412  01da a109          	cp	a,#9
3413  01dc 240d          	jruge	L5612
3414                     ; 496 				current_temp = user_Prdata.byte.current_adj - (step_current * temp_sdow_mode);
3416  01de b646          	ld	a,_step_current+1
3417  01e0 97            	ld	xl,a
3418  01e1 b603          	ld	a,_temp_sdow_mode
3419  01e3 42            	mul	x,a
3420  01e4 9f            	ld	a,xl
3421  01e5 b024          	sub	a,_user_Prdata+3
3422  01e7 40            	neg	a
3423  01e8 b753          	ld	_current_temp,a
3426  01ea 81            	ret	
3427  01eb               L5612:
3428                     ; 500 				current_temp = current_adj_table[2];			//1/4
3430  01eb 5500ba0053    	mov	_current_temp,_current_adj_table+5
3432  01f0 81            	ret	
3433  01f1               L7312:
3434                     ; 540 	else if(sys_step == 60)
3436  01f1 a13c          	cp	a,#60
3437  01f3 2703cc02b3    	jrne	L3712
3438                     ; 581 		if(current_temp >  current_v)
3440  01f8 b653          	ld	a,_current_temp
3441  01fa b12d          	cp	a,_current_v
3442  01fc 2304          	jrule	L5712
3443                     ; 582 			current_temp = current_v;	
3445  01fe b62d          	ld	a,_current_v
3446  0200 b753          	ld	_current_temp,a
3447  0202               L5712:
3448                     ; 584 		current_lj = current_ph_lj;
3450  0202 ce00f1        	ldw	x,_current_ph_lj+2
3451  0205 cf00df        	ldw	_current_lj,x
3452                     ; 586 	if((current_temp > current_lj) && ((data_rx[1] & 0x10) == 0) && ((control_temp < 245) || (sys_state_flag.bit.protect_flag > 0)))//
3454  0208 5f            	clrw	x
3455  0209 97            	ld	xl,a
3456  020a c300df        	cpw	x,_current_lj
3457  020d 2316          	jrule	L7712
3459  020f 7208000111    	btjt	_data_rx+1,#4,L7712
3461  0214 be30          	ldw	x,_control_temp
3462  0216 a300f5        	cpw	x,#245
3463  0219 2505          	jrult	L1022
3465  021b 720d000005    	btjf	_sys_state_flag,#6,L7712
3466  0220               L1022:
3467                     ; 587 				current_temp = current_lj;//current_ph;
3469  0220 c600e0        	ld	a,_current_lj+1
3470  0223 b753          	ld	_current_temp,a
3471  0225               L7712:
3472                     ; 612 				if(speed_motor2 > 350)
3474  0225 be00          	ldw	x,_speed_motor2
3475  0227 a3015f        	cpw	x,#351
3476  022a 2507          	jrult	L3022
3477                     ; 614 				if(current_temp > current_speed)
3479  022c b135          	cp	a,_current_speed
3480  022e 2303          	jrule	L3022
3481                     ; 616 					current_temp = current_speed;
3483  0230 453553        	mov	_current_temp,_current_speed
3484  0233               L3022:
3485                     ; 651 		if(current_max < current_temp)
3487  0233 b654          	ld	a,_current_max
3488  0235 b153          	cp	a,_current_temp
3489  0237 2435          	jruge	L7022
3490                     ; 653 			current_max ++;
3492  0239 3c54          	inc	_current_max
3493                     ; 654 			current_adj_table_add[0] = current_max + current_adj_table[4];
3495  023b c600bd        	ld	a,_current_adj_table+8
3496  023e 97            	ld	xl,a
3497  023f c600be        	ld	a,_current_adj_table+9
3498  0242 bb54          	add	a,_current_max
3499  0244 2401          	jrnc	L03
3500  0246 5c            	incw	x
3501  0247               L03:
3502  0247 c700a4        	ld	_current_adj_table_add+1,a
3503  024a 9f            	ld	a,xl
3504  024b c700a3        	ld	_current_adj_table_add,a
3505                     ; 655 			current_adj_table_add[1] = current_max + current_adj_table[3];
3507  024e c600bb        	ld	a,_current_adj_table+6
3508  0251 97            	ld	xl,a
3509  0252 c600bc        	ld	a,_current_adj_table+7
3510  0255 bb54          	add	a,_current_max
3511  0257 2401          	jrnc	L23
3512  0259 5c            	incw	x
3513  025a               L23:
3514  025a c700a6        	ld	_current_adj_table_add+3,a
3515  025d 9f            	ld	a,xl
3516  025e c700a5        	ld	_current_adj_table_add+2,a
3517                     ; 656 			current_adj_table_add[2] = current_max + current_adj_table[1];
3519  0261 c600b7        	ld	a,_current_adj_table+2
3520  0264 97            	ld	xl,a
3521  0265 c600b8        	ld	a,_current_adj_table+3
3522  0268 bb54          	add	a,_current_max
3523  026a 243a          	jrnc	L24
3525  026c 2037          	jp	LC007
3526  026e               L7022:
3527                     ; 658 		else if(current_max > current_temp)
3529  026e b153          	cp	a,_current_temp
3530  0270 233d          	jrule	L1122
3531                     ; 660 			current_max --;
3533  0272 3a54          	dec	_current_max
3534                     ; 661 			current_adj_table_add[0] = current_max + current_adj_table[4];
3536  0274 c600bd        	ld	a,_current_adj_table+8
3537  0277 97            	ld	xl,a
3538  0278 c600be        	ld	a,_current_adj_table+9
3539  027b bb54          	add	a,_current_max
3540  027d 2401          	jrnc	L63
3541  027f 5c            	incw	x
3542  0280               L63:
3543  0280 c700a4        	ld	_current_adj_table_add+1,a
3544  0283 9f            	ld	a,xl
3545  0284 c700a3        	ld	_current_adj_table_add,a
3546                     ; 662 			current_adj_table_add[1] = current_max + current_adj_table[3];
3548  0287 c600bb        	ld	a,_current_adj_table+6
3549  028a 97            	ld	xl,a
3550  028b c600bc        	ld	a,_current_adj_table+7
3551  028e bb54          	add	a,_current_max
3552  0290 2401          	jrnc	L04
3553  0292 5c            	incw	x
3554  0293               L04:
3555  0293 c700a6        	ld	_current_adj_table_add+3,a
3556  0296 9f            	ld	a,xl
3557  0297 c700a5        	ld	_current_adj_table_add+2,a
3558                     ; 663 			current_adj_table_add[2] = current_max + current_adj_table[1];	
3560  029a c600b7        	ld	a,_current_adj_table+2
3561  029d 97            	ld	xl,a
3562  029e c600b8        	ld	a,_current_adj_table+3
3563  02a1 bb54          	add	a,_current_max
3564  02a3 2401          	jrnc	L24
3565  02a5               LC007:
3566  02a5 5c            	incw	x
3567  02a6               L24:
3568  02a6 c700a8        	ld	_current_adj_table_add+5,a
3569  02a9 9f            	ld	a,xl
3570  02aa c700a7        	ld	_current_adj_table_add+4,a
3571  02ad b654          	ld	a,_current_max
3572  02af               L1122:
3573                     ; 665 		current_max_low_step = (current_max >> 1);	
3575  02af 44            	srl	a
3576  02b0 b742          	ld	_current_max_low_step,a
3579  02b2 81            	ret	
3580  02b3               L3712:
3581                     ; 669 	else if(sys_step == 58)
3583  02b3 a13a          	cp	a,#58
3584  02b5 2703cc0367    	jrne	L7122
3585                     ; 671 		if(voltage_average > voltage_average_H)					//higher than 60 volt?
3587  02ba be47          	ldw	x,_voltage_average
3588  02bc b33f          	cpw	x,_voltage_average_H
3589  02be 230f          	jrule	L1222
3590                     ; 673 				error_bank.bit.voltage_over_flag = 1;
3592  02c0 72140000      	bset	_error_bank,#2
3593                     ; 674 				sys_state_flag.bit.sf_flag = 0;
3595                     ; 675 				pwm_duty_brake = 0;
3597  02c4 5f            	clrw	x
3598  02c5 72190001      	bres	_sys_state_flag+1,#4
3599  02c9 bf00          	ldw	_pwm_duty_brake,x
3600                     ; 676 				pwm_brake_max = 0;
3602  02cb bf00          	ldw	_pwm_brake_max,x
3604  02cd 200b          	jra	L3222
3605  02cf               L1222:
3606                     ; 678 			else if(voltage_average < (voltage_average_H - 1))		//162
3608  02cf be3f          	ldw	x,_voltage_average_H
3609  02d1 5a            	decw	x
3610  02d2 b347          	cpw	x,_voltage_average
3611  02d4 2304          	jrule	L3222
3612                     ; 679 				error_bank.bit.voltage_over_flag = 0;	
3614  02d6 72150000      	bres	_error_bank,#2
3615  02da               L3222:
3616                     ; 681 			if(voltage_average < voltage1)					//115
3618  02da be47          	ldw	x,_voltage_average
3619  02dc c3008b        	cpw	x,_voltage1
3620  02df 2467          	jruge	L7222
3621                     ; 683 				if(voltage_normal_count < voltage_count)								//32*2 = 
3623  02e1 b60b          	ld	a,_voltage_normal_count
3624  02e3 c10083        	cp	a,_voltage_count
3625  02e6 2404          	jruge	L1322
3626                     ; 684 					voltage_normal_count ++;
3628  02e8 3c0b          	inc	_voltage_normal_count
3630  02ea 2023          	jra	L3322
3631  02ec               L1322:
3632                     ; 687 						if(MODE_PORT > 0)
3634  02ec b62d          	ld	a,_current_v
3635  02ee 7201501010    	btjf	_PD_IDR,#0,L5322
3636                     ; 689 						if(current_v > current_3a)
3638  02f3 c10084        	cp	a,_current_3a
3639                     ; 690 							current_v -= 1;
3641  02f6 220d          	jrugt	LC002
3642                     ; 693 							current_v = current_3a;
3644  02f8 550084002d    	mov	_current_v,_current_3a
3645                     ; 694 							sys_state_flag.bit.sf_flag = 0;
3647  02fd 72190001      	bres	_sys_state_flag+1,#4
3648  0301 2008          	jra	L3422
3649  0303               L5322:
3650                     ; 699 							if(current_v > 0)
3652  0303 2704          	jreq	L5422
3653                     ; 700 								current_v -= 1;
3655  0305               LC002:
3657  0305 3a2d          	dec	_current_v
3659  0307 2002          	jra	L3422
3660  0309               L5422:
3661                     ; 702 								current_v = 0 ;
3663  0309 b72d          	ld	_current_v,a
3664  030b               L3422:
3665                     ; 705 					voltage_normal_count = 0;
3667  030b 3f0b          	clr	_voltage_normal_count
3668                     ; 706 					voltage_low_count = 0;
3670  030d 3f0c          	clr	_voltage_low_count
3671  030f               L3322:
3672                     ; 709 				if(voltage_average < voltage2)
3674  030f be47          	ldw	x,_voltage_average
3675  0311 c30089        	cpw	x,_voltage2
3676  0314 2503cc0547    	jruge	L1712
3677                     ; 711 					if((voltage_average < voltage_adj_table[3])||(current_v <= current_3a))	//2009.12.11                 //jpk
3679  0319 c300db        	cpw	x,_voltage_adj_table+6
3680  031c 2507          	jrult	L5522
3682  031e b62d          	ld	a,_current_v
3683  0320 c10084        	cp	a,_current_3a
3684  0323 22f1          	jrugt	L1712
3685  0325               L5522:
3686                     ; 713 						if(voltage_cut_count >= 2)
3688  0325 b60a          	ld	a,_voltage_cut_count
3689  0327 a102          	cp	a,#2
3690  0329 251a          	jrult	L7522
3691                     ; 716 							voltage_cut_count = 2;
3693  032b 3502000a      	mov	_voltage_cut_count,#2
3694                     ; 717 							error_bank.bit.voltage_low_flag = 1;
3696  032f 72160000      	bset	_error_bank,#3
3697                     ; 718 							sys_state_flag.bit.sf_flag = 0;
3699  0333 72190001      	bres	_sys_state_flag+1,#4
3700                     ; 719 							if(debug_mode_flag == 0)
3702  0337 b600          	ld	a,_debug_mode_flag
3703  0339 2605          	jrne	L1622
3704                     ; 720 								CLP_OFF();
3706  033b 721c5000      	bset	_PA_ODR,#6
3709  033f 81            	ret	
3710  0340               L1622:
3711                     ; 722 								CLP_ON();
3713  0340 721d5000      	bres	_PA_ODR,#6
3715  0344 81            	ret	
3716  0345               L7522:
3717                     ; 725 							voltage_cut_count ++;
3719  0345 3c0a          	inc	_voltage_cut_count
3721  0347 81            	ret	
3722  0348               L7222:
3723                     ; 733 			else if(voltage_average > (user_Prdata.byte.voltage_adj + 1))					//116
3725  0348 be21          	ldw	x,_user_Prdata
3726  034a 5c            	incw	x
3727  034b b347          	cpw	x,_voltage_average
3728  034d 24c7          	jruge	L1712
3729                     ; 735 				if(voltage_low_count < 10)
3731  034f b60c          	ld	a,_voltage_low_count
3732  0351 a10a          	cp	a,#10
3733  0353 2403          	jruge	L3722
3734                     ; 736 					voltage_low_count ++;
3736  0355 3c0c          	inc	_voltage_low_count
3739  0357 81            	ret	
3740  0358               L3722:
3741                     ; 739 					CLP_ON();
3743  0358 721d5000      	bres	_PA_ODR,#6
3744                     ; 741 					voltage_cut_count = 0;
3746  035c 3f0a          	clr	_voltage_cut_count
3747                     ; 742 					if(voltage_normal_count > 0)
3749  035e b60b          	ld	a,_voltage_normal_count
3750  0360 2702          	jreq	L7722
3751                     ; 743 						voltage_normal_count --;
3753  0362 3a0b          	dec	_voltage_normal_count
3754  0364               L7722:
3755                     ; 744 					voltage_low_count = 0;
3757  0364 3f0c          	clr	_voltage_low_count
3759  0366 81            	ret	
3760  0367               L7122:
3761                     ; 748 	else if(sys_step == 42)
3763  0367 a12a          	cp	a,#42
3764  0369 262b          	jrne	L3032
3765                     ; 750 		if(speed_ad_count > 9)
3767  036b b605          	ld	a,_speed_ad_count
3768  036d a10a          	cp	a,#10
3769  036f 25a5          	jrult	L1712
3770                     ; 752 			speed_ad = (speed_ad_sun/10);
3772  0371 ce0003        	ldw	x,_speed_ad_sun
3773  0374 a60a          	ld	a,#10
3774  0376 62            	div	x,a
3775  0377 01            	rrwa	x,a
3776  0378 b713          	ld	_speed_ad,a
3777                     ; 753 			speed_ad_sun = 0;
3779  037a 5f            	clrw	x
3780  037b cf0003        	ldw	_speed_ad_sun,x
3781                     ; 754 			speed_ad_count = 0;
3783  037e 3f05          	clr	_speed_ad_count
3784                     ; 757 			pwm_duty_on_ini = (u16)(4130/speed_motor2);
3786  0380 ae1022        	ldw	x,#4130
3787  0383 90be00        	ldw	y,_speed_motor2
3788  0386 65            	divw	x,y
3789  0387 cf0097        	ldw	_pwm_duty_on_ini,x
3790                     ; 758 			if(pwm_duty_on_ini > 255)
3792  038a a30100        	cpw	x,#256
3793  038d 2587          	jrult	L1712
3794                     ; 759 			  pwm_duty_on_ini = 255;
3796  038f ae00ff        	ldw	x,#255
3797  0392 cf0097        	ldw	_pwm_duty_on_ini,x
3799  0395 81            	ret	
3800  0396               L3032:
3801                     ; 766 	else if(sys_step == 28)
3803  0396 a11c          	cp	a,#28
3804  0398 2603cc0547    	jreq	L1712
3806                     ; 774 	else if(sys_step == 20)
3808  039d a114          	cp	a,#20
3809  039f 2669          	jrne	L7132
3810                     ; 776 		if(current_cmd_average_key > 0)
3812  03a1 be00          	ldw	x,_current_cmd_average_key
3813                     ; 777 			current_cmd_average = current_cmd_average_key;
3815  03a3 260e          	jrne	L3232
3816                     ; 778 		else if(sys_state_flag.bit.brk_flag == 0)	//y42
3818  03a5 7202000008    	btjt	_sys_state_flag,#1,L7232
3819                     ; 780 		if(current_v > 0)
3821  03aa b62d          	ld	a,_current_v
3822  03ac 2704          	jreq	L7232
3823                     ; 781 			current_cmd_average = current_cmd_average1;
3825  03ae be2e          	ldw	x,_current_cmd_average1
3827  03b0 2001          	jra	L3232
3828  03b2               L7232:
3829                     ; 783 			current_cmd_average = 0;
3830                     ; 787 			current_cmd_average = 0;//y42
3833  03b2 5f            	clrw	x
3834  03b3               L3232:
3836  03b3 bf00          	ldw	_current_cmd_average,x
3837                     ; 789 		if(cmd_start == 0)
3839  03b5 b60e          	ld	a,_cmd_start
3840  03b7 260e          	jrne	L5332
3841                     ; 791 			if(current_cmd_average >= 5)
3843  03b9 a30005        	cpw	x,#5
3844  03bc 2506          	jrult	L7332
3845                     ; 792 				cmd_start = 1;
3847  03be 3501000e      	mov	_cmd_start,#1
3849  03c2 2015          	jra	L3432
3850  03c4               L7332:
3851                     ; 794 				current_cmd_average = 0;
3853  03c4 5f            	clrw	x
3854  03c5 2010          	jp	LC004
3855  03c7               L5332:
3856                     ; 798 			if(current_cmd_average == 0)
3858  03c7 be00          	ldw	x,_current_cmd_average
3859  03c9 2604          	jrne	L5432
3860                     ; 799   		    	cmd_start = 0;
3862  03cb 3f0e          	clr	_cmd_start
3864  03cd 200a          	jra	L3432
3865  03cf               L5432:
3866                     ; 800 			else if(current_cmd_average <= 5)
3868  03cf a30006        	cpw	x,#6
3869  03d2 2405          	jruge	L3432
3870                     ; 801 			   current_cmd_average = 5;
3872  03d4 ae0005        	ldw	x,#5
3873  03d7               LC004:
3874  03d7 bf00          	ldw	_current_cmd_average,x
3875  03d9               L3432:
3876                     ; 804 		if(current_cmd_average == 0)
3878  03d9 be00          	ldw	x,_current_cmd_average
3879  03db 26bd          	jrne	L1712
3880                     ; 806 			TIM1_BKR  |= 0x80;
3882  03dd 721e526d      	bset	_TIM1_BKR,#7
3883                     ; 828 			error_bank.all_flag &= 0x3f7F;		//hall reset by power			//	2F7F //
3885  03e1 721f0001      	bres	_error_bank+1,#7
3886  03e5 b600          	ld	a,_error_bank
3887  03e7 a43f          	and	a,#63
3888  03e9 b700          	ld	_error_bank,a
3889                     ; 831 			Restart_cont = 0;
3891  03eb 3f00          	clr	_Restart_cont
3892                     ; 832 			if(sp_zero_count > 10)
3894  03ed b652          	ld	a,_sp_zero_count
3895  03ef a10b          	cp	a,#11
3896  03f1 2506          	jrult	L5532
3897                     ; 834 				sp_zero_count = 0;
3899  03f3 3f52          	clr	_sp_zero_count
3900                     ; 835 				error_bank.bit.motor_stop_flag = 0;
3902  03f5 721d0000      	bres	_error_bank,#6
3903  03f9               L5532:
3904                     ; 837 			motor_stop_count = 0;
3906  03f9 3f00          	clr	_motor_stop_count
3907                     ; 838 			motor_stop_count2 = 0;
3909  03fb 3f00          	clr	_motor_stop_count2
3910                     ; 839 			ph_lost_count = 0;
3912  03fd 3f4a          	clr	_ph_lost_count
3913                     ; 840 			hall_ok_count = 0; 
3915  03ff 3f00          	clr	_hall_ok_count
3916                     ; 841 			ph_low_count_max = 0;
3918  0401 3f00          	clr	_ph_low_count_max
3919                     ; 842 			ph_low_count_max_back = 0;
3921  0403 725f0000      	clr	_ph_low_count_max_back
3922                     ; 843 			hall_drive_back = 0;
3924  0407 3f00          	clr	_hall_drive_back
3926  0409 81            	ret	
3927  040a               L7132:
3928                     ; 850 	else if(sys_step == 18)
3930  040a a112          	cp	a,#18
3931  040c 2703cc04c3    	jrne	L1632
3932                     ; 852 		if(current_cmd_average1 <= 0) //0
3934  0411 be2e          	ldw	x,_current_cmd_average1
3935  0413 2609          	jrne	L3632
3936                     ; 854 			if(sys_state_flag.bit.spt_flag > 0)					//?¨²¨¢|¡ê?
3938  0415 7205000104    	btjf	_sys_state_flag+1,#2,L3632
3939                     ; 857 				current_cmd_average1 = pwm_duty_on1;	
3941  041a be00          	ldw	x,_pwm_duty_on1
3942  041c bf2e          	ldw	_current_cmd_average1,x
3943  041e               L3632:
3944                     ; 869 		if((data_rx[1] & 0x10) > 0)//6km
3946  041e 7209000105    	btjf	_data_rx+1,#4,L7632
3947                     ; 871 			current_cmd_average1 = dang_limit_pwm;
3949  0423 ce0000        	ldw	x,_dang_limit_pwm
3950  0426 bf2e          	ldw	_current_cmd_average1,x
3951  0428               L7632:
3952                     ; 876 		if(current_cmd_average1 > current_cmd_protect_average)
3954  0428 b33d          	cpw	x,_current_cmd_protect_average
3955  042a 2304          	jrule	L1732
3956                     ; 877 			current_cmd_average1 = current_cmd_protect_average;		//?T?¨´¡À¡ê?¡è
3958  042c be3d          	ldw	x,_current_cmd_protect_average
3959  042e bf2e          	ldw	_current_cmd_average1,x
3960  0430               L1732:
3961                     ; 879 	if((current_cmd_average1 > dang_limit_pwm) && ((run_mode > 0) || (control_temp < 245) || (sys_state_flag.bit.protect_flag == 1) || (dang_limit_pwm == 0)))
3963  0430 c30000        	cpw	x,_dang_limit_pwm
3964  0433 231b          	jrule	L3732
3966  0435 c60000        	ld	a,_run_mode
3967  0438 2611          	jrne	L5732
3969  043a be30          	ldw	x,_control_temp
3970  043c a300f5        	cpw	x,#245
3971  043f 250a          	jrult	L5732
3973  0441 720c000005    	btjt	_sys_state_flag,#6,L5732
3975  0446 ce0000        	ldw	x,_dang_limit_pwm
3976  0449 2605          	jrne	L3732
3977  044b               L5732:
3978                     ; 880 			current_cmd_average1 = dang_limit_pwm;		//¦Ì¦Ì???T?¨´¡À¡ê?¡è		
3980  044b ce0000        	ldw	x,_dang_limit_pwm
3981  044e bf2e          	ldw	_current_cmd_average1,x
3982  0450               L3732:
3983                     ; 882 		if(current_cmd_average1 > limit_current_speed)//((current_cmd_average1 > limit_current_speed) && (hand_no_speed_limit == 0))
3985  0450 be2e          	ldw	x,_current_cmd_average1
3986  0452 c30000        	cpw	x,_limit_current_speed
3987  0455 2305          	jrule	L3042
3988                     ; 883 			current_cmd_average1 = limit_current_speed;		//?????T?¨´¡À¡ê?¡è	
3990  0457 ce0000        	ldw	x,_limit_current_speed
3991  045a bf2e          	ldw	_current_cmd_average1,x
3992  045c               L3042:
3993                     ; 914 		if(current_cmd_average1 > MAX_PWMDUTY)
3995  045c a301e1        	cpw	x,#481
3996  045f 2505          	jrult	L5042
3997                     ; 915 			current_cmd_average1 = 500;		//		
3999  0461 ae01f4        	ldw	x,#500
4000  0464 bf2e          	ldw	_current_cmd_average1,x
4001  0466               L5042:
4002                     ; 917 		if(sp_release_flag == 0)	// SFCCD
4004  0466 c60011        	ld	a,_sp_release_flag
4005  0469 261e          	jrne	L7042
4006                     ; 919 			if(current_cmd_average1 < 10)
4008  046b a3000a        	cpw	x,#10
4009  046e 2413          	jruge	L1142
4010                     ; 921 				if(sp_release_count >= 25)
4012  0470 c60012        	ld	a,_sp_release_count
4013  0473 a119          	cp	a,#25
4014  0475 2506          	jrult	L3142
4015                     ; 922 					sp_release_flag = 1;
4017  0477 35010011      	mov	_sp_release_flag,#1
4019  047b 202c          	jra	L1242
4020  047d               L3142:
4021                     ; 924 					sp_release_count ++;
4023  047d 725c0012      	inc	_sp_release_count
4024  0481 2026          	jra	L1242
4025  0483               L1142:
4026                     ; 927 				sp_release_count = 0;
4028  0483 725f0012      	clr	_sp_release_count
4029  0487 2020          	jra	L1242
4030  0489               L7042:
4031                     ; 931 			if(current_cmd_average1 >= 10)
4033  0489 a3000a        	cpw	x,#10
4034  048c 2517          	jrult	L3242
4035                     ; 933 				if(sf_sp_cancel_count > 25)
4037  048e c60010        	ld	a,_sf_sp_cancel_count
4038  0491 a11a          	cp	a,#26
4039  0493 250a          	jrult	L5242
4040                     ; 935 					sys_state_flag.bit.sf_flag = 0;
4042  0495 72190001      	bres	_sys_state_flag+1,#4
4043                     ; 936 					sp_release_flag = 0;
4045  0499 725f0011      	clr	_sp_release_flag
4047  049d 200a          	jra	L1242
4048  049f               L5242:
4049                     ; 939 					sf_sp_cancel_count ++;
4051  049f 725c0010      	inc	_sf_sp_cancel_count
4052  04a3 2004          	jra	L1242
4053  04a5               L3242:
4054                     ; 942 				sf_sp_cancel_count = 0;
4056  04a5 725f0010      	clr	_sf_sp_cancel_count
4057  04a9               L1242:
4058                     ; 945 		current_cmd_average_old = current_cmd_average1;
4060  04a9 be2e          	ldw	x,_current_cmd_average1
4061  04ab bf11          	ldw	_current_cmd_average_old,x
4062                     ; 947 		if((sys_state_flag.bit.spt_flag > 0))
4064  04ad 7205000104    	btjf	_sys_state_flag+1,#2,L3342
4065                     ; 948 			sys_state_flag.bit.sf_flag = 0;
4067  04b2 72190001      	bres	_sys_state_flag+1,#4
4068  04b6               L3342:
4069                     ; 955 		if((sys_state_flag.bit.sf_flag > 0))
4071  04b6 7208000103cc  	btjf	_sys_state_flag+1,#4,L1712
4072                     ; 956 			current_cmd_average1 = current_cmd_average;
4074  04be be00          	ldw	x,_current_cmd_average
4075  04c0 cc0545        	jp	LC006
4076  04c3               L1632:
4077                     ; 958 	else if(sys_step == 14)
4079  04c3 a10e          	cp	a,#14
4080  04c5 26f4          	jrne	L1712
4081                     ; 960 		if(sys_state_flag.bit.protect_flag == 0)
4083  04c7 720c00001f    	btjt	_sys_state_flag,#6,L3442
4084                     ; 962 			if(control_temp >= 980) //(|| (/*(speed_bike > 600) &&*/ (current_average1 < 3) && (speed_motor2 > 350)))// (|| (HANDLE_PRO_PORT == 0))
4086  04cc be30          	ldw	x,_control_temp
4087  04ce a303d4        	cpw	x,#980
4088  04d1 2504          	jrult	L5442
4089                     ; 963 				protect_count++;
4091  04d3 3c0d          	inc	_protect_count
4093  04d5 2002          	jra	L7442
4094  04d7               L5442:
4095                     ; 965 		 		protect_count = 0;
4097  04d7 3f0d          	clr	_protect_count
4098  04d9               L7442:
4099                     ; 967 			if(protect_count > 3)						// ¨¢?D?100¡ä??¨¬2a¦Ì?¨º?¡À¨²D?o?¦Ì??11y??		
4101  04d9 b60d          	ld	a,_protect_count
4102  04db a104          	cp	a,#4
4103  04dd 250c          	jrult	L3442
4104                     ; 969 				sys_state_flag.bit.sf_flag = 0;
4106  04df 72190001      	bres	_sys_state_flag+1,#4
4107                     ; 970 				sys_state_flag.bit.protect_flag = 1;   // ?D?¡§¡ä|¨®¨²¡Á?DD3¦Ì¡ä|¨®¨²¨º¡ì??¡Á¡ä¨¬?
4109  04e3 721c0000      	bset	_sys_state_flag,#6
4110                     ; 971 				hand_enable_flag = 0; 
4112  04e7 725f0000      	clr	_hand_enable_flag
4113  04eb               L3442:
4114                     ; 976 		if(delay_counter < 125)						//					//
4116  04eb ce0000        	ldw	x,_delay_counter
4117  04ee a3007d        	cpw	x,#125
4118  04f1 241c          	jruge	L3542
4119                     ; 978 			delay_counter ++;
4121  04f3 5c            	incw	x
4122  04f4 cf0000        	ldw	_delay_counter,x
4123                     ; 979 			if(control_temp >= 200)     
4125  04f7 be30          	ldw	x,_control_temp
4126  04f9 a300c8        	cpw	x,#200
4127  04fc 2508          	jrult	L5542
4128                     ; 981 				sys_state_flag.bit.sf_flag = 0;
4130  04fe 72190001      	bres	_sys_state_flag+1,#4
4131                     ; 982 				sys_state_flag.bit.protect_flag = 1;				
4133  0502 721c0000      	bset	_sys_state_flag,#6
4134  0506               L5542:
4135                     ; 984 			if(sys_state_flag.bit.brk_flag > 0)brk_error_flag = 1;
4137  0506 7203000004    	btjf	_sys_state_flag,#1,L3542
4140  050b 35010000      	mov	_brk_error_flag,#1
4141  050f               L3542:
4142                     ; 987 		if(mode_flag == 0)
4144  050f b600          	ld	a,_mode_flag
4145  0511 2603          	jrne	L1642
4146                     ; 988 			control_temp = 0;		
4148  0513 5f            	clrw	x
4149  0514 bf30          	ldw	_control_temp,x
4150  0516               L1642:
4151                     ; 995 		if(control_temp < 245)// 210 xz
4153  0516 be30          	ldw	x,_control_temp
4154  0518 a300f5        	cpw	x,#245
4155  051b 240d          	jruge	L3642
4156                     ; 997 			current_cmd_average1 = 0;
4158  051d 5f            	clrw	x
4159  051e bf2e          	ldw	_current_cmd_average1,x
4160                     ; 998 			sys_state_flag.bit.protect_flag = 0;
4162  0520 721d0000      	bres	_sys_state_flag,#6
4163                     ; 999 			hand_enable_flag = 0;
4165  0524 725f0000      	clr	_hand_enable_flag
4167  0528 2010          	jra	L5642
4168  052a               L3642:
4169                     ; 1001 		else if(control_temp < 710)
4171  052a a302c6        	cpw	x,#710
4172  052d 2406          	jruge	L7642
4173                     ; 1002 			current_cmd_average1 = (control_temp - 150)>>1;
4175  052f 1d0096        	subw	x,#150
4176  0532 54            	srlw	x
4178  0533 2003          	jp	LC005
4179  0535               L7642:
4180                     ; 1004 			current_cmd_average1 = 280;
4182  0535 ae0118        	ldw	x,#280
4183  0538               LC005:
4184  0538 bf2e          	ldw	_current_cmd_average1,x
4185  053a               L5642:
4186                     ; 1006 		if((sys_state_flag.bit.protect_flag > 0) || (onekey.bit.speed_err_flag > 0))// /**/|| ((speed_motor2 > 350) && (speed_bike > 450)))//(hand_enable_flag == 0)
4188  053a 720c000005    	btjt	_sys_state_flag,#6,L5742
4190  053f 7203000003    	btjf	_onekey,#1,L1712
4191  0544               L5742:
4192                     ; 1007 			current_cmd_average1 = 0;
4194  0544 5f            	clrw	x
4195  0545               LC006:
4196  0545 bf2e          	ldw	_current_cmd_average1,x
4197  0547               L1712:
4198                     ; 1012 }
4201  0547 81            	ret	
4261                     ; 1018 void current_num(void)
4261                     ; 1019 {
4262                     	switch	.text
4263  0548               _current_num:
4265  0548 89            	pushw	x
4266       00000002      OFST:	set	2
4269                     ; 1020 	if((sys_step & 0x03) == 0x01)
4271  0549 b600          	ld	a,_sys_step
4272  054b a403          	and	a,#3
4273  054d 4a            	dec	a
4274  054e 2703cc06ee    	jrne	L7052
4275                     ; 1022 		if(run_flag == 0)
4277  0553 b64b          	ld	a,_run_flag
4278  0555 2655          	jrne	L1152
4279                     ; 1024 			sc_current_count ++;
4281  0557 3c49          	inc	_sc_current_count
4282                     ; 1025 			if(sc_current_count > 10)
4284  0559 b649          	ld	a,_sc_current_count
4285  055b a10b          	cp	a,#11
4286  055d 2519          	jrult	L3152
4287                     ; 1027 				sc_ref += current_sample_average[2];
4289  055f c60074        	ld	a,_current_sample_average+2
4290  0562 5f            	clrw	x
4291  0563 97            	ld	xl,a
4292  0564 1f01          	ldw	(OFST-1,sp),x
4294  0566 72bb004c      	addw	x,_sc_ref
4295  056a bf4c          	ldw	_sc_ref,x
4296                     ; 1028 				sphc_ref+= (ph_current_average1/2);
4298  056c be4e          	ldw	x,_ph_current_average1
4299  056e 54            	srlw	x
4300  056f 72bb000a      	addw	x,_sphc_ref
4301  0573 cf000a        	ldw	_sphc_ref,x
4302  0576 b649          	ld	a,_sc_current_count
4303  0578               L3152:
4304                     ; 1030 			if(sc_current_count >= 138)				//
4306  0578 a18a          	cp	a,#138
4307  057a 2527          	jrult	L5152
4308                     ; 1032 				sc_ref = (sc_ref >>7);
4310  057c 384d          	sll	_sc_ref+1
4311  057e b64c          	ld	a,_sc_ref
4312  0580 49            	rlc	a
4313  0581 b74d          	ld	_sc_ref+1,a
4314  0583 3f4c          	clr	_sc_ref
4315                     ; 1033 				sphc_ref = (sphc_ref >> 6);
4317  0585 a606          	ld	a,#6
4318  0587 394c          	rlc	_sc_ref
4319  0589               L64:
4320  0589 7254000a      	srl	_sphc_ref
4321  058d 7256000b      	rrc	_sphc_ref+1
4322  0591 4a            	dec	a
4323  0592 26f5          	jrne	L64
4324                     ; 1034 				sc_current_count = 0;
4326  0594 b749          	ld	_sc_current_count,a
4327                     ; 1035 				run_flag = 1;
4329  0596 3501004b      	mov	_run_flag,#1
4330                     ; 1036 				current_offset = sc_ref;
4332  059a 454d1d        	mov	_current_offset,_sc_ref+1
4333                     ; 1037 				ph_current_offset = sphc_ref ;
4335  059d ce000a        	ldw	x,_sphc_ref
4336  05a0 cf000c        	ldw	_ph_current_offset,x
4337  05a3               L5152:
4338                     ; 1039 			current_sample_average[2] = 0;
4340  05a3 725f0074      	clr	_current_sample_average+2
4341                     ; 1040 			ph_current_average1 = 0;
4343  05a7 5f            	clrw	x
4344  05a8 bf4e          	ldw	_ph_current_average1,x
4346  05aa 201e          	jra	L7152
4347  05ac               L1152:
4348                     ; 1044 			if(current_sample_average[2] > current_offset)
4350  05ac c60074        	ld	a,_current_sample_average+2
4351  05af b11d          	cp	a,_current_offset
4352  05b1 230b          	jrule	L1252
4353                     ; 1046 				current_average_neg = 0;
4355  05b3 725f0071      	clr	_current_average_neg
4356                     ; 1047 				current_sample_average[2] = current_sample_average[2] - current_offset;
4358  05b7 b01d          	sub	a,_current_offset
4359  05b9 c70074        	ld	_current_sample_average+2,a
4361  05bc 200c          	jra	L7152
4362  05be               L1252:
4363                     ; 1051 				current_average_neg = current_offset - current_sample_average[2];
4365  05be b61d          	ld	a,_current_offset
4366  05c0 c00074        	sub	a,_current_sample_average+2
4367  05c3 c70071        	ld	_current_average_neg,a
4368                     ; 1052 				current_sample_average[2] = 0;
4370  05c6 725f0074      	clr	_current_sample_average+2
4371  05ca               L7152:
4372                     ; 1057 		if(current_average1 <= 2)		//13
4374  05ca b62c          	ld	a,_current_average1
4375  05cc a103          	cp	a,#3
4376  05ce 242d          	jruge	L1352
4377                     ; 1059 			if(error_bank.all_flag == 0)
4379  05d0 be00          	ldw	x,_error_bank
4380  05d2 262b          	jrne	L1452
4381                     ; 1061 				if((sys_state_flag.bit.brk_flag == 0)&&(pwm_duty_on_old >= 80)&&(current_v >= 30)&&(speed_motor2 > 400))
4383  05d4 7202000024    	btjt	_sys_state_flag,#1,L1352
4385  05d9 be00          	ldw	x,_pwm_duty_on_old
4386  05db a30050        	cpw	x,#80
4387  05de 251d          	jrult	L1352
4389  05e0 b62d          	ld	a,_current_v
4390  05e2 a11e          	cp	a,#30
4391  05e4 2517          	jrult	L1352
4393  05e6 be00          	ldw	x,_speed_motor2
4394  05e8 a30191        	cpw	x,#401
4395  05eb 2510          	jrult	L1352
4396                     ; 1063 					if(current_zero_count >= 20)
4398  05ed b643          	ld	a,_current_zero_count
4399  05ef a114          	cp	a,#20
4400  05f1 2506          	jrult	L3352
4401                     ; 1066 						sys_state_flag.bit.sf_flag = 0;
4403  05f3 72190001      	bres	_sys_state_flag+1,#4
4405  05f7 2006          	jra	L1452
4406  05f9               L3352:
4407                     ; 1069 						current_zero_count ++;
4409  05f9 3c43          	inc	_current_zero_count
4410  05fb 2002          	jra	L1452
4411  05fd               L1352:
4412                     ; 1072 					current_zero_count = 0;
4413                     ; 1076 			current_zero_count = 0;
4416  05fd 3f43          	clr	_current_zero_count
4417  05ff               L1452:
4418                     ; 1078 		if(motor_alm_status_lock == 0)	
4420  05ff c60000        	ld	a,_motor_alm_status_lock
4421  0602 2638          	jrne	L3452
4422                     ; 1080 			if((pwm_duty_on_old > 0)&&(sys_state_flag.bit.hall_exit == 0))
4424  0604 be00          	ldw	x,_pwm_duty_on_old
4425  0606 272a          	jreq	L1752
4427  0608 7206000025    	btjt	_sys_state_flag,#3,L1752
4428                     ; 1082 				if(pwm_duty_on_old < 40)
4430  060d a30028        	cpw	x,#40
4431  0610 2406          	jruge	L7452
4432                     ; 1084 					if(current_average1 >= current_adj_I)
4434  0612 b62c          	ld	a,_current_average1
4435  0614 b12b          	cp	a,_current_adj_I
4436                     ; 1085 						short_count ++;
4438  0616 2009          	jp	LC011
4439                     ; 1087 						short_count = 0;
4440  0618               L7452:
4441                     ; 1089 				else if(pwm_duty_on_old < 65)
4443  0618 a30041        	cpw	x,#65
4444  061b 240a          	jruge	L7552
4445                     ; 1091 					if(current_average1 >= current_adj_II)
4447  061d b62c          	ld	a,_current_average1
4448  061f b12a          	cp	a,_current_adj_II
4449  0621               LC011:
4450  0621 250f          	jrult	L1752
4451                     ; 1092 						short_count ++;
4453  0623               LC010:
4456  0623 3c28          	inc	_short_count
4458  0625 200d          	jra	L7752
4459                     ; 1094 						short_count = 0;
4460  0627               L7552:
4461                     ; 1096 				else if(pwm_duty_on_old < 80)
4463  0627 a30050        	cpw	x,#80
4464  062a 2406          	jruge	L1752
4465                     ; 1098 					if(current_average1 >= current_adj_III)
4467  062c b62c          	ld	a,_current_average1
4468  062e b129          	cp	a,_current_adj_III
4469                     ; 1099 						short_count ++;
4471  0630 24f1          	jruge	LC010
4472  0632               L1752:
4473                     ; 1101 						short_count = 0;
4474                     ; 1104 					short_count = 0;
4475                     ; 1107 				short_count = 0;
4481  0632 3f28          	clr	_short_count
4482  0634               L7752:
4483                     ; 1109 			if(short_count >= 3)
4485  0634 b628          	ld	a,_short_count
4486  0636 a103          	cp	a,#3
4487  0638 2502          	jrult	L3452
4488                     ; 1112 				short_count = 0;
4490  063a 3f28          	clr	_short_count
4491  063c               L3452:
4492                     ; 1115 		current_average1 = current_sample_average[2]/2 + current_sample_average[1]/2;
4494  063c c60073        	ld	a,_current_sample_average+1
4495  063f 44            	srl	a
4496  0640 6b02          	ld	(OFST+0,sp),a
4498  0642 c60074        	ld	a,_current_sample_average+2
4499  0645 44            	srl	a
4500  0646 1b02          	add	a,(OFST+0,sp)
4501  0648 b72c          	ld	_current_average1,a
4502                     ; 1116 		current_ph = (current_average1 << 8)/pwm_duty_on_old;
4504  064a 97            	ld	xl,a
4505  064b 4f            	clr	a
4506  064c 02            	rlwa	x,a
4507  064d 90be00        	ldw	y,_pwm_duty_on_old
4508  0650 65            	divw	x,y
4509  0651 cf0005        	ldw	_current_ph,x
4510                     ; 1118 		current_sample_average[1] = current_sample_average[2];
4512  0654 5500740073    	mov	_current_sample_average+1,_current_sample_average+2
4513                     ; 1119 		if((current_average1 < current_max) /**/&& ((current_ph < start_2s_count) || (speed_motor2 > 350)))//260
4515  0659 b62c          	ld	a,_current_average1
4516  065b b154          	cp	a,_current_max
4517  065d 244f          	jruge	L3062
4519  065f c30000        	cpw	x,_start_2s_count
4520  0662 2507          	jrult	L5062
4522  0664 be00          	ldw	x,_speed_motor2
4523  0666 a3015f        	cpw	x,#351
4524  0669 2543          	jrult	L3062
4525  066b               L5062:
4526                     ; 1121 			current_add_mod = current_max - current_average1;
4528  066b b654          	ld	a,_current_max
4529  066d b02c          	sub	a,_current_average1
4530  066f c70008        	ld	_current_add_mod,a
4531                     ; 1122 			if(current_add_mod > 10)
4533  0672 a10b          	cp	a,#11
4534  0674 2504          	jrult	L7062
4535                     ; 1123 				current_add_mod = 12;
4537  0676 a60c          	ld	a,#12
4539  0678 200b          	jra	L1162
4540  067a               L7062:
4541                     ; 1126 				current_add_mod = current_add_mod << 4;
4543  067a 4e            	swap	a
4544  067b a4f0          	and	a,#240
4545  067d c70008        	ld	_current_add_mod,a
4546                     ; 1127 				current_add_mod = 184 - current_add_mod;
4548  0680 a6b8          	ld	a,#184
4549  0682 c00008        	sub	a,_current_add_mod
4550  0685               L1162:
4551  0685 c70008        	ld	_current_add_mod,a
4552                     ; 1130 			if(((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0)) || (run_mode > 0))
4554  0688 be30          	ldw	x,_control_temp
4555  068a a300f6        	cpw	x,#246
4556  068d 2505          	jrult	L7162
4558  068f 720d000006    	btjf	_sys_state_flag,#6,L5162
4559  0694               L7162:
4561  0694 725d0000      	tnz	_run_mode
4562  0698 270e          	jreq	L5262
4563  069a               L5162:
4564                     ; 1134 					if(current_add_mod > 127)current_add_mod = 255;
4566  069a a180          	cp	a,#128
4567  069c 2506          	jrult	L1262
4570  069e 35ff0008      	mov	_current_add_mod,#255
4572  06a2 2004          	jra	L5262
4573  06a4               L1262:
4574                     ; 1135 					else current_add_mod = (current_add_mod << 1);// + (current_add_mod >> 2);
4576  06a4 72580008      	sll	_current_add_mod
4577  06a8               L5262:
4578                     ; 1187 			current_high_flag = 0;
4580  06a8 725f009c      	clr	_current_high_flag
4582  06ac 2070          	jra	L5462
4583  06ae               L3062:
4584                     ; 1189 		else if((current_average1 > current_max) || (current_max == 0) /**/|| ((current_ph > start_2s_count) && (speed_motor2 <= 350)))////current_ph?¨¤¦Ì?¨¢¡Â
4586  06ae b154          	cp	a,_current_max
4587  06b0 2213          	jrugt	L3362
4589  06b2 3d54          	tnz	_current_max
4590  06b4 270f          	jreq	L3362
4592  06b6 ce0005        	ldw	x,_current_ph
4593  06b9 c30000        	cpw	x,_start_2s_count
4594  06bc 232a          	jrule	L1362
4596  06be be00          	ldw	x,_speed_motor2
4597  06c0 a3015f        	cpw	x,#351
4598  06c3 2423          	jruge	L1362
4599  06c5               L3362:
4600                     ; 1191 			current_sub_mod = current_average1 - current_max;
4602  06c5 b054          	sub	a,_current_max
4603  06c7 c70009        	ld	_current_sub_mod,a
4604                     ; 1192 		  if(current_sub_mod > 10)
4606  06ca a10b          	cp	a,#11
4607  06cc 2506          	jrult	L7362
4608                     ; 1193 				current_sub_mod = 12;
4610  06ce 350c0009      	mov	_current_sub_mod,#12
4612  06d2 200e          	jra	L1462
4613  06d4               L7362:
4614                     ; 1196 				current_sub_mod = current_sub_mod << 4;
4616  06d4 4e            	swap	a
4617  06d5 a4f0          	and	a,#240
4618  06d7 c70009        	ld	_current_sub_mod,a
4619                     ; 1197 				current_sub_mod = 184 - current_sub_mod;
4621  06da a6b8          	ld	a,#184
4622  06dc c00009        	sub	a,_current_sub_mod
4623  06df c70009        	ld	_current_sub_mod,a
4624  06e2               L1462:
4625                     ; 1201 			current_high_flag = 1;
4627  06e2 3501009c      	mov	_current_high_flag,#1
4629  06e6 2036          	jra	L5462
4630  06e8               L1362:
4631                     ; 1205 			current_high_flag = 2;
4633  06e8 3502009c      	mov	_current_high_flag,#2
4634  06ec 2030          	jra	L5462
4635  06ee               L7052:
4636                     ; 1207 	else if((sys_step & 0x03) == 0x03)				//62.5*4 = 
4638  06ee b600          	ld	a,_sys_step
4639  06f0 a403          	and	a,#3
4640  06f2 a103          	cp	a,#3
4641  06f4 2628          	jrne	L5462
4642                     ; 1209 		if(alarm_switch == 0)
4644  06f6 b600          	ld	a,_alarm_switch
4645  06f8 2624          	jrne	L5462
4646                     ; 1211 			if(motor_flag.all_flag == DRIVE_BIT)
4648  06fa b600          	ld	a,_motor_flag
4649  06fc a101          	cp	a,#1
4650  06fe 2617          	jrne	L3562
4651                     ; 1213 				if((ModeFlag == 0) && (sys_state_flag.bit.hall_exit > 0) && (square_sine_change_flag == 1))
4653  0700 b600          	ld	a,_ModeFlag
4654  0702 260b          	jrne	L5562
4656  0704 7207000006    	btjf	_sys_state_flag,#3,L5562
4658  0709 c60000        	ld	a,_square_sine_change_flag
4659  070c 4a            	dec	a
4660  070d 270f          	jreq	L5462
4662  070f               L5562:
4663                     ; 1216 				else if(current_cmd_average > 0)
4665  070f be00          	ldw	x,_current_cmd_average
4666  0711 270b          	jreq	L5462
4667                     ; 1217 					motor_dirve2();
4669  0713 ad0b          	call	_motor_dirve2
4671  0715 2007          	jra	L5462
4672  0717               L3562:
4673                     ; 1219 			else if(motor_flag.all_flag == ABS_BIT)
4675  0717 a102          	cp	a,#2
4676  0719 2603          	jrne	L5462
4677                     ; 1221 				motor_abs();
4679  071b cd07e0        	call	_motor_abs
4681  071e               L5462:
4682                     ; 1226 }
4685  071e 85            	popw	x
4686  071f 81            	ret	
4722                     ; 1228 void motor_dirve2(void)
4722                     ; 1229 {
4723                     	switch	.text
4724  0720               _motor_dirve2:
4728                     ; 1234 	if(ph_low_count_max == 0)
4730  0720 b600          	ld	a,_ph_low_count_max
4731  0722 2703cc07df    	jrne	L7762
4732                     ; 1238 		if(current_high_flag == 1)
4734  0727 c6009c        	ld	a,_current_high_flag
4735  072a 4a            	dec	a
4736  072b 2632          	jrne	L1072
4737                     ; 1240 			pwm_add_count = 1;
4739  072d 35010000      	mov	_pwm_add_count,#1
4740                     ; 1241 			if(pwm_sub_count == 0)
4742  0731 b600          	ld	a,_pwm_sub_count
4743  0733 261e          	jrne	L3072
4744                     ; 1243 				if(sys_state_flag.bit.hall_exit == 1)
4746  0735 720700000c    	btjf	_sys_state_flag,#3,L5072
4747                     ; 1245 					if(pwm_duty_on_old > 250)
4749  073a be00          	ldw	x,_pwm_duty_on_old
4750  073c a300fb        	cpw	x,#251
4751  073f 2505          	jrult	L5072
4752                     ; 1246 						pwm_duty_on_old = 250;
4754  0741 ae00fa        	ldw	x,#250
4755  0744 bf00          	ldw	_pwm_duty_on_old,x
4756  0746               L5072:
4757                     ; 1249 				if(pwm_duty_on_old >= 10)
4759  0746 be00          	ldw	x,_pwm_duty_on_old
4760  0748 a3000a        	cpw	x,#10
4761  074b 2503          	jrult	L1172
4762                     ; 1264 					pwm_duty_on_old -= 1;//1
4764  074d 5a            	decw	x
4766  074e 2001          	jp	LC012
4767  0750               L1172:
4768                     ; 1267 					pwm_duty_on_old = 0;
4770  0750 5f            	clrw	x
4771  0751               LC012:
4772  0751 bf00          	ldw	_pwm_duty_on_old,x
4773  0753               L3072:
4774                     ; 1269 			pwm_sub_count ++;
4776  0753 3c00          	inc	_pwm_sub_count
4777                     ; 1270 			if(pwm_sub_count >= current_sub_mod)				//4
4779  0755 b600          	ld	a,_pwm_sub_count
4780  0757 c10009        	cp	a,_current_sub_mod
4781  075a 25c8          	jrult	L7762
4782                     ; 1271 				pwm_sub_count = 0;
4784  075c 3f00          	clr	_pwm_sub_count
4786  075e 81            	ret	
4787  075f               L1072:
4788                     ; 1275 			pwm_sub_count = 1;
4790  075f 35010000      	mov	_pwm_sub_count,#1
4791                     ; 1276 			if((current_cmd_average > pwm_duty_on_old) || (current_average_neg >= 2))
4793  0763 be00          	ldw	x,_current_cmd_average
4794  0765 b300          	cpw	x,_pwm_duty_on_old
4795  0767 2207          	jrugt	L3272
4797  0769 c60071        	ld	a,_current_average_neg
4798  076c a102          	cp	a,#2
4799  076e 2538          	jrult	L1272
4800  0770               L3272:
4801                     ; 1280 					if(pwm_duty_on_old < 8)
4803  0770 be00          	ldw	x,_pwm_duty_on_old
4804  0772 a30008        	cpw	x,#8
4805  0775 2405          	jruge	L5272
4806                     ; 1281 						pwm_duty_on_old = 8;
4808  0777 ae0008        	ldw	x,#8
4809  077a bf00          	ldw	_pwm_duty_on_old,x
4810  077c               L5272:
4811                     ; 1283 					if(pwm_add_count == 0)
4813  077c b600          	ld	a,_pwm_add_count
4814  077e 2603          	jrne	L7272
4815                     ; 1288 							pwm_duty_on_old += 1;//1
4817  0780 5c            	incw	x
4818  0781 bf00          	ldw	_pwm_duty_on_old,x
4819  0783               L7272:
4820                     ; 1292 					if(sys_state_flag.bit.hall_exit == 1)
4822  0783 720700000a    	btjf	_sys_state_flag,#3,L1372
4823                     ; 1294 						if(pwm_duty_on_old > 250)
4825  0788 a300fb        	cpw	x,#251
4826  078b 250f          	jrult	L5372
4827                     ; 1295 							pwm_duty_on_old = 256;						
4829  078d ae0100        	ldw	x,#256
4830  0790 2008          	jp	LC013
4831  0792               L1372:
4832                     ; 1299 						if(pwm_duty_on_old > 280)
4834  0792 a30119        	cpw	x,#281
4835  0795 2505          	jrult	L5372
4836                     ; 1300 							pwm_duty_on_old = 280;
4838  0797 ae0118        	ldw	x,#280
4839  079a               LC013:
4840  079a bf00          	ldw	_pwm_duty_on_old,x
4841  079c               L5372:
4842                     ; 1303 					pwm_add_count++;
4844  079c 3c00          	inc	_pwm_add_count
4845                     ; 1305 					if(pwm_add_count >= current_add_mod)
4847  079e b600          	ld	a,_pwm_add_count
4848  07a0 c10008        	cp	a,_current_add_mod
4849  07a3 253a          	jrult	L7762
4850                     ; 1306 						pwm_add_count = 0;
4852  07a5 3f00          	clr	_pwm_add_count
4854  07a7 81            	ret	
4855  07a8               L1272:
4856                     ; 1310 			else if((current_cmd_average < pwm_duty_on_old) && (current_average1 > c_offset))
4858  07a8 b300          	cpw	x,_pwm_duty_on_old
4859  07aa 2427          	jruge	L5472
4861  07ac b62c          	ld	a,_current_average1
4862  07ae c100a2        	cp	a,_c_offset
4863  07b1 2320          	jrule	L5472
4864                     ; 1312 				if(pwm_cut_count == 0)
4866  07b3 b600          	ld	a,_pwm_cut_count
4867  07b5 2607          	jrne	L7472
4868                     ; 1314 					if(pwm_duty_on_old > 0)
4870  07b7 be00          	ldw	x,_pwm_duty_on_old
4871  07b9 2703          	jreq	L7472
4872                     ; 1315 						pwm_duty_on_old --;
4874  07bb 5a            	decw	x
4875  07bc bf00          	ldw	_pwm_duty_on_old,x
4876  07be               L7472:
4877                     ; 1317 				pwm_cut_count ++;
4879  07be 3c00          	inc	_pwm_cut_count
4880                     ; 1319 				if(pwm_duty_on_old < 15)//5
4882  07c0 be00          	ldw	x,_pwm_duty_on_old
4883  07c2 a3000f        	cpw	x,#15
4884  07c5 2403          	jruge	L3572
4885                     ; 1320 					pwm_duty_on_old = 0;
4887  07c7 5f            	clrw	x
4888  07c8 bf00          	ldw	_pwm_duty_on_old,x
4889  07ca               L3572:
4890                     ; 1322 				if(pwm_cut_count >= 36)//25
4892  07ca b600          	ld	a,_pwm_cut_count
4893  07cc a124          	cp	a,#36
4894  07ce 250f          	jrult	L7762
4895                     ; 1323 					pwm_cut_count = 0;
4897  07d0 3f00          	clr	_pwm_cut_count
4899  07d2 81            	ret	
4900  07d3               L5472:
4901                     ; 1327 					if(pwm_duty_on_old > 280)
4903  07d3 be00          	ldw	x,_pwm_duty_on_old
4904  07d5 a30119        	cpw	x,#281
4905  07d8 2505          	jrult	L7762
4906                     ; 1328 						pwm_duty_on_old = 280;
4908  07da ae0118        	ldw	x,#280
4909  07dd bf00          	ldw	_pwm_duty_on_old,x
4910  07df               L7762:
4911                     ; 1334 }
4914  07df 81            	ret	
4940                     ; 1436 void motor_abs(void)
4940                     ; 1437 {
4941                     	switch	.text
4942  07e0               _motor_abs:
4946                     ; 1438 	brake_pwm_duty();
4948  07e0 cd0000        	call	_brake_pwm_duty
4950                     ; 1439 	pwm_duty_on = 0;
4952  07e3 5f            	clrw	x
4953  07e4 bf00          	ldw	_pwm_duty_on,x
4954                     ; 1440 	pwm_duty_on_old = 0;	
4956  07e6 bf00          	ldw	_pwm_duty_on_old,x
4957                     ; 1441 }
4960  07e8 81            	ret	
4986                     ; 1446 void adc_channel(void)
4986                     ; 1447 {
4987                     	switch	.text
4988  07e9               _adc_channel:
4992                     ; 1451 	ADC_CSR &= 0xf0;
4994  07e9 c65400        	ld	a,_ADC_CSR
4995  07ec a4f0          	and	a,#240
4996  07ee c75400        	ld	_ADC_CSR,a
4997                     ; 1454 if(sys_step == 56)
4999  07f1 b600          	ld	a,_sys_step
5000  07f3 a138          	cp	a,#56
5001  07f5 2607          	jrne	L3003
5002                     ; 1456 		ADC_CSR |= VOL_CHN;		//¦Ì??12¨¦?¨´
5004  07f7 c65400        	ld	a,_ADC_CSR
5005  07fa aa06          	or	a,#6
5006                     ; 1457 		ADC_CSR &= 0x7f;
5007                     ; 1458 		ADC_CR1 |= 0x01;			//?a¨º?¡Áa??
5009  07fc 2014          	jp	LC015
5010  07fe               L3003:
5011                     ; 1460 	else if(sys_step == 40)
5013  07fe a128          	cp	a,#40
5014  0800 2607          	jrne	L7003
5015                     ; 1462 		ADC_CSR |= PRO_CHN;		//???¨¨2¨¦?¨´
5017  0802 c65400        	ld	a,_ADC_CSR
5018  0805 aa09          	or	a,#9
5019                     ; 1463 		ADC_CSR &= 0x7f;
5020                     ; 1464 		ADC_CR1 |= 0x01;			//?a¨º?¡Áa??
5022  0807 2009          	jp	LC015
5023  0809               L7003:
5024                     ; 1466 	else if(sys_step == 26)
5026  0809 a11a          	cp	a,#26
5027  080b 260a          	jrne	L3103
5028                     ; 1468 		ADC_CSR |= HAD_CHN;		//¡Áa¡ã?2¨¦?¨´
5030  080d c65400        	ld	a,_ADC_CSR
5031  0810 aa07          	or	a,#7
5032  0812               LC015:
5033  0812 c75400        	ld	_ADC_CSR,a
5034                     ; 1469 		ADC_CSR &= 0x7f;
5035                     ; 1470 		ADC_CR1 |= 0x01;			//?a¨º?¡Áa??
5037  0815 201f          	jp	LC014
5038  0817               L3103:
5039                     ; 1472 	else if(sys_step == 12)
5041  0817 a10c          	cp	a,#12
5042  0819 2606          	jrne	L7103
5043                     ; 1474 		ADC_CSR |= TEM_CHN;		//?T?¨´2¨¦?¨´
5045  081b 72165400      	bset	_ADC_CSR,#3
5046                     ; 1475 		ADC_CSR &= 0x7f;
5047                     ; 1476 		ADC_CR1 |= 0x01;			//?a¨º?¡Áa??
5049  081f 2015          	jp	LC014
5050  0821               L7103:
5051                     ; 1478 	else if(sys_step == 6) //LJ XZ ADD
5053  0821 a106          	cp	a,#6
5054  0823 2607          	jrne	L3203
5055                     ; 1480 		ADC_CSR |= LJ_CHN;		
5057  0825 c65400        	ld	a,_ADC_CSR
5058  0828 aa05          	or	a,#5
5059                     ; 1481 		ADC_CSR &= 0x7f;
5060                     ; 1482 		ADC_CR1 |= 0x01;			
5062  082a 20e6          	jp	LC015
5063  082c               L3203:
5064                     ; 1488 	else if((sys_step & 0x03) == 0x03)
5066  082c a403          	and	a,#3
5067  082e a103          	cp	a,#3
5068  0830 260c          	jrne	L5003
5069                     ; 1493 		ADC_CSR |= CUR_CHN;		//¦Ì?¨¢¡Â2¨¦?¨´
5071  0832 72145400      	bset	_ADC_CSR,#2
5072                     ; 1494 		ADC_CSR &= 0x7f;
5074                     ; 1495 		ADC_CR1 |= 0x01;			//?a¨º?¡Áa??
5076  0836               LC014:
5082  0836 721f5400      	bres	_ADC_CSR,#7
5088  083a 72105401      	bset	_ADC_CR1,#0
5089  083e               L5003:
5090                     ; 1499 }
5093  083e 81            	ret	
5125                     ; 1507 void adc_sampel_ph(void)					//?¨¤¦Ì?¨¢¡Â2¨¦?¨´¡ä|¨¤¨ª
5125                     ; 1508 {
5126                     	switch	.text
5127  083f               _adc_sampel_ph:
5131                     ; 1509 	AD_count_max = 10;
5133  083f 350a0000      	mov	_AD_count_max,#10
5135  0843               L5403:
5136                     ; 1511 	while(((ADC_CSR & 0x80) == 0x00) && (AD_count_max --));		//?¨¬2aAD¡Áa??¨º?¡¤?¨ª¨º3¨¦
5138  0843 720e540007    	btjt	_ADC_CSR,#7,L1503
5140  0848 b600          	ld	a,_AD_count_max
5141  084a 3a00          	dec	_AD_count_max
5142  084c 4d            	tnz	a
5143  084d 26f4          	jrne	L5403
5144  084f               L1503:
5145                     ; 1512 	ADC_CSR &= 0x7f;						//??3yAD¡Áa??¨ª¨º3¨¦¡À¨º????
5147  084f 721f5400      	bres	_ADC_CSR,#7
5148                     ; 1513 	if(AD_count_max > 0)
5150  0853 b600          	ld	a,_AD_count_max
5151  0855 272f          	jreq	L3503
5152                     ; 1515 		AD_Value = (ADC_DRH << 2) + ADC_DRL;
5154  0857 c65404        	ld	a,_ADC_DRH
5155  085a 97            	ld	xl,a
5156  085b a604          	ld	a,#4
5157  085d 42            	mul	x,a
5158  085e 01            	rrwa	x,a
5159  085f cb5405        	add	a,_ADC_DRL
5160  0862 2401          	jrnc	L66
5161  0864 5c            	incw	x
5162  0865               L66:
5163  0865 b751          	ld	_AD_Value+1,a
5164  0867 9f            	ld	a,xl
5165  0868 b750          	ld	_AD_Value,a
5166                     ; 1516 		ph_current_average1 = AD_Value;
5168  086a be50          	ldw	x,_AD_Value
5169  086c bf4e          	ldw	_ph_current_average1,x
5170                     ; 1517 		if((run_flag == 1))//&&(debug_mode_flag > 0))
5172  086e b64b          	ld	a,_run_flag
5173  0870 4a            	dec	a
5174  0871 2616          	jrne	L3603
5175                     ; 1519 		if(ph_current_average1 > ph_current_offset)
5177  0873 c3000c        	cpw	x,_ph_current_offset
5178  0876 2309          	jrule	L7503
5179                     ; 1520 			cvt_torlance_current = ph_current_average1 - ph_current_offset;
5181  0878 b64f          	ld	a,_ph_current_average1+1
5182  087a c0000d        	sub	a,_ph_current_offset+1
5183  087d c70086        	ld	_cvt_torlance_current,a
5186  0880 81            	ret	
5187  0881               L7503:
5188                     ; 1522 			cvt_torlance_current = 0;	
5190  0881 725f0086      	clr	_cvt_torlance_current
5192  0885 81            	ret	
5193  0886               L3503:
5194                     ; 1526 		ph_current_average1 = 0;
5196  0886 5f            	clrw	x
5197  0887 bf4e          	ldw	_ph_current_average1,x
5198  0889               L3603:
5199                     ; 1527 }
5202  0889 81            	ret	
5238                     ; 1534 void motor_stop(void)
5238                     ; 1535 {
5239                     	switch	.text
5240  088a               _motor_stop:
5244                     ; 1536 	speed_motor = hall_count;
5246  088a be00          	ldw	x,_hall_count
5247  088c bf00          	ldw	_speed_motor,x
5248                     ; 1537 	hall_count = 0;
5250  088e 5f            	clrw	x
5251  088f bf00          	ldw	_hall_count,x
5252                     ; 1596 	if(speed_motor2 > 490)
5254  0891 be00          	ldw	x,_speed_motor2
5255  0893 a301eb        	cpw	x,#491
5256  0896 2534          	jrult	L5703
5257                     ; 1611 		if(current_average1 > current_adj_table[3])			//7A
5259  0898 b62c          	ld	a,_current_average1
5260  089a 5f            	clrw	x
5261  089b 97            	ld	xl,a
5262  089c c300bb        	cpw	x,_current_adj_table+6
5263  089f 2325          	jrule	L7703
5264                     ; 1613 			if(sys_state_flag.bit.brk_flag == 0)
5266  08a1 7202000014    	btjt	_sys_state_flag,#1,L1013
5267                     ; 1615 				if(motor_stop_count < 25)			//10*43.5ms = 435ms		
5269  08a6 b600          	ld	a,_motor_stop_count
5270  08a8 a119          	cp	a,#25
5271  08aa 2404          	jruge	L3013
5272                     ; 1616 					motor_stop_count ++;
5274  08ac 3c00          	inc	_motor_stop_count
5276  08ae 200a          	jra	L1013
5277  08b0               L3013:
5278                     ; 1619 					error_bank.bit.motor_stop_flag = 1;
5280  08b0 721c0000      	bset	_error_bank,#6
5281                     ; 1620 					position_flag = 1;	
5283  08b4 35010000      	mov	_position_flag,#1
5284                     ; 1621 					sp_zero_count = 0;
5286  08b8 3f52          	clr	_sp_zero_count
5287  08ba               L1013:
5288                     ; 1626 			if(motor_stop_count == 7)
5290  08ba b600          	ld	a,_motor_stop_count
5291  08bc a107          	cp	a,#7
5292  08be 2614          	jrne	L3113
5293                     ; 1627 				motor_current_limit_flag = 1;							
5295  08c0 3501008f      	mov	_motor_current_limit_flag,#1
5296  08c4 200e          	jra	L3113
5297  08c6               L7703:
5298                     ; 1631 			motor_current_limit_flag = 0;
5300  08c6 725f008f      	clr	_motor_current_limit_flag
5301                     ; 1632 			motor_stop_count = 0;
5302  08ca 2006          	jp	LC016
5303  08cc               L5703:
5304                     ; 1663 		sleep_count = 0;
5306  08cc 5f            	clrw	x
5307  08cd cf0000        	ldw	_sleep_count,x
5308                     ; 1664 		motor_stop_count2 = 0;	
5310  08d0 3f00          	clr	_motor_stop_count2
5311                     ; 1665 		motor_stop_count = 0;
5313  08d2               LC016:
5315  08d2 3f00          	clr	_motor_stop_count
5316  08d4               L3113:
5317                     ; 1669 	if(error_bank.bit.motor_stop_flag > 0)
5319  08d4 720d00000c    	btjf	_error_bank,#6,L5113
5320                     ; 1671 		sys_state_flag.bit.sf_flag = 0;
5322  08d9 72190001      	bres	_sys_state_flag+1,#4
5323                     ; 1672 		if(sp_zero_count <= 10)
5325  08dd b652          	ld	a,_sp_zero_count
5326  08df a10b          	cp	a,#11
5327  08e1 2402          	jruge	L5113
5328                     ; 1673 			sp_zero_count ++;
5330  08e3 3c52          	inc	_sp_zero_count
5331  08e5               L5113:
5332                     ; 1675 }
5335  08e5 81            	ret	
5358                     ; 1847 @far @interrupt void ADC_IRQ (void)
5358                     ; 1848 {
5360                     	switch	.text
5361  08e6               f_ADC_IRQ:
5365                     ; 1853 	return;
5368  08e6 80            	iret	
6885                     	xdef	f_ADC_IRQ
6886                     	switch	.bss
6887  0000               _lj_pale_count:
6888  0000 00            	ds.b	1
6889                     	xdef	_lj_pale_count
6890  0001               _control_lj_temp_old:
6891  0001 0000          	ds.b	2
6892                     	xdef	_control_lj_temp_old
6893  0003               _lj_ad_app_delta:
6894  0003 0000          	ds.b	2
6895                     	xdef	_lj_ad_app_delta
6896  0005               _current_ph:
6897  0005 0000          	ds.b	2
6898                     	xdef	_current_ph
6899  0007               _sp_ph_current_limit:
6900  0007 00            	ds.b	1
6901                     	xdef	_sp_ph_current_limit
6902  0008               _current_add_mod:
6903  0008 00            	ds.b	1
6904                     	xdef	_current_add_mod
6905  0009               _current_sub_mod:
6906  0009 00            	ds.b	1
6907                     	xdef	_current_sub_mod
6908  000a               _sphc_ref:
6909  000a 0000          	ds.b	2
6910                     	xdef	_sphc_ref
6911  000c               _ph_current_offset:
6912  000c 0000          	ds.b	2
6913                     	xdef	_ph_current_offset
6914  000e               _speed_high_count:
6915  000e 00            	ds.b	1
6916                     	xdef	_speed_high_count
6917  000f               _motor_stop_1st:
6918  000f 00            	ds.b	1
6919                     	xdef	_motor_stop_1st
6920  0010               _sf_sp_cancel_count:
6921  0010 00            	ds.b	1
6922                     	xdef	_sf_sp_cancel_count
6923  0011               _sp_release_flag:
6924  0011 00            	ds.b	1
6925                     	xdef	_sp_release_flag
6926  0012               _sp_release_count:
6927  0012 00            	ds.b	1
6928                     	xdef	_sp_release_count
6929  0013               _current_average_log_sum:
6930  0013 0000          	ds.b	2
6931                     	xdef	_current_average_log_sum
6932  0015               _current_average_log_i:
6933  0015 00            	ds.b	1
6934                     	xdef	_current_average_log_i
6935  0016               _current_average_log:
6936  0016 000000000000  	ds.b	16
6937                     	xdef	_current_average_log
6938                     	switch	.ubsct
6939  0000               _AD_count_max:
6940  0000 00            	ds.b	1
6941                     	xdef	_AD_count_max
6942  0001               _sum_average_current:
6943  0001 00000000      	ds.b	4
6944                     	xdef	_sum_average_current
6945  0005               _ph_current_average2:
6946  0005 00            	ds.b	1
6947                     	xdef	_ph_current_average2
6948  0006               _add_16data:
6949  0006 00            	ds.b	1
6950                     	xdef	_add_16data
6951                     	switch	.bss
6952  0026               _cal_current_tab:
6953  0026 000000000000  	ds.b	64
6954                     	xdef	_cal_current_tab
6955                     	switch	.ubsct
6956  0007               _current_sample_16bit:
6957  0007 0000          	ds.b	2
6958                     	xdef	_current_sample_16bit
6959  0009               _pwm_duty_8bit:
6960  0009 00            	ds.b	1
6961                     	xdef	_pwm_duty_8bit
6962  000a               _voltage_cut_count:
6963  000a 00            	ds.b	1
6964                     	xdef	_voltage_cut_count
6965  000b               _voltage_normal_count:
6966  000b 00            	ds.b	1
6967                     	xdef	_voltage_normal_count
6968  000c               _voltage_low_count:
6969  000c 00            	ds.b	1
6970                     	xdef	_voltage_low_count
6971                     	switch	.bss
6972  0066               _ph_current_count:
6973  0066 00            	ds.b	1
6974                     	xdef	_ph_current_count
6975                     	switch	.ubsct
6976  000d               _protect_count:
6977  000d 00            	ds.b	1
6978                     	xdef	_protect_count
6979  000e               _cmd_start:
6980  000e 00            	ds.b	1
6981                     	xdef	_cmd_start
6982                     	switch	.bss
6983  0067               _current_cmd_average_sub:
6984  0067 0000          	ds.b	2
6985                     	xdef	_current_cmd_average_sub
6986  0069               _current_cmd_average_old1:
6987  0069 0000          	ds.b	2
6988                     	xdef	_current_cmd_average_old1
6989                     	switch	.ubsct
6990  000f               _speed_check_count:
6991  000f 00            	ds.b	1
6992                     	xdef	_speed_check_count
6993  0010               _speed_time_count:
6994  0010 00            	ds.b	1
6995                     	xdef	_speed_time_count
6996  0011               _current_cmd_average_old:
6997  0011 0000          	ds.b	2
6998                     	xdef	_current_cmd_average_old
6999  0013               _speed_ad:
7000  0013 00            	ds.b	1
7001                     	xdef	_speed_ad
7002                     	xdef	_speed_ad_count
7003                     	xdef	_speed_ad_sun
7004                     	xdef	_temp_count
7005                     	xdef	_temp_sun
7006                     	xdef	_temp_sdow_mode
7007                     	xdef	_temp_normal_count
7008                     	xdef	_temp_over_count
7009  0014               _current_adj_temp:
7010  0014 0000          	ds.b	2
7011                     	xdef	_current_adj_temp
7012                     	switch	.bss
7013  006b               _low_current_cmd_protect_temp:
7014  006b 0000          	ds.b	2
7015                     	xdef	_low_current_cmd_protect_temp
7016  006d               _voltage_data_back:
7017  006d 0000          	ds.b	2
7018                     	xdef	_voltage_data_back
7019  006f               _voltage_data:
7020  006f 0000          	ds.b	2
7021                     	xdef	_voltage_data
7022                     	switch	.ubsct
7023  0016               _phase_normal_count:
7024  0016 00            	ds.b	1
7025                     	xdef	_phase_normal_count
7026  0017               _phase_lost_count:
7027  0017 00            	ds.b	1
7028                     	xdef	_phase_lost_count
7029  0018               _ph_current:
7030  0018 0000          	ds.b	2
7031                     	xdef	_ph_current
7032                     	switch	.bss
7033  0071               _current_average_neg:
7034  0071 00            	ds.b	1
7035                     	xdef	_current_average_neg
7036  0072               _current_sample_average:
7037  0072 000000        	ds.b	3
7038                     	xdef	_current_sample_average
7039  0075               _control_temp_table:
7040  0075 00000000      	ds.b	4
7041                     	xdef	_control_temp_table
7042                     	switch	.ubsct
7043  001a               _ph_current_average_back:
7044  001a 00            	ds.b	1
7045                     	xdef	_ph_current_average_back
7046  001b               _current_average:
7047  001b 0000          	ds.b	2
7048                     	xdef	_current_average
7049  001d               _current_offset:
7050  001d 00            	ds.b	1
7051                     	xdef	_current_offset
7052  001e               _AD_ValueL:
7053  001e 00            	ds.b	1
7054                     	xdef	_AD_ValueL
7055  001f               _AD_ValueH:
7056  001f 0000          	ds.b	2
7057                     	xdef	_AD_ValueH
7058                     	xref.b	_onekey
7059                     	xref.b	_motor_flag
7060  0021               _user_Prdata:
7061  0021 000000000000  	ds.b	7
7062                     	xdef	_user_Prdata
7063                     	xref.b	_sys_state_flag
7064                     	xref.b	_error_bank
7065                     	xref	_hand_enable_flag
7066                     	xref	_limit_current_speed
7067                     	xref	_dang_limit_pwm
7068                     	xref	_data_rx
7069                     	switch	.bss
7070  0079               _sp_ph_current_limit_90p:
7071  0079 00            	ds.b	1
7072                     	xdef	_sp_ph_current_limit_90p
7073  007a               _sp_ph_current_limit_80p:
7074  007a 00            	ds.b	1
7075                     	xdef	_sp_ph_current_limit_80p
7076  007b               _sp_ph_current_limit_70p:
7077  007b 00            	ds.b	1
7078                     	xdef	_sp_ph_current_limit_70p
7079  007c               _sp_ph_current_limit_60p:
7080  007c 00            	ds.b	1
7081                     	xdef	_sp_ph_current_limit_60p
7082  007d               _sp_ph_current_limit_50p:
7083  007d 00            	ds.b	1
7084                     	xdef	_sp_ph_current_limit_50p
7085  007e               _sp_ph_current_limit_40p:
7086  007e 00            	ds.b	1
7087                     	xdef	_sp_ph_current_limit_40p
7088  007f               _sp_ph_current_limit_30p:
7089  007f 00            	ds.b	1
7090                     	xdef	_sp_ph_current_limit_30p
7091  0080               _sp_ph_current_limit_20p:
7092  0080 00            	ds.b	1
7093                     	xdef	_sp_ph_current_limit_20p
7094  0081               _sp_ph_current_limit_10p:
7095  0081 00            	ds.b	1
7096                     	xdef	_sp_ph_current_limit_10p
7097  0082               _sp_ph_current_limit_max:
7098  0082 00            	ds.b	1
7099                     	xdef	_sp_ph_current_limit_max
7100  0083               _voltage_count:
7101  0083 00            	ds.b	1
7102                     	xdef	_voltage_count
7103  0084               _current_3a:
7104  0084 00            	ds.b	1
7105                     	xdef	_current_3a
7106  0085               _cvt_add:
7107  0085 00            	ds.b	1
7108                     	xdef	_cvt_add
7109  0086               _cvt_torlance_current:
7110  0086 00            	ds.b	1
7111                     	xdef	_cvt_torlance_current
7112  0087               _voltage_average_L1:
7113  0087 0000          	ds.b	2
7114                     	xdef	_voltage_average_L1
7115  0089               _voltage2:
7116  0089 0000          	ds.b	2
7117                     	xdef	_voltage2
7118  008b               _voltage1:
7119  008b 0000          	ds.b	2
7120                     	xdef	_voltage1
7121  008d               _voltage_average_L:
7122  008d 0000          	ds.b	2
7123                     	xdef	_voltage_average_L
7124  008f               _motor_current_limit_flag:
7125  008f 00            	ds.b	1
7126                     	xdef	_motor_current_limit_flag
7127                     	xref	_square_sine_change_flag
7128  0090               _current_adj_fifteen:
7129  0090 0000          	ds.b	2
7130                     	xdef	_current_adj_fifteen
7131  0092               _power_low42:
7132  0092 00            	ds.b	1
7133                     	xdef	_power_low42
7134  0093               _power_low45:
7135  0093 00            	ds.b	1
7136                     	xdef	_power_low45
7137                     	switch	.ubsct
7138  0028               _short_count:
7139  0028 00            	ds.b	1
7140                     	xdef	_short_count
7141                     	switch	.bss
7142  0094               _current_adj_battry:
7143  0094 00            	ds.b	1
7144                     	xdef	_current_adj_battry
7145                     	switch	.ubsct
7146  0029               _current_adj_III:
7147  0029 00            	ds.b	1
7148                     	xdef	_current_adj_III
7149  002a               _current_adj_II:
7150  002a 00            	ds.b	1
7151                     	xdef	_current_adj_II
7152  002b               _current_adj_I:
7153  002b 00            	ds.b	1
7154                     	xdef	_current_adj_I
7155                     	xref	_motor_alm_status_lock
7156                     	switch	.bss
7157  0095               _current_adj_10a:
7158  0095 00            	ds.b	1
7159                     	xdef	_current_adj_10a
7160  0096               _current_adj_18a:
7161  0096 00            	ds.b	1
7162                     	xdef	_current_adj_18a
7163  0097               _pwm_duty_on_ini:
7164  0097 0000          	ds.b	2
7165                     	xdef	_pwm_duty_on_ini
7166  0099               _current_s2:
7167  0099 00            	ds.b	1
7168                     	xdef	_current_s2
7169  009a               _current_s1:
7170  009a 00            	ds.b	1
7171                     	xdef	_current_s1
7172  009b               _current_s:
7173  009b 00            	ds.b	1
7174                     	xdef	_current_s
7175  009c               _current_high_flag:
7176  009c 00            	ds.b	1
7177                     	xdef	_current_high_flag
7178                     	switch	.ubsct
7179  002c               _current_average1:
7180  002c 00            	ds.b	1
7181                     	xdef	_current_average1
7182                     	xdef	_temperature_average
7183                     	switch	.bss
7184  009d               _test_current_cmd_protect_average:
7185  009d 0000          	ds.b	2
7186                     	xdef	_test_current_cmd_protect_average
7187  009f               _test_control_temp:
7188  009f 0000          	ds.b	2
7189                     	xdef	_test_control_temp
7190                     	switch	.ubsct
7191  002d               _current_v:
7192  002d 00            	ds.b	1
7193                     	xdef	_current_v
7194                     	xref.b	_current_cmd_average_key
7195  002e               _current_cmd_average1:
7196  002e 0000          	ds.b	2
7197                     	xdef	_current_cmd_average1
7198  0030               _control_temp:
7199  0030 0000          	ds.b	2
7200                     	xdef	_control_temp
7201  0032               _sys_start_time:
7202  0032 00            	ds.b	1
7203                     	xdef	_sys_start_time
7204                     	switch	.bss
7205  00a1               _flash_count:
7206  00a1 00            	ds.b	1
7207                     	xdef	_flash_count
7208                     	xref	_sleep_count
7209  00a2               _c_offset:
7210  00a2 00            	ds.b	1
7211                     	xdef	_c_offset
7212  00a3               _current_adj_table_add:
7213  00a3 000000000000  	ds.b	8
7214                     	xdef	_current_adj_table_add
7215                     	xref	_ph_low_count_max_back
7216                     	xref.b	_alarm_switch
7217                     	switch	.ubsct
7218  0033               _delvoltage:
7219  0033 0000          	ds.b	2
7220                     	xdef	_delvoltage
7221                     	switch	.bss
7222  00ab               _ph_current_adj_table:
7223  00ab 000000000000  	ds.b	8
7224                     	xdef	_ph_current_adj_table
7225  00b3               _low_current_cmd_protect:
7226  00b3 0000          	ds.b	2
7227                     	xdef	_low_current_cmd_protect
7228  00b5               _current_adj_table:
7229  00b5 000000000000  	ds.b	16
7230                     	xdef	_current_adj_table
7231  00c5               _current_adj_lowp:
7232  00c5 0000          	ds.b	2
7233                     	xdef	_current_adj_lowp
7234  00c7               _voltage_adj_table54:
7235  00c7 0000          	ds.b	2
7236                     	xdef	_voltage_adj_table54
7237  00c9               _voltage_adj_table42:
7238  00c9 0000          	ds.b	2
7239                     	xdef	_voltage_adj_table42
7240  00cb               _voltage_adj_table45:
7241  00cb 0000          	ds.b	2
7242                     	xdef	_voltage_adj_table45
7243  00cd               _voltage_adj_table46:
7244  00cd 0000          	ds.b	2
7245                     	xdef	_voltage_adj_table46
7246  00cf               _voltage_adj_table47:
7247  00cf 0000          	ds.b	2
7248                     	xdef	_voltage_adj_table47
7249  00d1               _voltage_adj_table48:
7250  00d1 0000          	ds.b	2
7251                     	xdef	_voltage_adj_table48
7252                     	xref	_delay_counter
7253  00d3               _voltage_adj_table49:
7254  00d3 0000          	ds.b	2
7255                     	xdef	_voltage_adj_table49
7256                     	xref.b	_ModeFlag
7257                     	xref.b	_hall_drive_back
7258  00d5               _voltage_adj_table:
7259  00d5 000000000000  	ds.b	8
7260                     	xdef	_voltage_adj_table
7261                     	xref.b	_pwm_cut_count
7262                     	xref.b	_pwm_add_count
7263                     	xref.b	_pwm_sub_count
7264  00dd               _current_limit_pwm_flag:
7265  00dd 00            	ds.b	1
7266                     	xdef	_current_limit_pwm_flag
7267  00de               _current_adj_12:
7268  00de 00            	ds.b	1
7269                     	xdef	_current_adj_12
7270                     	switch	.ubsct
7271  0035               _current_speed:
7272  0035 00            	ds.b	1
7273                     	xdef	_current_speed
7274                     	xref.b	_ph_low_count_max
7275                     	xref.b	_hall_ok_count
7276  0036               _speed_ok_count:
7277  0036 00            	ds.b	1
7278                     	xdef	_speed_ok_count
7279  0037               _speed_dn_count:
7280  0037 00            	ds.b	1
7281                     	xdef	_speed_dn_count
7282  0038               _ph_low_count:
7283  0038 00            	ds.b	1
7284                     	xdef	_ph_low_count
7285                     	xref.b	_Restart_cont
7286  0039               _current_cmd_protect_average1:
7287  0039 0000          	ds.b	2
7288                     	xdef	_current_cmd_protect_average1
7289  003b               _current_cmd_protect_average_dang:
7290  003b 0000          	ds.b	2
7291                     	xdef	_current_cmd_protect_average_dang
7292  003d               _current_cmd_protect_average:
7293  003d 0000          	ds.b	2
7294                     	xdef	_current_cmd_protect_average
7295  003f               _voltage_average_H:
7296  003f 0000          	ds.b	2
7297                     	xdef	_voltage_average_H
7298  0041               _ph_current_average:
7299  0041 00            	ds.b	1
7300                     	xdef	_ph_current_average
7301  0042               _current_max_low_step:
7302  0042 00            	ds.b	1
7303                     	xdef	_current_max_low_step
7304  0043               _current_zero_count:
7305  0043 00            	ds.b	1
7306                     	xdef	_current_zero_count
7307  0044               _start_current:
7308  0044 00            	ds.b	1
7309                     	xdef	_start_current
7310  0045               _step_current:
7311  0045 0000          	ds.b	2
7312                     	xdef	_step_current
7313                     	xref.b	_hall_count
7314  0047               _voltage_average:
7315  0047 0000          	ds.b	2
7316                     	xdef	_voltage_average
7317                     	xref.b	_motor_stop_count2
7318                     	xref.b	_debug_mode_flag
7319                     	xref.b	_mode_flag
7320                     	xref.b	_motor_stop_count
7321                     	xref.b	_position_flag
7322  0049               _sc_current_count:
7323  0049 00            	ds.b	1
7324                     	xdef	_sc_current_count
7325  004a               _ph_lost_count:
7326  004a 00            	ds.b	1
7327                     	xdef	_ph_lost_count
7328  004b               _run_flag:
7329  004b 00            	ds.b	1
7330                     	xdef	_run_flag
7331                     	xref.b	_speed_motor2
7332                     	xref.b	_speed_motor
7333                     	xref.b	_pwm_brake_max
7334                     	xref.b	_pwm_duty_brake
7335                     	xref.b	_pwm_duty_on1
7336                     	xref.b	_pwm_duty_on
7337                     	xref.b	_pwm_duty_on_old
7338  004c               _sc_ref:
7339  004c 0000          	ds.b	2
7340                     	xdef	_sc_ref
7341                     	xref.b	_current_cmd_average
7342  004e               _ph_current_average1:
7343  004e 0000          	ds.b	2
7344                     	xdef	_ph_current_average1
7345  0050               _AD_Value:
7346  0050 0000          	ds.b	2
7347                     	xdef	_AD_Value
7348  0052               _sp_zero_count:
7349  0052 00            	ds.b	1
7350                     	xdef	_sp_zero_count
7351                     	xdef	_sc_count
7352                     	xref.b	_sys_step
7353  0053               _current_temp:
7354  0053 00            	ds.b	1
7355                     	xdef	_current_temp
7356  0054               _current_max:
7357  0054 00            	ds.b	1
7358                     	xdef	_current_max
7359                     	xref	_brk_error_flag
7360                     	xref	_run_mode
7361                     	switch	.bss
7362  00df               _current_lj:
7363  00df 0000          	ds.b	2
7364                     	xdef	_current_lj
7365  00e1               _control_lj_temp_old_delta:
7366  00e1 0000          	ds.b	2
7367                     	xdef	_control_lj_temp_old_delta
7368  00e3               _lj_ad_app:
7369  00e3 0000          	ds.b	2
7370                     	xdef	_lj_ad_app
7371  00e5               _lj_zero_auto_corrent_count:
7372  00e5 0000          	ds.b	2
7373                     	xdef	_lj_zero_auto_corrent_count
7374                     	xref	_start_2s_count
7375  00e7               _current_ph_lj_time:
7376  00e7 0000          	ds.b	2
7377                     	xdef	_current_ph_lj_time
7378  00e9               _current_ph_lj_delta:
7379  00e9 0000          	ds.b	2
7380                     	xdef	_current_ph_lj_delta
7381  00eb               _current_ph_lj_old:
7382  00eb 00000000      	ds.b	4
7383                     	xdef	_current_ph_lj_old
7384  00ef               _current_ph_lj:
7385  00ef 00000000      	ds.b	4
7386                     	xdef	_current_ph_lj
7387  00f3               _control_lj_zero_table:
7388  00f3 00000000      	ds.b	4
7389                     	xdef	_control_lj_zero_table
7390  00f7               _control_lj_temp_table:
7391  00f7 00000000      	ds.b	4
7392                     	xdef	_control_lj_temp_table
7393                     	xdef	_current_num
7394                     	xdef	_ad_data
7395                     	xref	_brake_pwm_duty
7396                     	xdef	_motor_abs
7397                     	xdef	_motor_dirve2
7398                     	xdef	_motor_stop
7399                     	xdef	_adc_sampel_ph
7400                     	xdef	_adc_sample
7401                     	xdef	_adc_channel
7402                     	xdef	_AD_INI
7403                     	xref.b	c_x
7423                     	xref	c_sdivx
7424                     	xref	c_lcmp
7425                     	xref	c_uitolx
7426                     	end
