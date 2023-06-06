   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2777                     	bsct
2778  0000               _sys_step:
2779  0000 00            	dc.b	0
2823                     ; 17 main()
2823                     ; 18 {
2825                     	switch	.text
2826  0000               _main:
2828  0000 89            	pushw	x
2829       00000002      OFST:	set	2
2832                     ; 19  	DI();
2835  0001 9b            	sim	
2837                     ; 20 	WDT_INI();	
2839  0002 cd0159        	call	_WDT_INI
2841                     ; 21 	RAM_INI();
2843  0005 cd02bb        	call	_RAM_INI
2845                     ; 22 	OPTIONSET_INI();	
2847  0008 cd0000        	call	_OPTIONSET_INI
2849                     ; 23 	OSC_INI();
2851  000b cd009d        	call	_OSC_INI
2853                     ; 24 	IO_INI();
2855  000e cd00d4        	call	_IO_INI
2857                     ; 25 	TM1_INI();
2859  0011 cd0178        	call	_TM1_INI
2861                     ; 26 	TM2_INI();
2863  0014 cd0266        	call	_TM2_INI
2865                     ; 27 	AD_INI();
2867  0017 cd0000        	call	_AD_INI
2869                     ; 29 	EI();
2872  001a 9a            	rim	
2874                     ; 30 	Init_UART2();
2876  001b cd071a        	call	_Init_UART2
2878                     ; 31 	data_load();
2880  001e ad3a          	call	_data_load
2882                     ; 33 	current_s = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 5);
2884  0020 be02          	ldw	x,_user_Prdata+2
2885  0022 54            	srlw	x
2886  0023 54            	srlw	x
2887  0024 54            	srlw	x
2888  0025 54            	srlw	x
2889  0026 54            	srlw	x
2890  0027 1f01          	ldw	(OFST-1,sp),x
2892  0029 be02          	ldw	x,_user_Prdata+2
2893  002b 54            	srlw	x
2894  002c 72fb01        	addw	x,(OFST-1,sp)
2895  002f 01            	rrwa	x,a
2896  0030 c70000        	ld	_current_s,a
2897  0033 02            	rlwa	x,a
2898                     ; 34 	current_s1 = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 3);
2900  0034 be02          	ldw	x,_user_Prdata+2
2901  0036 54            	srlw	x
2902  0037 54            	srlw	x
2903  0038 54            	srlw	x
2904  0039 1f01          	ldw	(OFST-1,sp),x
2906  003b be02          	ldw	x,_user_Prdata+2
2907  003d 54            	srlw	x
2908  003e 72fb01        	addw	x,(OFST-1,sp)
2909  0041 01            	rrwa	x,a
2910  0042 c70000        	ld	_current_s1,a
2911  0045 02            	rlwa	x,a
2912                     ; 35 	current_s2 = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 2);
2914  0046 be02          	ldw	x,_user_Prdata+2
2915  0048 54            	srlw	x
2916  0049 54            	srlw	x
2917  004a 1f01          	ldw	(OFST-1,sp),x
2919  004c be02          	ldw	x,_user_Prdata+2
2920  004e 54            	srlw	x
2921  004f 72fb01        	addw	x,(OFST-1,sp)
2922  0052 01            	rrwa	x,a
2923  0053 c70000        	ld	_current_s2,a
2924  0056               L5771:
2925                     ; 39 		_asm("nop");
2928  0056 9d            	nop	
2930                     ; 49 		_asm("nop");
2933  0057 9d            	nop	
2936  0058 20fc          	jra	L5771
2975                     ; 53 void data_load(void)
2975                     ; 54 {
2976                     	switch	.text
2977  005a               _data_load:
2981                     ; 55 	voltage_count = 10;
2983  005a 350a0000      	mov	_voltage_count,#10
2984                     ; 56 	voltage1 = user_Prdata.byte.voltage_adj;
2986  005e be00          	ldw	x,_user_Prdata
2987  0060 cf0000        	ldw	_voltage1,x
2988                     ; 57 	voltage2 = voltage1; 
2990  0063 cf0000        	ldw	_voltage2,x
2991                     ; 58 	send_data_flag = 0;
2993  0066 725f0000      	clr	_send_data_flag
2994                     ; 59 	current_cmd_protect_average= 280; 
2996  006a ae0118        	ldw	x,#280
2997  006d bf00          	ldw	_current_cmd_protect_average,x
2998                     ; 60 	speed_bike = 0;
3000  006f 5f            	clrw	x
3001  0070 cf0000        	ldw	_speed_bike,x
3002                     ; 61 	hand_no_speed_limit = 0;
3004  0073 725f0000      	clr	_hand_no_speed_limit
3005                     ; 63 	limit_speed_hall_1 = 135;//20
3007  0077 ae0087        	ldw	x,#135
3008  007a cf0000        	ldw	_limit_speed_hall_1,x
3009                     ; 64 	speed_bike_load_count = 0;
3011  007d 725f0000      	clr	_speed_bike_load_count
3012                     ; 68 	start_2s_count = 10;
3014  0081 ae000a        	ldw	x,#10
3015  0084 cf0000        	ldw	_start_2s_count,x
3016                     ; 69 	bike_rpm = 1;
3018  0087 ae0001        	ldw	x,#1
3019  008a cf0000        	ldw	_bike_rpm,x
3020                     ; 70 	zero_add_torque = 30;
3022  008d 351e0000      	mov	_zero_add_torque,#30
3023                     ; 71 	lj_change_time_count = 0;
3025  0091 5f            	clrw	x
3026  0092 cf0000        	ldw	_lj_change_time_count,x
3027                     ; 72 	lj_ad_app_change = 0;
3029  0095 cf0000        	ldw	_lj_ad_app_change,x
3030                     ; 73 	max_speed_limit = 32;
3032  0098 35200000      	mov	_max_speed_limit,#32
3033                     ; 74 }
3036  009c 81            	ret	
3068                     ; 76 void OSC_INI(void)
3068                     ; 77 {		//int osc 16mhz
3069                     	switch	.text
3070  009d               _OSC_INI:
3074                     ; 78 	CLK_CKDIVR = 0x00;			//FMAST = 16MHZ,FCPU = 16MHZ
3076  009d 725f50c6      	clr	_CLK_CKDIVR
3077                     ; 80 	CLK_ICKR |= 0x01;			//使能LRC HRC//16mhz内部时钟
3079  00a1 721050c0      	bset	_CLK_ICKR,#0
3080                     ; 81 	CLK_ICKR &= 0xF7;
3082  00a5 721750c0      	bres	_CLK_ICKR,#3
3084  00a9               L3202:
3085                     ; 83 	while((CLK_ICKR & 0xFD) == 0);//等待 HRC RADY
3087  00a9 c650c0        	ld	a,_CLK_ICKR
3088  00ac a5fd          	bcp	a,#253
3089  00ae 27f9          	jreq	L3202
3090                     ; 85 	if(CLK_CMSR != HSI)
3092  00b0 c650c3        	ld	a,_CLK_CMSR
3093  00b3 a1e1          	cp	a,#225
3094  00b5 2704          	jreq	L7202
3095                     ; 86 		CLK_SWR = HSI;			//使用内部高速时钟，默认状态
3097  00b7 35e150c4      	mov	_CLK_SWR,#225
3098  00bb               L7202:
3099                     ; 88 	CLK_SWCR |= 0x02;
3101  00bb 721250c5      	bset	_CLK_SWCR,#1
3102                     ; 90 	CLK_PCKENR2 = 0x00;			//关闭外设时钟
3104  00bf 725f50ca      	clr	_CLK_PCKENR2
3105                     ; 91 	CLK_PCKENR1 = 0x08;			//关闭外设时钟	//uart 
3107  00c3 350850c7      	mov	_CLK_PCKENR1,#8
3108                     ; 94 	CLK_CKDIVR = 0x00;			//16mhz内部时钟
3110  00c7 725f50c6      	clr	_CLK_CKDIVR
3111                     ; 95 	CLK_SWIMCCR = 0x00;			//SWIM _CLK 
3113  00cb 725f50cd      	clr	_CLK_SWIMCCR
3114                     ; 97 	CLK_CSSR |= 0x01;			//启动时钟安全系统	
3116  00cf 721050c8      	bset	_CLK_CSSR,#0
3117                     ; 98 }
3120  00d3 81            	ret	
3167                     ; 101 void IO_INI(void)
3167                     ; 102 {
3168                     	switch	.text
3169  00d4               _IO_INI:
3173                     ; 104 	PA_ODR |= 0x00;			//0~7	
3175  00d4 c65000        	ld	a,_PA_ODR
3176                     ; 105 	PA_DDR |= 0x20;			//输入口
3178  00d7 721a5002      	bset	_PA_DDR,#5
3179                     ; 106 	PA_CR1 |= 0xFF;			//启用内部上啦
3181  00db c65003        	ld	a,_PA_CR1
3182  00de aaff          	or	a,#255
3183  00e0 c75003        	ld	_PA_CR1,a
3184                     ; 107 	PA_CR2 |= 0x20;			//输入模式是禁止外部中断，
3186  00e3 721a5004      	bset	_PA_CR2,#5
3187                     ; 109 	PB_ODR |= 0x00;//0x07;//0x00;//	//0X00		//0~7		/PWM下桥
3189  00e7 c65005        	ld	a,_PB_ODR
3190                     ; 110 	PB_DDR |= 0x07;			//
3192  00ea c65007        	ld	a,_PB_DDR
3193  00ed aa07          	or	a,#7
3194  00ef c75007        	ld	_PB_DDR,a
3195                     ; 111 	PB_CR1 |= 0x0F;			//
3197  00f2 c65008        	ld	a,_PB_CR1
3198  00f5 aa0f          	or	a,#15
3199  00f7 c75008        	ld	_PB_CR1,a
3200                     ; 112 	PB_CR2 |= 0x0F;			//
3202  00fa c65009        	ld	a,_PB_CR2
3203  00fd aa0f          	or	a,#15
3204  00ff c75009        	ld	_PB_CR2,a
3205                     ; 114 	PC_ODR |= 0x00;			//0~7		/PWM上桥
3207  0102 c6500a        	ld	a,_PC_ODR
3208                     ; 115 	PC_DDR |= 0x1E;			//
3210  0105 c6500c        	ld	a,_PC_DDR
3211  0108 aa1e          	or	a,#30
3212  010a c7500c        	ld	_PC_DDR,a
3213                     ; 116 	PC_CR1 |= 0xFF;			//
3215  010d c6500d        	ld	a,_PC_CR1
3216  0110 aaff          	or	a,#255
3217  0112 c7500d        	ld	_PC_CR1,a
3218                     ; 117 	PC_CR2 |= 0x1E;			//	
3220  0115 c6500e        	ld	a,_PC_CR2
3221  0118 aa1e          	or	a,#30
3222  011a c7500e        	ld	_PC_CR2,a
3223                     ; 119 	PD_ODR |= 0x00;			//0~7	
3225  011d c6500f        	ld	a,_PD_ODR
3226                     ; 120 	PD_DDR |= 0x21;			//
3228  0120 c65011        	ld	a,_PD_DDR
3229  0123 aa21          	or	a,#33
3230  0125 c75011        	ld	_PD_DDR,a
3231                     ; 121 	PD_CR1 |= 0xFF;			//
3233  0128 c65012        	ld	a,_PD_CR1
3234  012b aaff          	or	a,#255
3235  012d c75012        	ld	_PD_CR1,a
3236                     ; 122 	PD_CR2 |= 0x00;			//	
3238  0130 c65013        	ld	a,_PD_CR2
3239                     ; 124 	PE_ODR |= 0x00;			//0~7	
3241  0133 c65014        	ld	a,_PE_ODR
3242                     ; 125 	PE_DDR |= 0x40;			//
3244  0136 721c5016      	bset	_PE_DDR,#6
3245                     ; 126 	PE_CR1 |= 0xFF;			//
3247  013a c65017        	ld	a,_PE_CR1
3248  013d aaff          	or	a,#255
3249  013f c75017        	ld	_PE_CR1,a
3250                     ; 127 	PE_CR2 |= 0x00;			//		
3252  0142 c65018        	ld	a,_PE_CR2
3253                     ; 129 	PG_ODR |= 0x00;			//0~7	
3255  0145 c6501e        	ld	a,_PG_ODR
3256                     ; 130 	PG_DDR |= 0x01;			//
3258  0148 72105020      	bset	_PG_DDR,#0
3259                     ; 131 	PG_CR1 |= 0xFF;			//
3261  014c c65021        	ld	a,_PG_CR1
3262  014f aaff          	or	a,#255
3263  0151 c75021        	ld	_PG_CR1,a
3264                     ; 132 	PG_CR2 |= 0x01;			//
3266  0154 72105022      	bset	_PG_CR2,#0
3267                     ; 134 }
3270  0158 81            	ret	
3296                     ; 139 void WDT_INI(void)
3296                     ; 140 {
3297                     	switch	.text
3298  0159               _WDT_INI:
3302                     ; 141 	IWDG_KR = 0x55;		//开锁
3304  0159 355550e0      	mov	_IWDG_KR,#85
3305                     ; 142 	IWDG_PR = 0x03;		//看门狗分频  64K/32 =  2K = 500US    4,8,16,32,64,128,256,
3307  015d 350350e1      	mov	_IWDG_PR,#3
3308                     ; 143 	IWDG_RLR = 20;		//20*500us = 10ms
3310  0161 351450e2      	mov	_IWDG_RLR,#20
3311                     ; 144 	IWDG_KR = 0xAA;		//上锁
3313  0165 35aa50e0      	mov	_IWDG_KR,#170
3314                     ; 145 	IWDG_KR = 0xCC;		//启动看门狗
3316  0169 35cc50e0      	mov	_IWDG_KR,#204
3317                     ; 146 }
3320  016d 81            	ret	
3344                     ; 150 void SPI_ini(void)
3344                     ; 151 {
3345                     	switch	.text
3346  016e               _SPI_ini:
3350                     ; 152 	CLK_PCKENR1 |= 0x02;				//使能SPI时钟
3352  016e 721250c7      	bset	_CLK_PCKENR1,#1
3353                     ; 158 }
3356  0172 81            	ret	
3380                     ; 161 void sci_ini(void)
3380                     ; 162 {
3381                     	switch	.text
3382  0173               _sci_ini:
3386                     ; 163 	CLK_PCKENR1 |= 0x04;			//使能uart时钟
3388  0173 721450c7      	bset	_CLK_PCKENR1,#2
3389                     ; 171 }
3392  0177 81            	ret	
3443                     ; 178 void TM1_INI(void)
3443                     ; 179 {
3444                     	switch	.text
3445  0178               _TM1_INI:
3449                     ; 180 	CLK_PCKENR1 |= 0x80;		//使能TIM1时钟
3451  0178 721e50c7      	bset	_CLK_PCKENR1,#7
3452                     ; 182 	TIM1_OISR = 0x00;				//
3454  017c 725f526f      	clr	_TIM1_OISR
3455                     ; 183 	TIM1_PSCRH  = 0x00;   
3457  0180 725f5260      	clr	_TIM1_PSCRH
3458                     ; 184 	TIM1_PSCRL  = 0x01;   
3460  0184 35015261      	mov	_TIM1_PSCRL,#1
3461                     ; 186 	TIM1_ARRH   = 0x01;   
3463  0188 35015262      	mov	_TIM1_ARRH,#1
3464                     ; 187 	TIM1_ARRL   = 0x00;
3466  018c 725f5263      	clr	_TIM1_ARRL
3467                     ; 188 	TIM1_RCR    = 0x01;   		//03 8k   01 16k
3469  0190 35015264      	mov	_TIM1_RCR,#1
3470                     ; 190 	TIM1_CCR1H = (u8)(500 >> 8);
3472  0194 35015265      	mov	_TIM1_CCR1H,#1
3473                     ; 191 	TIM1_CCR1L = (u8)500;
3475  0198 35f45266      	mov	_TIM1_CCR1L,#244
3476                     ; 193 	TIM1_CCR2H = (u8)(500 >> 8);
3478  019c 35015267      	mov	_TIM1_CCR2H,#1
3479                     ; 194 	TIM1_CCR2L = (u8)500;
3481  01a0 35f45268      	mov	_TIM1_CCR2L,#244
3482                     ; 196 	TIM1_CCR3H = (u8)(500 >> 8);
3484  01a4 35015269      	mov	_TIM1_CCR3H,#1
3485                     ; 197 	TIM1_CCR3L = (u8)500;
3487  01a8 35f4526a      	mov	_TIM1_CCR3L,#244
3488                     ; 199 	TIM1_CCR4H  = 0x00;
3490  01ac 725f526b      	clr	_TIM1_CCR4H
3491                     ; 200 	TIM1_CCR4L  = 0x00;
3493  01b0 725f526c      	clr	_TIM1_CCR4L
3494                     ; 202 	SVPWM_PH();
3496  01b4 35685258      	mov	_TIM1_CCMR1,#104
3499  01b8 35685259      	mov	_TIM1_CCMR2,#104
3502  01bc 3568525a      	mov	_TIM1_CCMR3,#104
3505  01c0 3555525c      	mov	_TIM1_CCER1,#85
3508  01c4 3555525d      	mov	_TIM1_CCER2,#85
3509                     ; 203 	TIM1_EGR |= 0x20;					//刷新PWM	
3513  01c8 721a5257      	bset	_TIM1_EGR,#5
3514                     ; 205 	TIM1_IER    = 0x81;   				//启动break and updata IE	
3516  01cc 35815254      	mov	_TIM1_IER,#129
3517                     ; 210 		TIM1_DTR = 0x58;//39;						//8*FTIM = 1us 死区时间
3519  01d0 3558526e      	mov	_TIM1_DTR,#88
3520                     ; 213 	TIM1_CR2   = 0x21;					//更新事件被选为触发输入
3522  01d4 35215251      	mov	_TIM1_CR2,#33
3523                     ; 215 	TIM1_BKR    = 0x92; 				//b2
3525  01d8 3592526d      	mov	_TIM1_BKR,#146
3526                     ; 217 	TIM1_CR1    = 0xA5; 				//中间对齐模式，向下计数时触发中断。
3528  01dc 35a55250      	mov	_TIM1_CR1,#165
3529                     ; 218 	TIM1_CCER2 = ((TIM1_CCER2 & 0x1f) | 0x10);
3531  01e0 c6525d        	ld	a,_TIM1_CCER2
3532  01e3 a41f          	and	a,#31
3533  01e5 aa10          	or	a,#16
3534  01e7 c7525d        	ld	_TIM1_CCER2,a
3535                     ; 219 	TIM1_CCMR4 = PWM_MODE1;
3537  01ea 3568525b      	mov	_TIM1_CCMR4,#104
3538                     ; 220 	PWM_ALL_OFF();
3540  01ee cd0000        	call	_PWM_ALL_OFF
3542                     ; 221 	TIM1_EGR   |= 0x01;
3544  01f1 72105257      	bset	_TIM1_EGR,#0
3545                     ; 222 }
3548  01f5 81            	ret	
3599                     ; 224 void NOHALL_TIM1(void)
3599                     ; 225 {
3600                     	switch	.text
3601  01f6               _NOHALL_TIM1:
3605                     ; 226 	CLK_PCKENR1 |= 0x80;		//使能TIM1时钟
3607  01f6 721e50c7      	bset	_CLK_PCKENR1,#7
3608                     ; 227 	TIM1_OISR = 0x00;				//
3610  01fa 725f526f      	clr	_TIM1_OISR
3611                     ; 228 	TIM1_PSCRH  = 0x00;   
3613  01fe 725f5260      	clr	_TIM1_PSCRH
3614                     ; 229 	TIM1_PSCRL  = 0x01;   
3616  0202 35015261      	mov	_TIM1_PSCRL,#1
3617                     ; 230 	TIM1_ARRH   = 0x01; 
3619  0206 35015262      	mov	_TIM1_ARRH,#1
3620                     ; 231 	TIM1_ARRL   = 0x00;
3622  020a 725f5263      	clr	_TIM1_ARRL
3623                     ; 232 	TIM1_RCR    = 0x01;   		//03 8k   01 16k 
3625  020e 35015264      	mov	_TIM1_RCR,#1
3626                     ; 233 	TIM1_CCMR1 = PWM_HOLD_OFF;   
3628  0212 35485258      	mov	_TIM1_CCMR1,#72
3629                     ; 234 	TIM1_CCMR2 = PWM_HOLD_OFF;   
3631  0216 35485259      	mov	_TIM1_CCMR2,#72
3632                     ; 235 	TIM1_CCMR3 = PWM_HOLD_OFF; 
3634  021a 3548525a      	mov	_TIM1_CCMR3,#72
3635                     ; 236 	TIM1_CCMR4 = PWM_HOLD_OFF;		
3637  021e 3548525b      	mov	_TIM1_CCMR4,#72
3638                     ; 237 	TIM1_CCER1 = PWM_ALLON; 			
3640  0222 3511525c      	mov	_TIM1_CCER1,#17
3641                     ; 238 	TIM1_CCER2 = (PWM_ALLON) & 0xff;			
3643  0226 3511525d      	mov	_TIM1_CCER2,#17
3644                     ; 239 	TIM1_CCR1H  = 0x00;    
3646  022a 725f5265      	clr	_TIM1_CCR1H
3647                     ; 240 	TIM1_CCR1L  = 0x00;
3649  022e 725f5266      	clr	_TIM1_CCR1L
3650                     ; 241 	TIM1_CCR2H  = 0x00;   
3652  0232 725f5267      	clr	_TIM1_CCR2H
3653                     ; 242 	TIM1_CCR2L  = 0x00;
3655  0236 725f5268      	clr	_TIM1_CCR2L
3656                     ; 243 	TIM1_CCR3H  = 0x00;   
3658  023a 725f5269      	clr	_TIM1_CCR3H
3659                     ; 244 	TIM1_CCR3L  = 0x00;
3661  023e 725f526a      	clr	_TIM1_CCR3L
3662                     ; 245 	TIM1_CCR4H  = 0x00;
3664  0242 725f526b      	clr	_TIM1_CCR4H
3665                     ; 246 	TIM1_CCR4L  = 0x00;
3667  0246 725f526c      	clr	_TIM1_CCR4L
3668                     ; 247 	TIM1_IER    = 0x81;   				//启动break and updata IE	
3670  024a 35815254      	mov	_TIM1_IER,#129
3671                     ; 248 	TIM1_DTR = 0;
3673  024e 725f526e      	clr	_TIM1_DTR
3674                     ; 249 	TIM1_CR2   = 0x21;					//更新事件被选为触发输入
3676  0252 35215251      	mov	_TIM1_CR2,#33
3677                     ; 250 	TIM1_BKR    = 0x92; 				//b2
3679  0256 3592526d      	mov	_TIM1_BKR,#146
3680                     ; 251 	TIM1_CR1    = 0xA5; 				//中间对齐模式，向下计数时触发中断。
3682  025a 35a55250      	mov	_TIM1_CR1,#165
3683                     ; 252 	PWM_ALL_OFF();
3685  025e cd0000        	call	_PWM_ALL_OFF
3687                     ; 253 	TIM1_EGR   |= 0x01;
3689  0261 72105257      	bset	_TIM1_EGR,#0
3690                     ; 254 }
3693  0265 81            	ret	
3737                     ; 256 void TM2_INI(void)
3737                     ; 257 {
3738                     	switch	.text
3739  0266               _TM2_INI:
3743                     ; 258 	CLK_PCKENR1 |= 0x20;		//使能TIM2时钟
3745  0266 721a50c7      	bset	_CLK_PCKENR1,#5
3746                     ; 260 	TIM2_CNTRH = 0x00; //TIM2计数器高8位(TIM1_CNTRH)
3748  026a 725f530a      	clr	_TIM2_CNTRH
3749                     ; 261 	TIM2_CNTRL = 0x00;
3751  026e 725f530b      	clr	_TIM2_CNTRL
3752                     ; 263 	TIM2_SR1 &= 0x00;  //状态寄存器1
3754  0272 725f5302      	clr	_TIM2_SR1
3755                     ; 264 	TIM2_SR2 &= 0x00;
3757  0276 725f5303      	clr	_TIM2_SR2
3758                     ; 266 	TIM2_PSCR = 0x08;  //time2两分频   2
3760  027a 3508530c      	mov	_TIM2_PSCR,#8
3761                     ; 268 	TIM2_CCMR1 = 0x01;   
3763  027e 35015305      	mov	_TIM2_CCMR1,#1
3764                     ; 269 	TIM2_CCMR2 = 0x01;   
3766  0282 35015306      	mov	_TIM2_CCMR2,#1
3767                     ; 270 	TIM2_CCMR3 = 0x01; 
3769  0286 35015307      	mov	_TIM2_CCMR3,#1
3770                     ; 272 	TIM2_CCER1 = 0x11; 			
3772  028a 35115308      	mov	_TIM2_CCER1,#17
3773                     ; 273 	TIM2_CCER2 = 0x01;			
3775  028e 35015309      	mov	_TIM2_CCER2,#1
3776                     ; 275 	TIM2_CCR1H  = 0x00;    
3778  0292 725f530f      	clr	_TIM2_CCR1H
3779                     ; 276 	TIM2_CCR1L  = 0x00;
3781  0296 725f5310      	clr	_TIM2_CCR1L
3782                     ; 277 	TIM2_CCR2H  = 0x00;   
3784  029a 725f5311      	clr	_TIM2_CCR2H
3785                     ; 278 	TIM2_CCR2L  = 0x00;
3787  029e 725f5312      	clr	_TIM2_CCR2L
3788                     ; 279 	TIM2_CCR3H  = 0x00;   
3790  02a2 725f5313      	clr	_TIM2_CCR3H
3791                     ; 280 	TIM2_CCR3L  = 0x00;
3793  02a6 725f5314      	clr	_TIM2_CCR3L
3794                     ; 284 	TIM2_CR1    = 0x01; 				//中间对齐模式，向下计数时触发中断。
3796  02aa 35015300      	mov	_TIM2_CR1,#1
3797                     ; 286 	TIM2_ARRH   = 0xEA;   
3799  02ae 35ea530d      	mov	_TIM2_ARRH,#234
3800                     ; 287 	TIM2_ARRL   = 0x60;
3802  02b2 3560530e      	mov	_TIM2_ARRL,#96
3803                     ; 289 	TIM2_EGR   |= 0x01;
3805  02b6 72105304      	bset	_TIM2_EGR,#0
3806                     ; 290 }
3809  02ba 81            	ret	
3899                     ; 293 void RAM_INI(void)
3899                     ; 294 {
3900                     	switch	.text
3901  02bb               _RAM_INI:
3903  02bb 5206          	subw	sp,#6
3904       00000006      OFST:	set	6
3907                     ; 295 	error_bank.all_flag = 0;
3909  02bd 5f            	clrw	x
3910  02be bf00          	ldw	_error_bank,x
3911                     ; 296 	sys_state_flag.all_flag = 0;
3913  02c0 bf00          	ldw	_sys_state_flag,x
3914                     ; 297 	Alarm_Flag.all_flag = 0;
3916  02c2 3f00          	clr	_Alarm_Flag
3917                     ; 298 	sys_state_flag2.bit.chg_mode_cc = 1;
3919  02c4 72180001      	bset	_sys_state_flag2+1,#4
3920                     ; 299 	sys_state_flag2.bit.start_flag = 1;
3922  02c8 72120001      	bset	_sys_state_flag2+1,#1
3923                     ; 302 	pwm_duty_on_old = 0;
3925  02cc bf00          	ldw	_pwm_duty_on_old,x
3926                     ; 303 	pwm_duty_on = 0;
3928  02ce bf00          	ldw	_pwm_duty_on,x
3929                     ; 304 	run_flag = 0;
3931  02d0 3f00          	clr	_run_flag
3932                     ; 305 	sc_current_count = 0;
3934  02d2 3f00          	clr	_sc_current_count
3935                     ; 306 	current_zero_count = 0;
3937  02d4 3f00          	clr	_current_zero_count
3938                     ; 307 	sc_ref = 0;
3940  02d6 bf00          	ldw	_sc_ref,x
3941                     ; 308 	speed_num = 1;
3943  02d8 35010000      	mov	_speed_num,#1
3944                     ; 309 	current_cmd_average = 0;
3946  02dc bf00          	ldw	_current_cmd_average,x
3947                     ; 310 	delay_counter = 0;
3949  02de cf0000        	ldw	_delay_counter,x
3950                     ; 311 	ph_low_count_max = 0;  
3952  02e1 3f00          	clr	_ph_low_count_max
3953                     ; 312 	flash_count = 10;
3955  02e3 350a0000      	mov	_flash_count,#10
3956                     ; 313 	sys_start_time = 0;
3958  02e7 3f00          	clr	_sys_start_time
3959                     ; 314 	uart_dan_mode = 4;
3961  02e9 35040000      	mov	_uart_dan_mode,#4
3962                     ; 315 	Auto_SPT = 0;
3964  02ed 3f00          	clr	_Auto_SPT
3965                     ; 316 	eeprom_read(); 
3967  02ef cd0000        	call	_eeprom_read
3969                     ; 319 	if((user_Prdata.byte.voltage_adj > 700) || (user_Prdata.byte.voltage_adj == 0))
3971  02f2 be00          	ldw	x,_user_Prdata
3972  02f4 a302bd        	cpw	x,#701
3973  02f7 2404          	jruge	L3312
3975  02f9 be00          	ldw	x,_user_Prdata
3976  02fb 2605          	jrne	L1312
3977  02fd               L3312:
3978                     ; 320 		user_Prdata.byte.voltage_adj = 357;//495;//475;//654
3980  02fd ae0165        	ldw	x,#357
3981  0300 bf00          	ldw	_user_Prdata,x
3982  0302               L1312:
3983                     ; 322 	if((user_Prdata.byte.current_adj > 160) || (user_Prdata.byte.current_adj == 0))
3985  0302 be02          	ldw	x,_user_Prdata+2
3986  0304 a300a1        	cpw	x,#161
3987  0307 2404          	jruge	L7312
3989  0309 be02          	ldw	x,_user_Prdata+2
3990  030b 2605          	jrne	L5312
3991  030d               L7312:
3992                     ; 323 		user_Prdata.byte.current_adj = 60;//126;
3994  030d ae003c        	ldw	x,#60
3995  0310 bf02          	ldw	_user_Prdata+2,x
3996  0312               L5312:
3997                     ; 325 	if((user_Prdata.byte.limit_adj > 500) || (user_Prdata.byte.limit_adj == 0))
3999  0312 be05          	ldw	x,_user_Prdata+5
4000  0314 a301f5        	cpw	x,#501
4001  0317 2404          	jruge	L3412
4003  0319 be05          	ldw	x,_user_Prdata+5
4004  031b 2605          	jrne	L1412
4005  031d               L3412:
4006                     ; 326 		user_Prdata.byte.limit_adj = 280;
4008  031d ae0118        	ldw	x,#280
4009  0320 bf05          	ldw	_user_Prdata+5,x
4010  0322               L1412:
4011                     ; 328 	if((user_Prdata.byte.ph_current_adj > 100) || (user_Prdata.byte.ph_current_adj == 0))
4013  0322 b604          	ld	a,_user_Prdata+4
4014  0324 a165          	cp	a,#101
4015  0326 2404          	jruge	L7412
4017  0328 b604          	ld	a,_user_Prdata+4
4018  032a 2604          	jrne	L5412
4019  032c               L7412:
4020                     ; 329 		user_Prdata.byte.ph_current_adj = PH_CURRENT_MAX;
4022  032c 35780004      	mov	_user_Prdata+4,#120
4023  0330               L5412:
4024                     ; 331 	if((cvt_torlance_save > 200)||(cvt_torlance_save == 0))
4026  0330 c60000        	ld	a,_cvt_torlance_save
4027  0333 a1c9          	cp	a,#201
4028  0335 2405          	jruge	L3512
4030  0337 c60000        	ld	a,_cvt_torlance_save
4031  033a 2604          	jrne	L1512
4032  033c               L3512:
4033                     ; 332 		cvt_torlance_save = 60;
4035  033c 353c0000      	mov	_cvt_torlance_save,#60
4036  0340               L1512:
4037                     ; 334 	voltage_adj_table54 = (user_Prdata.byte.voltage_adj * 54)/42;
4039  0340 be00          	ldw	x,_user_Prdata
4040  0342 a636          	ld	a,#54
4041  0344 cd0000        	call	c_bmulx
4043  0347 a62a          	ld	a,#42
4044  0349 62            	div	x,a
4045  034a cf0000        	ldw	_voltage_adj_table54,x
4046                     ; 335 	voltage_adj_table49 = (user_Prdata.byte.voltage_adj * 49)/42;
4048  034d a631          	ld	a,#49
4049  034f be00          	ldw	x,_user_Prdata
4050  0351 cd0000        	call	c_bmulx
4052  0354 a62a          	ld	a,#42
4053  0356 62            	div	x,a
4054  0357 cf0000        	ldw	_voltage_adj_table49,x
4055                     ; 336 	voltage_adj_table48 = (user_Prdata.byte.voltage_adj * 48)/42;
4057  035a be00          	ldw	x,_user_Prdata
4058  035c 58            	sllw	x
4059  035d 72bb0000      	addw	x,_user_Prdata
4060  0361 58            	sllw	x
4061  0362 58            	sllw	x
4062  0363 58            	sllw	x
4063  0364 58            	sllw	x
4065  0365 a62a          	ld	a,#42
4066  0367 62            	div	x,a
4067  0368 cf0000        	ldw	_voltage_adj_table48,x
4068                     ; 337 	voltage_adj_table47 = (user_Prdata.byte.voltage_adj * 47)/42;
4070  036b a62f          	ld	a,#47
4071  036d be00          	ldw	x,_user_Prdata
4072  036f cd0000        	call	c_bmulx
4074  0372 a62a          	ld	a,#42
4075  0374 62            	div	x,a
4076  0375 cf0000        	ldw	_voltage_adj_table47,x
4077                     ; 338 	voltage_adj_table46 = (user_Prdata.byte.voltage_adj * 46)/42;
4079  0378 a62e          	ld	a,#46
4080  037a be00          	ldw	x,_user_Prdata
4081  037c cd0000        	call	c_bmulx
4083  037f a62a          	ld	a,#42
4084  0381 62            	div	x,a
4085  0382 cf0000        	ldw	_voltage_adj_table46,x
4086                     ; 339 	voltage_adj_table45 = (user_Prdata.byte.voltage_adj * 45)/42;
4088  0385 a62d          	ld	a,#45
4089  0387 be00          	ldw	x,_user_Prdata
4090  0389 cd0000        	call	c_bmulx
4092  038c a62a          	ld	a,#42
4093  038e 62            	div	x,a
4094  038f cf0000        	ldw	_voltage_adj_table45,x
4095                     ; 340 	voltage_adj_table42 = (user_Prdata.byte.voltage_adj * 42)/42;
4097  0392 be00          	ldw	x,_user_Prdata
4098  0394 cf0000        	ldw	_voltage_adj_table42,x
4099                     ; 342 	delvoltage = voltage_adj_table47 - user_Prdata.byte.voltage_adj;
4101  0397 ce0000        	ldw	x,_voltage_adj_table47
4102  039a 72b00000      	subw	x,_user_Prdata
4103  039e bf00          	ldw	_delvoltage,x
4104                     ; 346 	low_current_cmd_protect = 500;
4106  03a0 ae01f4        	ldw	x,#500
4107  03a3 cf0000        	ldw	_low_current_cmd_protect,x
4108                     ; 348 	current_adj_lowp = user_Prdata.byte.current_adj;
4110  03a6 be02          	ldw	x,_user_Prdata+2
4111  03a8 cf0000        	ldw	_current_adj_lowp,x
4112                     ; 349 	current_adj_table[0] = (user_Prdata.byte.current_adj >> 4);
4114  03ab 54            	srlw	x
4115  03ac 54            	srlw	x
4116  03ad 54            	srlw	x
4117  03ae 54            	srlw	x
4118  03af cf0000        	ldw	_current_adj_table,x
4119                     ; 350 	current_adj_table[1] = (user_Prdata.byte.current_adj >> 3);											//1/8
4121  03b2 be02          	ldw	x,_user_Prdata+2
4122  03b4 54            	srlw	x
4123  03b5 54            	srlw	x
4124  03b6 54            	srlw	x
4125  03b7 cf0002        	ldw	_current_adj_table+2,x
4126                     ; 351 	current_adj_table[2] = (user_Prdata.byte.current_adj >> 2);											//2/8
4128  03ba be02          	ldw	x,_user_Prdata+2
4129  03bc 54            	srlw	x
4130  03bd 54            	srlw	x
4131  03be cf0004        	ldw	_current_adj_table+4,x
4132                     ; 352 	current_adj_table[3] = (user_Prdata.byte.current_adj >> 2) + (user_Prdata.byte.current_adj >> 3);	//3
4134  03c1 be02          	ldw	x,_user_Prdata+2
4135  03c3 54            	srlw	x
4136  03c4 54            	srlw	x
4137  03c5 54            	srlw	x
4138  03c6 1f05          	ldw	(OFST-1,sp),x
4140  03c8 be02          	ldw	x,_user_Prdata+2
4141  03ca 54            	srlw	x
4142  03cb 54            	srlw	x
4143  03cc 72fb05        	addw	x,(OFST-1,sp)
4144  03cf cf0006        	ldw	_current_adj_table+6,x
4145                     ; 353 	current_adj_table[4] = (user_Prdata.byte.current_adj >> 1);											//4
4147  03d2 be02          	ldw	x,_user_Prdata+2
4148  03d4 54            	srlw	x
4149  03d5 cf0008        	ldw	_current_adj_table+8,x
4150                     ; 354 	current_adj_table[5] = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 3);	//5
4152  03d8 be02          	ldw	x,_user_Prdata+2
4153  03da 54            	srlw	x
4154  03db 54            	srlw	x
4155  03dc 54            	srlw	x
4156  03dd 1f05          	ldw	(OFST-1,sp),x
4158  03df be02          	ldw	x,_user_Prdata+2
4159  03e1 54            	srlw	x
4160  03e2 72fb05        	addw	x,(OFST-1,sp)
4161  03e5 cf000a        	ldw	_current_adj_table+10,x
4162                     ; 355 	current_adj_table[6] = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 2);	//6
4164  03e8 be02          	ldw	x,_user_Prdata+2
4165  03ea 54            	srlw	x
4166  03eb 54            	srlw	x
4167  03ec 1f05          	ldw	(OFST-1,sp),x
4169  03ee be02          	ldw	x,_user_Prdata+2
4170  03f0 54            	srlw	x
4171  03f1 72fb05        	addw	x,(OFST-1,sp)
4172  03f4 cf000c        	ldw	_current_adj_table+12,x
4173                     ; 356 	current_adj_table[7] = user_Prdata.byte.current_adj - (user_Prdata.byte.current_adj >> 3);			//7/8
4175  03f7 be02          	ldw	x,_user_Prdata+2
4176  03f9 54            	srlw	x
4177  03fa 54            	srlw	x
4178  03fb 54            	srlw	x
4179  03fc 1f05          	ldw	(OFST-1,sp),x
4181  03fe be02          	ldw	x,_user_Prdata+2
4182  0400 72f005        	subw	x,(OFST-1,sp)
4183  0403 cf000e        	ldw	_current_adj_table+14,x
4184                     ; 357 	current_adj_fifteen = user_Prdata.byte.current_adj*15/18;
4186  0406 be02          	ldw	x,_user_Prdata+2
4187  0408 58            	sllw	x
4188  0409 58            	sllw	x
4189  040a 58            	sllw	x
4190  040b 58            	sllw	x
4191  040c 72b00002      	subw	x,_user_Prdata+2
4193  0410 a612          	ld	a,#18
4194  0412 62            	div	x,a
4195  0413 cf0000        	ldw	_current_adj_fifteen,x
4196                     ; 358 	current_adj_I = user_Prdata.byte.current_adj >> 1;	//yn42
4198  0416 be02          	ldw	x,_user_Prdata+2
4199  0418 54            	srlw	x
4200  0419 01            	rrwa	x,a
4201  041a b700          	ld	_current_adj_I,a
4202                     ; 359 	current_adj_II = user_Prdata.byte.current_adj - (user_Prdata.byte.current_adj >> 2);	//yn42
4204  041c be02          	ldw	x,_user_Prdata+2
4205  041e 54            	srlw	x
4206  041f 54            	srlw	x
4207  0420 1f05          	ldw	(OFST-1,sp),x
4209  0422 5f            	clrw	x
4210  0423 b603          	ld	a,_user_Prdata+3
4211  0425 97            	ld	xl,a
4212  0426 72f005        	subw	x,(OFST-1,sp)
4213  0429 01            	rrwa	x,a
4214  042a b700          	ld	_current_adj_II,a
4215                     ; 360 	current_adj_III = user_Prdata.byte.current_adj;
4217  042c 450300        	mov	_current_adj_III,_user_Prdata+3
4218                     ; 361 	current_adj_battry = user_Prdata.byte.current_adj / 13 * 6;
4220  042f a60d          	ld	a,#13
4221  0431 be02          	ldw	x,_user_Prdata+2
4222  0433 62            	div	x,a
4223  0434 a606          	ld	a,#6
4224  0436 cd0000        	call	c_bmulx
4226  0439 01            	rrwa	x,a
4227  043a c70000        	ld	_current_adj_battry,a
4228                     ; 364 	ph_current_adj_table[1] = (user_Prdata.byte.ph_current_adj >> 3);
4230  043d b604          	ld	a,_user_Prdata+4
4231  043f 44            	srl	a
4232  0440 44            	srl	a
4233  0441 44            	srl	a
4234  0442 c70001        	ld	_ph_current_adj_table+1,a
4235                     ; 365 	ph_current_adj_table[2] = (user_Prdata.byte.ph_current_adj >> 2);
4237  0445 b604          	ld	a,_user_Prdata+4
4238  0447 44            	srl	a
4239  0448 44            	srl	a
4240  0449 c70002        	ld	_ph_current_adj_table+2,a
4241                     ; 366 	ph_current_adj_table[3] = (user_Prdata.byte.ph_current_adj >> 2) + (user_Prdata.byte.ph_current_adj >> 3);
4243  044c b604          	ld	a,_user_Prdata+4
4244  044e 44            	srl	a
4245  044f 44            	srl	a
4246  0450 44            	srl	a
4247  0451 6b06          	ld	(OFST+0,sp),a
4249  0453 b604          	ld	a,_user_Prdata+4
4250  0455 44            	srl	a
4251  0456 44            	srl	a
4252  0457 1b06          	add	a,(OFST+0,sp)
4253  0459 c70003        	ld	_ph_current_adj_table+3,a
4254                     ; 367 	ph_current_adj_table[4] = user_Prdata.byte.ph_current_adj >> 1;
4256  045c b604          	ld	a,_user_Prdata+4
4257  045e 44            	srl	a
4258  045f c70004        	ld	_ph_current_adj_table+4,a
4259                     ; 368 	ph_current_adj_table[5] = (user_Prdata.byte.ph_current_adj >> 1) + (user_Prdata.byte.ph_current_adj >> 3);
4261  0462 b604          	ld	a,_user_Prdata+4
4262  0464 44            	srl	a
4263  0465 44            	srl	a
4264  0466 44            	srl	a
4265  0467 6b06          	ld	(OFST+0,sp),a
4267  0469 b604          	ld	a,_user_Prdata+4
4268  046b 44            	srl	a
4269  046c 1b06          	add	a,(OFST+0,sp)
4270  046e c70005        	ld	_ph_current_adj_table+5,a
4271                     ; 369 	ph_current_adj_table[6] = (user_Prdata.byte.ph_current_adj >> 1) + (user_Prdata.byte.ph_current_adj >> 2);
4273  0471 b604          	ld	a,_user_Prdata+4
4274  0473 44            	srl	a
4275  0474 44            	srl	a
4276  0475 6b06          	ld	(OFST+0,sp),a
4278  0477 b604          	ld	a,_user_Prdata+4
4279  0479 44            	srl	a
4280  047a 1b06          	add	a,(OFST+0,sp)
4281  047c c70006        	ld	_ph_current_adj_table+6,a
4282                     ; 370 	ph_current_adj_table[7] = user_Prdata.byte.ph_current_adj - (user_Prdata.byte.ph_current_adj >> 3);
4284  047f b604          	ld	a,_user_Prdata+4
4285  0481 44            	srl	a
4286  0482 44            	srl	a
4287  0483 44            	srl	a
4288  0484 b004          	sub	a,_user_Prdata+4
4289  0486 40            	neg	a
4290  0487 c70007        	ld	_ph_current_adj_table+7,a
4291                     ; 372 	voltage_adj_table[0] = (user_Prdata.byte.voltage_adj >> 3);											//1/8
4293  048a be00          	ldw	x,_user_Prdata
4294  048c 54            	srlw	x
4295  048d 54            	srlw	x
4296  048e 54            	srlw	x
4297  048f cf0000        	ldw	_voltage_adj_table,x
4298                     ; 373 	voltage_adj_table[1] = (user_Prdata.byte.voltage_adj >> 2);											//2/8
4300  0492 be00          	ldw	x,_user_Prdata
4301  0494 54            	srlw	x
4302  0495 54            	srlw	x
4303  0496 cf0002        	ldw	_voltage_adj_table+2,x
4304                     ; 374 	voltage_adj_table[2] = (user_Prdata.byte.voltage_adj >> 1);											//4/8
4306  0499 be00          	ldw	x,_user_Prdata
4307  049b 54            	srlw	x
4308  049c cf0004        	ldw	_voltage_adj_table+4,x
4309                     ; 375 	voltage_adj_table[3] = (user_Prdata.byte.voltage_adj - (user_Prdata.byte.voltage_adj >> 2));		//6/8
4311  049f be00          	ldw	x,_user_Prdata
4312  04a1 54            	srlw	x
4313  04a2 54            	srlw	x
4314  04a3 1f05          	ldw	(OFST-1,sp),x
4316  04a5 be00          	ldw	x,_user_Prdata
4317  04a7 72f005        	subw	x,(OFST-1,sp)
4318  04aa cf0006        	ldw	_voltage_adj_table+6,x
4319                     ; 378 	Current_temp.byte.current5 = user_Prdata.byte.current_adj;
4321  04ad b603          	ld	a,_user_Prdata+3
4322  04af b704          	ld	_Current_temp+4,a
4323                     ; 380 	delay_counter = Current_temp.byte.current5;				//100%
4325  04b1 5f            	clrw	x
4326  04b2 97            	ld	xl,a
4327                     ; 382 	delay_counter = delay_counter*9;
4329  04b3 89            	pushw	x
4330  04b4 58            	sllw	x
4331  04b5 58            	sllw	x
4332  04b6 58            	sllw	x
4333  04b7 72fb01        	addw	x,(1,sp)
4334  04ba 5b02          	addw	sp,#2
4336  04bc cf0000        	ldw	_delay_counter,x
4337                     ; 384 	Current_temp.byte.current4 = delay_counter/10;			//90%
4339  04bf a60a          	ld	a,#10
4340  04c1 62            	div	x,a
4341  04c2 01            	rrwa	x,a
4342  04c3 b703          	ld	_Current_temp+3,a
4343                     ; 386 	delay_counter -= Current_temp.table[4];
4345  04c5 5f            	clrw	x
4346  04c6 b604          	ld	a,_Current_temp+4
4347  04c8 97            	ld	xl,a
4348  04c9 1f05          	ldw	(OFST-1,sp),x
4350  04cb ce0000        	ldw	x,_delay_counter
4351  04ce 72f005        	subw	x,(OFST-1,sp)
4352  04d1 cf0000        	ldw	_delay_counter,x
4353                     ; 387 	Current_temp.byte.current3 = delay_counter/10;			//80%
4355  04d4 a60a          	ld	a,#10
4356  04d6 62            	div	x,a
4357  04d7 01            	rrwa	x,a
4358  04d8 b702          	ld	_Current_temp+2,a
4359                     ; 389 	delay_counter -= Current_temp.table[4];
4361  04da 5f            	clrw	x
4362  04db b604          	ld	a,_Current_temp+4
4363  04dd 97            	ld	xl,a
4364  04de 1f05          	ldw	(OFST-1,sp),x
4366  04e0 ce0000        	ldw	x,_delay_counter
4367  04e3 72f005        	subw	x,(OFST-1,sp)
4368  04e6 cf0000        	ldw	_delay_counter,x
4369                     ; 390 	Current_temp.byte.current2 = delay_counter/10;			//70%
4371  04e9 a60a          	ld	a,#10
4372  04eb 62            	div	x,a
4373  04ec 01            	rrwa	x,a
4374  04ed b701          	ld	_Current_temp+1,a
4375                     ; 392 	delay_counter -= Current_temp.table[4];
4377  04ef 5f            	clrw	x
4378  04f0 b604          	ld	a,_Current_temp+4
4379  04f2 97            	ld	xl,a
4380  04f3 1f05          	ldw	(OFST-1,sp),x
4382  04f5 ce0000        	ldw	x,_delay_counter
4383  04f8 72f005        	subw	x,(OFST-1,sp)
4384                     ; 393 	Current_temp.byte.current1 = (delay_counter/10);		//60%
4386  04fb a60a          	ld	a,#10
4387  04fd 62            	div	x,a
4388  04fe 01            	rrwa	x,a
4389  04ff b700          	ld	_Current_temp,a
4390                     ; 395 	delay_counter = 0;
4392  0501 5f            	clrw	x
4393  0502 cf0000        	ldw	_delay_counter,x
4394                     ; 397 	voltage_table [4] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) + (user_Prdata.byte.voltage_adj >> 5) + (user_Prdata.byte.voltage_adj >> 7) + (user_Prdata.byte.voltage_adj >> 8);
4396  0505 4f            	clr	a
4397  0506 be00          	ldw	x,_user_Prdata
4398  0508 01            	rrwa	x,a
4399  0509 1f05          	ldw	(OFST-1,sp),x
4401  050b 4f            	clr	a
4402  050c be00          	ldw	x,_user_Prdata
4403  050e 01            	rrwa	x,a
4404  050f 48            	sll	a
4405  0510 59            	rlcw	x
4406  0511 1f03          	ldw	(OFST-3,sp),x
4408  0513 be00          	ldw	x,_user_Prdata
4409  0515 54            	srlw	x
4410  0516 54            	srlw	x
4411  0517 54            	srlw	x
4412  0518 54            	srlw	x
4413  0519 54            	srlw	x
4414  051a 1f01          	ldw	(OFST-5,sp),x
4416  051c be00          	ldw	x,_user_Prdata
4417  051e 54            	srlw	x
4418  051f 54            	srlw	x
4419  0520 72bb0000      	addw	x,_user_Prdata
4420  0524 72fb01        	addw	x,(OFST-5,sp)
4421  0527 72fb03        	addw	x,(OFST-3,sp)
4422  052a 72fb05        	addw	x,(OFST-1,sp)
4423  052d cf0008        	ldw	_voltage_table+8,x
4424                     ; 398 	voltage_table [4] = voltage_table [4] - (voltage_table [4]>>4);
4426  0530 54            	srlw	x
4427  0531 54            	srlw	x
4428  0532 54            	srlw	x
4429  0533 54            	srlw	x
4430  0534 72b00008      	subw	x,_voltage_table+8
4431  0538 50            	negw	x
4432  0539 cf0008        	ldw	_voltage_table+8,x
4433                     ; 400 	voltage_table [3] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) + (user_Prdata.byte.voltage_adj >> 6) + (user_Prdata.byte.voltage_adj >> 7);
4435  053c 4f            	clr	a
4436  053d be00          	ldw	x,_user_Prdata
4437  053f 01            	rrwa	x,a
4438  0540 48            	sll	a
4439  0541 59            	rlcw	x
4440  0542 1f05          	ldw	(OFST-1,sp),x
4442  0544 a606          	ld	a,#6
4443  0546 be00          	ldw	x,_user_Prdata
4444  0548               L46:
4445  0548 54            	srlw	x
4446  0549 4a            	dec	a
4447  054a 26fc          	jrne	L46
4448  054c 1f03          	ldw	(OFST-3,sp),x
4450  054e be00          	ldw	x,_user_Prdata
4451  0550 54            	srlw	x
4452  0551 54            	srlw	x
4453  0552 72bb0000      	addw	x,_user_Prdata
4454  0556 72fb03        	addw	x,(OFST-3,sp)
4455  0559 72fb05        	addw	x,(OFST-1,sp)
4456  055c cf0006        	ldw	_voltage_table+6,x
4457                     ; 401 	voltage_table [3] = voltage_table [3] - (voltage_table [3]>>4);
4459  055f 54            	srlw	x
4460  0560 54            	srlw	x
4461  0561 54            	srlw	x
4462  0562 54            	srlw	x
4463  0563 72b00006      	subw	x,_voltage_table+6
4464  0567 50            	negw	x
4465  0568 cf0006        	ldw	_voltage_table+6,x
4466                     ; 403 	voltage_table [2] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 8) + (user_Prdata.byte.voltage_adj >> 7);
4468  056b be00          	ldw	x,_user_Prdata
4469  056d 01            	rrwa	x,a
4470  056e 48            	sll	a
4471  056f 59            	rlcw	x
4472  0570 1f05          	ldw	(OFST-1,sp),x
4474  0572 4f            	clr	a
4475  0573 be00          	ldw	x,_user_Prdata
4476  0575 01            	rrwa	x,a
4477  0576 1f03          	ldw	(OFST-3,sp),x
4479  0578 be00          	ldw	x,_user_Prdata
4480  057a 54            	srlw	x
4481  057b 54            	srlw	x
4482  057c 72bb0000      	addw	x,_user_Prdata
4483  0580 72f003        	subw	x,(OFST-3,sp)
4484  0583 72fb05        	addw	x,(OFST-1,sp)
4485  0586 cf0004        	ldw	_voltage_table+4,x
4486                     ; 404 	voltage_table [2] = voltage_table [2] - (voltage_table [2]>>4);
4488  0589 54            	srlw	x
4489  058a 54            	srlw	x
4490  058b 54            	srlw	x
4491  058c 54            	srlw	x
4492  058d 72b00004      	subw	x,_voltage_table+4
4493  0591 50            	negw	x
4494  0592 cf0004        	ldw	_voltage_table+4,x
4495                     ; 406 	voltage_table [1] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 6) + (user_Prdata.byte.voltage_adj >> 8);
4497  0595 4f            	clr	a
4498  0596 be00          	ldw	x,_user_Prdata
4499  0598 01            	rrwa	x,a
4500  0599 1f05          	ldw	(OFST-1,sp),x
4502  059b a606          	ld	a,#6
4503  059d be00          	ldw	x,_user_Prdata
4504  059f               L66:
4505  059f 54            	srlw	x
4506  05a0 4a            	dec	a
4507  05a1 26fc          	jrne	L66
4508  05a3 1f03          	ldw	(OFST-3,sp),x
4510  05a5 be00          	ldw	x,_user_Prdata
4511  05a7 54            	srlw	x
4512  05a8 54            	srlw	x
4513  05a9 72bb0000      	addw	x,_user_Prdata
4514  05ad 72f003        	subw	x,(OFST-3,sp)
4515  05b0 72fb05        	addw	x,(OFST-1,sp)
4516  05b3 cf0002        	ldw	_voltage_table+2,x
4517                     ; 407 	voltage_table [1] = voltage_table [1] - (voltage_table [1]>>4);
4519  05b6 54            	srlw	x
4520  05b7 54            	srlw	x
4521  05b8 54            	srlw	x
4522  05b9 54            	srlw	x
4523  05ba 72b00002      	subw	x,_voltage_table+2
4524  05be 50            	negw	x
4525  05bf cf0002        	ldw	_voltage_table+2,x
4526                     ; 409 	voltage_table [0] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 4) + (user_Prdata.byte.voltage_adj >> 5);
4528  05c2 be00          	ldw	x,_user_Prdata
4529  05c4 54            	srlw	x
4530  05c5 54            	srlw	x
4531  05c6 54            	srlw	x
4532  05c7 54            	srlw	x
4533  05c8 54            	srlw	x
4534  05c9 1f05          	ldw	(OFST-1,sp),x
4536  05cb be00          	ldw	x,_user_Prdata
4537  05cd 54            	srlw	x
4538  05ce 54            	srlw	x
4539  05cf 54            	srlw	x
4540  05d0 54            	srlw	x
4541  05d1 1f03          	ldw	(OFST-3,sp),x
4543  05d3 be00          	ldw	x,_user_Prdata
4544  05d5 54            	srlw	x
4545  05d6 54            	srlw	x
4546  05d7 72bb0000      	addw	x,_user_Prdata
4547  05db 72f003        	subw	x,(OFST-3,sp)
4548  05de 72fb05        	addw	x,(OFST-1,sp)
4549  05e1 cf0000        	ldw	_voltage_table,x
4550                     ; 410 	voltage_table [0] = voltage_table [0] - (voltage_table [0]>>4);
4552  05e4 54            	srlw	x
4553  05e5 54            	srlw	x
4554  05e6 54            	srlw	x
4555  05e7 54            	srlw	x
4556  05e8 72b00000      	subw	x,_voltage_table
4557  05ec 50            	negw	x
4558  05ed cf0000        	ldw	_voltage_table,x
4559                     ; 412 	current_adj_table_add[0] = user_Prdata.byte.current_adj + current_adj_table[4];
4561  05f0 be02          	ldw	x,_user_Prdata+2
4562  05f2 72bb0008      	addw	x,_current_adj_table+8
4563  05f6 cf0000        	ldw	_current_adj_table_add,x
4564                     ; 413 	current_adj_table_add[1] = user_Prdata.byte.current_adj + current_adj_table[3];
4566  05f9 be02          	ldw	x,_user_Prdata+2
4567  05fb 72bb0006      	addw	x,_current_adj_table+6
4568  05ff cf0002        	ldw	_current_adj_table_add+2,x
4569                     ; 414 	current_adj_table_add[2] = user_Prdata.byte.current_adj + current_adj_table[1];
4571  0602 be02          	ldw	x,_user_Prdata+2
4572  0604 72bb0002      	addw	x,_current_adj_table+2
4573  0608 cf0004        	ldw	_current_adj_table_add+4,x
4574                     ; 417 	current_v = user_Prdata.byte.current_adj;	//y42
4576  060b 450300        	mov	_current_v,_user_Prdata+3
4577                     ; 418 	current_temp = user_Prdata.byte.current_adj;
4579  060e 450300        	mov	_current_temp,_user_Prdata+3
4580                     ; 419 	current_speed = (user_Prdata.byte.current_adj*16)/18;
4582  0611 be02          	ldw	x,_user_Prdata+2
4583  0613 58            	sllw	x
4584  0614 58            	sllw	x
4585  0615 58            	sllw	x
4586  0616 58            	sllw	x
4587  0617 a612          	ld	a,#18
4588  0619 62            	div	x,a
4589  061a 01            	rrwa	x,a
4590  061b b700          	ld	_current_speed,a
4591                     ; 420 	current_max = user_Prdata.byte.current_adj;
4593  061d b603          	ld	a,_user_Prdata+3
4594  061f b700          	ld	_current_max,a
4595                     ; 421 	step_current = (current_max >> 4);			//
4597  0621 4e            	swap	a
4598  0622 a40f          	and	a,#15
4599  0624 5f            	clrw	x
4600  0625 97            	ld	xl,a
4601  0626 bf00          	ldw	_step_current,x
4602                     ; 422 	start_current = current_speed;
4604  0628 450000        	mov	_start_current,_current_speed
4605                     ; 423 	current_max_low_step = (current_max >> 1);
4607  062b b600          	ld	a,_current_max
4608  062d 44            	srl	a
4609  062e b700          	ld	_current_max_low_step,a
4610                     ; 425 	sp_ph_current_limit_max = user_Prdata.byte.current_adj;	
4612  0630 5500030000    	mov	_sp_ph_current_limit_max,_user_Prdata+3
4613                     ; 426 	sp_ph_current_limit_10p = user_Prdata.byte.current_adj / 10;
4615  0635 a60a          	ld	a,#10
4616  0637 be02          	ldw	x,_user_Prdata+2
4617  0639 62            	div	x,a
4618  063a 01            	rrwa	x,a
4619  063b c70000        	ld	_sp_ph_current_limit_10p,a
4620                     ; 427 	sp_ph_current_limit_20p = user_Prdata.byte.current_adj * 2 / 10;
4622  063e be02          	ldw	x,_user_Prdata+2
4623  0640 58            	sllw	x
4624  0641 a60a          	ld	a,#10
4625  0643 62            	div	x,a
4626  0644 01            	rrwa	x,a
4627  0645 c70000        	ld	_sp_ph_current_limit_20p,a
4628                     ; 428 	sp_ph_current_limit_30p = user_Prdata.byte.current_adj * 3 / 10;
4630  0648 be02          	ldw	x,_user_Prdata+2
4631  064a 58            	sllw	x
4632  064b 72bb0002      	addw	x,_user_Prdata+2
4634  064f a60a          	ld	a,#10
4635  0651 62            	div	x,a
4636  0652 01            	rrwa	x,a
4637  0653 c70000        	ld	_sp_ph_current_limit_30p,a
4638                     ; 429 	sp_ph_current_limit_40p	= user_Prdata.byte.current_adj * 4 / 10;
4640  0656 be02          	ldw	x,_user_Prdata+2
4641  0658 58            	sllw	x
4642  0659 58            	sllw	x
4643  065a a60a          	ld	a,#10
4644  065c 62            	div	x,a
4645  065d 01            	rrwa	x,a
4646  065e c70000        	ld	_sp_ph_current_limit_40p,a
4647                     ; 430 	sp_ph_current_limit_50p = user_Prdata.byte.current_adj * 5 / 10;
4649  0661 be02          	ldw	x,_user_Prdata+2
4650  0663 58            	sllw	x
4651  0664 58            	sllw	x
4652  0665 72bb0002      	addw	x,_user_Prdata+2
4654  0669 a60a          	ld	a,#10
4655  066b 62            	div	x,a
4656  066c 01            	rrwa	x,a
4657  066d c70000        	ld	_sp_ph_current_limit_50p,a
4658                     ; 431 	sp_ph_current_limit_60p =	user_Prdata.byte.current_adj * 6 / 10;
4660  0670 be02          	ldw	x,_user_Prdata+2
4661  0672 58            	sllw	x
4662  0673 72bb0002      	addw	x,_user_Prdata+2
4663  0677 58            	sllw	x
4665  0678 a60a          	ld	a,#10
4666  067a 62            	div	x,a
4667  067b 01            	rrwa	x,a
4668  067c c70000        	ld	_sp_ph_current_limit_60p,a
4669                     ; 432 	sp_ph_current_limit_70p = user_Prdata.byte.current_adj * 7 / 10;
4671  067f be02          	ldw	x,_user_Prdata+2
4672  0681 58            	sllw	x
4673  0682 58            	sllw	x
4674  0683 58            	sllw	x
4675  0684 72b00002      	subw	x,_user_Prdata+2
4677  0688 a60a          	ld	a,#10
4678  068a 62            	div	x,a
4679  068b 01            	rrwa	x,a
4680  068c c70000        	ld	_sp_ph_current_limit_70p,a
4681                     ; 433 	sp_ph_current_limit_80p = user_Prdata.byte.current_adj * 8 / 10;
4683  068f be02          	ldw	x,_user_Prdata+2
4684  0691 58            	sllw	x
4685  0692 58            	sllw	x
4686  0693 58            	sllw	x
4687  0694 a60a          	ld	a,#10
4688  0696 62            	div	x,a
4689  0697 01            	rrwa	x,a
4690  0698 c70000        	ld	_sp_ph_current_limit_80p,a
4691                     ; 434 	sp_ph_current_limit_90p = user_Prdata.byte.current_adj * 9 / 10;
4693  069b be02          	ldw	x,_user_Prdata+2
4694  069d 58            	sllw	x
4695  069e 58            	sllw	x
4696  069f 58            	sllw	x
4697  06a0 72bb0002      	addw	x,_user_Prdata+2
4699  06a4 a60a          	ld	a,#10
4700  06a6 62            	div	x,a
4701  06a7 01            	rrwa	x,a
4702  06a8 c70000        	ld	_sp_ph_current_limit_90p,a
4703                     ; 436 	current_adj_12 = (u16)(user_Prdata.byte.current_adj*12/17);//ECO
4705  06ab be02          	ldw	x,_user_Prdata+2
4706  06ad 58            	sllw	x
4707  06ae 72bb0002      	addw	x,_user_Prdata+2
4708  06b2 58            	sllw	x
4709  06b3 58            	sllw	x
4711  06b4 a611          	ld	a,#17
4712  06b6 62            	div	x,a
4713  06b7 01            	rrwa	x,a
4714  06b8 c70000        	ld	_current_adj_12,a
4715                     ; 437 	current_3a = user_Prdata.byte.current_adj/6;
4717  06bb a606          	ld	a,#6
4718  06bd be02          	ldw	x,_user_Prdata+2
4719  06bf 62            	div	x,a
4720  06c0 01            	rrwa	x,a
4721  06c1 c70000        	ld	_current_3a,a
4722                     ; 438 	voltage_average_L = user_Prdata.byte.voltage_adj *22/21 ;
4724  06c4 a616          	ld	a,#22
4725  06c6 be00          	ldw	x,_user_Prdata
4726  06c8 cd0000        	call	c_bmulx
4728  06cb a615          	ld	a,#21
4729  06cd 62            	div	x,a
4730  06ce cf0000        	ldw	_voltage_average_L,x
4731                     ; 439 	voltage_average_L1 = user_Prdata.byte.voltage_adj ;
4733  06d1 be00          	ldw	x,_user_Prdata
4734  06d3 cf0000        	ldw	_voltage_average_L1,x
4735                     ; 440 	voltage_average_H = user_Prdata.byte.voltage_adj;
4737  06d6 bf00          	ldw	_voltage_average_H,x
4738                     ; 441 	voltage_average_H = (voltage_average_H * 9)/6+(user_Prdata.byte.voltage_adj >> 4);//(voltage_average_H * 9)/6;(user_Prdata.byte.voltage_adj >> 4);
4740  06d8 54            	srlw	x
4741  06d9 54            	srlw	x
4742  06da 54            	srlw	x
4743  06db 54            	srlw	x
4744  06dc 1f05          	ldw	(OFST-1,sp),x
4746  06de be00          	ldw	x,_voltage_average_H
4747  06e0 58            	sllw	x
4748  06e1 58            	sllw	x
4749  06e2 58            	sllw	x
4750  06e3 72bb0000      	addw	x,_voltage_average_H
4752  06e7 a606          	ld	a,#6
4753  06e9 62            	div	x,a
4754  06ea 72fb05        	addw	x,(OFST-1,sp)
4755  06ed bf00          	ldw	_voltage_average_H,x
4756                     ; 443 	current_adj_18a = user_Prdata.byte.current_adj * 18 / 20;
4758  06ef be02          	ldw	x,_user_Prdata+2
4759  06f1 58            	sllw	x
4760  06f2 58            	sllw	x
4761  06f3 58            	sllw	x
4762  06f4 72bb0002      	addw	x,_user_Prdata+2
4763  06f8 58            	sllw	x
4765  06f9 a614          	ld	a,#20
4766  06fb 62            	div	x,a
4767  06fc 01            	rrwa	x,a
4768  06fd c70000        	ld	_current_adj_18a,a
4769                     ; 444 	current_adj_10a = user_Prdata.byte.current_adj * 10 / 17;
4771  0700 be02          	ldw	x,_user_Prdata+2
4772  0702 58            	sllw	x
4773  0703 58            	sllw	x
4774  0704 72bb0002      	addw	x,_user_Prdata+2
4775  0708 58            	sllw	x
4777  0709 a611          	ld	a,#17
4778  070b 62            	div	x,a
4779  070c 01            	rrwa	x,a
4780  070d c70000        	ld	_current_adj_10a,a
4781                     ; 446 	cvt_add = (cvt_torlance_save >> 1);///5/8
4783  0710 c60000        	ld	a,_cvt_torlance_save
4784  0713 44            	srl	a
4785  0714 c70000        	ld	_cvt_add,a
4786                     ; 448 }
4789  0717 5b06          	addw	sp,#6
4790  0719 81            	ret	
4818                     ; 451 void Init_UART2(void)//stm8s105c6只有异步串行口2可以使用
4818                     ; 452 {
4819                     	switch	.text
4820  071a               _Init_UART2:
4824                     ; 453 		UART2_CR1=0x00;
4826  071a 725f5244      	clr	_UART2_CR1
4827                     ; 454 		UART2_CR2=0x00;
4829  071e 725f5245      	clr	_UART2_CR2
4830                     ; 455 		UART2_CR3=0x00;		
4832  0722 725f5246      	clr	_UART2_CR3
4833                     ; 465 		UART2_BRR2=0x02;
4835  0726 35025243      	mov	_UART2_BRR2,#2
4836                     ; 466 		UART2_BRR1=0x68;
4838  072a 35685242      	mov	_UART2_BRR1,#104
4839                     ; 467 		UART2_CR2=0x0c;//允许接收，发送
4841  072e 350c5245      	mov	_UART2_CR2,#12
4842                     ; 469 }
4845  0732 81            	ret	
4869                     	xdef	_NOHALL_TIM1
4870                     	xdef	_sci_ini
4871                     	xdef	_SPI_ini
4872                     	xdef	_main
4873                     	xdef	_data_load
4874                     	xdef	_Init_UART2
4875                     	xref.b	_Alarm_Flag
4876                     	xref.b	_Current_temp
4877                     	xref.b	_user_Prdata
4878                     	xref.b	_sys_state_flag2
4879                     	xref.b	_sys_state_flag
4880                     	xref.b	_error_bank
4881                     	xref	_send_data_flag
4882                     	xref	_hand_no_speed_limit
4883                     	xref	_limit_speed_hall_1
4884                     	xref	_speed_bike
4885                     	xref	_sp_ph_current_limit_90p
4886                     	xref	_sp_ph_current_limit_80p
4887                     	xref	_sp_ph_current_limit_70p
4888                     	xref	_sp_ph_current_limit_60p
4889                     	xref	_sp_ph_current_limit_50p
4890                     	xref	_sp_ph_current_limit_40p
4891                     	xref	_sp_ph_current_limit_30p
4892                     	xref	_sp_ph_current_limit_20p
4893                     	xref	_sp_ph_current_limit_10p
4894                     	xref	_sp_ph_current_limit_max
4895                     	xref	_voltage_count
4896                     	xref	_current_3a
4897                     	xref	_cvt_add
4898                     	xref	_cvt_torlance_save
4899                     	xref	_voltage_average_L1
4900                     	xref	_voltage2
4901                     	xref	_voltage1
4902                     	xref	_voltage_average_L
4903                     	xref	_current_adj_fifteen
4904                     	xref	_current_adj_battry
4905                     	xref.b	_current_adj_III
4906                     	xref.b	_current_adj_II
4907                     	xref.b	_current_adj_I
4908                     	xref	_current_adj_10a
4909                     	xref	_current_adj_18a
4910                     	xref	_current_s2
4911                     	xref	_current_s1
4912                     	xref	_current_s
4913                     	xref.b	_current_v
4914                     	xref.b	_sys_start_time
4915                     	xref	_flash_count
4916                     	xref	_uart_dan_mode
4917                     	xref	_voltage_table
4918                     	xref	_current_adj_table_add
4919                     	xref.b	_delvoltage
4920                     	xref	_ph_current_adj_table
4921                     	xref	_low_current_cmd_protect
4922                     	xref	_current_adj_table
4923                     	xref	_current_adj_lowp
4924                     	xref	_voltage_adj_table54
4925                     	xref	_voltage_adj_table42
4926                     	xref	_voltage_adj_table45
4927                     	xref	_voltage_adj_table46
4928                     	xref	_voltage_adj_table47
4929                     	xref	_voltage_adj_table48
4930                     	xref	_delay_counter
4931                     	xref	_voltage_adj_table49
4932                     	xref.b	_Auto_SPT
4933                     	xref	_voltage_adj_table
4934                     	xref.b	_speed_num
4935                     	xref	_current_adj_12
4936                     	xref.b	_current_speed
4937                     	xref.b	_ph_low_count_max
4938                     	xref.b	_current_cmd_protect_average
4939                     	xref.b	_voltage_average_H
4940                     	xref.b	_current_max_low_step
4941                     	xref.b	_current_zero_count
4942                     	xref.b	_start_current
4943                     	xref.b	_step_current
4944                     	xref.b	_sc_current_count
4945                     	xref.b	_run_flag
4946                     	xref.b	_pwm_duty_on
4947                     	xref.b	_pwm_duty_on_old
4948                     	xref.b	_sc_ref
4949                     	xref.b	_current_cmd_average
4950                     	xdef	_sys_step
4951                     	xref.b	_current_temp
4952                     	xref.b	_current_max
4953                     	xref	_bike_rpm
4954                     	xref	_zero_add_torque
4955                     	xref	_lj_change_time_count
4956                     	xref	_lj_ad_app_change
4957                     	xref	_start_2s_count
4958                     	xref	_speed_bike_load_count
4959                     	xref	_max_speed_limit
4960                     	xref	_PWM_ALL_OFF
4961                     	xref	_eeprom_read
4962                     	xref	_OPTIONSET_INI
4963                     	xdef	_RAM_INI
4964                     	xdef	_TM2_INI
4965                     	xdef	_TM1_INI
4966                     	xref	_AD_INI
4967                     	xdef	_IO_INI
4968                     	xdef	_OSC_INI
4969                     	xdef	_WDT_INI
4970                     	xref.b	c_x
4989                     	xref	c_bmulx
4990                     	end
