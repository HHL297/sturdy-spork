   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2777                     	bsct
2778  0000               _speed_motor2:
2779  0000 01f4          	dc.w	500
2780  0002               _hall_pwm_cont:
2781  0002 01f4          	dc.w	500
2782  0004               _debug_count_max:
2783  0004 03e8          	dc.w	1000
2784  0006               _sys_step_52_number:
2785  0006 00            	dc.b	0
2786  0007               _sys_step_36_number:
2787  0007 00            	dc.b	0
2788  0008               _mode_flag:
2789  0008 01            	dc.b	1
2790  0009               _position_flag:
2791  0009 01            	dc.b	1
2792  000a               _period_count:
2793  000a 0258          	dc.w	600
2794                     .const:	section	.text
2795  0000               _setp_chk_hall:
2796  0000 03            	dc.b	3
2797  0001 01            	dc.b	1
2798  0002 05            	dc.b	5
2799  0003 04            	dc.b	4
2800  0004 06            	dc.b	6
2801  0005 02            	dc.b	2
2802  0006 00            	dc.b	0
2803  0007               _setp_dir_hall:
2804  0007 02            	dc.b	2
2805  0008 03            	dc.b	3
2806  0009 01            	dc.b	1
2807  000a 05            	dc.b	5
2808  000b 04            	dc.b	4
2809  000c 06            	dc.b	6
2810  000d 00            	dc.b	0
2811  000e               _setp_chk_last_hall:
2812  000e 00            	dc.b	0
2813  000f 03            	dc.b	3
2814  0010 06            	dc.b	6
2815  0011 02            	dc.b	2
2816  0012 05            	dc.b	5
2817  0013 01            	dc.b	1
2818  0014 04            	dc.b	4
2819  0015               _Sensorless_next:
2820  0015 00            	dc.b	0
2821  0016 02            	dc.b	2
2822  0017 00            	dc.b	0
2823  0018 01            	dc.b	1
2824  0019 04            	dc.b	4
2825  001a 03            	dc.b	3
2826  001b 05            	dc.b	5
2827  001c 00            	dc.b	0
2828  001d               _HALL_60C_table:
2829  001d 02            	dc.b	2
2830  001e 06            	dc.b	6
2831  001f 00            	dc.b	0
2832  0020 04            	dc.b	4
2833  0021 03            	dc.b	3
2834  0022 07            	dc.b	7
2835  0023 01            	dc.b	1
2836  0024 05            	dc.b	5
2837  0025               _hall_turetable:
2838  0025 00            	dc.b	0
2839  0026 05            	dc.b	5
2840  0027 03            	dc.b	3
2841  0028 01            	dc.b	1
2842  0029 06            	dc.b	6
2843  002a 04            	dc.b	4
2844  002b 02            	dc.b	2
2845  002c 00            	dc.b	0
2846  002d               _hall_turetable2:
2847  002d 00            	dc.b	0
2848  002e 03            	dc.b	3
2849  002f 06            	dc.b	6
2850  0030 02            	dc.b	2
2851  0031 05            	dc.b	5
2852  0032 01            	dc.b	1
2853  0033 04            	dc.b	4
2854  0034 00            	dc.b	0
2855  0035               _Hall_REV_table:
2856  0035 00            	dc.b	0
2857  0036 05            	dc.b	5
2858  0037 03            	dc.b	3
2859  0038 01            	dc.b	1
2860  0039 06            	dc.b	6
2861  003a 04            	dc.b	4
2862  003b 02            	dc.b	2
2863  003c 07            	dc.b	7
2864                     	bsct
2865  000c               _current_cmd_spt:
2866  000c 0000          	dc.w	0
2867                     	switch	.data
2868  0000               _speed_chg_delay:
2869  0000 0064          	dc.w	100
2870  0002               _auto_debug_count:
2871  0002 0000          	dc.w	0
2872  0004               _nhchk_pwm_match:
2873  0004 00            	dc.b	0
2874  0005 01            	dc.b	1
2875  0006 02            	dc.b	2
2876  0007 02            	dc.b	2
2877  0008 01            	dc.b	1
2878  0009 00            	dc.b	0
2879  000a 01            	dc.b	1
2880  000b 00            	dc.b	0
2881  000c 00            	dc.b	0
2882  000d 01            	dc.b	1
2883  000e 02            	dc.b	2
2884  000f 02            	dc.b	2
2885  0010 02            	dc.b	2
2886  0011 02            	dc.b	2
2887  0012 01            	dc.b	1
2888  0013 00            	dc.b	0
2889  0014 00            	dc.b	0
2890  0015 01            	dc.b	1
2891  0016               _data_tx:
2892  0016 46            	dc.b	70
2893  0017 00            	dc.b	0
2894  0018 00            	dc.b	0
2895  0019 00            	dc.b	0
2896  001a 00            	dc.b	0
2897  001b 00            	dc.b	0
2898  001c 00            	dc.b	0
2899  001d 00            	dc.b	0
2900  001e               _data_rx_number:
2901  001e 00            	dc.b	0
2902  001f               _voltage_pulv:
2903  001f f4            	dc.b	244
2904  0020               _alarm_flag:
2905  0020 00            	dc.b	0
2906  0021               _nohall_ready_flag:
2907  0021 00            	dc.b	0
2908  0022               _nohall_ready_count:
2909  0022 00            	dc.b	0
2910  0023               _nohall_start_count:
2911  0023 0000          	dc.w	0
2912  0025               _nohall_step:
2913  0025 00            	dc.b	0
2914  0026               _nohall_start_delay:
2915  0026 0000          	dc.w	0
2916  0028               _nspeed_motor:
2917  0028 0190          	dc.w	400
2918  002a               _nhall_pwm_cont:
2919  002a 0190          	dc.w	400
2920  002c               _nohall_ol_count:
2921  002c 07d0          	dc.w	2000
2922  002e 0640          	dc.w	1600
2923  0030 0514          	dc.w	1300
2924  0032 03e8          	dc.w	1000
2925  0034 02bc          	dc.w	700
2926  0036 0190          	dc.w	400
2927                     	xref	_hall_speed_chk
2928                     	xref	_cvt_act_deal
2929                     	xref	_cvt_act_cacu_2
2930                     	xref	_cdpi_on_check
2931                     	xref	_speed_limit_data_load
2932                     	xref	_current_load
2933                     	xref	_SynchConSub
3044                     ; 842 @far @interrupt @svlreg void TIM1_PWM_IRQ (void)
3044                     ; 843 {
3045                     	switch	.text
3046  0000               f_TIM1_PWM_IRQ:
3048  0000 8a            	push	cc
3049  0001 84            	pop	a
3050  0002 a4bf          	and	a,#191
3051  0004 88            	push	a
3052  0005 86            	pop	cc
3053  0006 3b0002        	push	c_x+2
3054  0009 be00          	ldw	x,c_x
3055  000b 89            	pushw	x
3056  000c 3b0002        	push	c_y+2
3057  000f be00          	ldw	x,c_y
3058  0011 89            	pushw	x
3059  0012 be02          	ldw	x,c_lreg+2
3060  0014 89            	pushw	x
3061  0015 be00          	ldw	x,c_lreg
3062  0017 89            	pushw	x
3065                     ; 844 	if(IRQ_BIF & TIM1_SR1)							//判断是否是短路保护
3067  0018 720f52550c    	btjf	_TIM1_SR1,#7,L5771
3068                     ; 846 		TIM1_SR1 &= (~IRQ_BIF);		
3070  001d 721f5255      	bres	_TIM1_SR1,#7
3071                     ; 847 		error_bank.bit.current_flow_flag = 1;	//一键通短路保护
3073  0021 72100030      	bset	_error_bank+2,#0
3074                     ; 849 		WDT_FLASH();    								//刷新WDT
3076  0025 35aa50e0      	mov	_IWDG_KR,#170
3077  0029               L5771:
3078                     ; 852 	if(IRQ_UIF & TIM1_SR1)							//判断刷新标记位
3080  0029 7200525504ac  	btjf	_TIM1_SR1,#0,L7771
3081                     ; 854 		TIM1_SR1 &= (~IRQ_UIF);
3083  0032 72115255      	bres	_TIM1_SR1,#0
3084                     ; 856 			ADC_CSR &= 0x7f;
3086  0036 721f5400      	bres	_ADC_CSR,#7
3087                     ; 857 			ADC_CR1 |= 0x01;			//开始转换
3089  003a 72105401      	bset	_ADC_CR1,#0
3090                     ; 858 			hall_read();
3092  003e cd0000        	call	_hall_read
3094                     ; 860 			if((sys_step & 0x01) == 0x00)
3096  0041 7201000004ac  	btjt	_sys_step,#0,L1002
3097                     ; 862 				if((sys_step & 0x01f) == 2)		//32*62.5 = 2 + 32    2,34,
3099  004a b600          	ld	a,_sys_step
3100  004c a41f          	and	a,#31
3101  004e a102          	cp	a,#2
3102  0050 2607          	jrne	L3002
3103                     ; 864 					cvt_speed();
3105  0052 cd0ba1        	call	_cvt_speed
3108  0055 ac7b027b      	jra	L3622
3109  0059               L3002:
3110                     ; 866 				else if(sys_step == 6)	//16  = 6 + 16   ,6,22,38,54
3112  0059 b600          	ld	a,_sys_step
3113  005b a106          	cp	a,#6
3114  005d 2607          	jrne	L7002
3115                     ; 868 					LJ_zero_error_chk();//spt_chk();//uart_send_data();//if(control_temp < 245)
3117  005f cd04ae        	call	_LJ_zero_error_chk
3120  0062 ac7b027b      	jra	L3622
3121  0066               L7002:
3122                     ; 870 				else if(sys_step == 22)
3124  0066 a116          	cp	a,#22
3125  0068 2607          	jrne	L3102
3126                     ; 872 					brake_chk();
3128  006a cd0da1        	call	_brake_chk
3131  006d ac7b027b      	jra	L3622
3132  0071               L3102:
3133                     ; 874 				else if(sys_step == 38)
3135  0071 a126          	cp	a,#38
3136  0073 2655          	jrne	L7102
3137                     ; 877 					speed_check_bike(); //speed_limit_check();
3139  0075 cd091d        	call	_speed_check_bike
3141                     ; 880 					if((sys_state_flag.bit.spt_flag > 0) && (spt_low_high_count_old < 500))//candence
3143  0078 b62c          	ld	a,_sys_state_flag+1
3144  007a a504          	bcp	a,#4
3145  007c 2721          	jreq	L1202
3147  007e ce018f        	ldw	x,_spt_low_high_count_old
3148  0081 a301f4        	cpw	x,#500
3149  0084 2419          	jruge	L1202
3150                     ; 882 						if(spt_low_high_count_old < 3)//1
3152  0086 a30003        	cpw	x,#3
3153  0089 2406          	jruge	L3202
3154                     ; 884 							bb_candence_old = 255;
3156  008b 35ff01f5      	mov	_bb_candence_old,#255
3158  008f 2012          	jra	L7202
3159  0091               L3202:
3160                     ; 888 							bb_candence_old = 833 / spt_low_high_count_old;//1667			
3162  0091 ae0341        	ldw	x,#833
3163  0094 90ce018f      	ldw	y,_spt_low_high_count_old
3164  0098 65            	divw	x,y
3165  0099 01            	rrwa	x,a
3166  009a c701f5        	ld	_bb_candence_old,a
3167  009d 2004          	jra	L7202
3168  009f               L1202:
3169                     ; 892 						bb_candence_old = 0;	
3171  009f 725f01f5      	clr	_bb_candence_old
3172  00a3               L7202:
3173                     ; 894 						if(bb_candence_old > bb_candence)bb_candence ++;
3175  00a3 c601f5        	ld	a,_bb_candence_old
3176  00a6 5f            	clrw	x
3177  00a7 97            	ld	xl,a
3178  00a8 c301dc        	cpw	x,_bb_candence
3179  00ab 230b          	jrule	L1302
3182  00ad ce01dc        	ldw	x,_bb_candence
3183  00b0 5c            	incw	x
3184  00b1 cf01dc        	ldw	_bb_candence,x
3186  00b4 ac7b027b      	jra	L3622
3187  00b8               L1302:
3188                     ; 895 						else if(bb_candence_old < bb_candence)bb_candence --;
3190  00b8 5f            	clrw	x
3191  00b9 97            	ld	xl,a
3192  00ba c301dc        	cpw	x,_bb_candence
3193  00bd 24f5          	jruge	L3622
3196  00bf ce01dc        	ldw	x,_bb_candence
3197  00c2 5a            	decw	x
3198  00c3 cf01dc        	ldw	_bb_candence,x
3199  00c6 ac7b027b      	jra	L3622
3200  00ca               L7102:
3201                     ; 898 				else if(sys_step == 54)// (|| ((sys_step & 0x1f) == 16))
3203  00ca a136          	cp	a,#54
3204  00cc 2704ac670167  	jrne	L1402
3205                     ; 904 						if(send_data_time < 100)send_data_time ++;
3207  00d2 c60117        	ld	a,_send_data_time
3208  00d5 a164          	cp	a,#100
3209  00d7 2404          	jruge	L3402
3212  00d9 725c0117      	inc	_send_data_time
3213  00dd               L3402:
3214                     ; 905 						if(voltage_load_time < 100)voltage_load_time ++;
3216  00dd c60176        	ld	a,_voltage_load_time
3217  00e0 a164          	cp	a,#100
3218  00e2 2404          	jruge	L5402
3221  00e4 725c0176      	inc	_voltage_load_time
3222  00e8               L5402:
3223                     ; 935 					if((((sys_state_flag.bit.spt_flag > 0) && (sys_state_flag.bit.lj_flag > 0)) || ((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0))) && (start_2s_count < 150) && (data_rx_dang > 0) && (error_bank.all_flag == 0) && (sys_state_flag.bit.brk_flag == 0))
3225  00e8 7205002c05    	btjf	_sys_state_flag+1,#2,L3502
3227  00ed 7200002c0c    	btjt	_sys_state_flag+1,#0,L1502
3228  00f2               L3502:
3230  00f2 be00          	ldw	x,_control_temp
3231  00f4 a300f6        	cpw	x,#246
3232  00f7 2529          	jrult	L7402
3234  00f9 720c002b24    	btjt	_sys_state_flag,#6,L7402
3235  00fe               L1502:
3237  00fe ce01ef        	ldw	x,_start_2s_count
3238  0101 a30096        	cpw	x,#150
3239  0104 241c          	jruge	L7402
3241  0106 c6012a        	ld	a,_data_rx_dang
3242  0109 2717          	jreq	L7402
3244  010b be2e          	ldw	x,_error_bank
3245  010d 2613          	jrne	L7402
3247  010f 7202002b0e    	btjt	_sys_state_flag,#1,L7402
3248                     ; 937 						if(start_1s_count < 1)start_1s_count ++;
3250  0114 ce01f2        	ldw	x,_start_1s_count
3251  0117 2603          	jrne	L5502
3254  0119 5c            	incw	x
3256  011a 2018          	jra	L1602
3257  011c               L5502:
3258                     ; 940 							start_2s_count ++; 
3260  011c ce01ef        	ldw	x,_start_2s_count
3261  011f 5c            	incw	x
3262                     ; 941 							start_1s_count = 0;
3263  0120 200e          	jpf	L5602
3264  0122               L7402:
3265                     ; 946 						if(start_2s_count > 10)start_2s_count --;
3267  0122 ce01ef        	ldw	x,_start_2s_count
3268  0125 a3000b        	cpw	x,#11
3269  0128 2503          	jrult	L3602
3272  012a 5a            	decw	x
3274  012b 2003          	jra	L5602
3275  012d               L3602:
3276                     ; 947 						else start_2s_count = 10;
3278  012d ae000a        	ldw	x,#10
3279  0130               L5602:
3280                     ; 948 						start_1s_count = 0;
3282  0130 cf01ef        	ldw	_start_2s_count,x
3284  0133 5f            	clrw	x
3285  0134               L1602:
3286  0134 cf01f2        	ldw	_start_1s_count,x
3287                     ; 954 					if(lj_change_time_count < 15)//15* 4 = 60ms
3289  0137 ce01e7        	ldw	x,_lj_change_time_count
3290  013a a3000f        	cpw	x,#15
3291  013d 2408          	jruge	L7602
3292                     ; 956 						lj_change_time_count ++;						
3294  013f 5c            	incw	x
3295  0140 cf01e7        	ldw	_lj_change_time_count,x
3297  0143 ac7b027b      	jra	L3622
3298  0147               L7602:
3299                     ; 960 						lj_change_time_count = 0;
3301  0147 5f            	clrw	x
3302  0148 cf01e7        	ldw	_lj_change_time_count,x
3303                     ; 961 						if(lj_ad_app > lj_ad_app_last)lj_ad_app_change = lj_ad_app - lj_ad_app_last;
3305  014b ce0000        	ldw	x,_lj_ad_app
3306  014e c301eb        	cpw	x,_lj_ad_app_last
3307  0151 2306          	jrule	L3702
3310  0153 72b001eb      	subw	x,_lj_ad_app_last
3312  0157 2001          	jra	L5702
3313  0159               L3702:
3314                     ; 962 						else lj_ad_app_change = 0;
3316  0159 5f            	clrw	x
3317  015a               L5702:
3318  015a cf01e9        	ldw	_lj_ad_app_change,x
3319                     ; 963 						lj_ad_app_last = lj_ad_app; 						
3321  015d ce0000        	ldw	x,_lj_ad_app
3322  0160 cf01eb        	ldw	_lj_ad_app_last,x
3323  0163 ac7b027b      	jra	L3622
3324  0167               L1402:
3325                     ; 966 				else if(sys_step == 4)			//32*62.5
3327  0167 a104          	cp	a,#4
3328  0169 2607          	jrne	L1012
3329                     ; 968 					hall_speed_chk();//hall_speed_limit();//square_sine_change(); //no hall check
3331  016b cd0665        	call	_hall_speed_chk
3334  016e ac7b027b      	jra	L3622
3335  0172               L1012:
3336                     ; 970 				else if(sys_step == 8)
3338  0172 a108          	cp	a,#8
3339  0174 2607          	jrne	L5012
3340                     ; 973 					light_on_off_fun();
3342  0176 cd03f5        	call	_light_on_off_fun
3345  0179 ac7b027b      	jra	L3622
3346  017d               L5012:
3347                     ; 980 				else if(sys_step == 10)			//2ms
3349  017d a10a          	cp	a,#10
3350  017f 2607          	jrne	L1112
3351                     ; 982 					spt_chk();
3353  0181 cd0e57        	call	_spt_chk
3356  0184 ac7b027b      	jra	L3622
3357  0188               L1112:
3358                     ; 990 				else if(sys_step == 24)
3360  0188 a118          	cp	a,#24
3361  018a 2607          	jrne	L5112
3362                     ; 992 					lj_chk();//spt_chk();//spt_chk_single();
3364  018c cd0510        	call	_lj_chk
3367  018f ac7b027b      	jra	L3622
3368  0193               L5112:
3369                     ; 1000 				else if((sys_step & 0x1f) == 16)		//16,48
3371  0193 a41f          	and	a,#31
3372  0195 a110          	cp	a,#16
3373  0197 27f6          	jreq	L3622
3375                     ; 1009 				else if(sys_step == 30)
3377  0199 b600          	ld	a,_sys_step
3378  019b a11e          	cp	a,#30
3379  019d 2607          	jrne	L5212
3380                     ; 1011 					cvt_act_deal();
3382  019f cd0bfe        	call	_cvt_act_deal
3385  01a2 ac7b027b      	jra	L3622
3386  01a6               L5212:
3387                     ; 1013 				else if(sys_step == 32)
3389  01a6 a120          	cp	a,#32
3390  01a8 2607          	jrne	L1312
3391                     ; 1015 					spt_chk();//nohall_control();//push_6km_run();//
3393  01aa cd0e57        	call	_spt_chk
3396  01ad ac7b027b      	jra	L3622
3397  01b1               L1312:
3398                     ; 1017 				else if(sys_step == 36)
3400  01b1 a124          	cp	a,#36
3401  01b3 262d          	jrne	L5312
3402                     ; 1019 					if(sys_step_36_number == 1)
3404  01b5 b607          	ld	a,_sys_step_36_number
3405  01b7 a101          	cp	a,#1
3406  01b9 2605          	jrne	L7312
3407                     ; 1021 						uart_rx_dang_deal();
3409  01bb cd0a99        	call	_uart_rx_dang_deal
3412  01be 2010          	jra	L1412
3413  01c0               L7312:
3414                     ; 1023 					else if(sys_step_36_number == 2)
3416  01c0 a102          	cp	a,#2
3417  01c2 2605          	jrne	L3412
3418                     ; 1025 						uart_rec_deal();
3420  01c4 cd0ab4        	call	_uart_rec_deal
3423  01c7 2007          	jra	L1412
3424  01c9               L3412:
3425                     ; 1027 					else if(sys_step_36_number == 3)
3427  01c9 a103          	cp	a,#3
3428  01cb 2603          	jrne	L1412
3429                     ; 1029 						uart_rx_dang_load();
3431  01cd cd0a1b        	call	_uart_rx_dang_load
3433  01d0               L1412:
3434                     ; 1031 					if(sys_step_36_number < 3)sys_step_36_number ++ ;
3436  01d0 b607          	ld	a,_sys_step_36_number
3437  01d2 a103          	cp	a,#3
3438  01d4 2406          	jruge	L1512
3441  01d6 3c07          	inc	_sys_step_36_number
3443  01d8 ac7b027b      	jra	L3622
3444  01dc               L1512:
3445                     ; 1032 					else sys_step_36_number = 0;
3447  01dc 3f07          	clr	_sys_step_36_number
3448  01de ac7b027b      	jra	L3622
3449  01e2               L5312:
3450                     ; 1040 				else if(sys_step == 44)
3452  01e2 a12c          	cp	a,#44
3453  01e4 2607          	jrne	L7512
3454                     ; 1042 					cvt_act_cacu_2();
3456  01e6 cd0c9f        	call	_cvt_act_cacu_2
3459  01e9 ac7b027b      	jra	L3622
3460  01ed               L7512:
3461                     ; 1044 				else if(sys_step == 46)
3463  01ed a12e          	cp	a,#46
3464  01ef 2607          	jrne	L3612
3465                     ; 1046 					lock_c_v();
3467  01f1 cd1c74        	call	_lock_c_v
3470  01f4 ac7b027b      	jra	L3622
3471  01f8               L3612:
3472                     ; 1048 				else if(sys_step == 50)
3474  01f8 a132          	cp	a,#50
3475  01fa 2605          	jrne	L7612
3476                     ; 1050 					cdpi_on_check();
3478  01fc cd1ad3        	call	_cdpi_on_check
3481  01ff 207a          	jra	L3622
3482  0201               L7612:
3483                     ; 1052 				else if(sys_step == 52)
3485  0201 a134          	cp	a,#52
3486  0203 2634          	jrne	L3712
3487                     ; 1054 					if(sys_step_52_number == 0)
3489  0205 b606          	ld	a,_sys_step_52_number
3490  0207 2605          	jrne	L5712
3491                     ; 1056 						voltage_load();
3493  0209 cd0899        	call	_voltage_load
3496  020c 201d          	jra	L7712
3497  020e               L5712:
3498                     ; 1058 					else if(sys_step_52_number == 1)
3500  020e a101          	cp	a,#1
3501  0210 2719          	jreq	L7712
3503                     ; 1062 					else if(sys_step_52_number == 2)
3505  0212 a102          	cp	a,#2
3506  0214 2605          	jrne	L5022
3507                     ; 1064 						error_load();
3509  0216 cd079d        	call	_error_load
3512  0219 2010          	jra	L7712
3513  021b               L5022:
3514                     ; 1066 					else if(sys_step_52_number == 3)
3516  021b a103          	cp	a,#3
3517  021d 2605          	jrne	L1122
3518                     ; 1068 						speed_load();
3520  021f cd07f9        	call	_speed_load
3523  0222 2007          	jra	L7712
3524  0224               L1122:
3525                     ; 1070 					else if(sys_step_52_number == 4)
3527  0224 a104          	cp	a,#4
3528  0226 2603          	jrne	L7712
3529                     ; 1072 						tx_sum_load();
3531  0228 cd0883        	call	_tx_sum_load
3533  022b               L7712:
3534                     ; 1075 					if(sys_step_52_number < 4)sys_step_52_number ++ ;
3536  022b b606          	ld	a,_sys_step_52_number
3537  022d a104          	cp	a,#4
3538  022f 2404          	jruge	L7122
3541  0231 3c06          	inc	_sys_step_52_number
3543  0233 2046          	jra	L3622
3544  0235               L7122:
3545                     ; 1076 					else sys_step_52_number = 0;
3547  0235 3f06          	clr	_sys_step_52_number
3548  0237 2042          	jra	L3622
3549  0239               L3712:
3550                     ; 1078 				else if(sys_step == 0)			//4ms
3552  0239 b600          	ld	a,_sys_step
3553  023b 2636          	jrne	L5222
3554                     ; 1080 					if(time_count == 0)					//
3556  023d b60f          	ld	a,_time_count
3557  023f 2605          	jrne	L7222
3558                     ; 1082 						motor_stop();		
3560  0241 cd0000        	call	_motor_stop
3563  0244 b60f          	ld	a,_time_count
3564  0246               L7222:
3565                     ; 1084 					else if(time_count == 1)
3567                     ; 1108 					if(time_count == 3)
3569  0246 a103          	cp	a,#3
3570  0248 2605          	jrne	L5322
3571                     ; 1110 						speed_limit_data_load();//change limit_speed
3573  024a cd0446        	call	_speed_limit_data_load
3576  024d 2018          	jra	L7322
3577  024f               L5322:
3578                     ; 1112 					else if(time_count == 4)
3580  024f a104          	cp	a,#4
3581  0251 2605          	jrne	L1422
3582                     ; 1114 						current_load();
3584  0253 cd077e        	call	_current_load
3587  0256 200f          	jra	L7322
3588  0258               L1422:
3589                     ; 1116 					else if(time_count == 5)
3591  0258 a105          	cp	a,#5
3592  025a 270b          	jreq	L7322
3594                     ; 1120 					else if(time_count == 6)
3596  025c a106          	cp	a,#6
3597  025e 2707          	jreq	L7322
3599                     ; 1124 					else if(time_count == 7)
3601  0260 a107          	cp	a,#7
3602  0262 2603          	jrne	L7322
3603                     ; 1126 						hall_speed_limit();
3605  0264 cd06fa        	call	_hall_speed_limit
3607  0267               L7322:
3608                     ; 1156 					time_count ++;
3610  0267 3c0f          	inc	_time_count
3611                     ; 1157 					if(time_count >= 25)
3613  0269 b60f          	ld	a,_time_count
3614  026b a119          	cp	a,#25
3615  026d 250c          	jrult	L3622
3616                     ; 1158 						time_count  = 0;			
3618  026f 3f0f          	clr	_time_count
3619  0271 2008          	jra	L3622
3620  0273               L5222:
3621                     ; 1162 					ad_data();
3623  0273 cd0000        	call	_ad_data
3625  0276 2003          	jra	L3622
3626  0278               L1002:
3627                     ; 1167 				current_num();
3629  0278 cd0000        	call	_current_num
3631  027b               L3622:
3632                     ; 1170 			adc_sampel_ph();
3634  027b cd0000        	call	_adc_sampel_ph
3636                     ; 1172 			adc_channel();
3638  027e cd0000        	call	_adc_channel
3640                     ; 1174 			svpwm_ver();	
3642  0281 cd0000        	call	_svpwm_ver
3644                     ; 1176 			if(alarm_switch == 0)
3646  0284 b63c          	ld	a,_alarm_switch
3647  0286 2704ac650365  	jrne	L5622
3648                     ; 1178 				if(error_bank.all_flag > 0)
3650  028c be2e          	ldw	x,_error_bank
3651  028e 271b          	jreq	L7622
3652                     ; 1190 					motor_flag.all_flag = 0x00; 
3654  0290 b728          	ld	_motor_flag,a
3655                     ; 1191 					if(square_sine_change_flag == 1)
3657  0292 c601c9        	ld	a,_square_sine_change_flag
3658  0295 4a            	dec	a
3659  0296 2704ac600360  	jrne	LC003
3660                     ; 1193 						if(PWM_mode.all_flag > 0)
3662  029c b627          	ld	a,_PWM_mode
3663  029e 2604ac8e038e  	jreq	L3632
3664                     ; 1194 							STOP_drive();
3666  02a4 cd1364        	call	_STOP_drive
3668  02a7 ac8e038e      	jra	L3632
3669                     ; 1197 						PWM_ALL_OFF();
3671  02ab               L7622:
3672                     ; 1201 					if(sys_state_flag.bit.brk_flag == 0)		//y42
3674  02ab 7202002b73    	btjt	_sys_state_flag,#1,L1032
3675                     ; 1203 						if(current_cmd_average > 0)
3677  02b0 be5c          	ldw	x,_current_cmd_average
3678  02b2 274b          	jreq	L3032
3679                     ; 1205 							if(running_alarm == 0)
3681  02b4 b61d          	ld	a,_running_alarm
3682  02b6 2636          	jrne	L5032
3683                     ; 1207 								if((ModeFlag == 0) && (sys_state_flag.bit.hall_exit > 0) && (square_sine_change_flag == 1))
3685  02b8 b63e          	ld	a,_ModeFlag
3686  02ba 2610          	jrne	L7032
3688  02bc 7207002b0b    	btjf	_sys_state_flag,#3,L7032
3690  02c1 c601c9        	ld	a,_square_sine_change_flag
3691  02c4 4a            	dec	a
3692  02c5 2605          	jrne	L7032
3693                     ; 1208 									SynchConSub();
3695  02c7 cd158b        	call	_SynchConSub
3698  02ca 201a          	jra	L1132
3699  02cc               L7032:
3700                     ; 1211 									if(motor_flag.all_flag != DRIVE_BIT)
3702  02cc b628          	ld	a,_motor_flag
3703  02ce 4a            	dec	a
3704  02cf 2712          	jreq	L3132
3705                     ; 1213 										pwm_duty_on_old = (pwm_duty_on_ini >> 1);
3707  02d1 ce0000        	ldw	x,_pwm_duty_on_ini
3708  02d4 54            	srlw	x
3709  02d5 bf5a          	ldw	_pwm_duty_on_old,x
3710                     ; 1214 										mode_360_count = 0;
3712  02d7 725f01c8      	clr	_mode_360_count
3713                     ; 1215 										tim2_6_flag = 0;
3715  02db 725f0000      	clr	_tim2_6_flag
3716                     ; 1216 										cvt_ver = 0;
3718  02df 5f            	clrw	x
3719  02e0 cf0000        	ldw	_cvt_ver,x
3720  02e3               L3132:
3721                     ; 1219 									motor_drive();	
3723  02e3 cd1350        	call	_motor_drive
3725  02e6               L1132:
3726                     ; 1221 								motor_flag.all_flag = DRIVE_BIT;
3728  02e6 35010028      	mov	_motor_flag,#1
3730  02ea ac8e038e      	jra	L3632
3731  02ee               L5032:
3732                     ; 1225 								if(square_sine_change_flag == 1)
3734  02ee c601c9        	ld	a,_square_sine_change_flag
3735  02f1 4a            	dec	a
3736  02f2 266c          	jrne	LC003
3737                     ; 1227 									if(PWM_mode.all_flag > 0)
3739  02f4 b627          	ld	a,_PWM_mode
3740  02f6 27f2          	jreq	L3632
3741                     ; 1228 										STOP_drive();
3743  02f8 cd1364        	call	_STOP_drive
3745  02fb ac8e038e      	jra	L3632
3746                     ; 1231 									PWM_ALL_OFF();	
3748  02ff               L3032:
3749                     ; 1245 							if(square_sine_change_flag == 1)
3751  02ff c601c9        	ld	a,_square_sine_change_flag
3752  0302 4a            	dec	a
3753  0303 260b          	jrne	L7232
3754                     ; 1247 								if(PWM_mode.all_flag > 0)
3756  0305 b627          	ld	a,_PWM_mode
3757  0307 27f2          	jreq	L3632
3758                     ; 1248 									STOP_drive();
3760  0309 cd1364        	call	_STOP_drive
3762  030c ac8e038e      	jra	L3632
3763  0310               L7232:
3764                     ; 1250 							else if((current_average1 > c_offset)||(speed_motor2 > 350))
3766  0310 b600          	ld	a,_current_average1
3767  0312 c10000        	cp	a,_c_offset
3768  0315 2207          	jrugt	L7332
3770  0317 be00          	ldw	x,_speed_motor2
3771  0319 a3015f        	cpw	x,#351
3772  031c 2536          	jrult	L7532
3773  031e               L7332:
3774                     ; 1251 									STOP_drive_sin();
3776  031e cd0d19        	call	_STOP_drive_sin
3779  0321 206b          	jra	L3632
3780                     ; 1254 								mode_360_count = 0;
3781                     ; 1255 								tim2_6_flag = 0;
3782                     ; 1256 								cvt_ver = 0;							
3783                     ; 1257 								PWM_ALL_OFF();
3785  0323               L1032:
3786                     ; 1272 						if((sys_state_flag.bit.brake_charge_flag > 0)&& (square_sine_change_flag == 1))
3788  0323 7205002b0f    	btjf	_sys_state_flag,#2,L5432
3790  0328 c601c9        	ld	a,_square_sine_change_flag
3791  032b 4a            	dec	a
3792  032c 2609          	jrne	L5432
3793                     ; 1274 							motor_brake();				//abs
3795  032e cd134b        	call	_motor_brake
3797                     ; 1276 							motor_flag.all_flag = ABS_BIT;
3799  0331 35020028      	mov	_motor_flag,#2
3801  0335 2057          	jra	L3632
3802  0337               L5432:
3803                     ; 1280 							motor_flag.all_flag = 0x00; 
3805  0337 3f28          	clr	_motor_flag
3806                     ; 1282 							if(square_sine_change_flag == 1)
3808  0339 c601c9        	ld	a,_square_sine_change_flag
3809  033c 4a            	dec	a
3810  033d 2609          	jrne	L1532
3811                     ; 1284 								if(PWM_mode.all_flag > 0)
3813  033f b627          	ld	a,_PWM_mode
3814  0341 274b          	jreq	L3632
3815                     ; 1285 									STOP_drive();
3817  0343 cd1364        	call	_STOP_drive
3819  0346 2046          	jra	L3632
3820  0348               L1532:
3821                     ; 1287 							else if(current_average1 > c_offset)	//
3823  0348 b600          	ld	a,_current_average1
3824  034a c10000        	cp	a,_c_offset
3825  034d 2305          	jrule	L7532
3826                     ; 1288 									STOP_drive_sin();
3828  034f cd0d19        	call	_STOP_drive_sin
3831  0352 203a          	jra	L3632
3832  0354               L7532:
3833                     ; 1291 									mode_360_count = 0;
3835                     ; 1292 									tim2_6_flag = 0;
3837                     ; 1293 									cvt_ver = 0;							
3840  0354 725f01c8      	clr	_mode_360_count
3842  0358 725f0000      	clr	_tim2_6_flag
3844  035c 5f            	clrw	x
3845  035d cf0000        	ldw	_cvt_ver,x
3846                     ; 1294 									PWM_ALL_OFF();
3848  0360               LC003:
3852  0360 cd12ee        	call	_PWM_ALL_OFF
3854  0363 2029          	jra	L3632
3855  0365               L5622:
3856                     ; 1302 				if(square_sine_change_flag == 1)
3858  0365 c601c9        	ld	a,_square_sine_change_flag
3859  0368 4a            	dec	a
3860  0369 2612          	jrne	L5632
3861                     ; 1304 					if(error_bank.bit.current_flow_flag == 0)
3863  036b 720000300b    	btjt	_error_bank+2,#0,L7632
3864                     ; 1306 						if(motor_alm_status_lock == 1)
3866  0370 c601d0        	ld	a,_motor_alm_status_lock
3867  0373 4a            	dec	a
3868  0374 2607          	jrne	L5632
3869                     ; 1307 								motor_lock_drive();
3871  0376 cd13d9        	call	_motor_lock_drive
3874  0379 2011          	jra	L7732
3875                     ; 1314 								mode_360_count = 0;
3876                     ; 1315 								tim2_6_flag = 0;
3877                     ; 1316 								cvt_ver = 0;							
3878                     ; 1317 								PWM_ALL_OFF();
3880  037b               L7632:
3881                     ; 1322 						alarm_switch = 0;
3883  037b 3f3c          	clr	_alarm_switch
3884                     ; 1323 						mode_360_count = 0;
3885                     ; 1324 						tim2_6_flag = 0;
3886                     ; 1325 						cvt_ver = 0;							
3887                     ; 1326 						PWM_ALL_OFF();
3889  037d               L5632:
3890                     ; 1331 						mode_360_count = 0;
3892                     ; 1332 						tim2_6_flag = 0;
3894                     ; 1333 						cvt_ver = 0;							
3896                     ; 1334 						PWM_ALL_OFF();
3900  037d 725f01c8      	clr	_mode_360_count
3903  0381 725f0000      	clr	_tim2_6_flag
3906  0385 5f            	clrw	x
3907  0386 cf0000        	ldw	_cvt_ver,x
3910  0389 cd12ee        	call	_PWM_ALL_OFF
3912  038c               L7732:
3913                     ; 1336 				motor_flag.all_flag = 0x00;
3915  038c 3f28          	clr	_motor_flag
3916  038e               L3632:
3917                     ; 1339 			adc_sample();					//12,16,20,24
3919  038e cd0000        	call	_adc_sample
3921                     ; 1341 			if(sys_step >= 63)						//4ms
3923  0391 b600          	ld	a,_sys_step
3924  0393 a13f          	cp	a,#63
3925  0395 2508          	jrult	L1042
3926                     ; 1343 				sys_step = 0xff;
3928  0397 35ff0000      	mov	_sys_step,#255
3929                     ; 1344 				WDT_FLASH();    //刷新WDT
3931  039b 35aa50e0      	mov	_IWDG_KR,#170
3932  039f               L1042:
3933                     ; 1348 			sys_step ++;
3935  039f 3c00          	inc	_sys_step
3936                     ; 1351 		if(send_data_flag == 1)/*((send_data_time > 10) || (send_data_flag > 0))*/
3938  03a1 c601a7        	ld	a,_send_data_flag
3939  03a4 4a            	dec	a
3940  03a5 2606          	jrne	L3042
3941                     ; 1353 			tx_sum_load();
3943  03a7 cd0883        	call	_tx_sum_load
3945                     ; 1354 			uart_send_main();
3947  03aa cd0489        	call	_uart_send_main
3949  03ad               L3042:
3950                     ; 1358 		if((UART2_SR & 0x20) > 0)//xz
3952  03ad 720b524030    	btjf	_UART2_SR,#5,L7771
3953                     ; 1360 			data_rx_temp[data_rx_number] = UART2_DR;//
3955  03b2 c6001e        	ld	a,_data_rx_number
3956  03b5 5f            	clrw	x
3957  03b6 97            	ld	xl,a
3958  03b7 c65241        	ld	a,_UART2_DR
3959  03ba d701ba        	ld	(_data_rx_temp,x),a
3960                     ; 1361 			/**/if(data_rx_number == 0)
3962  03bd c6001e        	ld	a,_data_rx_number
3963  03c0 2611          	jrne	L7042
3964                     ; 1363 				if((data_rx_temp[0] != 0x46) && (data_rx_temp[0] != 0x53))//0x3a
3966  03c2 c601ba        	ld	a,_data_rx_temp
3967  03c5 a146          	cp	a,#70
3968  03c7 270a          	jreq	L7042
3970  03c9 a153          	cp	a,#83
3971  03cb 2706          	jreq	L7042
3972                     ; 1365 					data_rx_number = 0;
3974  03cd 725f001e      	clr	_data_rx_number
3975                     ; 1366 					return;
3977  03d1 200f          	jra	L7771
3978  03d3               L7042:
3979                     ; 1369 			if((data_rx_temp[0] == 0x46) || (data_rx_temp[0] == 0x53))//0x3a
3981  03d3 c601ba        	ld	a,_data_rx_temp
3982  03d6 a146          	cp	a,#70
3983  03d8 2704          	jreq	L5142
3985  03da a153          	cp	a,#83
3986  03dc 2604          	jrne	L7771
3987  03de               L5142:
3988                     ; 1370 				data_rx_number++;//
3990  03de 725c001e      	inc	_data_rx_number
3991  03e2               L7771:
3992                     ; 1381  	return;
3995  03e2 85            	popw	x
3996  03e3 bf00          	ldw	c_lreg,x
3997  03e5 85            	popw	x
3998  03e6 bf02          	ldw	c_lreg+2,x
3999  03e8 85            	popw	x
4000  03e9 bf00          	ldw	c_y,x
4001  03eb 320002        	pop	c_y+2
4002  03ee 85            	popw	x
4003  03ef bf00          	ldw	c_x,x
4004  03f1 320002        	pop	c_x+2
4005  03f4 80            	iret	
4033                     ; 1387 void light_on_off_fun(void)
4033                     ; 1388 {
4035                     	switch	.text
4036  03f5               _light_on_off_fun:
4040                     ; 1389 	if((data_rx[1] & 0x80) > 0)//lamp if((data_rx[1] & 0x01) > 0)
4042  03f5 720f01b518    	btjf	_data_rx+1,#7,L7242
4043                     ; 1391 		LAMP_ON();
4045  03fa 721a5000      	bset	_PA_ODR,#5
4046                     ; 1392 		if(sys_state_flag.bit.brk_flag > 0)BRAKE_LIGHT_ON();
4048  03fe 7203002b02    	btjf	_sys_state_flag,#1,L1342
4051  0403 2007          	jp	L5342
4052  0405               L1342:
4053                     ; 1395 			if((PD_ODR & 0x01) > 0)BRAKE_LIGHT_OFF();
4055  0405 7201500f02    	btjf	_PD_ODR,#0,L5342
4058  040a 2018          	jp	L3442
4059  040c               L5342:
4060                     ; 1396 			else BRAKE_LIGHT_ON();
4064  040c 7210500f      	bset	_PD_ODR,#0
4065  0410 2016          	jra	L1442
4066  0412               L7242:
4067                     ; 1401 		LAMP_OFF();
4069  0412 721b5000      	bres	_PA_ODR,#5
4070                     ; 1402 		if(sys_state_flag.bit.brk_flag > 0)
4072  0416 7203002b09    	btjf	_sys_state_flag,#1,L3442
4073                     ; 1404 			if((PD_ODR & 0x01) > 0)BRAKE_LIGHT_OFF();
4075  041b 7201500f02    	btjf	_PD_ODR,#0,L5442
4078  0420 2002          	jp	L3442
4079  0422               L5442:
4080                     ; 1405 			else BRAKE_LIGHT_ON();
4081  0422 20e8          	jp	L5342
4082  0424               L3442:
4083                     ; 1407 		else BRAKE_LIGHT_OFF();
4087  0424 7211500f      	bres	_PD_ODR,#0
4088  0428               L1442:
4089                     ; 1410 	if((data_rx[1] & 0x20) > 0)RIGHT_LIGHT_ON();
4091  0428 720b01b506    	btjf	_data_rx+1,#5,L3542
4094  042d 721c5014      	bset	_PE_ODR,#6
4096  0431 2004          	jra	L5542
4097  0433               L3542:
4098                     ; 1411 	else RIGHT_LIGHT_OFF();
4100  0433 721d5014      	bres	_PE_ODR,#6
4101  0437               L5542:
4102                     ; 1413 	if((data_rx[1] & 0x40) > 0)LEFT_LIGHT_ON();
4104  0437 720d01b505    	btjf	_data_rx+1,#6,L7542
4107  043c 7210501e      	bset	_PG_ODR,#0
4110  0440 81            	ret	
4111  0441               L7542:
4112                     ; 1414 	else LEFT_LIGHT_OFF();
4114  0441 7211501e      	bres	_PG_ODR,#0
4115                     ; 1415 }
4118  0445 81            	ret	
4147                     ; 1419 void speed_limit_data_load(void)
4147                     ; 1420 {	
4148                     	switch	.text
4149  0446               _speed_limit_data_load:
4153                     ; 1421 	if(wheel == 0)wheel = 20;//wheel = 26;//
4155  0446 c60012        	ld	a,_wheel
4156  0449 2605          	jrne	L3742
4159  044b a614          	ld	a,#20
4160  044d c70012        	ld	_wheel,a
4161  0450               L3742:
4162                     ; 1422 	if((max_speed_limit == 0) || ((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0)))
4164  0450 725d01f6      	tnz	_max_speed_limit
4165  0454 270c          	jreq	L7742
4167  0456 be00          	ldw	x,_control_temp
4168  0458 a300f6        	cpw	x,#246
4169  045b 2512          	jrult	L5742
4171  045d 720c002b0d    	btjt	_sys_state_flag,#6,L5742
4172  0462               L7742:
4173                     ; 1424 		limit_speed_hall_1 = 60 * wheel / 32;
4175  0462 97            	ld	xl,a
4176  0463 a63c          	ld	a,#60
4177  0465 42            	mul	x,a
4178  0466 a620          	ld	a,#32
4179  0468 cd0000        	call	c_sdivx
4182  046b               L1052:
4183  046b cf01ab        	ldw	_limit_speed_hall_1,x
4184                     ; 1429 }
4187  046e 81            	ret	
4188  046f               L5742:
4189                     ; 1427 		limit_speed_hall_1 = 60 * wheel / max_speed_limit;
4191  046f 97            	ld	xl,a
4192  0470 a63c          	ld	a,#60
4193  0472 42            	mul	x,a
4194  0473 c601f6        	ld	a,_max_speed_limit
4195  0476 905f          	clrw	y
4196  0478 9097          	ld	yl,a
4197  047a cd0000        	call	c_idiv
4199  047d 20ec          	jra	L1052
4223                     ; 1432 unsigned char chk_sendbus(void)
4223                     ; 1433 {
4224                     	switch	.text
4225  047f               _chk_sendbus:
4229                     ; 1434 	if(UART2_SR & 0x80)
4231  047f 720f524003    	btjf	_UART2_SR,#7,L3152
4232                     ; 1436 		return 1;
4234  0484 a601          	ld	a,#1
4237  0486 81            	ret	
4238  0487               L3152:
4239                     ; 1439 		return 0;
4241  0487 4f            	clr	a
4244  0488 81            	ret	
4273                     ; 1442 void uart_send_main(void)
4273                     ; 1443 {
4274                     	switch	.text
4275  0489               _uart_send_main:
4279                     ; 1444 	if(chk_sendbus() > 0)
4281  0489 adf4          	call	_chk_sendbus
4283  048b 4d            	tnz	a
4284  048c 271f          	jreq	L7252
4285                     ; 1446 		UART2_DR = data_tx[time_100ms];
4287  048e ce011e        	ldw	x,_time_100ms
4288  0491 d60016        	ld	a,(_data_tx,x)
4289  0494 c75241        	ld	_UART2_DR,a
4290                     ; 1447 		if(time_100ms < 7) time_100ms += 1;//12
4292  0497 a30007        	cpw	x,#7
4293  049a 2405          	jruge	L1352
4296  049c 5c            	incw	x
4297  049d cf011e        	ldw	_time_100ms,x
4300  04a0 81            	ret	
4301  04a1               L1352:
4302                     ; 1450 			time_100ms = 0;
4304  04a1 5f            	clrw	x
4305  04a2 cf011e        	ldw	_time_100ms,x
4306                     ; 1451 			send_data_time = 0;
4308  04a5 725f0117      	clr	_send_data_time
4309                     ; 1452 			send_data_flag = 0;
4311  04a9 725f01a7      	clr	_send_data_flag
4312  04ad               L7252:
4313                     ; 1455 }
4316  04ad 81            	ret	
4348                     ; 1458 void LJ_zero_error_chk(void)
4348                     ; 1459 {
4349                     	switch	.text
4350  04ae               _LJ_zero_error_chk:
4354                     ; 1460 	if(sys_state_flag.bit.lj_zero_chk_flag == 0)
4356  04ae 7202002c5c    	btjt	_sys_state_flag+1,#1,L5452
4357                     ; 1462 		if(current_ph_lj_time < 437)current_ph_lj_time ++;
4359  04b3 ce0000        	ldw	x,_current_ph_lj_time
4360  04b6 a301b5        	cpw	x,#437
4361  04b9 2404          	jruge	L7452
4364  04bb 5c            	incw	x
4365  04bc cf0000        	ldw	_current_ph_lj_time,x
4366  04bf               L7452:
4367                     ; 1463 		if(current_ph_lj_time < 420)control_lj_zero_table[1] = 0;
4369  04bf a301a4        	cpw	x,#420
4370  04c2 2407          	jruge	L1552
4373  04c4 5f            	clrw	x
4374  04c5 cf0002        	ldw	_control_lj_zero_table+2,x
4375  04c8 ce0000        	ldw	x,_current_ph_lj_time
4376  04cb               L1552:
4377                     ; 1464 		if((current_ph_lj_time > 420) && (current_ph_lj_time <= 436))
4379  04cb a301a5        	cpw	x,#421
4380  04ce 251a          	jrult	L3552
4382  04d0 a301b5        	cpw	x,#437
4383  04d3 2415          	jruge	L3552
4384                     ; 1466 			control_lj_zero_table[1] += control_lj_temp_table[1];
4386  04d5 ce0002        	ldw	x,_control_lj_zero_table+2
4387  04d8 72bb0002      	addw	x,_control_lj_temp_table+2
4388  04dc cf0002        	ldw	_control_lj_zero_table+2,x
4389                     ; 1467 			lj_ad_app_old = control_lj_temp_table[1];
4391  04df ce0002        	ldw	x,_control_lj_temp_table+2
4392  04e2 cf000b        	ldw	_lj_ad_app_old,x
4393                     ; 1468 			lj_speed_start_time = 0;
4395  04e5 725f000f      	clr	_lj_speed_start_time
4398  04e9 81            	ret	
4399  04ea               L3552:
4400                     ; 1472 			control_lj_zero_table[0] = (control_lj_zero_table[1] >> 4);//+ 10;
4402  04ea ce0002        	ldw	x,_control_lj_zero_table+2
4403  04ed 54            	srlw	x
4404  04ee 54            	srlw	x
4405  04ef 54            	srlw	x
4406  04f0 54            	srlw	x
4407  04f1 cf0000        	ldw	_control_lj_zero_table,x
4408                     ; 1473 			control_lj_zero_table[1] = control_lj_zero_table[0];//error check
4410  04f4 cf0002        	ldw	_control_lj_zero_table+2,x
4411                     ; 1474 			if((error_bank.bit.LJ_flag == 0) && (control_lj_zero_table[0] > 0))
4413  04f7 7208002f09    	btjt	_error_bank+1,#4,L7552
4415  04fc ce0000        	ldw	x,_control_lj_zero_table
4416  04ff 2704          	jreq	L7552
4417                     ; 1475 				sys_state_flag.bit.lj_zero_chk_flag = 1;
4419  0501 7212002c      	bset	_sys_state_flag+1,#1
4420  0505               L7552:
4421                     ; 1476 			lj_zero_auto_corrent_count = 0;
4423  0505 5f            	clrw	x
4424  0506 cf0000        	ldw	_lj_zero_auto_corrent_count,x
4425                     ; 1477 			lj_ad_app_last = control_lj_zero_table[0];
4427  0509 ce0000        	ldw	x,_control_lj_zero_table
4428  050c cf01eb        	ldw	_lj_ad_app_last,x
4429  050f               L5452:
4430                     ; 1499 }
4433  050f 81            	ret	
4472                     	switch	.const
4473  003d               L271:
4474  003d 00000005      	dc.l	5
4475                     ; 1505 void lj_chk(void)//153
4475                     ; 1506 {	
4476                     	switch	.text
4477  0510               _lj_chk:
4479  0510 5208          	subw	sp,#8
4480       00000008      OFST:	set	8
4483                     ; 1507 	if(/*(sys_state_flag.bit.spt_flag > 0) &&*/ (error_bank.bit.LJ_flag == 0) && (run_mode == 0) && (current_ph_lj_time > 436) && 
4483                     ; 1508 	((control_lj_temp_table[1] > (control_lj_zero_table[0] + 153))  || ((sys_state_flag.bit.spt_flag > 0) && ((control_lj_temp_table[1] > (control_lj_zero_table[0] + 30)) || (sys_state_flag.bit.lj_flag > 0) || (lj_ad_app_change > 10)))))
4485  0512 7209002f03cc  	btjt	_error_bank+1,#4,L1752
4487  051a c601db        	ld	a,_run_mode
4488  051d 26f8          	jrne	L1752
4490  051f ce0000        	ldw	x,_current_ph_lj_time
4491  0522 a301b5        	cpw	x,#437
4492  0525 25f0          	jrult	L1752
4494  0527 ce0000        	ldw	x,_control_lj_zero_table
4495  052a 1c0099        	addw	x,#153
4496  052d c30002        	cpw	x,_control_lj_temp_table+2
4497  0530 251d          	jrult	L3752
4499  0532 7205002ce0    	btjf	_sys_state_flag+1,#2,L1752
4501  0537 ce0000        	ldw	x,_control_lj_zero_table
4502  053a 1c001e        	addw	x,#30
4503  053d c30002        	cpw	x,_control_lj_temp_table+2
4504  0540 250d          	jrult	L3752
4506  0542 7200002c08    	btjt	_sys_state_flag+1,#0,L3752
4508  0547 ce01e9        	ldw	x,_lj_ad_app_change
4509  054a a3000b        	cpw	x,#11
4510  054d 25c8          	jrult	L1752
4511  054f               L3752:
4512                     ; 1511 			if(control_lj_temp_table[1] > control_lj_zero_table[0])
4514  054f ce0002        	ldw	x,_control_lj_temp_table+2
4515  0552 c30000        	cpw	x,_control_lj_zero_table
4516  0555 232c          	jrule	L1062
4517                     ; 1513 				control_lj_temp_table[0] = control_lj_temp_table[1] - control_lj_zero_table[0];
4519  0557 72b00000      	subw	x,_control_lj_zero_table
4520  055b cf0000        	ldw	_control_lj_temp_table,x
4521                     ; 1514 				current_ph_lj_old = (control_lj_temp_table[0] >> 1)  + (control_lj_temp_table[0] >> 3) + (data_rx_dang >> 1);//(control_lj_temp_table[0] >> 2) + (control_lj_temp_table[0] >> 3);
4523  055e c6012a        	ld	a,_data_rx_dang
4524  0561 44            	srl	a
4525  0562 5f            	clrw	x
4526  0563 97            	ld	xl,a
4527  0564 1f07          	ldw	(OFST-1,sp),x
4529  0566 ce0000        	ldw	x,_control_lj_temp_table
4530  0569 54            	srlw	x
4531  056a 54            	srlw	x
4532  056b 54            	srlw	x
4533  056c 1f05          	ldw	(OFST-3,sp),x
4535  056e ce0000        	ldw	x,_control_lj_temp_table
4536  0571 54            	srlw	x
4537  0572 72fb05        	addw	x,(OFST-3,sp)
4538  0575 72fb07        	addw	x,(OFST-1,sp)
4539  0578 cd0000        	call	c_uitolx
4541  057b ae0000        	ldw	x,#_current_ph_lj_old
4542  057e cd0000        	call	c_rtol
4545  0581 200a          	jra	L3062
4546  0583               L1062:
4547                     ; 1520 				current_ph_lj_old = 1;
4549  0583 ae0001        	ldw	x,#1
4550  0586 cf0002        	ldw	_current_ph_lj_old+2,x
4551  0589 5f            	clrw	x
4552  058a cf0000        	ldw	_current_ph_lj_old,x
4553  058d               L3062:
4554                     ; 1523 			current_ph_lj = current_ph_lj_old;
4556  058d ce0002        	ldw	x,_current_ph_lj_old+2
4557  0590 cf0002        	ldw	_current_ph_lj+2,x
4558  0593 ce0000        	ldw	x,_current_ph_lj_old
4559  0596 cf0000        	ldw	_current_ph_lj,x
4560                     ; 1540 					if(bb_candence > 10)//10
4562  0599 ce01dc        	ldw	x,_bb_candence
4563  059c a3000b        	cpw	x,#11
4564  059f ce01e0        	ldw	x,_bike_rpm
4565  05a2 2522          	jrult	L5062
4566                     ; 1541 						current_ph_lj = (current_ph_lj * bb_candence) / bike_rpm;
4568  05a4 cd0000        	call	c_uitolx
4570  05a7 96            	ldw	x,sp
4571  05a8 1c0005        	addw	x,#OFST-3
4572  05ab cd0000        	call	c_rtol
4575  05ae ce01dc        	ldw	x,_bb_candence
4576  05b1 cd0000        	call	c_uitolx
4578  05b4 96            	ldw	x,sp
4579  05b5 5c            	incw	x
4580  05b6 cd0000        	call	c_rtol
4583  05b9 ae0000        	ldw	x,#_current_ph_lj
4584  05bc cd0000        	call	c_ltor
4586  05bf 96            	ldw	x,sp
4587  05c0 5c            	incw	x
4588  05c1 cd0000        	call	c_lmul
4593  05c4 2015          	jra	L7062
4594  05c6               L5062:
4595                     ; 1543 						current_ph_lj = (current_ph_lj * 10) / bike_rpm;//
4597  05c6 cd0000        	call	c_uitolx
4599  05c9 96            	ldw	x,sp
4600  05ca 1c0005        	addw	x,#OFST-3
4601  05cd cd0000        	call	c_rtol
4604  05d0 ae0000        	ldw	x,#_current_ph_lj
4605  05d3 cd0000        	call	c_ltor
4607  05d6 a60a          	ld	a,#10
4608  05d8 cd0000        	call	c_smul
4612  05db               L7062:
4613  05db 96            	ldw	x,sp
4614  05dc 1c0005        	addw	x,#OFST-3
4615  05df cd0000        	call	c_ludv
4616  05e2 ae0000        	ldw	x,#_current_ph_lj
4617  05e5 cd0000        	call	c_rtol
4618                     ; 1563 		  current_ph_lj = ((current_ph_lj * torque_level) >> 6);	//
4620  05e8 5501f40003    	mov	c_lreg+3,_torque_level
4621  05ed 3f02          	clr	c_lreg+2
4622  05ef 3f01          	clr	c_lreg+1
4623  05f1 3f00          	clr	c_lreg
4624  05f3 96            	ldw	x,sp
4625  05f4 1c0005        	addw	x,#OFST-3
4626  05f7 cd0000        	call	c_rtol
4629  05fa ae0000        	ldw	x,#_current_ph_lj
4630  05fd cd0000        	call	c_ltor
4632  0600 96            	ldw	x,sp
4633  0601 1c0005        	addw	x,#OFST-3
4634  0604 cd0000        	call	c_lmul
4636  0607 a606          	ld	a,#6
4637  0609 cd0000        	call	c_lursh
4639  060c ae0000        	ldw	x,#_current_ph_lj
4640  060f cd0000        	call	c_rtol
4642                     ; 1565 			if(current_ph_lj > user_Prdata.byte.current_adj)current_ph_lj = user_Prdata.byte.current_adj;
4644  0612 be02          	ldw	x,_user_Prdata+2
4645  0614 cd0000        	call	c_uitolx
4647  0617 ae0000        	ldw	x,#_current_ph_lj
4648  061a cd0000        	call	c_lcmp
4650  061d 240d          	jruge	L1162
4653  061f be02          	ldw	x,_user_Prdata+2
4654  0621 cd0000        	call	c_uitolx
4656  0624 ae0000        	ldw	x,#_current_ph_lj
4657  0627 cd0000        	call	c_rtol
4660  062a 2015          	jra	L3162
4661  062c               L1162:
4662                     ; 1566 			else if(current_ph_lj < 5)current_ph_lj = 5;
4664  062c cd0000        	call	c_ltor
4666  062f ae003d        	ldw	x,#L271
4667  0632 cd0000        	call	c_lcmp
4669  0635 240a          	jruge	L3162
4672  0637 ae0005        	ldw	x,#5
4673  063a cf0002        	ldw	_current_ph_lj+2,x
4674  063d 5f            	clrw	x
4675  063e cf0000        	ldw	_current_ph_lj,x
4676  0641               L3162:
4677                     ; 1569 		  sys_state_flag.bit.lj_flag = 1;
4679  0641 7210002c      	bset	_sys_state_flag+1,#0
4681  0645 201b          	jra	L7162
4682  0647               L1752:
4683                     ; 1590 		current_ph_lj = 0;
4685  0647 5f            	clrw	x
4686  0648 cf0002        	ldw	_current_ph_lj+2,x
4687  064b cf0000        	ldw	_current_ph_lj,x
4688                     ; 1591 		current_ph_lj_old = 0;
4690  064e cf0002        	ldw	_current_ph_lj_old+2,x
4691  0651 cf0000        	ldw	_current_ph_lj_old,x
4692                     ; 1592 		current_ph_lj_delta = 0;
4694  0654 cf0000        	ldw	_current_ph_lj_delta,x
4695                     ; 1593 		sys_state_flag.bit.lj_flag = 0;
4697  0657 7211002c      	bres	_sys_state_flag+1,#0
4698                     ; 1594 		control_lj_temp_table[0] = 0;
4700  065b cf0000        	ldw	_control_lj_temp_table,x
4701                     ; 1595 		zero_start_number = 0;
4703  065e 725f0005      	clr	_zero_start_number
4704  0662               L7162:
4705                     ; 1600 }
4708  0662 5b08          	addw	sp,#8
4709  0664 81            	ret	
4738                     ; 1602 void hall_speed_chk(void)
4738                     ; 1603 {
4739                     	switch	.text
4740  0665               _hall_speed_chk:
4742  0665 5204          	subw	sp,#4
4743       00000004      OFST:	set	4
4746                     ; 1606 	limit_speed_hall_old = (speed_motor2 << 3) / 3 + (hall_speed_motor2_old << 3) / 3 + (hall_speed_motor2_old1 << 3) / 3;
4748  0667 ce0178        	ldw	x,_hall_speed_motor2_old1
4749  066a 58            	sllw	x
4750  066b 58            	sllw	x
4751  066c 58            	sllw	x
4752  066d a603          	ld	a,#3
4753  066f 62            	div	x,a
4754  0670 1f03          	ldw	(OFST-1,sp),x
4756  0672 ce017a        	ldw	x,_hall_speed_motor2_old
4757  0675 58            	sllw	x
4758  0676 58            	sllw	x
4759  0677 58            	sllw	x
4760  0678 a603          	ld	a,#3
4761  067a 62            	div	x,a
4762  067b 1f01          	ldw	(OFST-3,sp),x
4764  067d be00          	ldw	x,_speed_motor2
4765  067f 58            	sllw	x
4766  0680 58            	sllw	x
4767  0681 58            	sllw	x
4768  0682 a603          	ld	a,#3
4769  0684 62            	div	x,a
4770  0685 72fb01        	addw	x,(OFST-3,sp)
4771  0688 72fb03        	addw	x,(OFST-1,sp)
4772  068b cf0125        	ldw	_limit_speed_hall_old,x
4773                     ; 1607 	hall_speed_motor2_old =  speed_motor2 ;
4775  068e be00          	ldw	x,_speed_motor2
4776  0690 cf017a        	ldw	_hall_speed_motor2_old,x
4777                     ; 1608 	hall_speed_motor2_old1 = hall_speed_motor2_old;
4779  0693 cf0178        	ldw	_hall_speed_motor2_old1,x
4780                     ; 1609   if(limit_speed_hall_temp > limit_speed_hall_old)
4782  0696 ce0123        	ldw	x,_limit_speed_hall_temp
4783  0699 c30125        	cpw	x,_limit_speed_hall_old
4784  069c 2328          	jrule	L1362
4785                     ; 1611 		limit_speed_hall_delta = limit_speed_hall_temp - limit_speed_hall_old;
4787  069e 72b00125      	subw	x,_limit_speed_hall_old
4788  06a2 cf01a9        	ldw	_limit_speed_hall_delta,x
4789                     ; 1612 		if(limit_speed_hall_delta > 7)//
4791  06a5 a30008        	cpw	x,#8
4792  06a8 2516          	jrult	L3362
4793                     ; 1614 			limit_speed_hall_delta >>= 3;
4795  06aa a603          	ld	a,#3
4796  06ac               L671:
4797  06ac 725401a9      	srl	_limit_speed_hall_delta
4798  06b0 725601aa      	rrc	_limit_speed_hall_delta+1
4799  06b4 4a            	dec	a
4800  06b5 26f5          	jrne	L671
4801                     ; 1615 			limit_speed_hall_temp -= limit_speed_hall_delta;
4803  06b7 ce0123        	ldw	x,_limit_speed_hall_temp
4804  06ba 72b001a9      	subw	x,_limit_speed_hall_delta
4806  06be 2034          	jp	LC007
4807  06c0               L3362:
4808                     ; 1617 		else limit_speed_hall_temp --;
4810  06c0 ce0123        	ldw	x,_limit_speed_hall_temp
4811  06c3 5a            	decw	x
4812  06c4 202e          	jp	LC007
4813  06c6               L1362:
4814                     ; 1619 	else if(limit_speed_hall_temp < limit_speed_hall_old)
4816  06c6 c30125        	cpw	x,_limit_speed_hall_old
4817  06c9 242c          	jruge	L7362
4818                     ; 1621 		limit_speed_hall_delta = limit_speed_hall_old - limit_speed_hall_temp;
4820  06cb ce0125        	ldw	x,_limit_speed_hall_old
4821  06ce 72b00123      	subw	x,_limit_speed_hall_temp
4822  06d2 cf01a9        	ldw	_limit_speed_hall_delta,x
4823                     ; 1622 		if(limit_speed_hall_delta > 7)//
4825  06d5 a30008        	cpw	x,#8
4826  06d8 2516          	jrult	L3462
4827                     ; 1624 			limit_speed_hall_delta >>= 3;
4829  06da a603          	ld	a,#3
4830  06dc               L002:
4831  06dc 725401a9      	srl	_limit_speed_hall_delta
4832  06e0 725601aa      	rrc	_limit_speed_hall_delta+1
4833  06e4 4a            	dec	a
4834  06e5 26f5          	jrne	L002
4835                     ; 1625 			limit_speed_hall_temp += limit_speed_hall_delta;
4837  06e7 ce0123        	ldw	x,_limit_speed_hall_temp
4838  06ea 72bb01a9      	addw	x,_limit_speed_hall_delta
4840  06ee 2004          	jp	LC007
4841  06f0               L3462:
4842                     ; 1627 		else limit_speed_hall_temp ++;
4844  06f0 ce0123        	ldw	x,_limit_speed_hall_temp
4845  06f3 5c            	incw	x
4846  06f4               LC007:
4847  06f4 cf0123        	ldw	_limit_speed_hall_temp,x
4848  06f7               L7362:
4849                     ; 1629 }
4852  06f7 5b04          	addw	sp,#4
4853  06f9 81            	ret	
4880                     ; 1632 void hall_speed_limit(void)
4880                     ; 1633 {	
4881                     	switch	.text
4882  06fa               _hall_speed_limit:
4886                     ; 1634 		if(limit_speed_hall_temp < limit_speed_hall_1)//
4888  06fa ce0123        	ldw	x,_limit_speed_hall_temp
4889  06fd c301ab        	cpw	x,_limit_speed_hall_1
4890  0700 2440          	jruge	L7562
4891                     ; 1636 		if(limit_current_speed > pwm_duty_on_old)limit_current_speed = pwm_duty_on_old;
4893  0702 ce01ad        	ldw	x,_limit_current_speed
4894  0705 b35a          	cpw	x,_pwm_duty_on_old
4895  0707 2305          	jrule	L1662
4898  0709 be5a          	ldw	x,_pwm_duty_on_old
4899  070b cf01ad        	ldw	_limit_current_speed,x
4900  070e               L1662:
4901                     ; 1637 		if((limit_current_speed > ((limit_speed_hall_1 - limit_speed_hall_temp) >> 3)) && ((limit_speed_hall_1 - limit_speed_hall_temp ) >= 8))limit_current_speed = limit_current_speed - ((limit_speed_hall_1 - limit_speed_hall_temp ) >> 3);
4903  070e ce01ab        	ldw	x,_limit_speed_hall_1
4904  0711 72b00123      	subw	x,_limit_speed_hall_temp
4905  0715 54            	srlw	x
4906  0716 54            	srlw	x
4907  0717 54            	srlw	x
4908  0718 c301ad        	cpw	x,_limit_current_speed
4909  071b 241d          	jruge	L3662
4911  071d ce01ab        	ldw	x,_limit_speed_hall_1
4912  0720 72b00123      	subw	x,_limit_speed_hall_temp
4913  0724 a30008        	cpw	x,#8
4914  0727 2511          	jrult	L3662
4917  0729 ce01ab        	ldw	x,_limit_speed_hall_1
4918  072c 72b00123      	subw	x,_limit_speed_hall_temp
4919  0730 54            	srlw	x
4920  0731 54            	srlw	x
4921  0732 54            	srlw	x
4922  0733 72b001ad      	subw	x,_limit_current_speed
4923  0737 50            	negw	x
4925  0738 2028          	jp	LC008
4926  073a               L3662:
4927                     ; 1638 		else if(limit_current_speed > 0)limit_current_speed --;
4929  073a ce01ad        	ldw	x,_limit_current_speed
4930  073d 2726          	jreq	L1762
4933  073f 5a            	decw	x
4934  0740 2020          	jp	LC008
4935  0742               L7562:
4936                     ; 1641 	else if(limit_speed_hall_temp > limit_speed_hall_1)//
4938  0742 c301ab        	cpw	x,_limit_speed_hall_1
4939  0745 231e          	jrule	L1762
4940                     ; 1643 		if((limit_speed_hall_temp - limit_speed_hall_1) >= 2)limit_current_speed = limit_current_speed + ((limit_speed_hall_temp - limit_speed_hall_1) >> 1);
4942  0747 72b001ab      	subw	x,_limit_speed_hall_1
4943  074b a30002        	cpw	x,#2
4944  074e 250e          	jrult	L5762
4947  0750 ce0123        	ldw	x,_limit_speed_hall_temp
4948  0753 72b001ab      	subw	x,_limit_speed_hall_1
4949  0757 54            	srlw	x
4950  0758 72bb01ad      	addw	x,_limit_current_speed
4952  075c 2004          	jp	LC008
4953  075e               L5762:
4954                     ; 1644 		else limit_current_speed ++;		
4956  075e ce01ad        	ldw	x,_limit_current_speed
4957  0761 5c            	incw	x
4958  0762               LC008:
4959  0762 cf01ad        	ldw	_limit_current_speed,x
4960  0765               L1762:
4961                     ; 1646 	if(limit_current_speed < 60)limit_current_speed = 60;//60
4963  0765 ce01ad        	ldw	x,_limit_current_speed
4964  0768 a3003c        	cpw	x,#60
4965  076b 2405          	jruge	L1072
4968  076d ae003c        	ldw	x,#60
4970  0770 2008          	jp	LC009
4971  0772               L1072:
4972                     ; 1647 	else if(limit_current_speed > 280)limit_current_speed = 280;//60
4974  0772 a30119        	cpw	x,#281
4975  0775 2506          	jrult	L3072
4978  0777 ae0118        	ldw	x,#280
4979  077a               LC009:
4980  077a cf01ad        	ldw	_limit_current_speed,x
4981  077d               L3072:
4982                     ; 1649 }
4985  077d 81            	ret	
5010                     ; 1651 void current_load(void)//
5010                     ; 1652 {
5011                     	switch	.text
5012  077e               _current_load:
5016                     ; 1653 	if(current_average1 > 0) data_tx[2] = current_average1;//(current_average1 >> 1);
5018  077e b600          	ld	a,_current_average1
5019  0780 2706          	jreq	L7172
5022  0782 5500000018    	mov	_data_tx+2,_current_average1
5025  0787 81            	ret	
5026  0788               L7172:
5027                     ; 1654 	else data_tx[2] = 0;
5029  0788 c70018        	ld	_data_tx+2,a
5030                     ; 1655 }
5033  078b 81            	ret	
5059                     ; 1657 void controller_state_load(void)//
5059                     ; 1658 {
5060                     	switch	.text
5061  078c               _controller_state_load:
5065                     ; 1659 	if(speed_motor2 < 500 )data_tx[2] |= 0x04;
5067  078c be00          	ldw	x,_speed_motor2
5068  078e a301f4        	cpw	x,#500
5069  0791 2405          	jruge	L3372
5072  0793 72140018      	bset	_data_tx+2,#2
5075  0797 81            	ret	
5076  0798               L3372:
5077                     ; 1660 	else data_tx[2] &= 0xfb;
5079  0798 72150018      	bres	_data_tx+2,#2
5080                     ; 1661 }
5083  079c 81            	ret	
5111                     ; 1663 void error_load(void)
5111                     ; 1664 {
5112                     	switch	.text
5113  079d               _error_load:
5117                     ; 1666 	if(error_bank.bit.current_flow_flag > 0) data_tx[6] = 0x21; ////短路保护
5119  079d 7201003005    	btjf	_error_bank+2,#0,L7472
5122  07a2 3521001c      	mov	_data_tx+6,#33
5125  07a6 81            	ret	
5126  07a7               L7472:
5127                     ; 1667 	else if((sys_state_flag.bit.protect_flag > 0) && (control_temp < 900)) data_tx[6] = 0x22;//hand error
5129  07a7 720d002b0c    	btjf	_sys_state_flag,#6,L3572
5131  07ac be00          	ldw	x,_control_temp
5132  07ae a30384        	cpw	x,#900
5133  07b1 2405          	jruge	L3572
5136  07b3 3522001c      	mov	_data_tx+6,#34
5139  07b7 81            	ret	
5140  07b8               L3572:
5141                     ; 1668 	else if(error_bank.bit.ph_lost_flag > 0) data_tx[6] = 0x23;   //电机缺相		
5143  07b8 720f002e05    	btjf	_error_bank,#7,L7572
5146  07bd 3523001c      	mov	_data_tx+6,#35
5149  07c1 81            	ret	
5150  07c2               L7572:
5151                     ; 1669 	else if(error_bank.bit.hall_wron_flag > 0) data_tx[6] = 0x24; //hall error
5153  07c2 720b002e05    	btjf	_error_bank,#5,L3672
5156  07c7 3524001c      	mov	_data_tx+6,#36
5159  07cb 81            	ret	
5160  07cc               L3672:
5161                     ; 1670 	else if(brk_error_flag > 0)data_tx[6] = 0x25; //hall
5163  07cc c601da        	ld	a,_brk_error_flag
5164  07cf 2705          	jreq	L7672
5167  07d1 3525001c      	mov	_data_tx+6,#37
5170  07d5 81            	ret	
5171  07d6               L7672:
5172                     ; 1671 	else if(error_bank.bit.temperature_flag > 0) data_tx[6] = 0x26;  //温度保护
5174  07d6 7203002e05    	btjf	_error_bank,#1,L3772
5177  07db 3526001c      	mov	_data_tx+6,#38
5180  07df 81            	ret	
5181  07e0               L3772:
5182                     ; 1672 	else if(error_bank.bit.motor_stop_flag > 0) data_tx[6] = 0x27;  ////堵转保护		
5184  07e0 720d002e05    	btjf	_error_bank,#6,L7772
5187  07e5 3527001c      	mov	_data_tx+6,#39
5190  07e9 81            	ret	
5191  07ea               L7772:
5192                     ; 1674 	else if(error_bank.bit.voltage_over_flag > 0) data_tx[6] = 0x29;  //过压保护
5194  07ea 7205002e05    	btjf	_error_bank,#2,L3003
5197  07ef 3529001c      	mov	_data_tx+6,#41
5200  07f3 81            	ret	
5201  07f4               L3003:
5202                     ; 1676 	else data_tx[6] = 0;
5204  07f4 725f001c      	clr	_data_tx+6
5205                     ; 1687 }
5208  07f8 81            	ret	
5237                     ; 1692 void speed_load(void)
5237                     ; 1693 {
5238                     	switch	.text
5239  07f9               _speed_load:
5243                     ; 1695 	if((spt_high_count_bike + spt_low_count_bike) > 450)
5245  07f9 ce01e2        	ldw	x,_spt_high_count_bike
5246  07fc 72bb01e4      	addw	x,_spt_low_count_bike
5247  0800 a301c3        	cpw	x,#451
5248  0803 250f          	jrult	L7103
5249                     ; 1697 		data_tx[3] = 0x0d;//speed_motor2 ;
5251  0805 350d0019      	mov	_data_tx+3,#13
5252                     ; 1698 		data_tx[4] = 0x0d;
5254  0809 350d001a      	mov	_data_tx+4,#13
5255                     ; 1699 		speed_bike_temp = 0xd0d;
5257  080d ae0d0d        	ldw	x,#3341
5258  0810 cf0128        	ldw	_speed_bike_temp,x
5261  0813 81            	ret	
5262  0814               L7103:
5263                     ; 1705 		speed_bike_temp_old1 = (speed_bike_temp_old << 2);
5265  0814 ce0003        	ldw	x,_speed_bike_temp_old
5266  0817 58            	sllw	x
5267  0818 58            	sllw	x
5268  0819 cf0001        	ldw	_speed_bike_temp_old1,x
5269                     ; 1707 		if(speed_bike_temp_old1 > speed_bike_temp)
5271  081c c30128        	cpw	x,_speed_bike_temp
5272  081f 2325          	jrule	L3203
5273                     ; 1709 			if((speed_bike_temp_old1 - speed_bike_temp) > 15)speed_bike_temp = speed_bike_temp + ((speed_bike_temp_old1 - speed_bike_temp) >> 4);
5275  0821 72b00128      	subw	x,_speed_bike_temp
5276  0825 a30010        	cpw	x,#16
5277  0828 ce0001        	ldw	x,_speed_bike_temp_old1
5278  082b 250e          	jrult	L5203
5281  082d 72b00128      	subw	x,_speed_bike_temp
5282  0831 54            	srlw	x
5283  0832 54            	srlw	x
5284  0833 54            	srlw	x
5285  0834 54            	srlw	x
5286  0835 72bb0128      	addw	x,_speed_bike_temp
5288  0839 203a          	jp	LC010
5289  083b               L5203:
5290                     ; 1710 			else if(speed_bike_temp_old1 > speed_bike_temp)speed_bike_temp ++;
5292  083b c30128        	cpw	x,_speed_bike_temp
5293  083e 2338          	jrule	L3303
5296  0840 ce0128        	ldw	x,_speed_bike_temp
5297  0843 5c            	incw	x
5298  0844 202f          	jp	LC010
5299  0846               L3203:
5300                     ; 1712 		else if(speed_bike_temp_old1 < speed_bike_temp)		
5302  0846 c30128        	cpw	x,_speed_bike_temp
5303  0849 242d          	jruge	L3303
5304                     ; 1714 			if((speed_bike_temp - speed_bike_temp_old1) > 15)speed_bike_temp = speed_bike_temp - ((speed_bike_temp - speed_bike_temp_old1) >> 4);
5306  084b ce0128        	ldw	x,_speed_bike_temp
5307  084e 72b00001      	subw	x,_speed_bike_temp_old1
5308  0852 a30010        	cpw	x,#16
5309  0855 2512          	jrult	L7303
5312  0857 ce0128        	ldw	x,_speed_bike_temp
5313  085a 72b00001      	subw	x,_speed_bike_temp_old1
5314  085e 54            	srlw	x
5315  085f 54            	srlw	x
5316  0860 54            	srlw	x
5317  0861 54            	srlw	x
5318  0862 72b00128      	subw	x,_speed_bike_temp
5319  0866 50            	negw	x
5321  0867 200c          	jp	LC010
5322  0869               L7303:
5323                     ; 1715 			else if(speed_bike_temp_old1 < speed_bike_temp)speed_bike_temp --;
5325  0869 ce0001        	ldw	x,_speed_bike_temp_old1
5326  086c c30128        	cpw	x,_speed_bike_temp
5327  086f 2407          	jruge	L3303
5330  0871 ce0128        	ldw	x,_speed_bike_temp
5331  0874 5a            	decw	x
5332  0875               LC010:
5333  0875 cf0128        	ldw	_speed_bike_temp,x
5334  0878               L3303:
5335                     ; 1718 		data_tx[4] = (speed_bike_temp & 0xff);
5337  0878 550129001a    	mov	_data_tx+4,_speed_bike_temp+1
5338                     ; 1719 		data_tx[3] =  (speed_bike_temp >> 8) & 0xff;
5340  087d 5501280019    	mov	_data_tx+3,_speed_bike_temp
5341                     ; 1721 }
5344  0882 81            	ret	
5368                     ; 1722 void tx_sum_load(void)
5368                     ; 1723 {
5369                     	switch	.text
5370  0883               _tx_sum_load:
5374                     ; 1724 	data_tx[7] = (data_tx[1] ^ data_tx[2] ^ data_tx[3] ^ data_tx[4] ^  data_tx[5] ^ data_tx[6]) & 0xff ;
5376  0883 c60017        	ld	a,_data_tx+1
5377  0886 c80018        	xor	a,_data_tx+2
5378  0889 c80019        	xor	a,_data_tx+3
5379  088c c8001a        	xor	a,_data_tx+4
5380  088f c8001b        	xor	a,_data_tx+5
5381  0892 c8001c        	xor	a,_data_tx+6
5382  0895 c7001d        	ld	_data_tx+7,a
5383                     ; 1726 }
5386  0898 81            	ret	
5419                     ; 1730 void voltage_load(void)
5419                     ; 1731 {
5420                     	switch	.text
5421  0899               _voltage_load:
5425                     ; 1732 	if((current_average1 < current_adj_battry) && (voltage_average > user_Prdata.byte.voltage_adj) && (voltage_load_time > 25))//&& (current_average1 < current_adj_battry))
5427  0899 b600          	ld	a,_current_average1
5428  089b c10000        	cp	a,_current_adj_battry
5429  089e 246e          	jruge	L5603
5431  08a0 be00          	ldw	x,_voltage_average
5432  08a2 b300          	cpw	x,_user_Prdata
5433  08a4 2368          	jrule	L5603
5435  08a6 c60176        	ld	a,_voltage_load_time
5436  08a9 a11a          	cp	a,#26
5437  08ab 2561          	jrult	L5603
5438                     ; 1736 			if(current_average1 < current_adj_table[0]) //current_adj_table[0] = user_Prdata.byte.voltage_adj / 16
5440  08ad b600          	ld	a,_current_average1
5441  08af 5f            	clrw	x
5442  08b0 97            	ld	xl,a
5443  08b1 c30000        	cpw	x,_current_adj_table
5444  08b4 2453          	jruge	L7603
5445                     ; 1738 				if(voltage_average > (user_Prdata.byte.voltage_adj + 21))//11
5447  08b6 be00          	ldw	x,_user_Prdata
5448  08b8 1c0015        	addw	x,#21
5449  08bb b300          	cpw	x,_voltage_average
5450  08bd 2442          	jruge	L1703
5451                     ; 1740 					send_battry_old = (voltage_average - user_Prdata.byte.voltage_adj - 21) >> 4;//1v 11 5 data_tx[1]
5453  08bf be00          	ldw	x,_voltage_average
5454  08c1 72b00000      	subw	x,_user_Prdata
5455  08c5 1d0015        	subw	x,#21
5456  08c8 54            	srlw	x
5457  08c9 54            	srlw	x
5458  08ca 54            	srlw	x
5459  08cb 54            	srlw	x
5460  08cc 01            	rrwa	x,a
5461  08cd c70000        	ld	_send_battry_old,a
5462                     ; 1742 					if(data_tx[1] == 0)data_tx[1] = send_battry_old;
5464  08d0 c60017        	ld	a,_data_tx+1
5465  08d3 2607          	jrne	L3703
5468  08d5 5500000017    	mov	_data_tx+1,_send_battry_old
5470  08da 2014          	jra	L5703
5471  08dc               L3703:
5472                     ; 1743 					else if(data_tx[1] > send_battry_old)data_tx[1] --;
5474  08dc c10000        	cp	a,_send_battry_old
5475  08df 2306          	jrule	L7703
5478  08e1 725a0017      	dec	_data_tx+1
5480  08e5 2009          	jra	L5703
5481  08e7               L7703:
5482                     ; 1744 					else if(data_tx[1] < send_battry_old)data_tx[1] ++;
5484  08e7 c10000        	cp	a,_send_battry_old
5485  08ea 2404          	jruge	L5703
5488  08ec 725c0017      	inc	_data_tx+1
5489  08f0               L5703:
5490                     ; 1746 					if(data_tx[1] > 5)data_tx[1] = 5;
5492  08f0 c60017        	ld	a,_data_tx+1
5493  08f3 a106          	cp	a,#6
5494  08f5 2504          	jrult	L5013
5497  08f7 35050017      	mov	_data_tx+1,#5
5498  08fb               L5013:
5499                     ; 1747 					error_bank.bit.voltage_low_flag = 0;
5501  08fb 7217002e      	bres	_error_bank,#3
5503  08ff 2004          	jra	L7013
5504  0901               L1703:
5505                     ; 1749 				else data_tx[1] = 0;
5507  0901 725f0017      	clr	_data_tx+1
5508  0905               L7013:
5509                     ; 1751 				voltage_load_count = 0;
5511  0905 5f            	clrw	x
5512  0906 cf011c        	ldw	_voltage_load_count,x
5513  0909               L7603:
5514                     ; 1768 			voltage_load_time = 0;
5516  0909 725f0176      	clr	_voltage_load_time
5519  090d 81            	ret	
5520  090e               L5603:
5521                     ; 1770 	else if(voltage_average <= user_Prdata.byte.voltage_adj )
5523  090e be00          	ldw	x,_voltage_average
5524  0910 b300          	cpw	x,_user_Prdata
5525  0912 2208          	jrugt	L1113
5526                     ; 1772 		data_tx[1] = 0;
5528  0914 725f0017      	clr	_data_tx+1
5529                     ; 1773 		voltage_load_count = 0;
5531  0918 5f            	clrw	x
5532  0919 cf011c        	ldw	_voltage_load_count,x
5533  091c               L1113:
5534                     ; 1783 }
5537  091c 81            	ret	
5573                     ; 1819 void speed_check_bike(void) //
5573                     ; 1820 {
5574                     	switch	.text
5575  091d               _speed_check_bike:
5577  091d 5204          	subw	sp,#4
5578       00000004      OFST:	set	4
5581                     ; 1822 	spt_condition1_bike = SPEED_CHECK_PORT; //PEIN & 0x01;
5583  091f c65015        	ld	a,_PE_IDR
5584  0922 a401          	and	a,#1
5585  0924 c7019b        	ld	_spt_condition1_bike,a
5586                     ; 1824 	if(spt_condition_old_bike > 0)	//é?ò?′??a??μ???
5588  0927 c6019a        	ld	a,_spt_condition_old_bike
5589  092a 276a          	jreq	L5213
5590                     ; 1826 		if(spt_condition1_bike == 0)		//μ±?°?μ?aμíμ???
5592  092c c6019b        	ld	a,_spt_condition1_bike
5593  092f 2672          	jrne	L1413
5594                     ; 1828 			spt_low_flag_bike = 1;		//??μíμ?????êy±ê??
5596  0931 35010198      	mov	_spt_low_flag_bike,#1
5597                     ; 1829 			spt_high_flag_bike = 0;		//????μ?????êy±ê??	
5599  0935 c70199        	ld	_spt_high_flag_bike,a
5600                     ; 1838 				speed_bike_temp_old = speed_bike + (spt_high_count_bike + spt_low_count_bike);
5602  0938 ce01e2        	ldw	x,_spt_high_count_bike
5603  093b 72bb01e4      	addw	x,_spt_low_count_bike
5604  093f 72bb01af      	addw	x,_speed_bike
5605  0943 cf0003        	ldw	_speed_bike_temp_old,x
5606                     ; 1840 				bike_rpm_old = 15000 / speed_bike_temp_old;//
5608  0946 ae3a98        	ldw	x,#15000
5609  0949 90ce0003      	ldw	y,_speed_bike_temp_old
5610  094d 65            	divw	x,y
5611  094e cf01de        	ldw	_bike_rpm_old,x
5612                     ; 1841 				if(bike_rpm_old > bike_rpm)bike_rpm = bike_rpm + ((bike_rpm_old - bike_rpm) >> 2);
5614  0951 c301e0        	cpw	x,_bike_rpm
5615  0954 230c          	jrule	L1313
5618  0956 72b001e0      	subw	x,_bike_rpm
5619  095a 54            	srlw	x
5620  095b 54            	srlw	x
5621  095c 72bb01e0      	addw	x,_bike_rpm
5623  0960 2013          	jp	LC011
5624  0962               L1313:
5625                     ; 1842 				else if(bike_rpm_old < bike_rpm)bike_rpm = bike_rpm - ((bike_rpm - bike_rpm_old) >> 2);
5627  0962 c301e0        	cpw	x,_bike_rpm
5628  0965 2411          	jruge	L3313
5631  0967 ce01e0        	ldw	x,_bike_rpm
5632  096a 72b001de      	subw	x,_bike_rpm_old
5633  096e 54            	srlw	x
5634  096f 54            	srlw	x
5635  0970 72b001e0      	subw	x,_bike_rpm
5636  0974 50            	negw	x
5637  0975               LC011:
5638  0975 cf01e0        	ldw	_bike_rpm,x
5639  0978               L3313:
5640                     ; 1843 				if(bike_rpm < 20)bike_rpm = 20;
5642  0978 ce01e0        	ldw	x,_bike_rpm
5643  097b a30014        	cpw	x,#20
5644  097e 2406          	jruge	L7313
5647  0980 ae0014        	ldw	x,#20
5648  0983 cf01e0        	ldw	_bike_rpm,x
5649  0986               L7313:
5650                     ; 1844 				speed_bike = 0;
5652  0986 5f            	clrw	x
5653  0987 cf01af        	ldw	_speed_bike,x
5654                     ; 1845 				speed_bike_load_count = 0;
5656  098a 725f01f1      	clr	_speed_bike_load_count
5657                     ; 1848 			spt_high_count_bike = 0;		//??é?ò?′???μ?????êy?μ
5659  098e cf01e2        	ldw	_spt_high_count_bike,x
5660                     ; 1849 			spt_low_count_bike = 0;		//??é?ò?′?μíμ?????êy?μ
5662  0991 cf01e4        	ldw	_spt_low_count_bike,x
5663  0994 200d          	jra	L1413
5664  0996               L5213:
5665                     ; 1854 		if(spt_condition1_bike > 0)
5667  0996 725d019b      	tnz	_spt_condition1_bike
5668  099a 2707          	jreq	L1413
5669                     ; 1856 			spt_low_flag_bike = 0;		//??μíμ?????êy±ê??	
5671  099c c70198        	ld	_spt_low_flag_bike,a
5672                     ; 1857 			spt_high_flag_bike = 1;		//????μ?????êy±ê??
5674  099f 35010199      	mov	_spt_high_flag_bike,#1
5675  09a3               L1413:
5676                     ; 1860 	spt_condition_old_bike = spt_condition1_bike;
5678  09a3 55019b019a    	mov	_spt_condition_old_bike,_spt_condition1_bike
5679                     ; 1862 	if(spt_low_flag_bike == 1)
5681  09a8 c60198        	ld	a,_spt_low_flag_bike
5682  09ab 4a            	dec	a
5683  09ac 261e          	jrne	L5413
5684                     ; 1864 		spt_low_count_bike += 1;
5686  09ae ce01e4        	ldw	x,_spt_low_count_bike
5687  09b1 5c            	incw	x
5688  09b2 cf01e4        	ldw	_spt_low_count_bike,x
5689                     ; 1865 		if(spt_low_count_bike > 500)//900
5691  09b5 a301f5        	cpw	x,#501
5692  09b8 2512          	jrult	L5413
5693                     ; 1867 			speed_bike_temp_old = 900;
5695  09ba ae0384        	ldw	x,#900
5696  09bd cf0003        	ldw	_speed_bike_temp_old,x
5697                     ; 1868 			spt_low_count_bike = 500;
5699  09c0 ae01f4        	ldw	x,#500
5700  09c3 cf01e4        	ldw	_spt_low_count_bike,x
5701                     ; 1869 			bike_rpm = 30;//1
5703  09c6 ae001e        	ldw	x,#30
5704  09c9 cf01e0        	ldw	_bike_rpm,x
5705  09cc               L5413:
5706                     ; 1872 	if(spt_high_flag_bike == 1)
5708  09cc c60199        	ld	a,_spt_high_flag_bike
5709  09cf a101          	cp	a,#1
5710  09d1 261e          	jrne	L1513
5711                     ; 1874 		spt_high_count_bike += 1;
5713  09d3 ce01e2        	ldw	x,_spt_high_count_bike
5714  09d6 5c            	incw	x
5715  09d7 cf01e2        	ldw	_spt_high_count_bike,x
5716                     ; 1875 		if(spt_high_count_bike > 500)//900
5718  09da a301f5        	cpw	x,#501
5719  09dd 2512          	jrult	L1513
5720                     ; 1877 			speed_bike_temp_old = 900;
5722  09df ae0384        	ldw	x,#900
5723  09e2 cf0003        	ldw	_speed_bike_temp_old,x
5724                     ; 1878 			spt_high_count_bike = 500;
5726  09e5 ae01f4        	ldw	x,#500
5727  09e8 cf01e2        	ldw	_spt_high_count_bike,x
5728                     ; 1879 			bike_rpm = 30;//1
5730  09eb ae001e        	ldw	x,#30
5731  09ee cf01e0        	ldw	_bike_rpm,x
5732  09f1               L1513:
5733                     ; 1883 		if(bike_rpm > 66)zero_add_torque = 5;
5735  09f1 ce01e0        	ldw	x,_bike_rpm
5736  09f4 a30043        	cpw	x,#67
5737  09f7 2506          	jrult	L5513
5740  09f9 350501e6      	mov	_zero_add_torque,#5
5742  09fd 2019          	jra	L7513
5743  09ff               L5513:
5744                     ; 1884 		else zero_add_torque = 30 - (bike_rpm >> 2) - (bike_rpm >> 3);
5746  09ff 54            	srlw	x
5747  0a00 54            	srlw	x
5748  0a01 54            	srlw	x
5749  0a02 1f03          	ldw	(OFST-1,sp),x
5751  0a04 ce01e0        	ldw	x,_bike_rpm
5752  0a07 54            	srlw	x
5753  0a08 54            	srlw	x
5754  0a09 1f01          	ldw	(OFST-3,sp),x
5756  0a0b ae001e        	ldw	x,#30
5757  0a0e 72f001        	subw	x,(OFST-3,sp)
5758  0a11 72f003        	subw	x,(OFST-1,sp)
5759  0a14 01            	rrwa	x,a
5760  0a15 c701e6        	ld	_zero_add_torque,a
5761  0a18               L7513:
5762                     ; 1886 }
5765  0a18 5b04          	addw	sp,#4
5766  0a1a 81            	ret	
5796                     ; 1888 void uart_rx_dang_load(void)
5796                     ; 1889 {
5797                     	switch	.text
5798  0a1b               _uart_rx_dang_load:
5802                     ; 1893 	if((data_rx_dang == 0) || (data_rx[0] == 83))// stop
5804  0a1b c6012a        	ld	a,_data_rx_dang
5805  0a1e 2707          	jreq	L3713
5807  0a20 c601b4        	ld	a,_data_rx
5808  0a23 a153          	cp	a,#83
5809  0a25 261d          	jrne	L1713
5810  0a27               L3713:
5811                     ; 1895 		dang_limit_pwm = 0;
5813  0a27 5f            	clrw	x
5814  0a28 cf01b1        	ldw	_dang_limit_pwm,x
5815                     ; 1896 		torque_level = 0;
5817  0a2b 725f01f4      	clr	_torque_level
5818                     ; 1897 		dang_limit_current = 0;
5820  0a2f 725f01b3      	clr	_dang_limit_current
5822  0a33               L5713:
5823                     ; 1965 	if((data_rx[1] & 0x10) > 0)//6km
5825  0a33 720901b560    	btjf	_data_rx+1,#4,L3223
5826                     ; 1967 		dang_limit_pwm = 80;//80
5828  0a38 ae0050        	ldw	x,#80
5829  0a3b cf01b1        	ldw	_dang_limit_pwm,x
5830                     ; 1968 		dang_limit_current = sp_ph_current_limit_10p;//sp_ph_current_limit_20p
5832  0a3e 55000001b3    	mov	_dang_limit_current,_sp_ph_current_limit_10p
5834  0a43 81            	ret	
5835  0a44               L1713:
5836                     ; 1900 	else if(data_rx_dang == 1)
5838  0a44 c6012a        	ld	a,_data_rx_dang
5839  0a47 a101          	cp	a,#1
5840  0a49 260c          	jrne	L7713
5841                     ; 1902 		dang_limit_pwm = 280;//112;//126; // 100
5843  0a4b ae0118        	ldw	x,#280
5844  0a4e cf01b1        	ldw	_dang_limit_pwm,x
5845                     ; 1903 		torque_level = 35;
5847  0a51 352301f4      	mov	_torque_level,#35
5848                     ; 1904 		dang_limit_current = sp_ph_current_limit_max;
5850  0a55 203a          	jp	LC012
5851  0a57               L7713:
5852                     ; 1907 	else if(data_rx_dang == 2)
5854  0a57 a102          	cp	a,#2
5855  0a59 260c          	jrne	L3023
5856                     ; 1909 		dang_limit_pwm = 280;//154;//140
5858  0a5b ae0118        	ldw	x,#280
5859  0a5e cf01b1        	ldw	_dang_limit_pwm,x
5860                     ; 1910 		torque_level = 50;
5862  0a61 353201f4      	mov	_torque_level,#50
5863                     ; 1911 		dang_limit_current = sp_ph_current_limit_max;
5865  0a65 202a          	jp	LC012
5866  0a67               L3023:
5867                     ; 1914 	else if(data_rx_dang == 3)
5869  0a67 a103          	cp	a,#3
5870  0a69 260c          	jrne	L7023
5871                     ; 1916 		dang_limit_pwm = 280;//182;//168
5873  0a6b ae0118        	ldw	x,#280
5874  0a6e cf01b1        	ldw	_dang_limit_pwm,x
5875                     ; 1917 		torque_level = 65;
5877  0a71 354101f4      	mov	_torque_level,#65
5878                     ; 1918 		dang_limit_current = sp_ph_current_limit_max;
5880  0a75 201a          	jp	LC012
5881  0a77               L7023:
5882                     ; 1921 	else if(data_rx_dang == 4)
5884  0a77 a104          	cp	a,#4
5885  0a79 260c          	jrne	L3123
5886                     ; 1923 		dang_limit_pwm = 280;//200;//220
5888  0a7b ae0118        	ldw	x,#280
5889  0a7e cf01b1        	ldw	_dang_limit_pwm,x
5890                     ; 1924 		torque_level = 80;
5892  0a81 355001f4      	mov	_torque_level,#80
5893                     ; 1925 		dang_limit_current = sp_ph_current_limit_max;
5895  0a85 200a          	jp	LC012
5896  0a87               L3123:
5897                     ; 1928 	else if(data_rx_dang == 5)
5899                     ; 1930 		dang_limit_pwm = 280;//280
5900                     ; 1931 		torque_level = 105;//
5901                     ; 1932 		dang_limit_current = sp_ph_current_limit_max;
5903                     ; 1960 		dang_limit_pwm = 280;
5905                     ; 1961 		torque_level = 105;//
5908  0a87 ae0118        	ldw	x,#280
5909  0a8a cf01b1        	ldw	_dang_limit_pwm,x
5911  0a8d 356901f4      	mov	_torque_level,#105
5912                     ; 1962 		dang_limit_current = sp_ph_current_limit_max;
5914  0a91               LC012:
5920  0a91 55000001b3    	mov	_dang_limit_current,_sp_ph_current_limit_max
5921  0a96 209b          	jra	L5713
5922  0a98               L3223:
5923                     ; 1973 }
5926  0a98 81            	ret	
5951                     ; 1974 void uart_rx_dang_deal(void)
5951                     ; 1975 {
5952                     	switch	.text
5953  0a99               _uart_rx_dang_deal:
5957                     ; 1985 	if((data_rx[1] & 0x0f) == 15)data_rx_dang = 0;
5959  0a99 c601b5        	ld	a,_data_rx+1
5960  0a9c a40f          	and	a,#15
5961  0a9e a10f          	cp	a,#15
5962  0aa0 2605          	jrne	L5323
5965  0aa2 725f012a      	clr	_data_rx_dang
5968  0aa6 81            	ret	
5969  0aa7               L5323:
5970                     ; 1986 	else if((data_rx[1] & 0x0f) > 0)data_rx_dang = data_rx[1] & 0x0f;
5972  0aa7 c601b5        	ld	a,_data_rx+1
5973  0aaa a50f          	bcp	a,#15
5974  0aac 2705          	jreq	L7323
5977  0aae a40f          	and	a,#15
5978  0ab0 c7012a        	ld	_data_rx_dang,a
5979  0ab3               L7323:
5980                     ; 2001 }
5983  0ab3 81            	ret	
6024                     ; 2003 void uart_rec_deal(void)
6024                     ; 2004 {
6025                     	switch	.text
6026  0ab4               _uart_rec_deal:
6028  0ab4 88            	push	a
6029       00000001      OFST:	set	1
6032                     ; 2005 	unsigned char xj=0;//,jiaoyan_rec=0;
6034                     ; 2006 	if(data_rx_number >= 5)//9
6036  0ab5 c6001e        	ld	a,_data_rx_number
6037  0ab8 a105          	cp	a,#5
6038  0aba 2403cc0b6c    	jrult	L1623
6039                     ; 2008 		data_rx_number = 0;
6041  0abf 725f001e      	clr	_data_rx_number
6042                     ; 2010 		if(/*((jiaoyan_rec & 0xff) == data_rx_temp[4]) &&*/ (data_rx_temp[5] == 0x0d) && ((data_rx_temp[0] == 0x46) || (data_rx_temp[0] == 0x53)))//&& ((jiaoyan_rec >> 8) == data_rx_temp[7])
6044  0ac3 c601bf        	ld	a,_data_rx_temp+5
6045  0ac6 a10d          	cp	a,#13
6046  0ac8 2627          	jrne	L3623
6048  0aca c601ba        	ld	a,_data_rx_temp
6049  0acd a146          	cp	a,#70
6050  0acf 2704          	jreq	L5623
6052  0ad1 a153          	cp	a,#83
6053  0ad3 261c          	jrne	L3623
6054  0ad5               L5623:
6055                     ; 2012 			for(xj = 0;xj <= 5;xj++)//
6057  0ad5 4f            	clr	a
6058  0ad6 6b01          	ld	(OFST+0,sp),a
6060  0ad8               L7623:
6061                     ; 2013 			data_rx[xj] = data_rx_temp[xj];
6063  0ad8 5f            	clrw	x
6064  0ad9 97            	ld	xl,a
6065  0ada d601ba        	ld	a,(_data_rx_temp,x)
6066  0add d701b4        	ld	(_data_rx,x),a
6067                     ; 2012 			for(xj = 0;xj <= 5;xj++)//
6069  0ae0 0c01          	inc	(OFST+0,sp)
6073  0ae2 7b01          	ld	a,(OFST+0,sp)
6074  0ae4 a106          	cp	a,#6
6075  0ae6 25f0          	jrult	L7623
6076                     ; 2014 			send_data_flag = 1;
6078  0ae8 350101a7      	mov	_send_data_flag,#1
6079                     ; 2016 			data_tx[5] = data_rx[3];
6081  0aec 5501b7001b    	mov	_data_tx+5,_data_rx+3
6082  0af1               L3623:
6083                     ; 2020 		if((data_rx[2] & 0x07) == 0)wheel = 16;
6085  0af1 c601b6        	ld	a,_data_rx+2
6086  0af4 a507          	bcp	a,#7
6087  0af6 2606          	jrne	L5723
6090  0af8 35100012      	mov	_wheel,#16
6092  0afc 2063          	jra	L7723
6093  0afe               L5723:
6094                     ; 2021 		else if((data_rx[2] & 0x07) == 1)wheel = 18;
6096  0afe a407          	and	a,#7
6097  0b00 4a            	dec	a
6098  0b01 2606          	jrne	L1033
6101  0b03 35120012      	mov	_wheel,#18
6103  0b07 2058          	jra	L7723
6104  0b09               L1033:
6105                     ; 2022 		else if((data_rx[2] & 0x07) == 2)wheel = 20;
6107  0b09 c601b6        	ld	a,_data_rx+2
6108  0b0c a407          	and	a,#7
6109  0b0e a102          	cp	a,#2
6110  0b10 2606          	jrne	L5033
6113  0b12 35140012      	mov	_wheel,#20
6115  0b16 2049          	jra	L7723
6116  0b18               L5033:
6117                     ; 2023 		else if((data_rx[2] & 0x07) == 3)wheel = 22;
6119  0b18 c601b6        	ld	a,_data_rx+2
6120  0b1b a407          	and	a,#7
6121  0b1d a103          	cp	a,#3
6122  0b1f 2606          	jrne	L1133
6125  0b21 35160012      	mov	_wheel,#22
6127  0b25 203a          	jra	L7723
6128  0b27               L1133:
6129                     ; 2024 		else if((data_rx[2] & 0x07) == 4)wheel = 24;
6131  0b27 c601b6        	ld	a,_data_rx+2
6132  0b2a a407          	and	a,#7
6133  0b2c a104          	cp	a,#4
6134  0b2e 2606          	jrne	L5133
6137  0b30 35180012      	mov	_wheel,#24
6139  0b34 202b          	jra	L7723
6140  0b36               L5133:
6141                     ; 2025 		else if((data_rx[2] & 0x07) == 5)wheel = 26;
6143  0b36 c601b6        	ld	a,_data_rx+2
6144  0b39 a407          	and	a,#7
6145  0b3b a105          	cp	a,#5
6146  0b3d 2606          	jrne	L1233
6149  0b3f 351a0012      	mov	_wheel,#26
6151  0b43 201c          	jra	L7723
6152  0b45               L1233:
6153                     ; 2026 		else if((data_rx[2] & 0x07) == 6)wheel = 28;
6155  0b45 c601b6        	ld	a,_data_rx+2
6156  0b48 a407          	and	a,#7
6157  0b4a a106          	cp	a,#6
6158  0b4c 2606          	jrne	L5233
6161  0b4e 351c0012      	mov	_wheel,#28
6163  0b52 200d          	jra	L7723
6164  0b54               L5233:
6165                     ; 2027 		else if((data_rx[2] & 0x07) == 7)wheel = 29;
6167  0b54 c601b6        	ld	a,_data_rx+2
6168  0b57 a407          	and	a,#7
6169  0b59 a107          	cp	a,#7
6170  0b5b 2604          	jrne	L7723
6173  0b5d 351d0012      	mov	_wheel,#29
6174  0b61               L7723:
6175                     ; 2029 		max_speed_limit = ((data_rx[2] & 0xf8) >> 3) + 20 ;// 10//data_rx[5];
6177  0b61 c601b6        	ld	a,_data_rx+2
6178  0b64 44            	srl	a
6179  0b65 44            	srl	a
6180  0b66 44            	srl	a
6181  0b67 ab14          	add	a,#20
6182  0b69 c701f6        	ld	_max_speed_limit,a
6183                     ; 2031 		xj = 0 ;
6185  0b6c               L1623:
6186                     ; 2035 }
6189  0b6c 84            	pop	a
6190  0b6d 81            	ret	
6213                     ; 2090 void three_dang_deal(void)
6213                     ; 2091 {
6214                     	switch	.text
6215  0b6e               _three_dang_deal:
6219                     ; 2094 }
6222  0b6e 81            	ret	
6225                     	xref	_NOHALL_TIM1
6253                     ; 2096 void square_sine_change(void)
6253                     ; 2097 {
6254                     	switch	.text
6255  0b6f               _square_sine_change:
6259                     ; 2098 	if((sys_state_flag.bit.brake_charge_flag == 1)||(sys_state_flag.bit.hall_exit == 1)|| (alarm_switch != 0) || (set_debug_mode > 0))
6261  0b6f 7204002b0d    	btjt	_sys_state_flag,#2,L5533
6263  0b74 7206002b08    	btjt	_sys_state_flag,#3,L5533
6265  0b79 b63c          	ld	a,_alarm_switch
6266  0b7b 2604          	jrne	L5533
6268  0b7d b61a          	ld	a,_set_debug_mode
6269  0b7f 270f          	jreq	L3533
6270  0b81               L5533:
6271                     ; 2100 		if(square_sine_change_flag == 0)
6273  0b81 c601c9        	ld	a,_square_sine_change_flag
6274  0b84 2619          	jrne	L5633
6275                     ; 2102 			square_sine_change_flag = 1;
6277  0b86 350101c9      	mov	_square_sine_change_flag,#1
6278                     ; 2103 			PWM_ALL_OFF();
6280  0b8a cd12ee        	call	_PWM_ALL_OFF
6282                     ; 2104 			NOHALL_TIM1();
6286  0b8d cc0000        	jp	_NOHALL_TIM1
6287  0b90               L3533:
6288                     ; 2109 		if(square_sine_change_flag == 1)
6290  0b90 c601c9        	ld	a,_square_sine_change_flag
6291  0b93 4a            	dec	a
6292  0b94 2609          	jrne	L5633
6293                     ; 2111 			square_sine_change_flag = 0;
6295  0b96 c701c9        	ld	_square_sine_change_flag,a
6296                     ; 2112 			PWM_ALL_OFF();
6298  0b99 cd12ee        	call	_PWM_ALL_OFF
6300                     ; 2113 			TM1_INI();
6302  0b9c cd0000        	call	_TM1_INI
6304  0b9f               L5633:
6305                     ; 2118 }
6308  0b9f 81            	ret	
6331                     ; 2124 void sandang_speed(void)
6331                     ; 2125 { 
6332                     	switch	.text
6333  0ba0               _sandang_speed:
6337                     ; 2143 } 
6340  0ba0 81            	ret	
6370                     ; 2147 void cvt_speed(void)
6370                     ; 2148 {
6371                     	switch	.text
6372  0ba1               _cvt_speed:
6376                     ; 2149 	if((dang_mode == 2) && (current_cmd_average1 >= 280) && (pwm_duty_on_old >= 280) && (square_sine_change_flag == 0))//HZ
6378  0ba1 c60156        	ld	a,_dang_mode
6379  0ba4 a102          	cp	a,#2
6380  0ba6 2629          	jrne	L1143
6382  0ba8 be00          	ldw	x,_current_cmd_average1
6383  0baa a30118        	cpw	x,#280
6384  0bad 2522          	jrult	L1143
6386  0baf be5a          	ldw	x,_pwm_duty_on_old
6387  0bb1 a30118        	cpw	x,#280
6388  0bb4 251b          	jrult	L1143
6390  0bb6 725d01c9      	tnz	_square_sine_change_flag
6391  0bba 2615          	jrne	L1143
6392                     ; 2151 		cvt_dn_count = 0;
6394  0bbc 725f00fb      	clr	_cvt_dn_count
6395                     ; 2152 		if(cvt_up_count > 20)
6397  0bc0 c600fc        	ld	a,_cvt_up_count
6398  0bc3 a115          	cp	a,#21
6399  0bc5 2505          	jrult	L3143
6400                     ; 2153 			cvt_on_flag = 1;
6402  0bc7 350101cb      	mov	_cvt_on_flag,#1
6405  0bcb 81            	ret	
6406  0bcc               L3143:
6407                     ; 2155 			cvt_up_count ++;
6409  0bcc 725c00fc      	inc	_cvt_up_count
6411  0bd0 81            	ret	
6412  0bd1               L1143:
6413                     ; 2157 	else if((dang_mode != 2) || (current_cmd_average1 < 250)||(pwm_duty_on_old < 250)||(square_sine_change_flag == 1))
6415  0bd1 a102          	cp	a,#2
6416  0bd3 2614          	jrne	L3243
6418  0bd5 be00          	ldw	x,_current_cmd_average1
6419  0bd7 a300fa        	cpw	x,#250
6420  0bda 250d          	jrult	L3243
6422  0bdc be5a          	ldw	x,_pwm_duty_on_old
6423  0bde a300fa        	cpw	x,#250
6424  0be1 2506          	jrult	L3243
6426  0be3 c601c9        	ld	a,_square_sine_change_flag
6427  0be6 4a            	dec	a
6428  0be7 2614          	jrne	L7143
6429  0be9               L3243:
6430                     ; 2159 		cvt_up_count = 0;
6432  0be9 725f00fc      	clr	_cvt_up_count
6433                     ; 2160 		if(cvt_dn_count > 20)
6435  0bed c600fb        	ld	a,_cvt_dn_count
6436  0bf0 a115          	cp	a,#21
6437  0bf2 2505          	jrult	L1343
6438                     ; 2161 			cvt_on_flag = 0;
6440  0bf4 725f01cb      	clr	_cvt_on_flag
6443  0bf8 81            	ret	
6444  0bf9               L1343:
6445                     ; 2163 			cvt_dn_count ++;
6447  0bf9 725c00fb      	inc	_cvt_dn_count
6448  0bfd               L7143:
6449                     ; 2166 }
6452  0bfd 81            	ret	
6484                     ; 2168 void cvt_act_deal(void)
6484                     ; 2169 {
6485                     	switch	.text
6486  0bfe               _cvt_act_deal:
6490                     ; 2170 	if(cvt_on_flag == 1)
6492  0bfe c601cb        	ld	a,_cvt_on_flag
6493  0c01 4a            	dec	a
6494  0c02 264d          	jrne	L5443
6495                     ; 2172 		if(current_average1 >= current_adj_table[2])
6497  0c04 b600          	ld	a,_current_average1
6498  0c06 5f            	clrw	x
6499  0c07 97            	ld	xl,a
6500  0c08 c30004        	cpw	x,_current_adj_table+4
6501  0c0b 2516          	jrult	L7443
6502                     ; 2174 			if(cvt_act_flag == 0)
6504  0c0d c601c6        	ld	a,_cvt_act_flag
6505  0c10 260c          	jrne	L1543
6506                     ; 2176 				if(cvt_act_on_count >= 20)
6508  0c12 c60132        	ld	a,_cvt_act_on_count
6509  0c15 a114          	cp	a,#20
6510                     ; 2177 					cvt_act_flag = 1;
6512  0c17 2433          	jruge	LC014
6513                     ; 2179 					cvt_act_on_count ++;
6515  0c19 725c0132      	inc	_cvt_act_on_count
6517  0c1d 81            	ret	
6518  0c1e               L1543:
6519                     ; 2182 				cvt_act_off_count = 0;
6521  0c1e 725f0133      	clr	_cvt_act_off_count
6523  0c22 81            	ret	
6524  0c23               L7443:
6525                     ; 2186 			if(cvt_reg_flag == 0)
6527  0c23 c601c7        	ld	a,_cvt_reg_flag
6528  0c26 2620          	jrne	L3643
6529                     ; 2188 				if(cvt_act_flag == 1)
6531  0c28 c601c6        	ld	a,_cvt_act_flag
6532  0c2b 4a            	dec	a
6533  0c2c 2611          	jrne	L5643
6534                     ; 2190 					if(cvt_act_off_count >= 20)
6536  0c2e c60133        	ld	a,_cvt_act_off_count
6537  0c31 a114          	cp	a,#20
6538  0c33 2505          	jrult	L7643
6539                     ; 2191 						cvt_act_flag = 0;
6541  0c35 725f01c6      	clr	_cvt_act_flag
6544  0c39 81            	ret	
6545  0c3a               L7643:
6546                     ; 2193 						cvt_act_off_count ++;
6548  0c3a 725c0133      	inc	_cvt_act_off_count
6550  0c3e 81            	ret	
6551  0c3f               L5643:
6552                     ; 2197 					cvt_act_on_count = 0;
6554  0c3f 725f0132      	clr	_cvt_act_on_count
6555                     ; 2198 					cvt_reg_status = 1;
6557  0c43 350101c5      	mov	_cvt_reg_status,#1
6559  0c47 81            	ret	
6560  0c48               L3643:
6561                     ; 2203 				cvt_off_count = 0;
6563  0c48 725f0154      	clr	_cvt_off_count
6564                     ; 2204 				cvt_act_flag = 1;
6566  0c4c               LC014:
6568  0c4c 350101c6      	mov	_cvt_act_flag,#1
6570  0c50 81            	ret	
6571  0c51               L5443:
6572                     ; 2210 		cvt_act_on_count = 0;
6574  0c51 725f0132      	clr	_cvt_act_on_count
6575                     ; 2211 		cvt_act_flag = 0;
6577  0c55 725f01c6      	clr	_cvt_act_flag
6578                     ; 2212 		cvt_reg_flag = 0;
6580  0c59 725f01c7      	clr	_cvt_reg_flag
6581                     ; 2213 		cvt_reg_status = 0;
6583  0c5d 725f01c5      	clr	_cvt_reg_status
6584                     ; 2215 }
6587  0c61 81            	ret	
6616                     ; 2217 void cvt_act_cacu_1(void)
6616                     ; 2218 {
6617                     	switch	.text
6618  0c62               _cvt_act_cacu_1:
6622                     ; 2219 	if((cvt_reg_flag == 0)&&(cvt_reg_status == 1))
6624  0c62 c601c7        	ld	a,_cvt_reg_flag
6625  0c65 262f          	jrne	L1153
6627  0c67 c601c5        	ld	a,_cvt_reg_status
6628  0c6a 4a            	dec	a
6629  0c6b 2629          	jrne	L1153
6630                     ; 2221 		if(add_spdmt_count < 150)
6632  0c6d c60136        	ld	a,_add_spdmt_count
6633  0c70 a196          	cp	a,#150
6634  0c72 2414          	jruge	L3153
6635                     ; 2223 			add_spdmt_count ++;
6637  0c74 725c0136      	inc	_add_spdmt_count
6638                     ; 2224 			if(add_spdmt_count > 134) 
6640  0c78 c60136        	ld	a,_add_spdmt_count
6641  0c7b a187          	cp	a,#135
6642  0c7d 251b          	jrult	LC015
6643                     ; 2225 				sum_speed_motor_6 = sum_speed_motor_6 + speed_motor_6;
6645  0c7f ce0137        	ldw	x,_sum_speed_motor_6
6646  0c82 72bb0000      	addw	x,_speed_motor_6
6648  0c86 2013          	jra	L3253
6649                     ; 2227 				sum_speed_motor_6 = 0;
6650  0c88               L3153:
6651                     ; 2231 			cvt_reg_flag = 1;
6653  0c88 350101c7      	mov	_cvt_reg_flag,#1
6654                     ; 2232 			cvt_speed_motor_6_temp = sum_speed_motor_6 >> 4;
6656  0c8c ce0137        	ldw	x,_sum_speed_motor_6
6657  0c8f 54            	srlw	x
6658  0c90 54            	srlw	x
6659  0c91 54            	srlw	x
6660  0c92 54            	srlw	x
6661  0c93 cf0134        	ldw	_cvt_speed_motor_6_temp,x
6662                     ; 2233 			add_spdmt_count = 0;
6663                     ; 2234 			sum_speed_motor_6 = 0;
6664  0c96               L1153:
6665                     ; 2239 		add_spdmt_count = 0;
6668  0c96 725f0136      	clr	_add_spdmt_count
6669                     ; 2240 		sum_speed_motor_6 = 0;
6671  0c9a               LC015:
6674  0c9a 5f            	clrw	x
6675  0c9b               L3253:
6676  0c9b cf0137        	ldw	_sum_speed_motor_6,x
6677                     ; 2242 }
6680  0c9e 81            	ret	
6706                     ; 2244 void cvt_act_cacu_2(void)
6706                     ; 2245 {
6707                     	switch	.text
6708  0c9f               _cvt_act_cacu_2:
6710  0c9f 5204          	subw	sp,#4
6711       00000004      OFST:	set	4
6714                     ; 2246 	if(cvt_reg_flag == 1)
6716  0ca1 c601c7        	ld	a,_cvt_reg_flag
6717  0ca4 4a            	dec	a
6718  0ca5 261f          	jrne	L5353
6719                     ; 2248 		cvt_speed_motor_6 = cvt_speed_motor_6_temp  - (cvt_speed_motor_6_temp >> 4) - (cvt_speed_motor_6_temp >> 5);// - (cvt_speed_motor_6_temp >> 5)
6721  0ca7 ce0134        	ldw	x,_cvt_speed_motor_6_temp
6722  0caa 54            	srlw	x
6723  0cab 54            	srlw	x
6724  0cac 54            	srlw	x
6725  0cad 54            	srlw	x
6726  0cae 54            	srlw	x
6727  0caf 1f03          	ldw	(OFST-1,sp),x
6729  0cb1 ce0134        	ldw	x,_cvt_speed_motor_6_temp
6730  0cb4 54            	srlw	x
6731  0cb5 54            	srlw	x
6732  0cb6 54            	srlw	x
6733  0cb7 54            	srlw	x
6734  0cb8 1f01          	ldw	(OFST-3,sp),x
6736  0cba ce0134        	ldw	x,_cvt_speed_motor_6_temp
6737  0cbd 72f001        	subw	x,(OFST-3,sp)
6738  0cc0 72f003        	subw	x,(OFST-1,sp)
6739  0cc3 cf01c3        	ldw	_cvt_speed_motor_6,x
6740  0cc6               L5353:
6741                     ; 2250 }
6744  0cc6 5b04          	addw	sp,#4
6745  0cc8 81            	ret	
6772                     ; 2256 void limit_speed(void)
6772                     ; 2257 {  
6773                     	switch	.text
6774  0cc9               _limit_speed:
6778                     ; 2258 	if(speed_limit_port == 0)
6780  0cc9 720450010e    	btjt	_PA_IDR,#2,L7453
6781                     ; 2260 		if(sys_state_flag.bit.hall_exit == 0)
6783  0cce be05          	ldw	x,_user_Prdata+5
6784  0cd0 7206002b02    	btjt	_sys_state_flag,#3,L1553
6785                     ; 2261 			current_cmd_protect_average = user_Prdata.byte.limit_adj;
6787  0cd5 2008          	jra	L5553
6788  0cd7               L1553:
6789                     ; 2263 			current_cmd_protect_average = user_Prdata.byte.limit_adj - 25;
6791  0cd7 1d0019        	subw	x,#25
6792  0cda 2003          	jra	L5553
6793  0cdc               L7453:
6794                     ; 2267 		current_cmd_protect_average = 280;
6796  0cdc ae0118        	ldw	x,#280
6797  0cdf               L5553:
6799  0cdf bf00          	ldw	_current_cmd_protect_average,x
6800                     ; 2269 }
6803  0ce1 81            	ret	
6827                     ; 2271 void speed_limit_flag_check (void)
6827                     ; 2272 {
6828                     	switch	.text
6829  0ce2               _speed_limit_flag_check:
6833                     ; 2274 }
6836  0ce2 81            	ret	
6865                     ; 2276 void speed_limit_check(void)
6865                     ; 2277 {
6866                     	switch	.text
6867  0ce3               _speed_limit_check:
6871                     ; 2296 			/**/if(eco_flag == 1)
6873  0ce3 b601          	ld	a,_eco_flag
6874  0ce5 a101          	cp	a,#1
6875  0ce7 260f          	jrne	L7753
6876                     ; 2298 				current_cmd_protect_average = 234;
6878  0ce9 ae00ea        	ldw	x,#234
6879  0cec bf00          	ldw	_current_cmd_protect_average,x
6880                     ; 2299 				if(sys_state_flag.bit.hall_exit > 0)
6882  0cee 7207002b0a    	btjf	_sys_state_flag,#3,L3063
6883                     ; 2300 					current_cmd_protect_average = 210;
6885  0cf3 ae00d2        	ldw	x,#210
6886  0cf6 2003          	jp	LC017
6887  0cf8               L7753:
6888                     ; 2304 				current_cmd_protect_average= 280;  
6890  0cf8 ae0118        	ldw	x,#280
6891  0cfb               LC017:
6892  0cfb bf00          	ldw	_current_cmd_protect_average,x
6893  0cfd               L3063:
6894                     ; 2309 		if(eco_flag == 1)
6896  0cfd 4a            	dec	a
6897  0cfe 260d          	jrne	L5063
6898                     ; 2311 			if(current_temp > current_adj_12)
6900  0d00 b600          	ld	a,_current_temp
6901  0d02 c10000        	cp	a,_current_adj_12
6902  0d05 2311          	jrule	L1163
6903                     ; 2312 				current_temp = current_adj_12;
6905  0d07 5500000000    	mov	_current_temp,_current_adj_12
6907  0d0c 81            	ret	
6908  0d0d               L5063:
6909                     ; 2316 			if(current_temp > user_Prdata.byte.current_adj)
6911  0d0d b600          	ld	a,_current_temp
6912  0d0f 5f            	clrw	x
6913  0d10 97            	ld	xl,a
6914  0d11 b302          	cpw	x,_user_Prdata+2
6915  0d13 2303          	jrule	L1163
6916                     ; 2317 				current_temp = user_Prdata.byte.current_adj;
6918  0d15 450300        	mov	_current_temp,_user_Prdata+3
6919  0d18               L1163:
6920                     ; 2456 }
6923  0d18 81            	ret	
6962                     ; 2458 void STOP_drive_sin(void)
6962                     ; 2459 {
6963                     	switch	.text
6964  0d19               _STOP_drive_sin:
6968                     ; 2462 	if((pwm_duty_on_old < 10)||((error_bank.all_flag & 0xDE00) > 0) || (debug_mode_flag > 0)) // slow off
6970  0d19 be5a          	ldw	x,_pwm_duty_on_old
6971  0d1b a3000a        	cpw	x,#10
6972  0d1e 250a          	jrult	L7263
6974  0d20 b62e          	ld	a,_error_bank
6975  0d22 a5de          	bcp	a,#222
6976  0d24 2604          	jrne	L7263
6978  0d26 b64b          	ld	a,_debug_mode_flag
6979  0d28 270f          	jreq	L5263
6980  0d2a               L7263:
6981                     ; 2464 		PWM_ALL_OFF();
6983  0d2a cd12ee        	call	_PWM_ALL_OFF
6985                     ; 2465 		pwm_duty_on_old = 0;
6987  0d2d 5f            	clrw	x
6988  0d2e bf5a          	ldw	_pwm_duty_on_old,x
6989                     ; 2466 		pwm_duty_on = 0;
6991  0d30 bf58          	ldw	_pwm_duty_on,x
6992                     ; 2467 		pwm_sub_count = 0;
6994  0d32 3f44          	clr	_pwm_sub_count
6995                     ; 2468 		hall_drive_back = 0;
6997  0d34 3f3f          	clr	_hall_drive_back
6998                     ; 2469 		motor_flag.all_flag = 0x00;	//y42
7000  0d36 3f28          	clr	_motor_flag
7002                     ; 2510 }
7005  0d38 81            	ret	
7006  0d39               L5263:
7007                     ; 2474 		if((current_high_flag > 0))// || (sys_state_flag.bit.current_over_flag > 0))
7009  0d39 c60000        	ld	a,_current_high_flag
7010  0d3c 271b          	jreq	L5363
7011                     ; 2476 			if(pwm_sub_count == 0)
7013  0d3e b644          	ld	a,_pwm_sub_count
7014  0d40 2611          	jrne	L7363
7015                     ; 2478 				if(pwm_duty_on_old >= 1)
7017  0d42 be5a          	ldw	x,_pwm_duty_on_old
7018  0d44 2703          	jreq	L1463
7019                     ; 2479 					pwm_duty_on_old -= 1;
7021  0d46 5a            	decw	x
7022  0d47 bf5a          	ldw	_pwm_duty_on_old,x
7023  0d49               L1463:
7024                     ; 2480 				if(pwm_duty_on_old > 250)
7026  0d49 a300fb        	cpw	x,#251
7027  0d4c 2505          	jrult	L7363
7028                     ; 2481 					pwm_duty_on_old = 250;
7030  0d4e ae00fa        	ldw	x,#250
7031  0d51 bf5a          	ldw	_pwm_duty_on_old,x
7032  0d53               L7363:
7033                     ; 2483 			pwm_sub_count++;
7035  0d53 3c44          	inc	_pwm_sub_count
7036                     ; 2484 			if(pwm_sub_count >= 1)
7038  0d55 272f          	jreq	L7463
7039                     ; 2485 				pwm_sub_count = 0;
7040  0d57 202b          	jp	LC018
7041  0d59               L5363:
7042                     ; 2487 		else if((current_average1 >= c_offset)||(speed_motor2 >= 250))
7044  0d59 b600          	ld	a,_current_average1
7045  0d5b c10000        	cp	a,_c_offset
7046  0d5e 2407          	jruge	L3563
7048  0d60 be00          	ldw	x,_speed_motor2
7049  0d62 a300fa        	cpw	x,#250
7050  0d65 251f          	jrult	L7463
7051  0d67               L3563:
7052                     ; 2489 			if(pwm_sub_count == 0)
7054  0d67 b644          	ld	a,_pwm_sub_count
7055  0d69 2611          	jrne	L5563
7056                     ; 2491 				if(pwm_duty_on_old >= 1)
7058  0d6b be5a          	ldw	x,_pwm_duty_on_old
7059  0d6d 2703          	jreq	L7563
7060                     ; 2492 					pwm_duty_on_old -= 1;
7062  0d6f 5a            	decw	x
7063  0d70 bf5a          	ldw	_pwm_duty_on_old,x
7064  0d72               L7563:
7065                     ; 2494 				if(pwm_duty_on_old >250)
7067  0d72 a300fb        	cpw	x,#251
7068  0d75 2505          	jrult	L5563
7069                     ; 2495 					pwm_duty_on_old = 250;
7071  0d77 ae00fa        	ldw	x,#250
7072  0d7a bf5a          	ldw	_pwm_duty_on_old,x
7073  0d7c               L5563:
7074                     ; 2497 			pwm_sub_count++;
7076  0d7c 3c44          	inc	_pwm_sub_count
7077                     ; 2498 			if(pwm_sub_count >= 35)
7079  0d7e b644          	ld	a,_pwm_sub_count
7080  0d80 a123          	cp	a,#35
7081  0d82 2502          	jrult	L7463
7082                     ; 2499 				pwm_sub_count = 0;
7084  0d84               LC018:
7086  0d84 3f44          	clr	_pwm_sub_count
7087  0d86               L7463:
7088                     ; 2501 		if(pwm_duty_on_old < 5)
7090  0d86 be5a          	ldw	x,_pwm_duty_on_old
7091  0d88 a30005        	cpw	x,#5
7092  0d8b 2403          	jruge	L5663
7093                     ; 2502 			pwm_duty_on_old = 0;
7095  0d8d 5f            	clrw	x
7096  0d8e bf5a          	ldw	_pwm_duty_on_old,x
7097  0d90               L5663:
7098                     ; 2503 		pwm_duty_on = pwm_duty_on_old;
7100  0d90 bf58          	ldw	_pwm_duty_on,x
7101                     ; 2505 		if(square_sine_change_flag == 1)
7103  0d92 c601c9        	ld	a,_square_sine_change_flag
7104  0d95 4a            	dec	a
7105  0d96 2605          	jrne	L7663
7106                     ; 2506 			phase_change(rotor_position);
7108  0d98 b640          	ld	a,_rotor_position
7112  0d9a cc1009        	jp	_phase_change
7113  0d9d               L7663:
7114                     ; 2508 			rotor_ver();
7118  0d9d cc0000        	jp	_rotor_ver
7141                     ; 2514 void hall_out(void)
7141                     ; 2515 {
7142                     	switch	.text
7143  0da0               _hall_out:
7147                     ; 2523 }
7150  0da0 81            	ret	
7188                     ; 2527 void brake_chk(void)						//2ms
7188                     ; 2528 {
7189                     	switch	.text
7190  0da1               _brake_chk:
7194                     ; 2532 	if((BREAK_PORT == 0))				// 为1进入制动标志
7196  0da1 7202500156    	btjt	_PA_IDR,#1,L3173
7197                     ; 2535 		if(brake_out_count < 10)
7199  0da6 c6017f        	ld	a,_brake_out_count
7200  0da9 a10a          	cp	a,#10
7201  0dab 240a          	jruge	L5173
7202                     ; 2537 			brake_out_count += 1;		//开关计数器加1
7204  0dad 725c017f      	inc	_brake_out_count
7205                     ; 2538 			sys_state_flag.bit.brk_flag = 0;		//制动开关标志位为0
7207  0db1 7213002b      	bres	_sys_state_flag,#1
7209  0db5 2066          	jra	L7373
7210  0db7               L5173:
7211                     ; 2542 			brake_out_count = 10;
7213  0db7 350a017f      	mov	_brake_out_count,#10
7214                     ; 2543 			sys_state_flag.bit.brk_flag = 1;		//置位开关标志
7216                     ; 2544 			pwm_duty_on1 = 0;
7218  0dbb 5f            	clrw	x
7219  0dbc 7212002b      	bset	_sys_state_flag,#1
7220  0dc0 bf56          	ldw	_pwm_duty_on1,x
7221                     ; 2545 			spt_com_count = 0;
7223  0dc2 725f0184      	clr	_spt_com_count
7224                     ; 2546 			sys_state_flag.bit.sf_flag = 0;				//清自动巡航标志
7226  0dc6 7219002c      	bres	_sys_state_flag+1,#4
7227                     ; 2548 			if(mode_flag == 0)
7229  0dca b608          	ld	a,_mode_flag
7230  0dcc 2604          	jrne	L1273
7231                     ; 2549  		    	mode_flag = 1;			
7233  0dce 35010008      	mov	_mode_flag,#1
7234  0dd2               L1273:
7235                     ; 2550 			if(limit_flag == 12)
7237  0dd2 b616          	ld	a,_limit_flag
7238  0dd4 a10c          	cp	a,#12
7239  0dd6 2604          	jrne	L3273
7240                     ; 2552 				limit_flag = 11;
7242  0dd8 a60b          	ld	a,#11
7243  0dda b716          	ld	_limit_flag,a
7244  0ddc               L3273:
7245                     ; 2555 			if(limit_flag == 11)
7247  0ddc a10b          	cp	a,#11
7248  0dde 263d          	jrne	L7373
7249                     ; 2557 				limit_flag = 7;
7251  0de0 35070016      	mov	_limit_flag,#7
7252                     ; 2558 				if(current_cmd_average > 500)
7254  0de4 be5c          	ldw	x,_current_cmd_average
7255  0de6 a301f5        	cpw	x,#501
7256  0de9 2505          	jrult	L7273
7257                     ; 2559 					user_Prdata.byte.limit_adj = 500;
7259  0deb ae01f4        	ldw	x,#500
7261  0dee 2008          	jp	L3373
7262  0df0               L7273:
7263                     ; 2560 				else if(current_cmd_average <= 90)
7265  0df0 a3005b        	cpw	x,#91
7266  0df3 2403          	jruge	L3373
7267                     ; 2561 					user_Prdata.byte.limit_adj = 90;
7269  0df5 ae005a        	ldw	x,#90
7271  0df8               L3373:
7272                     ; 2563 					user_Prdata.byte.limit_adj = current_cmd_average;
7274  0df8 bf05          	ldw	_user_Prdata+5,x
7275  0dfa 2021          	jra	L7373
7276  0dfc               L3173:
7277                     ; 2569 		brake_out_count = 0;
7279  0dfc 725f017f      	clr	_brake_out_count
7280                     ; 2570 		brake_delay_count = 0;
7282  0e00 725f017e      	clr	_brake_delay_count
7283                     ; 2571 		sys_state_flag.bit.brake_charge_flag = 0;
7285                     ; 2572 		sys_state_flag.bit.brk_flag = 0;			//清零开关标志
7287                     ; 2573 		brk_error_flag = 0;
7289  0e04 b62b          	ld	a,_sys_state_flag
7290  0e06 a4f9          	and	a,#249
7291  0e08 b72b          	ld	_sys_state_flag,a
7292  0e0a 725f01da      	clr	_brk_error_flag
7293                     ; 2574 		pwm_duty_brake = 0;
7295  0e0e 5f            	clrw	x
7296  0e0f bf52          	ldw	_pwm_duty_brake,x
7297                     ; 2575 		pwm_brake_max = 0;
7299  0e11 bf50          	ldw	_pwm_brake_max,x
7300                     ; 2576 		if(limit_flag == 8)
7302  0e13 b616          	ld	a,_limit_flag
7303  0e15 a108          	cp	a,#8
7304  0e17 2604          	jrne	L7373
7305                     ; 2578 			limit_flag = 12;
7307  0e19 350c0016      	mov	_limit_flag,#12
7308  0e1d               L7373:
7309                     ; 2582 	if(sys_state_flag.bit.brk_flag > 0)
7311  0e1d 7203002b33    	btjf	_sys_state_flag,#1,L3473
7312                     ; 2584 		if(brake_delay_count < 30)
7314  0e22 c6017e        	ld	a,_brake_delay_count
7315  0e25 a11e          	cp	a,#30
7316  0e27 240c          	jruge	L5473
7317                     ; 2586 			brake_delay_count += 1;			//延时计数器加1
7319  0e29 725c017e      	inc	_brake_delay_count
7320                     ; 2587 			sys_state_flag.bit.brake_charge_flag = 0;
7322                     ; 2588 			pwm_duty_brake = 0;
7324  0e2d 5f            	clrw	x
7325  0e2e 7215002b      	bres	_sys_state_flag,#2
7326  0e32 bf52          	ldw	_pwm_duty_brake,x
7329  0e34 81            	ret	
7330  0e35               L5473:
7331                     ; 2592 			if(sys_state_flag.bit.abs_sel_flag > 0)
7333  0e35 7201002b04    	btjf	_sys_state_flag,#0,L1573
7334                     ; 2593 				sys_state_flag.bit.brake_charge_flag = 1;				//制动标志位置1
7336  0e3a 7214002b      	bset	_sys_state_flag,#2
7337  0e3e               L1573:
7338                     ; 2595 			brake_delay_count = 30;
7340  0e3e 351e017e      	mov	_brake_delay_count,#30
7341                     ; 2597 			if(speed_motor2 > 300)
7343  0e42 be00          	ldw	x,_speed_motor2
7344  0e44 a3012d        	cpw	x,#301
7345  0e47 250c          	jrult	L3473
7346                     ; 2599 				if(limit_flag == 7)
7348  0e49 b616          	ld	a,_limit_flag
7349  0e4b a107          	cp	a,#7
7350  0e4d 2606          	jrne	L3473
7351                     ; 2601 					limit_flag = 0;
7353  0e4f 3f16          	clr	_limit_flag
7354                     ; 2602 					debug_mode_flag = 8;
7356  0e51 3508004b      	mov	_debug_mode_flag,#8
7357  0e55               L3473:
7358                     ; 2623 }
7361  0e55 81            	ret	
7384                     ; 2628 void spt_chk_single(void)
7384                     ; 2629 {
7385                     	switch	.text
7386  0e56               _spt_chk_single:
7390                     ; 2631 }
7393  0e56 81            	ret	
7436                     ; 2633 void spt_chk(void)
7436                     ; 2634 {
7437                     	switch	.text
7438  0e57               _spt_chk:
7442                     ; 2635 	spt_condition1 = SPT_PORT; //PAIN & 0x40;
7444  0e57 c65010        	ld	a,_PD_IDR
7445  0e5a a480          	and	a,#128
7446  0e5c c701a0        	ld	_spt_condition1,a
7447                     ; 2643 	if(spt_condition_old > 0)	//é?ò?′??a??μ???
7449  0e5f c6019f        	ld	a,_spt_condition_old
7450  0e62 2603cc0f34    	jreq	L7773
7451                     ; 2645 		if(spt_condition1 == 0)		//μ±?°?μ?aμíμ???
7453  0e67 c601a0        	ld	a,_spt_condition1
7454  0e6a 2703cc0f41    	jrne	L7404
7455                     ; 2647 			spt_low_flag = 1;		//??μíμ?????êy±ê??
7457  0e6f 3501019d      	mov	_spt_low_flag,#1
7458                     ; 2648 			spt_high_flag = 0;		//????μ?????êy±ê??	
7460  0e73 c7019e        	ld	_spt_high_flag,a
7461                     ; 2662 						if(spt_low_high_count_old > 0) spt_low_high_count_last = spt_low_high_count_old;
7463  0e76 ce018f        	ldw	x,_spt_low_high_count_old
7464  0e79 2705          	jreq	L3004
7467  0e7b cf018d        	ldw	_spt_low_high_count_last,x
7469  0e7e 200b          	jra	L5004
7470  0e80               L3004:
7471                     ; 2665 							spt_low_high_count_last = 450;
7473  0e80 ae01c2        	ldw	x,#450
7474  0e83 cf018d        	ldw	_spt_low_high_count_last,x
7475                     ; 2668 							pwm_duty_on1 = 60;  
7477  0e86 ae003c        	ldw	x,#60
7478  0e89 bf56          	ldw	_pwm_duty_on1,x
7479  0e8b               L5004:
7480                     ; 2670 						spt_low_high_count_old = spt_high_count + spt_low_count;
7482  0e8b ce0193        	ldw	x,_spt_high_count
7483  0e8e 72bb0195      	addw	x,_spt_low_count
7484  0e92 cf018f        	ldw	_spt_low_high_count_old,x
7485                     ; 2672 							if(run_mode == 0)
7487  0e95 c601db        	ld	a,_run_mode
7488                     ; 2677 								pwm_duty_on1 = 280;
7490  0e98 2603cc0f1e    	jreq	LC023
7491                     ; 2681 								if(spt_low_high_count_old > 3)
7493  0e9d a30004        	cpw	x,#4
7494  0ea0 2517          	jrult	L3104
7495                     ; 2683 									pwm_duty_speed = 15000 / spt_low_high_count_old + 60; //60  6300
7497  0ea2 ae3a98        	ldw	x,#15000
7498  0ea5 90ce018f      	ldw	y,_spt_low_high_count_old
7499  0ea9 65            	divw	x,y
7500  0eaa 1c003c        	addw	x,#60
7501  0ead bf54          	ldw	_pwm_duty_speed,x
7502                     ; 2684 									if(pwm_duty_speed > 280) pwm_duty_speed = 280;
7504  0eaf a30119        	cpw	x,#281
7505  0eb2 250a          	jrult	L7104
7508  0eb4 ae0118        	ldw	x,#280
7509  0eb7 2003          	jp	LC020
7510  0eb9               L3104:
7511                     ; 2686 								else pwm_duty_speed = 60;
7513  0eb9 ae003c        	ldw	x,#60
7514  0ebc               LC020:
7515  0ebc bf54          	ldw	_pwm_duty_speed,x
7516  0ebe               L7104:
7517                     ; 2688 								if(pwm_duty_on1 < pwm_duty_speed)spt_low_high_delta = pwm_duty_speed - pwm_duty_on1;
7519  0ebe be56          	ldw	x,_pwm_duty_on1
7520  0ec0 b354          	cpw	x,_pwm_duty_speed
7521  0ec2 2408          	jruge	L1204
7524  0ec4 be54          	ldw	x,_pwm_duty_speed
7525  0ec6 72b00056      	subw	x,_pwm_duty_on1
7527  0eca 2008          	jp	LC021
7528  0ecc               L1204:
7529                     ; 2689 								else if(pwm_duty_on1 > pwm_duty_speed)spt_low_high_delta = pwm_duty_on1 - pwm_duty_speed;
7531  0ecc b354          	cpw	x,_pwm_duty_speed
7532  0ece 2307          	jrule	L3204
7535  0ed0 72b00054      	subw	x,_pwm_duty_speed
7536  0ed4               LC021:
7537  0ed4 cf0187        	ldw	_spt_low_high_delta,x
7538  0ed7               L3204:
7539                     ; 2692 								if(spt_low_high_delta > 7)spt_low_high_delta >>= 3;  
7541  0ed7 ce0187        	ldw	x,_spt_low_high_delta
7542  0eda a30008        	cpw	x,#8
7543  0edd 250f          	jrult	L7204
7546  0edf a603          	ld	a,#3
7547  0ee1               L403:
7548  0ee1 72540187      	srl	_spt_low_high_delta
7549  0ee5 72560188      	rrc	_spt_low_high_delta+1
7550  0ee9 4a            	dec	a
7551  0eea 26f5          	jrne	L403
7553  0eec 200b          	jra	L1304
7554  0eee               L7204:
7555                     ; 2693 								else if(spt_low_high_delta > 0)spt_low_high_delta = 1; 								
7557  0eee ce0187        	ldw	x,_spt_low_high_delta
7558  0ef1 2706          	jreq	L1304
7561  0ef3 ae0001        	ldw	x,#1
7562  0ef6 cf0187        	ldw	_spt_low_high_delta,x
7563  0ef9               L1304:
7564                     ; 2695 								if(pwm_duty_on1 < 80)pwm_duty_on1 = 80;
7566  0ef9 be56          	ldw	x,_pwm_duty_on1
7567  0efb a30050        	cpw	x,#80
7568  0efe 2405          	jruge	L5304
7571  0f00 ae0050        	ldw	x,#80
7572  0f03 bf56          	ldw	_pwm_duty_on1,x
7573  0f05               L5304:
7574                     ; 2696 								if(pwm_duty_on1 < pwm_duty_speed)
7576  0f05 b354          	cpw	x,_pwm_duty_speed
7577  0f07 2406          	jruge	L7304
7578                     ; 2697 								 pwm_duty_on1 += spt_low_high_delta;
7580  0f09 72bb0187      	addw	x,_spt_low_high_delta
7582  0f0d 2008          	jp	LC022
7583  0f0f               L7304:
7584                     ; 2698 								else if(pwm_duty_on1 > pwm_duty_speed)
7586  0f0f b354          	cpw	x,_pwm_duty_speed
7587  0f11 2306          	jrule	L1404
7588                     ; 2699 								 pwm_duty_on1 -= spt_low_high_delta;//pwm_duty_on1 = pwm_duty_speed;//
7590  0f13 72b00187      	subw	x,_spt_low_high_delta
7591  0f17               LC022:
7592  0f17 bf56          	ldw	_pwm_duty_on1,x
7593  0f19               L1404:
7594                     ; 2701 								if(pwm_duty_on1 > 280)
7596  0f19 a30119        	cpw	x,#281
7597  0f1c 2505          	jrult	L1104
7598                     ; 2702 									pwm_duty_on1 = 280;								
7600  0f1e               LC023:
7602  0f1e ae0118        	ldw	x,#280
7603  0f21 bf56          	ldw	_pwm_duty_on1,x
7604  0f23               L1104:
7605                     ; 2704 							sys_state_flag.bit.spt_flag = 1;
7607  0f23 7214002c      	bset	_sys_state_flag+1,#2
7608                     ; 2705 							hand_enable_flag = 1;
7610  0f27 350101a6      	mov	_hand_enable_flag,#1
7611                     ; 2725 			spt_high_count = 0;		//??é?ò?′???μ?????êy?μ
7613  0f2b 5f            	clrw	x
7614  0f2c cf0193        	ldw	_spt_high_count,x
7615                     ; 2726 			spt_low_count = 0;		//??é?ò?′?μíμ?????êy?μ
7617  0f2f cf0195        	ldw	_spt_low_count,x
7618  0f32 200d          	jra	L7404
7619  0f34               L7773:
7620                     ; 2731 		if(spt_condition1 > 0)
7622  0f34 725d01a0      	tnz	_spt_condition1
7623  0f38 2707          	jreq	L7404
7624                     ; 2733 			spt_low_flag = 0;		//??μíμ?????êy±ê??	
7626  0f3a c7019d        	ld	_spt_low_flag,a
7627                     ; 2734 			spt_high_flag = 1;		//????μ?????êy±ê??
7629  0f3d 3501019e      	mov	_spt_high_flag,#1
7630  0f41               L7404:
7631                     ; 2737 	spt_condition_old = spt_condition1;
7633  0f41 5501a0019f    	mov	_spt_condition_old,_spt_condition1
7634                     ; 2739 	if(spt_low_flag == 1)
7636  0f46 c6019d        	ld	a,_spt_low_flag
7637  0f49 4a            	dec	a
7638  0f4a 263b          	jrne	L3504
7639                     ; 2741 		if(spt_low_count < 500)spt_low_count += 1;
7641  0f4c ce0195        	ldw	x,_spt_low_count
7642  0f4f a301f4        	cpw	x,#500
7643  0f52 2404          	jruge	L5504
7646  0f54 5c            	incw	x
7647  0f55 cf0195        	ldw	_spt_low_count,x
7648  0f58               L5504:
7649                     ; 2742 		if((spt_low_count > 450) && (sys_state_flag.bit.spt_flag > 0))//(|| (control_temp > 200))
7651  0f58 a301c3        	cpw	x,#451
7652  0f5b 2526          	jrult	L7504
7654  0f5d 7205002c21    	btjf	_sys_state_flag+1,#2,L7504
7655                     ; 2744 			spt_keep_out = 1;			//μíμ???ê±??ì?3¤,2???DD?úá|?D??
7657  0f62 3501019c      	mov	_spt_keep_out,#1
7658                     ; 2745 			sys_state_flag.bit.spt_flag = 0;
7660  0f66 7215002c      	bres	_sys_state_flag+1,#2
7661                     ; 2746 			spt_com_count = 0;
7663  0f6a 725f0184      	clr	_spt_com_count
7664                     ; 2748 			pwm_duty_on1 = 0;
7666  0f6e 5f            	clrw	x
7667  0f6f bf56          	ldw	_pwm_duty_on1,x
7668                     ; 2749 			pwm_duty_speed = 0; 
7670  0f71 bf54          	ldw	_pwm_duty_speed,x
7671                     ; 2750 			pwm_duty_speed_old = 0;
7673  0f73 bf22          	ldw	_pwm_duty_speed_old,x
7674                     ; 2751 			spt_low_high_count = 0;
7676  0f75 cf0191        	ldw	_spt_low_high_count,x
7677                     ; 2752 			spt_low_high_count_old =0;
7679  0f78 cf018f        	ldw	_spt_low_high_count_old,x
7680                     ; 2753 			spt_low_high_count_last = 0;
7682  0f7b cf018d        	ldw	_spt_low_high_count_last,x
7683                     ; 2754 			spt_low_high_count_sum = 0;
7685  0f7e cf0189        	ldw	_spt_low_high_count_sum,x
7687  0f81 2004          	jra	L3504
7688  0f83               L7504:
7689                     ; 2757 		else spt_keep_out = 0;
7691  0f83 725f019c      	clr	_spt_keep_out
7692  0f87               L3504:
7693                     ; 2760 	if(spt_high_flag == 1)
7695  0f87 c6019e        	ld	a,_spt_high_flag
7696  0f8a 4a            	dec	a
7697  0f8b 263b          	jrne	L3604
7698                     ; 2762 		if(spt_high_count < 500)spt_high_count += 1;
7700  0f8d ce0193        	ldw	x,_spt_high_count
7701  0f90 a301f4        	cpw	x,#500
7702  0f93 2404          	jruge	L5604
7705  0f95 5c            	incw	x
7706  0f96 cf0193        	ldw	_spt_high_count,x
7707  0f99               L5604:
7708                     ; 2763 		if((spt_high_count > 450) && (sys_state_flag.bit.spt_flag > 0)) //(|| (control_temp > 200))
7710  0f99 a301c3        	cpw	x,#451
7711  0f9c 2526          	jrult	L7604
7713  0f9e 7205002c21    	btjf	_sys_state_flag+1,#2,L7604
7714                     ; 2765 			spt_com_count = 0;
7716  0fa3 725f0184      	clr	_spt_com_count
7717                     ; 2766 			spt_keep_out = 1;			//??μ???ê±??ì?3¤,2???DD?úá|?D??
7719  0fa7 3501019c      	mov	_spt_keep_out,#1
7720                     ; 2767 			sys_state_flag.bit.spt_flag = 0;
7722                     ; 2769 			pwm_duty_on1 = 0;
7724  0fab 5f            	clrw	x
7725  0fac 7215002c      	bres	_sys_state_flag+1,#2
7726  0fb0 bf56          	ldw	_pwm_duty_on1,x
7727                     ; 2770 			pwm_duty_speed = 0;
7729  0fb2 bf54          	ldw	_pwm_duty_speed,x
7730                     ; 2771 			pwm_duty_speed_old = 0;
7732  0fb4 bf22          	ldw	_pwm_duty_speed_old,x
7733                     ; 2772 			spt_low_high_count = 0;
7735  0fb6 cf0191        	ldw	_spt_low_high_count,x
7736                     ; 2773 			spt_low_high_count_old =0;
7738  0fb9 cf018f        	ldw	_spt_low_high_count_old,x
7739                     ; 2774 			spt_low_high_count_last = 0;
7741  0fbc cf018d        	ldw	_spt_low_high_count_last,x
7742                     ; 2775 			spt_low_high_count_sum = 0;
7744  0fbf cf0189        	ldw	_spt_low_high_count_sum,x
7746  0fc2 2004          	jra	L3604
7747  0fc4               L7604:
7748                     ; 2777 		else spt_keep_out = 0;
7750  0fc4 725f019c      	clr	_spt_keep_out
7751  0fc8               L3604:
7752                     ; 2779 		if(((spt_high_count + spt_low_count) > ((spt_low_high_count_last << 1) /*+ (spt_low_high_count_last << 1)*/))  && (spt_low_high_count_old > 5) && (spt_low_high_count_last > 0)) 
7754  0fc8 ce0193        	ldw	x,_spt_high_count
7755  0fcb 72bb0195      	addw	x,_spt_low_count
7756  0fcf 90ce018d      	ldw	y,_spt_low_high_count_last
7757  0fd3 9058          	sllw	y
7758  0fd5 90bf00        	ldw	c_y,y
7759  0fd8 b300          	cpw	x,c_y
7760  0fda 232c          	jrule	L3704
7762  0fdc ce018f        	ldw	x,_spt_low_high_count_old
7763  0fdf a30006        	cpw	x,#6
7764  0fe2 2524          	jrult	L3704
7766  0fe4 ce018d        	ldw	x,_spt_low_high_count_last
7767  0fe7 271f          	jreq	L3704
7768                     ; 2782 			spt_keep_out = 1;	
7770  0fe9 3501019c      	mov	_spt_keep_out,#1
7771                     ; 2783 			pwm_duty_on1 = 0;
7773  0fed 5f            	clrw	x
7774  0fee bf56          	ldw	_pwm_duty_on1,x
7775                     ; 2784 			spt_com_count = 0;
7777  0ff0 725f0184      	clr	_spt_com_count
7778                     ; 2785 			sys_state_flag.bit.spt_flag = 0;        	//·′×a??3y?úá|±ê??
7780  0ff4 7215002c      	bres	_sys_state_flag+1,#2
7781                     ; 2786 			pwm_duty_speed = 0; 
7783  0ff8 bf54          	ldw	_pwm_duty_speed,x
7784                     ; 2787 			pwm_duty_speed_old = 0;
7786  0ffa bf22          	ldw	_pwm_duty_speed_old,x
7787                     ; 2788 			spt_low_high_count = 0;
7789  0ffc cf0191        	ldw	_spt_low_high_count,x
7790                     ; 2789 			spt_low_high_count_old =0;
7792  0fff cf018f        	ldw	_spt_low_high_count_old,x
7793                     ; 2790 			spt_low_high_count_last = 0;
7795  1002 cf018d        	ldw	_spt_low_high_count_last,x
7796                     ; 2791 			spt_low_high_count_sum = 0;
7798  1005 cf0189        	ldw	_spt_low_high_count_sum,x
7799  1008               L3704:
7800                     ; 2804 }
7803  1008 81            	ret	
7859                     ; 2925 void phase_change(u8 PR_hall_position_temp)
7859                     ; 2926 {
7860                     	switch	.text
7861  1009               _phase_change:
7863  1009 88            	push	a
7864       00000000      OFST:	set	0
7867                     ; 2927 	if(pwm_duty_on >= 256)
7869  100a be58          	ldw	x,_pwm_duty_on
7870  100c a30100        	cpw	x,#256
7871  100f 2505          	jrult	L3114
7872                     ; 2929 		pwm_duty_on = 256;
7874  1011 ae0100        	ldw	x,#256
7875  1014 bf58          	ldw	_pwm_duty_on,x
7876  1016               L3114:
7877                     ; 2935 	pwm_duty_low = (pwm_duty_on);
7879  1016 455926        	mov	_pwm_duty_low,_pwm_duty_on+1
7880                     ; 2936 	pwm_duty_high = (pwm_duty_on)>>8;
7882  1019 455825        	mov	_pwm_duty_high,_pwm_duty_on
7883                     ; 2938 	hall_position_temp = PR_hall_position_temp;
7885  101c b721          	ld	_hall_position_temp,a
7886                     ; 2940 	TIM1_CCR1H = pwm_duty_high;
7888  101e 5500255265    	mov	_TIM1_CCR1H,_pwm_duty_high
7889                     ; 2941 	TIM1_CCR1L = pwm_duty_low;
7891  1023 5500265266    	mov	_TIM1_CCR1L,_pwm_duty_low
7892                     ; 2943 	TIM1_CCR2H = pwm_duty_high;
7894  1028 5500255267    	mov	_TIM1_CCR2H,_pwm_duty_high
7895                     ; 2944 	TIM1_CCR2L = pwm_duty_low;
7897  102d 5500265268    	mov	_TIM1_CCR2L,_pwm_duty_low
7898                     ; 2946 	TIM1_CCR3H = pwm_duty_high;
7900  1032 5500255269    	mov	_TIM1_CCR3H,_pwm_duty_high
7901                     ; 2947 	TIM1_CCR3L = pwm_duty_low;
7903  1037 550026526a    	mov	_TIM1_CCR3L,_pwm_duty_low
7904                     ; 2949 	if((hall_drive_back !=  hall_position_temp))
7906  103c b63f          	ld	a,_hall_drive_back
7907  103e b121          	cp	a,_hall_position_temp
7908  1040 2603cc110a    	jreq	L5114
7909                     ; 2951 		if(hall_drive_back > 0)
7911  1045 b63f          	ld	a,_hall_drive_back
7912  1047 2716          	jreq	L7114
7913                     ; 2953 			if((hall_turetable[hall_drive_back]!= hall_position_temp))
7915  1049 5f            	clrw	x
7916  104a 97            	ld	xl,a
7917  104b d60025        	ld	a,(_hall_turetable,x)
7918  104e b121          	cp	a,_hall_position_temp
7919  1050 270d          	jreq	L7114
7920                     ; 2955 				if(hall_turetable2[hall_drive_back]!= hall_position_temp)
7922  1052 b63f          	ld	a,_hall_drive_back
7923  1054 5f            	clrw	x
7924  1055 97            	ld	xl,a
7925  1056 d6002d        	ld	a,(_hall_turetable2,x)
7926  1059 b121          	cp	a,_hall_position_temp
7927  105b 2702          	jreq	L7114
7928                     ; 2956 					hall_position_temp = 0;
7930  105d 3f21          	clr	_hall_position_temp
7931  105f               L7114:
7932                     ; 2960 		if((PWM_mode.all_flag &  (~DRIVE_BIT)) > 0)
7934  105f b627          	ld	a,_PWM_mode
7935  1061 5f            	clrw	x
7936  1062 a4fe          	and	a,#254
7937  1064 97            	ld	xl,a
7938  1065 9c            	rvf	
7939  1066 5d            	tnzw	x
7940  1067 2d02          	jrsle	L5214
7941                     ; 2962 			hall_position_temp = 0;
7943  1069 3f21          	clr	_hall_position_temp
7944  106b               L5214:
7945                     ; 2965 		if(pwm_duty_on == 256)
7947  106b be58          	ldw	x,_pwm_duty_on
7948  106d a30100        	cpw	x,#256
7949  1070 2610          	jrne	L7214
7950                     ; 2967 			PWM_FLASH();	
7952  1072 35085258      	mov	_TIM1_CCMR1,#8
7955  1076 35085259      	mov	_TIM1_CCMR2,#8
7958  107a 3508525a      	mov	_TIM1_CCMR3,#8
7961  107e 721a5257      	bset	_TIM1_EGR,#5
7963  1082               L7214:
7964                     ; 2970 		if(hall_position_temp == 1)
7966  1082 b621          	ld	a,_hall_position_temp
7967  1084 a101          	cp	a,#1
7968  1086 260e          	jrne	L1314
7969                     ; 2974 			PHASE_CCMR_CB();
7971  1088 35485258      	mov	_TIM1_CCMR1,#72
7974  108c 35585259      	mov	_TIM1_CCMR2,#88
7977  1090 3568525a      	mov	_TIM1_CCMR3,#104
7978                     ; 2975 			PHASE_CB();
7983  1094 2010          	jp	LC026
7984  1096               L1314:
7985                     ; 2977 		else if(hall_position_temp == 5)
7987  1096 a105          	cp	a,#5
7988  1098 2612          	jrne	L5314
7989                     ; 2981 			PHASE_CCMR_AB();	
7991  109a 35685258      	mov	_TIM1_CCMR1,#104
7994  109e 35585259      	mov	_TIM1_CCMR2,#88
7997  10a2 3548525a      	mov	_TIM1_CCMR3,#72
7998                     ; 2982 			PHASE_AB();
8001  10a6               LC026:
8003  10a6 3541525c      	mov	_TIM1_CCER1,#65
8007  10aa 204e          	jp	LC024
8008  10ac               L5314:
8009                     ; 2984 		else if(hall_position_temp == 4)
8011  10ac a104          	cp	a,#4
8012  10ae 2616          	jrne	L1414
8013                     ; 2988 			PHASE_CCMR_AC();	
8015  10b0 35685258      	mov	_TIM1_CCMR1,#104
8018  10b4 35485259      	mov	_TIM1_CCMR2,#72
8021                     ; 2989 			PHASE_AC();
8026  10b8               LC027:
8028  10b8 3558525a      	mov	_TIM1_CCMR3,#88
8030  10bc 3511525c      	mov	_TIM1_CCER1,#17
8032  10c0 3514525d      	mov	_TIM1_CCER2,#20
8035  10c4 203d          	jra	L3314
8036  10c6               L1414:
8037                     ; 2991 		else if(hall_position_temp == 6)
8039  10c6 a106          	cp	a,#6
8040  10c8 260a          	jrne	L5414
8041                     ; 2995 			PHASE_CCMR_BC();	
8043  10ca 35485258      	mov	_TIM1_CCMR1,#72
8046  10ce 35685259      	mov	_TIM1_CCMR2,#104
8048                     ; 2996 			PHASE_BC();
8053  10d2 20e4          	jp	LC027
8054  10d4               L5414:
8055                     ; 2998 		else if(hall_position_temp == 2)
8057  10d4 a102          	cp	a,#2
8058  10d6 260e          	jrne	L1514
8059                     ; 3002 			PHASE_CCMR_BA();	
8061  10d8 35585258      	mov	_TIM1_CCMR1,#88
8064  10dc 35685259      	mov	_TIM1_CCMR2,#104
8067  10e0 3548525a      	mov	_TIM1_CCMR3,#72
8068                     ; 3003 			PHASE_BA();
8073  10e4 2010          	jp	LC025
8074  10e6               L1514:
8075                     ; 3005 		else if(hall_position_temp == 3)
8077  10e6 a103          	cp	a,#3
8078  10e8 2616          	jrne	L5514
8079                     ; 3009 			PHASE_CCMR_CA();
8081  10ea 35585258      	mov	_TIM1_CCMR1,#88
8084  10ee 35485259      	mov	_TIM1_CCMR2,#72
8087  10f2 3568525a      	mov	_TIM1_CCMR3,#104
8088                     ; 3010 			PHASE_CA();
8091  10f6               LC025:
8093  10f6 3514525c      	mov	_TIM1_CCER1,#20
8096  10fa               LC024:
8100  10fa 3511525d      	mov	_TIM1_CCER2,#17
8103  10fe 2003          	jra	L3314
8104  1100               L5514:
8105                     ; 3014 			PWM_ALL_OFF();		
8107  1100 cd12ee        	call	_PWM_ALL_OFF
8109  1103               L3314:
8110                     ; 3016 		TIM1_EGR |= 0x20;					//刷新PWM
8112  1103 721a5257      	bset	_TIM1_EGR,#5
8113                     ; 3017 		hall_drive_back = hall_position_temp;
8115  1107 45213f        	mov	_hall_drive_back,_hall_position_temp
8116  110a               L5114:
8117                     ; 3019 	PWM_mode.all_flag = DRIVE_BIT;
8119  110a 35010027      	mov	_PWM_mode,#1
8120                     ; 3020 }
8123  110e 84            	pop	a
8124  110f 81            	ret	
8180                     ; 3022 void phase_lock_change(u8 PR_hall_position_temp) //nohall lock start
8180                     ; 3023 {
8181                     	switch	.text
8182  1110               _phase_lock_change:
8184  1110 88            	push	a
8185       00000000      OFST:	set	0
8188                     ; 3024 	if(pwm_duty_on >= 256)
8190  1111 be58          	ldw	x,_pwm_duty_on
8191  1113 a30100        	cpw	x,#256
8192  1116 2505          	jrult	L7714
8193                     ; 3026 		pwm_duty_on = 256;
8195  1118 ae0100        	ldw	x,#256
8196  111b bf58          	ldw	_pwm_duty_on,x
8197  111d               L7714:
8198                     ; 3032 	pwm_duty_low = (pwm_duty_on);
8200  111d 455926        	mov	_pwm_duty_low,_pwm_duty_on+1
8201                     ; 3033 	pwm_duty_high = (pwm_duty_on)>>8;
8203  1120 455825        	mov	_pwm_duty_high,_pwm_duty_on
8204                     ; 3035 	hall_position_temp = PR_hall_position_temp;
8206  1123 b721          	ld	_hall_position_temp,a
8207                     ; 3037 	TIM1_CCR1H = pwm_duty_high;
8209  1125 5500255265    	mov	_TIM1_CCR1H,_pwm_duty_high
8210                     ; 3038 	TIM1_CCR1L = pwm_duty_low;
8212  112a 5500265266    	mov	_TIM1_CCR1L,_pwm_duty_low
8213                     ; 3040 	TIM1_CCR2H = pwm_duty_high;
8215  112f 5500255267    	mov	_TIM1_CCR2H,_pwm_duty_high
8216                     ; 3041 	TIM1_CCR2L = pwm_duty_low;
8218  1134 5500265268    	mov	_TIM1_CCR2L,_pwm_duty_low
8219                     ; 3043 	TIM1_CCR3H = pwm_duty_high;
8221  1139 5500255269    	mov	_TIM1_CCR3H,_pwm_duty_high
8222                     ; 3044 	TIM1_CCR3L = pwm_duty_low;
8224  113e 550026526a    	mov	_TIM1_CCR3L,_pwm_duty_low
8225                     ; 3046 	if((hall_drive_back !=  hall_position_temp))
8227  1143 b63f          	ld	a,_hall_drive_back
8228  1145 b121          	cp	a,_hall_position_temp
8229  1147 2603cc1221    	jreq	L1024
8230                     ; 3048 		if(hall_drive_back > 0)
8232  114c b63f          	ld	a,_hall_drive_back
8233  114e 2716          	jreq	L3024
8234                     ; 3050 			if((hall_turetable[hall_drive_back]!= hall_position_temp))
8236  1150 5f            	clrw	x
8237  1151 97            	ld	xl,a
8238  1152 d60025        	ld	a,(_hall_turetable,x)
8239  1155 b121          	cp	a,_hall_position_temp
8240  1157 270d          	jreq	L3024
8241                     ; 3052 				if(hall_turetable2[hall_drive_back]!= hall_position_temp)
8243  1159 b63f          	ld	a,_hall_drive_back
8244  115b 5f            	clrw	x
8245  115c 97            	ld	xl,a
8246  115d d6002d        	ld	a,(_hall_turetable2,x)
8247  1160 b121          	cp	a,_hall_position_temp
8248  1162 2702          	jreq	L3024
8249                     ; 3053 					hall_position_temp = 0;
8251  1164 3f21          	clr	_hall_position_temp
8252  1166               L3024:
8253                     ; 3057 		if((PWM_mode.all_flag &  (~DRIVE_BIT)) > 0)
8255  1166 b627          	ld	a,_PWM_mode
8256  1168 5f            	clrw	x
8257  1169 a4fe          	and	a,#254
8258  116b 97            	ld	xl,a
8259  116c 9c            	rvf	
8260  116d 5d            	tnzw	x
8261  116e 2d02          	jrsle	L1124
8262                     ; 3059 			hall_position_temp = 0;
8264  1170 3f21          	clr	_hall_position_temp
8265  1172               L1124:
8266                     ; 3062 		if(pwm_duty_on == 256)
8268  1172 be58          	ldw	x,_pwm_duty_on
8269  1174 a30100        	cpw	x,#256
8270  1177 2610          	jrne	L3124
8271                     ; 3064 			PWM_FLASH();	
8273  1179 35085258      	mov	_TIM1_CCMR1,#8
8276  117d 35085259      	mov	_TIM1_CCMR2,#8
8279  1181 3508525a      	mov	_TIM1_CCMR3,#8
8282  1185 721a5257      	bset	_TIM1_EGR,#5
8284  1189               L3124:
8285                     ; 3067 		if(hall_position_temp == 1)
8287  1189 b621          	ld	a,_hall_position_temp
8288  118b a101          	cp	a,#1
8289  118d 2612          	jrne	L5124
8290                     ; 3071 			PHASE_CCMR_C_AB();
8292  118f 35585258      	mov	_TIM1_CCMR1,#88
8295  1193 35585259      	mov	_TIM1_CCMR2,#88
8298  1197 3568525a      	mov	_TIM1_CCMR3,#104
8299                     ; 3072 			PHASE_C_AB();
8302  119b 3544525c      	mov	_TIM1_CCER1,#68
8306  119f 2070          	jp	LC028
8307  11a1               L5124:
8308                     ; 3074 		else if(hall_position_temp == 5)
8310  11a1 a105          	cp	a,#5
8311  11a3 2612          	jrne	L1224
8312                     ; 3078 			PHASE_CCMR_AC_B();	
8314  11a5 35685258      	mov	_TIM1_CCMR1,#104
8317  11a9 35585259      	mov	_TIM1_CCMR2,#88
8320  11ad 3568525a      	mov	_TIM1_CCMR3,#104
8321                     ; 3079 			PHASE_AC_B();
8324  11b1 3541525c      	mov	_TIM1_CCER1,#65
8328  11b5 205a          	jp	LC028
8329  11b7               L1224:
8330                     ; 3081 		else if(hall_position_temp == 4)
8332  11b7 a104          	cp	a,#4
8333  11b9 2612          	jrne	L5224
8334                     ; 3085 			PHASE_CCMR_A_BC();	
8336  11bb 35685258      	mov	_TIM1_CCMR1,#104
8339  11bf 35585259      	mov	_TIM1_CCMR2,#88
8342  11c3 3558525a      	mov	_TIM1_CCMR3,#88
8343                     ; 3086 			PHASE_A_BC();
8346  11c7 3541525c      	mov	_TIM1_CCER1,#65
8350  11cb 2014          	jp	LC029
8351  11cd               L5224:
8352                     ; 3088 		else if(hall_position_temp == 6)
8354  11cd a106          	cp	a,#6
8355  11cf 2616          	jrne	L1324
8356                     ; 3092 			PHASE_CCMR_AB_C();	
8358  11d1 35685258      	mov	_TIM1_CCMR1,#104
8361  11d5 35685259      	mov	_TIM1_CCMR2,#104
8364  11d9 3558525a      	mov	_TIM1_CCMR3,#88
8365                     ; 3093 			PHASE_AB_C();
8368  11dd 3511525c      	mov	_TIM1_CCER1,#17
8371  11e1               LC029:
8374  11e1 3514525d      	mov	_TIM1_CCER2,#20
8377  11e5 2033          	jra	L7124
8378  11e7               L1324:
8379                     ; 3095 		else if(hall_position_temp == 2)
8381  11e7 a102          	cp	a,#2
8382  11e9 2612          	jrne	L5324
8383                     ; 3099 			PHASE_CCMR_B_AC();	
8385  11eb 35585258      	mov	_TIM1_CCMR1,#88
8388  11ef 35685259      	mov	_TIM1_CCMR2,#104
8391  11f3 3558525a      	mov	_TIM1_CCMR3,#88
8392                     ; 3100 			PHASE_B_AC();
8395  11f7 3514525c      	mov	_TIM1_CCER1,#20
8399  11fb 20e4          	jp	LC029
8400  11fd               L5324:
8401                     ; 3102 		else if(hall_position_temp == 3)
8403  11fd a103          	cp	a,#3
8404  11ff 2616          	jrne	L1424
8405                     ; 3106 			PHASE_CCMR_BC_A();
8407  1201 35585258      	mov	_TIM1_CCMR1,#88
8410  1205 35685259      	mov	_TIM1_CCMR2,#104
8413  1209 3568525a      	mov	_TIM1_CCMR3,#104
8414                     ; 3107 			PHASE_BC_A();
8417  120d 3514525c      	mov	_TIM1_CCER1,#20
8420  1211               LC028:
8423  1211 3511525d      	mov	_TIM1_CCER2,#17
8426  1215 2003          	jra	L7124
8427  1217               L1424:
8428                     ; 3111 			PWM_ALL_OFF();		
8430  1217 cd12ee        	call	_PWM_ALL_OFF
8432  121a               L7124:
8433                     ; 3113 		TIM1_EGR |= 0x20;					//刷新PWM
8435  121a 721a5257      	bset	_TIM1_EGR,#5
8436                     ; 3114 		hall_drive_back = hall_position_temp;
8438  121e 45213f        	mov	_hall_drive_back,_hall_position_temp
8439  1221               L1024:
8440                     ; 3116 	PWM_mode.all_flag = DRIVE_BIT;
8442  1221 35010027      	mov	_PWM_mode,#1
8443                     ; 3117 }
8446  1225 84            	pop	a
8447  1226 81            	ret	
8499                     ; 3125 void phase_abs_change(u8 PR_hall_position_temp)
8499                     ; 3126 {
8500                     	switch	.text
8501  1227               _phase_abs_change:
8503       00000000      OFST:	set	0
8506                     ; 3127 	if(pwm_duty_brake >= 400) 
8508  1227 be52          	ldw	x,_pwm_duty_brake
8509  1229 a30190        	cpw	x,#400
8510  122c 2515          	jrult	L3624
8511                     ; 3129 		pwm_duty_brake = 400;
8513  122e ae0190        	ldw	x,#400
8514  1231 bf52          	ldw	_pwm_duty_brake,x
8515                     ; 3130 		PWM_FLASH();
8517  1233 35085258      	mov	_TIM1_CCMR1,#8
8520  1237 35085259      	mov	_TIM1_CCMR2,#8
8523  123b 3508525a      	mov	_TIM1_CCMR3,#8
8526  123f 721a5257      	bset	_TIM1_EGR,#5
8528  1243               L3624:
8529                     ; 3132 	hall_position_temp = PR_hall_position_temp;
8531  1243 b721          	ld	_hall_position_temp,a
8532                     ; 3133 	pwm_duty_low = pwm_duty_brake;
8534  1245 455326        	mov	_pwm_duty_low,_pwm_duty_brake+1
8535                     ; 3134 	pwm_duty_high = pwm_duty_brake>>8;
8537  1248 455225        	mov	_pwm_duty_high,_pwm_duty_brake
8538                     ; 3136 	if(PWM_mode.all_flag != ABS_BIT)
8540  124b b627          	ld	a,_PWM_mode
8541  124d a102          	cp	a,#2
8542  124f 2706          	jreq	L5624
8543                     ; 3138 		hall_position_temp = 0;
8545  1251 3f21          	clr	_hall_position_temp
8546                     ; 3139 		PWM_mode.all_flag = ABS_BIT;
8548  1253 35020027      	mov	_PWM_mode,#2
8549  1257               L5624:
8550                     ; 3142 	TIM1_CCMR1 = PWM_MODE1;
8552  1257 35685258      	mov	_TIM1_CCMR1,#104
8553                     ; 3143 	TIM1_CCMR2 = PWM_MODE1;
8555  125b 35685259      	mov	_TIM1_CCMR2,#104
8556                     ; 3144 	TIM1_CCMR3 = PWM_MODE1;	
8558  125f 3568525a      	mov	_TIM1_CCMR3,#104
8559                     ; 3146 	TIM1_CCR1H = PWMDUTY_OFFH;
8561  1263 725f5265      	clr	_TIM1_CCR1H
8562                     ; 3147 	TIM1_CCR1L = PWMDUTY_OFFL;	
8564  1267 725f5266      	clr	_TIM1_CCR1L
8565                     ; 3149 	TIM1_CCR2H = PWMDUTY_OFFH;
8567  126b 725f5267      	clr	_TIM1_CCR2H
8568                     ; 3150 	TIM1_CCR2L = PWMDUTY_OFFL;	
8570  126f 725f5268      	clr	_TIM1_CCR2L
8571                     ; 3152 	TIM1_CCR3H = PWMDUTY_OFFH;
8573  1273 725f5269      	clr	_TIM1_CCR3H
8574                     ; 3153 	TIM1_CCR3L = PWMDUTY_OFFL;	
8576  1277 725f526a      	clr	_TIM1_CCR3L
8577                     ; 3155 	TIM1_CCR1H = pwm_duty_high;
8579  127b 5500255265    	mov	_TIM1_CCR1H,_pwm_duty_high
8580                     ; 3156 	TIM1_CCR1L = pwm_duty_low;	
8582  1280 5500265266    	mov	_TIM1_CCR1L,_pwm_duty_low
8583                     ; 3158 	TIM1_CCR2H = pwm_duty_high;
8585  1285 5500255267    	mov	_TIM1_CCR2H,_pwm_duty_high
8586                     ; 3159 	TIM1_CCR2L = pwm_duty_low;	
8588  128a 5500265268    	mov	_TIM1_CCR2L,_pwm_duty_low
8589                     ; 3161 	TIM1_CCR3H = pwm_duty_high;
8591  128f 5500255269    	mov	_TIM1_CCR3H,_pwm_duty_high
8592                     ; 3162 	TIM1_CCR3L = pwm_duty_low;
8594  1294 550026526a    	mov	_TIM1_CCR3L,_pwm_duty_low
8595                     ; 3164 	TIM1_CCER1 = 0x44;
8597  1299 3544525c      	mov	_TIM1_CCER1,#68
8598                     ; 3165 	TIM1_CCER2 = 0x14;
8600  129d 3514525d      	mov	_TIM1_CCER2,#20
8601                     ; 3190 	TIM1_EGR |= 0x20;					//刷新PWM
8603  12a1 721a5257      	bset	_TIM1_EGR,#5
8604                     ; 3191 }
8607  12a5 81            	ret	
8634                     ; 3195 void brake_pwm_duty(void)
8634                     ; 3196 {
8635                     	switch	.text
8636  12a6               _brake_pwm_duty:
8640                     ; 3197 	if(speed_motor2 <= 10)
8642  12a6 be00          	ldw	x,_speed_motor2
8643  12a8 a3000b        	cpw	x,#11
8644  12ab 2403          	jruge	L7724
8645                     ; 3198 		pwm_brake_max = 0;
8647  12ad 5f            	clrw	x
8649  12ae 200d          	jra	L1034
8650  12b0               L7724:
8651                     ; 3201 		pwm_brake_max = ((speed_motor2 - 2) * 15);
8653  12b0 89            	pushw	x
8654  12b1 58            	sllw	x
8655  12b2 58            	sllw	x
8656  12b3 58            	sllw	x
8657  12b4 58            	sllw	x
8658  12b5 72f001        	subw	x,(1,sp)
8659  12b8 5b02          	addw	sp,#2
8661  12ba 1d001e        	subw	x,#30
8662  12bd               L1034:
8663  12bd bf50          	ldw	_pwm_brake_max,x
8664                     ; 3204 	if(speed_motor2 > 120)
8666  12bf be00          	ldw	x,_speed_motor2
8667  12c1 a30079        	cpw	x,#121
8668  12c4 2503          	jrult	L3034
8669                     ; 3205 		pwm_brake_max = 0;
8671  12c6 5f            	clrw	x
8672  12c7 bf50          	ldw	_pwm_brake_max,x
8673  12c9               L3034:
8674                     ; 3207 	if(pwm_brake_max > 400)
8676  12c9 be50          	ldw	x,_pwm_brake_max
8677  12cb a30191        	cpw	x,#401
8678  12ce 2505          	jrult	L5034
8679                     ; 3208 		pwm_brake_max = 400;
8681  12d0 ae0190        	ldw	x,#400
8682  12d3 bf50          	ldw	_pwm_brake_max,x
8683  12d5               L5034:
8684                     ; 3210 	if(pwm_up_count > 4)
8686  12d5 b624          	ld	a,_pwm_up_count
8687  12d7 a105          	cp	a,#5
8688  12d9 2510          	jrult	L7034
8689                     ; 3212 		pwm_up_count = 0;
8691  12db 3f24          	clr	_pwm_up_count
8692                     ; 3213 		if(pwm_duty_brake < pwm_brake_max)
8694  12dd be52          	ldw	x,_pwm_duty_brake
8695  12df b350          	cpw	x,_pwm_brake_max
8696  12e1 2403          	jruge	L1134
8697                     ; 3215 			pwm_duty_brake ++;
8699  12e3 5c            	incw	x
8701  12e4 2002          	jp	LC030
8702  12e6               L1134:
8703                     ; 3218 			pwm_duty_brake = pwm_brake_max;
8705  12e6 be50          	ldw	x,_pwm_brake_max
8706  12e8               LC030:
8707  12e8 bf52          	ldw	_pwm_duty_brake,x
8709  12ea 81            	ret	
8710  12eb               L7034:
8711                     ; 3221 		pwm_up_count ++;
8713  12eb 3c24          	inc	_pwm_up_count
8714                     ; 3222 }
8717  12ed 81            	ret	
8757                     ; 3229 void PWM_ALL_OFF(void)
8757                     ; 3230 {
8758                     	switch	.text
8759  12ee               _PWM_ALL_OFF:
8763                     ; 3231 	PWM_FLASH();
8765  12ee 35085258      	mov	_TIM1_CCMR1,#8
8768  12f2 35085259      	mov	_TIM1_CCMR2,#8
8771  12f6 3508525a      	mov	_TIM1_CCMR3,#8
8774  12fa 721a5257      	bset	_TIM1_EGR,#5
8775                     ; 3232 	TIM1_CCMR1 = PWM_HOLD_OFF;
8778  12fe 35485258      	mov	_TIM1_CCMR1,#72
8779                     ; 3233 	TIM1_CCMR2 = PWM_HOLD_OFF;
8781  1302 35485259      	mov	_TIM1_CCMR2,#72
8782                     ; 3234 	TIM1_CCMR3 = PWM_HOLD_OFF;
8784  1306 3548525a      	mov	_TIM1_CCMR3,#72
8785                     ; 3237 	TIM1_CCR1H = 0x00;
8787  130a 725f5265      	clr	_TIM1_CCR1H
8788                     ; 3238 	TIM1_CCR1L = 0x00;
8790  130e 725f5266      	clr	_TIM1_CCR1L
8791                     ; 3239 	TIM1_CCR2H = 0x00;
8793  1312 725f5267      	clr	_TIM1_CCR2H
8794                     ; 3240 	TIM1_CCR2L = 0x00;
8796  1316 725f5268      	clr	_TIM1_CCR2L
8797                     ; 3241 	TIM1_CCR3H = 0x00;
8799  131a 725f5269      	clr	_TIM1_CCR3H
8800                     ; 3242 	TIM1_CCR3L = 0x00;
8802  131e 725f526a      	clr	_TIM1_CCR3L
8803                     ; 3244 	TIM1_CCER1 &= 0xee;
8805  1322 c6525c        	ld	a,_TIM1_CCER1
8806  1325 a4ee          	and	a,#238
8807  1327 c7525c        	ld	_TIM1_CCER1,a
8808                     ; 3245 	TIM1_CCER2 &= 0xfe;	
8810  132a 7211525d      	bres	_TIM1_CCER2,#0
8811                     ; 3246 	TIM1_CCER1 |= 0X44;
8813  132e c6525c        	ld	a,_TIM1_CCER1
8814  1331 aa44          	or	a,#68
8815  1333 c7525c        	ld	_TIM1_CCER1,a
8816                     ; 3247 	TIM1_CCER2 |= 0X04;
8818  1336 7214525d      	bset	_TIM1_CCER2,#2
8819                     ; 3248 	TIM1_EGR |= 0x20;
8821  133a 721a5257      	bset	_TIM1_EGR,#5
8822                     ; 3249 	pwm_duty_on = 0;
8824  133e 5f            	clrw	x
8825  133f bf58          	ldw	_pwm_duty_on,x
8826                     ; 3250 	pwm_duty_on_old = 0;	
8828  1341 bf5a          	ldw	_pwm_duty_on_old,x
8829                     ; 3251 	sensor_pwm_duty = 0;
8831  1343 cf0169        	ldw	_sensor_pwm_duty,x
8832                     ; 3252 	PWM_mode.all_flag = 0;
8834  1346 3f27          	clr	_PWM_mode
8835                     ; 3253 	motor_flag.all_flag = 0x00;
8837  1348 3f28          	clr	_motor_flag
8838                     ; 3254 }
8841  134a 81            	ret	
8866                     ; 3258 void motor_brake(void)
8866                     ; 3259 {
8867                     	switch	.text
8868  134b               _motor_brake:
8872                     ; 3261 	phase_abs_change(rotor_position);
8874  134b b640          	ld	a,_rotor_position
8876                     ; 3264 }
8879  134d cc1227        	jp	_phase_abs_change
8909                     ; 3269 void motor_drive(void)
8909                     ; 3270 {
8910                     	switch	.text
8911  1350               _motor_drive:
8915                     ; 3271 	if(square_sine_change_flag == 1)
8917  1350 c601c9        	ld	a,_square_sine_change_flag
8918  1353 4a            	dec	a
8919  1354 260b          	jrne	L7434
8920                     ; 3286 			ph_low_count_max = 0;
8922                     ; 3297 				ph_low_count_max = 0;	
8924  1356 b745          	ld	_ph_low_count_max,a
8925                     ; 3298 				pwm_duty_on = pwm_duty_on_old;
8927  1358 be5a          	ldw	x,_pwm_duty_on_old
8928  135a bf58          	ldw	_pwm_duty_on,x
8929                     ; 3305 			phase_change(rotor_position);
8931  135c b640          	ld	a,_rotor_position
8935  135e cc1009        	jp	_phase_change
8936  1361               L7434:
8937                     ; 3310 		rotor_ver();
8940                     ; 3311 }
8943  1361 cc0000        	jp	_rotor_ver
8980                     ; 3315 void STOP_drive(void)
8980                     ; 3316 {
8981                     	switch	.text
8982  1364               _STOP_drive:
8986                     ; 3318 	if((pwm_duty_on_old < 30)||((error_bank.all_flag & 0xD600) > 0) || (debug_mode_flag > 0)|| (speed_motor2 >= 350))
8988  1364 be5a          	ldw	x,_pwm_duty_on_old
8989  1366 a3001e        	cpw	x,#30
8990  1369 2511          	jrult	L5634
8992  136b b62e          	ld	a,_error_bank
8993  136d a5d6          	bcp	a,#214
8994  136f 260b          	jrne	L5634
8996  1371 b64b          	ld	a,_debug_mode_flag
8997  1373 2607          	jrne	L5634
8999  1375 be00          	ldw	x,_speed_motor2
9000  1377 a3015e        	cpw	x,#350
9001  137a 250f          	jrult	L3634
9002  137c               L5634:
9003                     ; 3320 		PWM_ALL_OFF();
9005  137c cd12ee        	call	_PWM_ALL_OFF
9007                     ; 3321 		pwm_duty_on_old = 0;
9009  137f 5f            	clrw	x
9010  1380 bf5a          	ldw	_pwm_duty_on_old,x
9011                     ; 3322 		pwm_duty_on = 0;
9013  1382 bf58          	ldw	_pwm_duty_on,x
9014                     ; 3323 		pwm_sub_count = 0;
9016  1384 3f44          	clr	_pwm_sub_count
9017                     ; 3324 		hall_drive_back = 0;
9019  1386 3f3f          	clr	_hall_drive_back
9020                     ; 3325 		motor_flag.all_flag = 0x00;	//y42
9022  1388 3f28          	clr	_motor_flag
9024                     ; 3366 }
9027  138a 81            	ret	
9028  138b               L3634:
9029                     ; 3330 		if((sys_state_flag.bit.current_over_flag > 0))// || (sys_state_flag.bit.current_over_flag > 0))
9031  138b b644          	ld	a,_pwm_sub_count
9032  138d 7201002d10    	btjf	_sys_state_flag+2,#0,L5734
9033                     ; 3332 			if(pwm_sub_count == 0)
9035  1392 2621          	jrne	L1144
9036                     ; 3334 				if(pwm_duty_on_old >= 1)
9038  1394 be5a          	ldw	x,_pwm_duty_on_old
9039  1396 2703          	jreq	L1044
9040                     ; 3335 					pwm_duty_on_old -= 1;
9042  1398 5a            	decw	x
9043  1399 bf5a          	ldw	_pwm_duty_on_old,x
9044  139b               L1044:
9045                     ; 3336 				if(pwm_duty_on_old > MAX_PWMDUTY)
9047  139b a301e1        	cpw	x,#481
9048  139e 2515          	jrult	L1144
9049                     ; 3337 					pwm_duty_on_old = MAX_PWMDUTY;
9050                     ; 3339 			pwm_sub_count++;
9051                     ; 3340 			if(pwm_sub_count >= 4)
9052                     ; 3341 				pwm_sub_count = 0;
9053  13a0 200e          	jp	LC032
9054  13a2               L5734:
9055                     ; 3345 			if(pwm_sub_count == 0)
9057  13a2 2611          	jrne	L1144
9058                     ; 3347 				if(pwm_duty_on_old >= 1)
9060  13a4 be5a          	ldw	x,_pwm_duty_on_old
9061  13a6 2703          	jreq	L3144
9062                     ; 3348 					pwm_duty_on_old -= 1;
9064  13a8 5a            	decw	x
9065  13a9 bf5a          	ldw	_pwm_duty_on_old,x
9066  13ab               L3144:
9067                     ; 3349 				if(pwm_duty_on_old > MAX_PWMDUTY)
9069  13ab a301e1        	cpw	x,#481
9070  13ae 2505          	jrult	L1144
9071                     ; 3350 					pwm_duty_on_old = MAX_PWMDUTY;
9073  13b0               LC032:
9075  13b0 ae01e0        	ldw	x,#480
9076  13b3 bf5a          	ldw	_pwm_duty_on_old,x
9077  13b5               L1144:
9078                     ; 3352 			pwm_sub_count++;
9080                     ; 3353 			if(pwm_sub_count >= 4)
9082                     ; 3354 				pwm_sub_count = 0;
9085  13b5 3c44          	inc	_pwm_sub_count
9087  13b7 b644          	ld	a,_pwm_sub_count
9088  13b9 a104          	cp	a,#4
9089  13bb 2502          	jrult	L7044
9091  13bd 3f44          	clr	_pwm_sub_count
9092  13bf               L7044:
9093                     ; 3356 		if(pwm_duty_on_old < 10)
9095  13bf be5a          	ldw	x,_pwm_duty_on_old
9096  13c1 a3000a        	cpw	x,#10
9097  13c4 2403          	jruge	L1244
9098                     ; 3357 			pwm_duty_on_old = 0;
9100  13c6 5f            	clrw	x
9101  13c7 bf5a          	ldw	_pwm_duty_on_old,x
9102  13c9               L1244:
9103                     ; 3358 		pwm_duty_on = pwm_duty_on_old;
9105  13c9 bf58          	ldw	_pwm_duty_on,x
9106                     ; 3360  	if(square_sine_change_flag == 1)
9108  13cb c601c9        	ld	a,_square_sine_change_flag
9109  13ce 4a            	dec	a
9110  13cf 2605          	jrne	L3244
9111                     ; 3361 			phase_change(rotor_position);
9113  13d1 b640          	ld	a,_rotor_position
9117  13d3 cc1009        	jp	_phase_change
9118  13d6               L3244:
9119                     ; 3363 			rotor_ver();
9123  13d6 cc0000        	jp	_rotor_ver
9168                     ; 3420 void motor_lock_drive(void)
9168                     ; 3421 {
9169                     	switch	.text
9170  13d9               _motor_lock_drive:
9174                     ; 3422 	if((current_high_flag > 0))				//current limit
9176  13d9 c60000        	ld	a,_current_high_flag
9177  13dc 2724          	jreq	L7344
9178                     ; 3424 		if(pwm_sub_count1 == 0)
9180  13de c601a4        	ld	a,_pwm_sub_count1
9181  13e1 260c          	jrne	L1444
9182                     ; 3426 			if(pwm_duty_on_old >= 10)
9184  13e3 be5a          	ldw	x,_pwm_duty_on_old
9185  13e5 a3000a        	cpw	x,#10
9186  13e8 2505          	jrult	L1444
9187                     ; 3427 				pwm_duty_on_old -= 5;
9189  13ea 1d0005        	subw	x,#5
9190  13ed bf5a          	ldw	_pwm_duty_on_old,x
9191  13ef               L1444:
9192                     ; 3430 		pwm_sub_count1 ++;
9194  13ef 725c01a4      	inc	_pwm_sub_count1
9195                     ; 3432 		if(pwm_sub_count1 >= 7)
9197  13f3 c601a4        	ld	a,_pwm_sub_count1
9198  13f6 a107          	cp	a,#7
9199  13f8 2504          	jrult	L5444
9200                     ; 3433 			pwm_sub_count1 = 0;
9202  13fa 725f01a4      	clr	_pwm_sub_count1
9203  13fe               L5444:
9204                     ; 3435 		pwm_duty_on = pwm_duty_on_old;
9206  13fe be5a          	ldw	x,_pwm_duty_on_old
9208  1400 2025          	jra	L7544
9209  1402               L7344:
9210                     ; 3439 		if(pwm_duty_on_old < 150)
9212  1402 be5a          	ldw	x,_pwm_duty_on_old
9213  1404 a30096        	cpw	x,#150
9214  1407 2419          	jruge	L1544
9215                     ; 3441 			if(pwm_add_count1 == 0)
9217  1409 c601a5        	ld	a,_pwm_add_count1
9218  140c 2603          	jrne	L3544
9219                     ; 3442 				pwm_duty_on_old += 1;
9221  140e 5c            	incw	x
9222  140f bf5a          	ldw	_pwm_duty_on_old,x
9223  1411               L3544:
9224                     ; 3444 			pwm_add_count1 ++;
9226  1411 725c01a5      	inc	_pwm_add_count1
9227                     ; 3446 			if(pwm_add_count1 >= 40)
9229  1415 c601a5        	ld	a,_pwm_add_count1
9230  1418 a128          	cp	a,#40
9231  141a 250b          	jrult	L7544
9232                     ; 3447 				pwm_add_count1 = 0;
9234  141c 725f01a5      	clr	_pwm_add_count1
9235  1420 2005          	jra	L7544
9236  1422               L1544:
9237                     ; 3450 			pwm_duty_on_old = 150;
9239  1422 ae0096        	ldw	x,#150
9240  1425 bf5a          	ldw	_pwm_duty_on_old,x
9241  1427               L7544:
9242                     ; 3452 		pwm_duty_on = pwm_duty_on_old;
9244  1427 bf58          	ldw	_pwm_duty_on,x
9245                     ; 3454 	pwm_duty_high = pwm_duty_on >>8;
9247  1429 455825        	mov	_pwm_duty_high,_pwm_duty_on
9248                     ; 3455 	pwm_duty_low = pwm_duty_on;	
9250  142c 455926        	mov	_pwm_duty_low,_pwm_duty_on+1
9251                     ; 3458     if((PWM_mode.all_flag &  (~ALM_BIT)) > 0)
9253  142f 5f            	clrw	x
9254  1430 b627          	ld	a,_PWM_mode
9255  1432 a4fb          	and	a,#251
9256  1434 97            	ld	xl,a
9257  1435 9c            	rvf	
9258  1436 5d            	tnzw	x
9259  1437 2d04          	jrsle	L1644
9260                     ; 3460 		pwm_duty_high = 0;
9262  1439 3f25          	clr	_pwm_duty_high
9263                     ; 3461 		pwm_duty_low = 0;
9265  143b 3f26          	clr	_pwm_duty_low
9266  143d               L1644:
9267                     ; 3464 	if(pwm_duty_on == 500)
9269  143d be58          	ldw	x,_pwm_duty_on
9270  143f a301f4        	cpw	x,#500
9271  1442 2610          	jrne	L3644
9272                     ; 3465 		PWM_FLASH();
9274  1444 35085258      	mov	_TIM1_CCMR1,#8
9277  1448 35085259      	mov	_TIM1_CCMR2,#8
9280  144c 3508525a      	mov	_TIM1_CCMR3,#8
9283  1450 721a5257      	bset	_TIM1_EGR,#5
9284  1454               L3644:
9285                     ; 3467     TIM1_CCR1H = pwm_duty_high;
9288  1454 5500255265    	mov	_TIM1_CCR1H,_pwm_duty_high
9289                     ; 3468 	TIM1_CCR1L = pwm_duty_low;
9291  1459 5500265266    	mov	_TIM1_CCR1L,_pwm_duty_low
9292                     ; 3470 	TIM1_CCR2H = pwm_duty_high;
9294  145e 5500255267    	mov	_TIM1_CCR2H,_pwm_duty_high
9295                     ; 3471 	TIM1_CCR2L = pwm_duty_low;
9297  1463 5500265268    	mov	_TIM1_CCR2L,_pwm_duty_low
9298                     ; 3473 	TIM1_CCR3H = pwm_duty_high;
9300  1468 5500255269    	mov	_TIM1_CCR3H,_pwm_duty_high
9301                     ; 3474 	TIM1_CCR3L = pwm_duty_low;
9303  146d 550026526a    	mov	_TIM1_CCR3L,_pwm_duty_low
9304                     ; 3476 	if((lock_hall == 7)||(lock_hall == 0))
9306  1472 b61f          	ld	a,_lock_hall
9307  1474 a107          	cp	a,#7
9308  1476 2704          	jreq	L7644
9310  1478 b61f          	ld	a,_lock_hall
9311  147a 261d          	jrne	L5644
9312  147c               L7644:
9313                     ; 3478         PHASE_CCMR_CB();       
9315  147c 35485258      	mov	_TIM1_CCMR1,#72
9318  1480 35585259      	mov	_TIM1_CCMR2,#88
9321  1484 3568525a      	mov	_TIM1_CCMR3,#104
9322                     ; 3479 		PHASE_CB();
9325  1488               LC034:
9327  1488 3541525c      	mov	_TIM1_CCER1,#65
9330  148c               LC033:
9333  148c 3511525d      	mov	_TIM1_CCER2,#17
9335  1490               L1744:
9336                     ; 3526 	PWM_mode.all_flag = ALM_BIT;
9338  1490 35040027      	mov	_PWM_mode,#4
9339                     ; 3527     TIM1_EGR |= 0x20;	
9341  1494 721a5257      	bset	_TIM1_EGR,#5
9342                     ; 3528 }
9345  1498 81            	ret	
9346  1499               L5644:
9347                     ; 3481 	else if((lock_hall == 1)||(lock_hall == 4))
9349  1499 a101          	cp	a,#1
9350  149b 2704          	jreq	L5744
9352  149d a104          	cp	a,#4
9353  149f 260e          	jrne	L3744
9354  14a1               L5744:
9355                     ; 3483         PHASE_CCMR_AB();	
9357  14a1 35685258      	mov	_TIM1_CCMR1,#104
9360  14a5 35585259      	mov	_TIM1_CCMR2,#88
9363  14a9 3548525a      	mov	_TIM1_CCMR3,#72
9364                     ; 3484 		PHASE_AB();
9369  14ad 20d9          	jp	LC034
9370  14af               L3744:
9371                     ; 3486 	else if((lock_hall == 2)||(lock_hall == 5))
9373  14af a102          	cp	a,#2
9374  14b1 2704          	jreq	L3054
9376  14b3 a105          	cp	a,#5
9377  14b5 2616          	jrne	L1054
9378  14b7               L3054:
9379                     ; 3488         PHASE_CCMR_BC();	
9381  14b7 35485258      	mov	_TIM1_CCMR1,#72
9384  14bb 35685259      	mov	_TIM1_CCMR2,#104
9387  14bf 3558525a      	mov	_TIM1_CCMR3,#88
9388                     ; 3489 		PHASE_BC();
9391  14c3 3511525c      	mov	_TIM1_CCER1,#17
9394  14c7 3514525d      	mov	_TIM1_CCER2,#20
9397  14cb 20c3          	jra	L1744
9398  14cd               L1054:
9399                     ; 3491 	else if((lock_hall == 3)||(lock_hall == 6))
9401  14cd a103          	cp	a,#3
9402  14cf 2704          	jreq	L1154
9404  14d1 a106          	cp	a,#6
9405  14d3 2612          	jrne	L7054
9406  14d5               L1154:
9407                     ; 3493         PHASE_CCMR_CA();
9409  14d5 35585258      	mov	_TIM1_CCMR1,#88
9412  14d9 35485259      	mov	_TIM1_CCMR2,#72
9415  14dd 3568525a      	mov	_TIM1_CCMR3,#104
9416                     ; 3494 		PHASE_CA();
9419  14e1 3514525c      	mov	_TIM1_CCER1,#20
9423  14e5 20a5          	jp	LC033
9424  14e7               L7054:
9425                     ; 3496 	else if((lock_hall == 8))
9427  14e7 a108          	cp	a,#8
9428  14e9 26a5          	jrne	L1744
9429                     ; 3498         PWM_ALL_OFF();
9431  14eb cd12ee        	call	_PWM_ALL_OFF
9433  14ee 20a0          	jra	L1744
9468                     ; 3531 void break_dirve(void)
9468                     ; 3532 {	
9469                     	switch	.text
9470  14f0               _break_dirve:
9474                     ; 3533 	TIM1_CCR1H = 0;
9476  14f0 725f5265      	clr	_TIM1_CCR1H
9477                     ; 3534 	TIM1_CCR1L = 80;
9479  14f4 35505266      	mov	_TIM1_CCR1L,#80
9480                     ; 3536 	TIM1_CCR2H = 0;
9482  14f8 725f5267      	clr	_TIM1_CCR2H
9483                     ; 3537 	TIM1_CCR2L = 80;	
9485  14fc 35505268      	mov	_TIM1_CCR2L,#80
9486                     ; 3539 	TIM1_CCR3H = 0;
9488  1500 725f5269      	clr	_TIM1_CCR3H
9489                     ; 3540 	TIM1_CCR3L = 80;	
9491  1504 3550526a      	mov	_TIM1_CCR3L,#80
9492                     ; 3541 	PWM_FLASH();	
9494  1508 35085258      	mov	_TIM1_CCMR1,#8
9497  150c 35085259      	mov	_TIM1_CCMR2,#8
9500  1510 3508525a      	mov	_TIM1_CCMR3,#8
9503  1514 721a5257      	bset	_TIM1_EGR,#5
9504                     ; 3542 	PHASE_CCMR_CB();
9507  1518 35485258      	mov	_TIM1_CCMR1,#72
9510  151c 35585259      	mov	_TIM1_CCMR2,#88
9513  1520 3568525a      	mov	_TIM1_CCMR3,#104
9514                     ; 3543 	PHASE_CB();	
9517  1524 3541525c      	mov	_TIM1_CCER1,#65
9520  1528 3511525d      	mov	_TIM1_CCER2,#17
9521                     ; 3544 	TIM1_EGR |= 0x20; 
9524  152c 721a5257      	bset	_TIM1_EGR,#5
9525                     ; 3545 }
9528  1530 81            	ret	
9574                     ; 3724 void RotorSetSub(void)//nohall run
9574                     ; 3725 {
9575                     	switch	.text
9576  1531               _RotorSetSub:
9580                     ; 3726 	PWM_ALL_OFF();
9582  1531 cd12ee        	call	_PWM_ALL_OFF
9584                     ; 3727 	rotor_position_sensor = IHALL_PORT;
9586  1534 c6500b        	ld	a,_PC_IDR
9587  1537 4e            	swap	a
9588  1538 a40e          	and	a,#14
9589  153a 44            	srl	a
9590  153b b706          	ld	_rotor_position_sensor,a
9591                     ; 3728 	sensor_pwm_duty = Min_pwm_protion;
9593  153d ae0010        	ldw	x,#16
9594  1540 cf0169        	ldw	_sensor_pwm_duty,x
9595                     ; 3729 	current_max = start_current;
9597  1543 450000        	mov	_current_max,_start_current
9598                     ; 3731 	motor_stop_count = 0;
9600  1546 3f4c          	clr	_motor_stop_count
9601                     ; 3732 	period_count = defperiod_count;
9603  1548 ae0258        	ldw	x,#600
9604  154b bf0a          	ldw	_period_count,x
9605                     ; 3733 	delay_test_count = 0;
9607  154d 5f            	clrw	x
9608  154e cf0167        	ldw	_delay_test_count,x
9609                     ; 3734 	pwm_add_count = 0;
9611  1551 3f43          	clr	_pwm_add_count
9612                     ; 3735 	pwm_sub_count = 0;
9614  1553 3f44          	clr	_pwm_sub_count
9615                     ; 3736 	position_flag = 0;			// set flag 
9617  1555 3f09          	clr	_position_flag
9618                     ; 3737 	RoHallOk = 0;
9620  1557 3f07          	clr	_RoHallOk
9621                     ; 3739 	if(current_cmd_average > 0)
9623  1559 be5c          	ldw	x,_current_cmd_average
9624  155b 270c          	jreq	L7354
9625                     ; 3741 		Restart_cont ++;
9627  155d 3c47          	inc	_Restart_cont
9628                     ; 3742 		if(Restart_cont > Re_Start_over_count)
9630  155f b647          	ld	a,_Restart_cont
9631  1561 a10b          	cp	a,#11
9632  1563 2504          	jrult	L7354
9633                     ; 3743 			error_bank.bit.restart_flag = 1;
9635  1565 7210002e      	bset	_error_bank,#0
9636  1569               L7354:
9637                     ; 3746 	sensor_step = Sensorless_next[rotor_position_sensor];
9639  1569 b606          	ld	a,_rotor_position_sensor
9640  156b 5f            	clrw	x
9641  156c 97            	ld	xl,a
9642  156d d60015        	ld	a,(_Sensorless_next,x)
9643  1570 b70b          	ld	_sensor_step,a
9644                     ; 3748 	if(sensor_step >= 5)
9646  1572 a105          	cp	a,#5
9647  1574 2504          	jrult	L3454
9648                     ; 3750 		sensor_step = 0;
9650  1576 3f0b          	clr	_sensor_step
9652  1578 2002          	jra	L5454
9653  157a               L3454:
9654                     ; 3753 		sensor_step += 1;	
9656  157a 3c0b          	inc	_sensor_step
9657  157c               L5454:
9658                     ; 3755 	sensorless_rotor = rotor_position_sensor;
9660  157c 45060a        	mov	_sensorless_rotor,_rotor_position_sensor
9661                     ; 3756 	back_sensor_step = sensorless_rotor;
9663  157f 450a09        	mov	_back_sensor_step,_sensorless_rotor
9664                     ; 3757 	back_sensor_step2 =  sensorless_rotor;
9666  1582 450a08        	mov	_back_sensor_step2,_sensorless_rotor
9667                     ; 3758 	hall_ok_count = 0;
9669  1585 3f46          	clr	_hall_ok_count
9670                     ; 3759 	rotor_count = 0;
9672  1587 5f            	clrw	x
9673  1588 bf03          	ldw	_rotor_count,x
9674                     ; 3760 }
9677  158a 81            	ret	
9737                     ; 3766 void SynchConSub(void)
9737                     ; 3767 {
9738                     	switch	.text
9739  158b               _SynchConSub:
9741  158b 5203          	subw	sp,#3
9742       00000003      OFST:	set	3
9745                     ; 3859 	nohall_start_count ++;
9747  158d ce0023        	ldw	x,_nohall_start_count
9748  1590 5c            	incw	x
9749  1591 cf0023        	ldw	_nohall_start_count,x
9750                     ; 3861 		if(current_high_flag == 1)
9752  1594 c60000        	ld	a,_current_high_flag
9753  1597 4a            	dec	a
9754  1598 267c          	jrne	L5654
9755                     ; 3863 			pwm_add_count = 1;
9757  159a 35010043      	mov	_pwm_add_count,#1
9758                     ; 3864 			if(pwm_sub_count == 0)
9760  159e b644          	ld	a,_pwm_sub_count
9761  15a0 2668          	jrne	L7654
9762                     ; 3866 				if(pwm_duty_on_old > 240)
9764  15a2 be5a          	ldw	x,_pwm_duty_on_old
9765  15a4 a300f1        	cpw	x,#241
9766  15a7 2505          	jrult	L1754
9767                     ; 3867 					pwm_duty_on_old = 240;	
9769  15a9 ae00f0        	ldw	x,#240
9770  15ac bf5a          	ldw	_pwm_duty_on_old,x
9771  15ae               L1754:
9772                     ; 3869 				if(pwm_duty_on_old >= 10)
9774  15ae a3000a        	cpw	x,#10
9775  15b1 2554          	jrult	L3754
9776                     ; 3871 					if(current_average1 > (current_max + (current_max >> 1)))
9778  15b3 b600          	ld	a,_current_average1
9779  15b5 5f            	clrw	x
9780  15b6 97            	ld	xl,a
9781  15b7 1f01          	ldw	(OFST-2,sp),x
9783  15b9 b600          	ld	a,_current_max
9784  15bb 44            	srl	a
9785  15bc 5f            	clrw	x
9786  15bd bb00          	add	a,_current_max
9787  15bf 59            	rlcw	x
9788  15c0 02            	rlwa	x,a
9789  15c1 1301          	cpw	x,(OFST-2,sp)
9790  15c3 2e04          	jrsge	L5754
9791                     ; 3872 						pwm_duty_on_old -= (pwm_duty_on_old >> 3);
9793  15c5 be5a          	ldw	x,_pwm_duty_on_old
9795  15c7 2016          	jp	LC036
9796  15c9               L5754:
9797                     ; 3873 					else if(current_average1 > (current_max + (current_max >> 2)))
9799  15c9 b600          	ld	a,_current_average1
9800  15cb 5f            	clrw	x
9801  15cc 97            	ld	xl,a
9802  15cd 1f01          	ldw	(OFST-2,sp),x
9804  15cf b600          	ld	a,_current_max
9805  15d1 44            	srl	a
9806  15d2 44            	srl	a
9807  15d3 5f            	clrw	x
9808  15d4 bb00          	add	a,_current_max
9809  15d6 59            	rlcw	x
9810  15d7 02            	rlwa	x,a
9811  15d8 1301          	cpw	x,(OFST-2,sp)
9812  15da 2e0d          	jrsge	L1064
9813                     ; 3874 						pwm_duty_on_old -= (pwm_duty_on_old >> 4);
9815  15dc be5a          	ldw	x,_pwm_duty_on_old
9816  15de               LC037:
9817  15de 54            	srlw	x
9818  15df               LC036:
9819  15df 54            	srlw	x
9820  15e0 54            	srlw	x
9821  15e1 54            	srlw	x
9822  15e2 72b0005a      	subw	x,_pwm_duty_on_old
9823  15e6 50            	negw	x
9825  15e7 201f          	jp	LC035
9826  15e9               L1064:
9827                     ; 3875 					else if(current_average1 > (current_max + (current_max >> 3)))
9829  15e9 b600          	ld	a,_current_average1
9830  15eb 5f            	clrw	x
9831  15ec 97            	ld	xl,a
9832  15ed 1f01          	ldw	(OFST-2,sp),x
9834  15ef b600          	ld	a,_current_max
9835  15f1 44            	srl	a
9836  15f2 44            	srl	a
9837  15f3 44            	srl	a
9838  15f4 5f            	clrw	x
9839  15f5 bb00          	add	a,_current_max
9840  15f7 59            	rlcw	x
9841  15f8 02            	rlwa	x,a
9842  15f9 1301          	cpw	x,(OFST-2,sp)
9843  15fb 2e05          	jrsge	L5064
9844                     ; 3876 						pwm_duty_on_old -= (pwm_duty_on_old >> 5);
9846  15fd be5a          	ldw	x,_pwm_duty_on_old
9847  15ff 54            	srlw	x
9849  1600 20dc          	jp	LC037
9850  1602               L5064:
9851                     ; 3878 						pwm_duty_on_old -= 1;
9853  1602 be5a          	ldw	x,_pwm_duty_on_old
9854  1604 5a            	decw	x
9855  1605 2001          	jp	LC035
9856  1607               L3754:
9857                     ; 3881 					pwm_duty_on_old = 0;
9859  1607 5f            	clrw	x
9860  1608               LC035:
9861  1608 bf5a          	ldw	_pwm_duty_on_old,x
9862  160a               L7654:
9863                     ; 3884 			pwm_sub_count++;
9865  160a 3c44          	inc	_pwm_sub_count
9866                     ; 3885 			if(pwm_sub_count >= 15)				//4
9868  160c b644          	ld	a,_pwm_sub_count
9869  160e a10f          	cp	a,#15
9870  1610 255a          	jrult	L5164
9871                     ; 3886 				pwm_sub_count = 0;
9873  1612 3f44          	clr	_pwm_sub_count
9874  1614 2056          	jra	L5164
9875  1616               L5654:
9876                     ; 3891 			pwm_sub_count = 1;
9878  1616 35010044      	mov	_pwm_sub_count,#1
9879                     ; 3893 			if(current_cmd_average1 > pwm_duty_on_old)
9881  161a be00          	ldw	x,_current_cmd_average1
9882  161c b35a          	cpw	x,_pwm_duty_on_old
9883  161e 2329          	jrule	L7164
9884                     ; 3895 				if(pwm_duty_on_old < 10)
9886  1620 be5a          	ldw	x,_pwm_duty_on_old
9887  1622 a3000a        	cpw	x,#10
9888  1625 2405          	jruge	L1264
9889                     ; 3896 					pwm_duty_on_old = 10;
9891  1627 ae000a        	ldw	x,#10
9892  162a bf5a          	ldw	_pwm_duty_on_old,x
9893  162c               L1264:
9894                     ; 3898 				if(pwm_add_count == 0)
9896  162c b643          	ld	a,_pwm_add_count
9897  162e 2603          	jrne	L3264
9898                     ; 3900 						pwm_duty_on_old += 1;
9900  1630 5c            	incw	x
9901  1631 bf5a          	ldw	_pwm_duty_on_old,x
9902  1633               L3264:
9903                     ; 3903 				if(pwm_duty_on_old > 240)
9905  1633 a300f1        	cpw	x,#241
9906  1636 2505          	jrult	L5264
9907                     ; 3904 					pwm_duty_on_old = 255;
9909  1638 ae00ff        	ldw	x,#255
9910  163b bf5a          	ldw	_pwm_duty_on_old,x
9911  163d               L5264:
9912                     ; 3906 				pwm_add_count++;
9914  163d 3c43          	inc	_pwm_add_count
9915                     ; 3907 				if(pwm_add_count >= 5)
9917  163f b643          	ld	a,_pwm_add_count
9918  1641 a105          	cp	a,#5
9919  1643 2527          	jrult	L5164
9920                     ; 3908 					pwm_add_count = 0;
9922  1645 3f43          	clr	_pwm_add_count
9923  1647 2023          	jra	L5164
9924  1649               L7164:
9925                     ; 3910 			else if(current_cmd_average1 < pwm_duty_on_old) //xz
9927  1649 b35a          	cpw	x,_pwm_duty_on_old
9928  164b 241f          	jruge	L5164
9929                     ; 3912 				if(pwm_cut_count == 0)
9931  164d b642          	ld	a,_pwm_cut_count
9932  164f 2607          	jrne	L5364
9933                     ; 3914 					if(pwm_duty_on_old > 0)
9935  1651 be5a          	ldw	x,_pwm_duty_on_old
9936  1653 2703          	jreq	L5364
9937                     ; 3915 						pwm_duty_on_old --;
9939  1655 5a            	decw	x
9940  1656 bf5a          	ldw	_pwm_duty_on_old,x
9941  1658               L5364:
9942                     ; 3917 				pwm_cut_count ++;
9944  1658 3c42          	inc	_pwm_cut_count
9945                     ; 3919 				if(pwm_duty_on_old < 5) 
9947  165a be5a          	ldw	x,_pwm_duty_on_old
9948  165c a30005        	cpw	x,#5
9949  165f 2403          	jruge	L1464
9950                     ; 3920 					pwm_duty_on_old = 0;
9952  1661 5f            	clrw	x
9953  1662 bf5a          	ldw	_pwm_duty_on_old,x
9954  1664               L1464:
9955                     ; 3922 				if(pwm_cut_count >= 5)//5
9957  1664 b642          	ld	a,_pwm_cut_count
9958  1666 a105          	cp	a,#5
9959  1668 2502          	jrult	L5164
9960                     ; 3923 					pwm_cut_count = 0;
9962  166a 3f42          	clr	_pwm_cut_count
9963  166c               L5164:
9964                     ; 3928 		pwm_duty_on = pwm_duty_on_old;
9966  166c be5a          	ldw	x,_pwm_duty_on_old
9967                     ; 3930 	if(pwm_duty_on <= 32)
9969  166e a30021        	cpw	x,#33
9970  1671 2403          	jruge	L5464
9971                     ; 3931 		pwm_duty_on = 32;
9973  1673 ae0020        	ldw	x,#32
9974  1676               L5464:
9975                     ; 3932 	if(pwm_duty_on >= 120)
9977  1676 a30078        	cpw	x,#120
9978  1679 2503          	jrult	L7464
9979                     ; 3933 		pwm_duty_on = 120;
9981  167b ae0078        	ldw	x,#120
9982  167e               L7464:
9983  167e bf58          	ldw	_pwm_duty_on,x
9984                     ; 3934 	a = rotor_position;
9986  1680 b640          	ld	a,_rotor_position
9987  1682 6b03          	ld	(OFST+0,sp),a
9989                     ; 3937 	rotor_position = setp_chk_hall[nohall_step];
9991  1684 5f            	clrw	x
9992  1685 c60025        	ld	a,_nohall_step
9993  1688 2a01          	jrpl	L073
9994  168a 53            	cplw	x
9995  168b               L073:
9996  168b 97            	ld	xl,a
9997  168c d60000        	ld	a,(_setp_chk_hall,x)
9998  168f b740          	ld	_rotor_position,a
9999                     ; 3939 	if(startup_count < 254)
10001  1691 ce001b        	ldw	x,_startup_count
10002  1694 a300fe        	cpw	x,#254
10003  1697 240d          	jruge	L1564
10004                     ; 3941 		phase_lock_change(rotor_position);
10006  1699 cd1110        	call	_phase_lock_change
10008                     ; 3942 		startup_count ++;
10010  169c ce001b        	ldw	x,_startup_count
10011  169f 5c            	incw	x
10012  16a0 cf001b        	ldw	_startup_count,x
10014  16a3 cc177c        	jra	L3564
10015  16a6               L1564:
10016                     ; 3944 	else if(startup_count == 254)
10018  16a6 a300fe        	cpw	x,#254
10019  16a9 262e          	jrne	L5564
10020                     ; 3946 		if(rotor_position1 != rotor_position)
10022  16ab b634          	ld	a,_rotor_position1
10023  16ad b140          	cp	a,_rotor_position
10024  16af 2708          	jreq	L7564
10025                     ; 3947 			phase_lock_change(rotor_position);
10027  16b1 b640          	ld	a,_rotor_position
10028  16b3 cd1110        	call	_phase_lock_change
10031  16b6 cc177c        	jra	L3564
10032  16b9               L7564:
10033                     ; 3950 			phase_change(rotor_position);
10035  16b9 b640          	ld	a,_rotor_position
10036  16bb cd1009        	call	_phase_change
10038                     ; 3951 			startup_count = 255;
10040  16be ae00ff        	ldw	x,#255
10041  16c1 cf001b        	ldw	_startup_count,x
10042                     ; 3952 			if(nohall_step < 5)
10044  16c4 c60025        	ld	a,_nohall_step
10045  16c7 a105          	cp	a,#5
10046  16c9 2e07          	jrsge	L3664
10047                     ; 3953 				nohall_step ++;
10049  16cb 725c0025      	inc	_nohall_step
10051  16cf cc177c        	jra	L3564
10052  16d2               L3664:
10053                     ; 3955 				nohall_step = 0;
10055  16d2 725f0025      	clr	_nohall_step
10056  16d6 cc177c        	jra	L3564
10057  16d9               L5564:
10058                     ; 3960 		phase_change(rotor_position);
10060  16d9 cd1009        	call	_phase_change
10062                     ; 3962 	if(rotor_position1 == hall_turetable[rotor_position])
10064  16dc b640          	ld	a,_rotor_position
10065  16de 5f            	clrw	x
10066  16df 97            	ld	xl,a
10067  16e0 d60025        	ld	a,(_hall_turetable,x)
10068  16e3 b134          	cp	a,_rotor_position1
10069  16e5 2703cc1768    	jrne	L1764
10070                     ; 3964 		if(nohall_ready_count < 10)
10072  16ea c60022        	ld	a,_nohall_ready_count
10073  16ed a10a          	cp	a,#10
10074  16ef 2429          	jruge	L3764
10075                     ; 3968 				nohall_ready_count ++;
10077  16f1 725c0022      	inc	_nohall_ready_count
10078                     ; 3969 				nohall_start_count = 0;
10080  16f5 5f            	clrw	x
10081  16f6 cf0023        	ldw	_nohall_start_count,x
10082                     ; 3971 				if(nohall_step < 5)
10084  16f9 c60025        	ld	a,_nohall_step
10085  16fc a105          	cp	a,#5
10086  16fe 2e06          	jrsge	L5764
10087                     ; 3972 					nohall_step ++;
10089  1700 725c0025      	inc	_nohall_step
10091  1704 2004          	jra	L7764
10092  1706               L5764:
10093                     ; 3974 					nohall_step = 0;
10095  1706 725f0025      	clr	_nohall_step
10096  170a               L7764:
10097                     ; 3975 				nohall_start_delay =0;
10099  170a 5f            	clrw	x
10100  170b cf0026        	ldw	_nohall_start_delay,x
10101                     ; 3977 				nspeed_motor = nhall_pwm_cont;
10103  170e ce002a        	ldw	x,_nhall_pwm_cont
10104  1711 cf0028        	ldw	_nspeed_motor,x
10105                     ; 3978 				nhall_pwm_cont = 0;
10107  1714 5f            	clrw	x
10108  1715 cf002a        	ldw	_nhall_pwm_cont,x
10110  1718 2048          	jra	L1074
10111  171a               L3764:
10112                     ; 3983 		else if(nspeed_motor < 100)
10114  171a ce0028        	ldw	x,_nspeed_motor
10115  171d a30064        	cpw	x,#100
10116  1720 2425          	jruge	L3074
10117                     ; 3985 			ModeFlag = 1;
10119  1722 3501003e      	mov	_ModeFlag,#1
10120                     ; 3986 			startup_count = 0;
10122                     ; 3987 			nohall_start_delay_count = 0;
10124  1726 725f001a      	clr	_nohall_start_delay_count
10125                     ; 3988 			nohall_phase_change_delay = 0;
10127  172a 5f            	clrw	x
10128  172b cf0018        	ldw	_nohall_phase_change_delay,x
10129                     ; 3990 			nohall_speed_low_count = 0;
10131  172e cf0000        	ldw	_nohall_speed_low_count,x
10132                     ; 3992 			nohall_ready_count = 0;
10134  1731 725f0022      	clr	_nohall_ready_count
10135                     ; 3993 			nohall_start_delay = 0;
10137  1735 cf0026        	ldw	_nohall_start_delay,x
10138                     ; 3994 			nohall_start_count = 0;
10140                     ; 3995 			startup_count = 0;
10142  1738 cf001b        	ldw	_startup_count,x
10143                     ; 3996 			nspeed_motor = 400;
10145  173b ae0190        	ldw	x,#400
10146  173e cf0028        	ldw	_nspeed_motor,x
10147                     ; 3998 			pwm_duty_on_old = pwm_duty_on;
10149  1741 be58          	ldw	x,_pwm_duty_on
10150  1743 bf5a          	ldw	_pwm_duty_on_old,x
10152  1745 201b          	jra	L1074
10153  1747               L3074:
10154                     ; 4002 			nspeed_motor = nhall_pwm_cont;
10156  1747 ce002a        	ldw	x,_nhall_pwm_cont
10157  174a cf0028        	ldw	_nspeed_motor,x
10158                     ; 4003 			nhall_pwm_cont = 0;
10160  174d 5f            	clrw	x
10161  174e cf002a        	ldw	_nhall_pwm_cont,x
10162                     ; 4004 			if(nohall_step < 5)
10164  1751 c60025        	ld	a,_nohall_step
10165  1754 a105          	cp	a,#5
10166  1756 2e06          	jrsge	L7074
10167                     ; 4005 				nohall_step ++;
10169  1758 725c0025      	inc	_nohall_step
10171  175c 2004          	jra	L1074
10172  175e               L7074:
10173                     ; 4007 				nohall_step = 0;
10175  175e 725f0025      	clr	_nohall_step
10176  1762               L1074:
10177                     ; 4010 		nohall_start_count = 0;
10179  1762 5f            	clrw	x
10180  1763 cf0023        	ldw	_nohall_start_count,x
10182  1766 2014          	jra	L3564
10183  1768               L1764:
10184                     ; 4014 		if(nhall_pwm_cont < 400)
10186  1768 ce002a        	ldw	x,_nhall_pwm_cont
10187  176b a30190        	cpw	x,#400
10188  176e 2406          	jruge	L5174
10189                     ; 4015 			nhall_pwm_cont ++;
10191  1770 5c            	incw	x
10192  1771 cf002a        	ldw	_nhall_pwm_cont,x
10194  1774 2006          	jra	L3564
10195  1776               L5174:
10196                     ; 4017 			nspeed_motor = 400;
10198  1776 ae0190        	ldw	x,#400
10199  1779 cf0028        	ldw	_nspeed_motor,x
10200  177c               L3564:
10201                     ; 4027 	if(nohall_start_count == 16000)
10203  177c ce0023        	ldw	x,_nohall_start_count
10204  177f a33e80        	cpw	x,#16000
10205  1782 2619          	jrne	L1274
10206                     ; 4030 		nohall_ready_count = 0;
10208  1784 725f0022      	clr	_nohall_ready_count
10209                     ; 4031 		nohall_start_count = 0;
10211  1788 5f            	clrw	x
10212  1789 cf0023        	ldw	_nohall_start_count,x
10213                     ; 4033 		if(nohall_step < 5)
10215  178c c60025        	ld	a,_nohall_step
10216  178f a105          	cp	a,#5
10217  1791 2e06          	jrsge	L3274
10218                     ; 4034 			nohall_step ++;
10220  1793 725c0025      	inc	_nohall_step
10222  1797 2004          	jra	L1274
10223  1799               L3274:
10224                     ; 4036 			nohall_step = 0;
10226  1799 725f0025      	clr	_nohall_step
10227  179d               L1274:
10228                     ; 4045 		rotor_position = a;
10230  179d 7b03          	ld	a,(OFST+0,sp)
10231  179f b740          	ld	_rotor_position,a
10232                     ; 4046 }
10235  17a1 5b03          	addw	sp,#3
10236  17a3 81            	ret	
10266                     ; 4050 void MotorStartSub(void)//nohall work
10266                     ; 4051 {
10267                     	switch	.text
10268  17a4               _MotorStartSub:
10272                     ; 4052 	if(position_flag == 1)//
10274  17a4 b609          	ld	a,_position_flag
10275  17a6 4a            	dec	a
10276  17a7 2603          	jrne	L7374
10277                     ; 4053 		RotorSetSub();
10282  17a9 cc1531        	jp	_RotorSetSub
10283  17ac               L7374:
10284                     ; 4056 		if((sys_state_flag.bit.current_over_flag > 0) || (sys_state_flag.bit.phcurrent_over_flag > 0))			//current limit
10286  17ac 7200002d05    	btjt	_sys_state_flag+2,#0,L5474
10288  17b1 7203002d1c    	btjf	_sys_state_flag+2,#1,L3474
10289  17b6               L5474:
10290                     ; 4058 			if(pwm_sub_count == 0)
10292  17b6 b644          	ld	a,_pwm_sub_count
10293  17b8 260c          	jrne	L7474
10294                     ; 4060 				if(sensor_pwm_duty > Min_pwm_protion)
10296  17ba ce0169        	ldw	x,_sensor_pwm_duty
10297  17bd a30011        	cpw	x,#17
10298  17c0 2504          	jrult	L7474
10299                     ; 4061 					sensor_pwm_duty --;
10301  17c2 5a            	decw	x
10302  17c3 cf0169        	ldw	_sensor_pwm_duty,x
10303  17c6               L7474:
10304                     ; 4063 			pwm_sub_count++;
10306  17c6 3c44          	inc	_pwm_sub_count
10307                     ; 4065 			if(pwm_sub_count >= 4)
10309  17c8 b644          	ld	a,_pwm_sub_count
10310  17ca a104          	cp	a,#4
10311  17cc 251c          	jrult	L5574
10312                     ; 4066 				pwm_sub_count = 0;
10314  17ce 3f44          	clr	_pwm_sub_count
10315  17d0 2018          	jra	L5574
10316  17d2               L3474:
10317                     ; 4070 		 	if(sensor_pwm_duty < Max_pwm_protion)
10319  17d2 ce0169        	ldw	x,_sensor_pwm_duty
10320  17d5 a30040        	cpw	x,#64
10321  17d8 2410          	jruge	L5574
10322                     ; 4072 				if(pwm_add_count >= Start_PS_TIME)
10324  17da b643          	ld	a,_pwm_add_count
10325  17dc a105          	cp	a,#5
10326  17de 2508          	jrult	L1674
10327                     ; 4074 					sensor_pwm_duty ++;
10329  17e0 5c            	incw	x
10330  17e1 cf0169        	ldw	_sensor_pwm_duty,x
10331                     ; 4075 					pwm_add_count = 0;
10333  17e4 3f43          	clr	_pwm_add_count
10335  17e6 2002          	jra	L5574
10336  17e8               L1674:
10337                     ; 4078 					pwm_add_count ++;
10339  17e8 3c43          	inc	_pwm_add_count
10340  17ea               L5574:
10341                     ; 4081 		SynchConSub();//
10344                     ; 4083 }
10347  17ea cc158b        	jp	_SynchConSub
10373                     ; 4088 void Motor_start_m(void)//
10373                     ; 4089 {
10374                     	switch	.text
10375  17ed               _Motor_start_m:
10379                     ; 4090 	if(sensor_pwm_duty > 0)//
10381  17ed ce0169        	ldw	x,_sensor_pwm_duty
10382  17f0 2705          	jreq	L5774
10383                     ; 4092 		phase_change(sensorless_rotor);
10385  17f2 b60a          	ld	a,_sensorless_rotor
10386  17f4 cd1009        	call	_phase_change
10388  17f7               L5774:
10389                     ; 4094 }
10392  17f7 81            	ret	
10422                     ; 4098 void dir_sf_mode(void)		//62.5* 64 = 4MS
10422                     ; 4099 {
10423                     	switch	.text
10424  17f8               _dir_sf_mode:
10428                     ; 4100 	if(MODE_PORT > 0)//sf_read_flag == 0x02)
10430  17f8 b60e          	ld	a,_sf_wait_flag
10431  17fa 720150103a    	btjf	_PD_IDR,#0,L7005
10432                     ; 4102 		if(sf_wait_flag == 1)
10434  17ff 4a            	dec	a
10435  1800 2634          	jrne	L1105
10436                     ; 4104 			if(sf_up_count >= 25)
10438  1802 be3a          	ldw	x,_sf_up_count
10439  1804 a30019        	cpw	x,#25
10440  1807 2529          	jrult	L3105
10441                     ; 4106 				if((mode_flag == 1)&&(sf_down_count <= 1499))
10443  1809 b608          	ld	a,_mode_flag
10444  180b 4a            	dec	a
10445  180c 2616          	jrne	L5105
10447  180e be0c          	ldw	x,_sf_down_count
10448  1810 a305dc        	cpw	x,#1500
10449  1813 240f          	jruge	L5105
10450                     ; 4108 					if(sys_state_flag.bit.sf_flag > 0)
10452  1815 7209002c06    	btjf	_sys_state_flag+1,#4,L7105
10453                     ; 4109 						sys_state_flag.bit.sf_flag = 0;
10455  181a 7219002c      	bres	_sys_state_flag+1,#4
10457  181e 200c          	jra	L3205
10458  1820               L7105:
10459                     ; 4111 						mode_flag = 0;
10461  1820 3f08          	clr	_mode_flag
10462  1822 2008          	jra	L3205
10463  1824               L5105:
10464                     ; 4113 			 	else if(mode_flag == 0)
10466  1824 b608          	ld	a,_mode_flag
10467  1826 2604          	jrne	L3205
10468                     ; 4114 					mode_flag = 1;
10470  1828 35010008      	mov	_mode_flag,#1
10471  182c               L3205:
10472                     ; 4115 				sf_down_count = 0;
10474  182c 5f            	clrw	x
10475  182d bf0c          	ldw	_sf_down_count,x
10476                     ; 4116 				sf_wait_flag = 0;
10478  182f 3f0e          	clr	_sf_wait_flag
10481  1831 81            	ret	
10482  1832               L3105:
10483                     ; 4119 				sf_up_count ++;
10485  1832 5c            	incw	x
10486  1833 bf3a          	ldw	_sf_up_count,x
10488  1835 81            	ret	
10489  1836               L1105:
10490                     ; 4122 			sf_down_count = 0;
10492  1836 5f            	clrw	x
10493  1837 2031          	jp	LC038
10494  1839               L7005:
10495                     ; 4126 		if(sf_wait_flag == 0)
10497  1839 260c          	jrne	L5305
10498                     ; 4128 			if(sf_down_count >= 25)
10500  183b be0c          	ldw	x,_sf_down_count
10501  183d a30019        	cpw	x,#25
10502  1840 2527          	jrult	L5405
10503                     ; 4130 				sf_wait_flag = 1;
10505  1842 3501000e      	mov	_sf_wait_flag,#1
10508  1846 81            	ret	
10509                     ; 4133 				sf_down_count ++;
10510  1847               L5305:
10511                     ; 4135 		else if(sf_down_count >= 1500)
10513  1847 be0c          	ldw	x,_sf_down_count
10514  1849 a305dc        	cpw	x,#1500
10515  184c 251b          	jrult	L5405
10516                     ; 4137 			sf_down_count = 1500;
10518  184e ae05dc        	ldw	x,#1500
10519  1851 bf0c          	ldw	_sf_down_count,x
10520                     ; 4138 			if((mode_flag == 1)&&(current_cmd_average >= 15)&&(sys_state_flag.bit.sf_flag == 0))
10522  1853 b608          	ld	a,_mode_flag
10523  1855 4a            	dec	a
10524  1856 2614          	jrne	L614
10526  1858 be5c          	ldw	x,_current_cmd_average
10527  185a a3000f        	cpw	x,#15
10528  185d 250d          	jrult	L614
10530  185f 7208002c08    	btjt	_sys_state_flag+1,#4,L614
10531                     ; 4139 				sys_state_flag.bit.sf_flag = 1;
10533  1864 7218002c      	bset	_sys_state_flag+1,#4
10535  1868 81            	ret	
10536  1869               L5405:
10537                     ; 4143 			sf_down_count ++;
10540  1869 5c            	incw	x
10541  186a               LC038:
10542  186a bf0c          	ldw	_sf_down_count,x
10543                     ; 4144 			sf_up_count == 0;
10545  186c               L614:
10546                     ; 4147 }
10549  186c 81            	ret	
10576                     ; 4148 void eco_sel(void)
10576                     ; 4149 {
10577                     	switch	.text
10578  186d               _eco_sel:
10582                     ; 4150 	if(ECO_PORT == 0)
10584  186d 7200501f18    	btjt	_PG_IDR,#0,L3605
10585                     ; 4152 		eco_on_count ++;
10587  1872 725c0161      	inc	_eco_on_count
10588                     ; 4153 		if(eco_on_count > 50)
10590  1876 c60161        	ld	a,_eco_on_count
10591  1879 a133          	cp	a,#51
10592  187b 2522          	jrult	L7605
10593                     ; 4155 			eco_on_count = 50;
10595  187d 35320161      	mov	_eco_on_count,#50
10596                     ; 4156 			eco_off_count = 0;
10598  1881 725f0160      	clr	_eco_off_count
10599                     ; 4157 			eco_flag = 1;
10601  1885 35010001      	mov	_eco_flag,#1
10603  1889 81            	ret	
10604  188a               L3605:
10605                     ; 4162 		eco_off_count ++;
10607  188a 725c0160      	inc	_eco_off_count
10608                     ; 4163 		if(eco_off_count > 50)
10610  188e c60160        	ld	a,_eco_off_count
10611  1891 a133          	cp	a,#51
10612  1893 250a          	jrult	L7605
10613                     ; 4165 			eco_off_count = 50;
10615  1895 35320160      	mov	_eco_off_count,#50
10616                     ; 4166 			eco_on_count = 0;
10618  1899 725f0161      	clr	_eco_on_count
10619                     ; 4167 			eco_flag = 0;
10621  189d 3f01          	clr	_eco_flag
10622  189f               L7605:
10623                     ; 4170 }
10626  189f 81            	ret	
10649                     ; 4241 void sf_sel(void)
10649                     ; 4242 {
10650                     	switch	.text
10651  18a0               _sf_sel:
10655                     ; 4245 }
10658  18a0 81            	ret	
10681                     ; 4248 void sf_sel_on_off(void)
10681                     ; 4249 {
10682                     	switch	.text
10683  18a1               _sf_sel_on_off:
10687                     ; 4251 }
10690  18a1 81            	ret	
10713                     ; 4323 void abs_sel(void)
10713                     ; 4324 {/*
10714                     	switch	.text
10715  18a2               _abs_sel:
10719                     ; 4346 }
10722  18a2 81            	ret	
10745                     ; 4350 void spt_sel(void)
10745                     ; 4351 {
10746                     	switch	.text
10747  18a3               _spt_sel:
10751                     ; 4374 }
10754  18a3 81            	ret	
10804                     ; 4495 void debug_save(void)
10804                     ; 4496 {
10805                     	switch	.text
10806  18a4               _debug_save:
10810                     ; 4497 	if(debug_mode_flag > 0)
10812  18a4 b64b          	ld	a,_debug_mode_flag
10813  18a6 2603cc1a3d    	jreq	L3415
10814                     ; 4499 		if(debug_mode_flag == 2) //s-
10816  18ab a102          	cp	a,#2
10817  18ad 2610          	jrne	L5415
10818                     ; 4501 			if(user_Prdata.byte.current_adj >= 41)
10820  18af be02          	ldw	x,_user_Prdata+2
10821  18b1 a30029        	cpw	x,#41
10822  18b4 2403cc1a23    	jrult	L1515
10823                     ; 4502 				user_Prdata.byte.current_adj -= 1;
10825  18b9 5a            	decw	x
10826  18ba bf02          	ldw	_user_Prdata+2,x
10827  18bc cc1a23        	jra	L1515
10828  18bf               L5415:
10829                     ; 4504 		else if(debug_mode_flag == 3) //s+
10831  18bf a103          	cp	a,#3
10832  18c1 260d          	jrne	L3515
10833                     ; 4506 			if(user_Prdata.byte.current_adj <= 160)
10835  18c3 be02          	ldw	x,_user_Prdata+2
10836  18c5 a300a1        	cpw	x,#161
10837  18c8 24f2          	jruge	L1515
10838                     ; 4507 				user_Prdata.byte.current_adj += 1;
10840  18ca 5c            	incw	x
10841  18cb bf02          	ldw	_user_Prdata+2,x
10842  18cd cc1a23        	jra	L1515
10843  18d0               L3515:
10844                     ; 4509 		else if(debug_mode_flag == 4) //b-
10846  18d0 a104          	cp	a,#4
10847  18d2 260f          	jrne	L1615
10848                     ; 4511 			if(user_Prdata.byte.current_adj >= 41)
10850  18d4 be02          	ldw	x,_user_Prdata+2
10851  18d6 a30029        	cpw	x,#41
10852  18d9 25f2          	jrult	L1515
10853                     ; 4512 				user_Prdata.byte.current_adj -= 10;
10855  18db 1d000a        	subw	x,#10
10856  18de bf02          	ldw	_user_Prdata+2,x
10857  18e0 cc1a23        	jra	L1515
10858  18e3               L1615:
10859                     ; 4514 		else if(debug_mode_flag == 5) //b+
10861  18e3 a105          	cp	a,#5
10862  18e5 2617          	jrne	L7615
10863                     ; 4516 			if(user_Prdata.byte.current_adj <= 160)
10865  18e7 be02          	ldw	x,_user_Prdata+2
10866  18e9 a300a1        	cpw	x,#161
10867  18ec 2408          	jruge	L1715
10868                     ; 4517 				user_Prdata.byte.current_adj += 10;
10870  18ee 1c000a        	addw	x,#10
10871  18f1 bf02          	ldw	_user_Prdata+2,x
10873  18f3 cc1a23        	jra	L1515
10874  18f6               L1715:
10875                     ; 4519 				user_Prdata.byte.current_adj = 160;
10877  18f6 ae00a0        	ldw	x,#160
10878  18f9 bf02          	ldw	_user_Prdata+2,x
10879  18fb cc1a23        	jra	L1515
10880  18fe               L7615:
10881                     ; 4521 		else if(debug_mode_flag == 20)
10883  18fe a114          	cp	a,#20
10884  1900 2614          	jrne	L7715
10885                     ; 4523 			if(user_Prdata.byte.ph_current_adj <= 200)
10887  1902 b604          	ld	a,_user_Prdata+4
10888  1904 a1c9          	cp	a,#201
10889  1906 2407          	jruge	L1025
10890                     ; 4524 				user_Prdata.byte.ph_current_adj += 2;
10892  1908 3c04          	inc	_user_Prdata+4
10893  190a 3c04          	inc	_user_Prdata+4
10895  190c cc1a23        	jra	L1515
10896  190f               L1025:
10897                     ; 4526 				user_Prdata.byte.ph_current_adj = 200;
10899  190f 35c80004      	mov	_user_Prdata+4,#200
10900  1913 cc1a23        	jra	L1515
10901  1916               L7715:
10902                     ; 4528 		else if(debug_mode_flag == 21)
10904  1916 a115          	cp	a,#21
10905  1918 2614          	jrne	L7025
10906                     ; 4530 			if(user_Prdata.byte.ph_current_adj >= 50)
10908  191a b604          	ld	a,_user_Prdata+4
10909  191c a132          	cp	a,#50
10910  191e 2507          	jrult	L1125
10911                     ; 4531 				user_Prdata.byte.ph_current_adj -= 2;
10913  1920 3a04          	dec	_user_Prdata+4
10914  1922 3a04          	dec	_user_Prdata+4
10916  1924 cc1a23        	jra	L1515
10917  1927               L1125:
10918                     ; 4533 				user_Prdata.byte.ph_current_adj = 50;
10920  1927 35320004      	mov	_user_Prdata+4,#50
10921  192b cc1a23        	jra	L1515
10922  192e               L7025:
10923                     ; 4535 		else if((debug_mode_flag == 6)||(debug_mode_flag == 7)||(debug_mode_flag == 9)||(debug_mode_flag == 8)) //save
10925  192e a106          	cp	a,#6
10926  1930 270c          	jreq	L1225
10928  1932 a107          	cp	a,#7
10929  1934 2708          	jreq	L1225
10931  1936 a109          	cp	a,#9
10932  1938 2704          	jreq	L1225
10934  193a a108          	cp	a,#8
10935  193c 266f          	jrne	L7125
10936  193e               L1225:
10937                     ; 4537 			PWM_ALL_OFF();
10939  193e cd12ee        	call	_PWM_ALL_OFF
10941                     ; 4538 			DI();
10944  1941 9b            	sim	
10946                     ; 4539 			if(debug_mode_flag == 6)  //save_voltage
10948  1942 b64b          	ld	a,_debug_mode_flag
10949  1944 a106          	cp	a,#6
10950  1946 2604          	jrne	L7225
10951                     ; 4541 				user_Prdata.byte.voltage_adj = voltage_average;
10953  1948 be00          	ldw	x,_voltage_average
10954  194a bf00          	ldw	_user_Prdata,x
10955  194c               L7225:
10956                     ; 4543 			eerprom_write();
10958  194c cd0000        	call	_eerprom_write
10960                     ; 4544 			fr_count = 0;
10962  194f 3f19          	clr	_fr_count
10963                     ; 4545 			beep_dely = 0;
10965  1951 5f            	clrw	x
10966  1952 bf10          	ldw	_beep_dely,x
10967  1954               L1325:
10968                     ; 4548 				if(IRQ_UIF & TIM1_SR1)
10970  1954 720152554e    	btjf	_TIM1_SR1,#0,L5325
10971                     ; 4550 					TIM1_SR1 &= (~IRQ_UIF);
10973  1959 72115255      	bres	_TIM1_SR1,#0
10974                     ; 4551 					if(beep_dely <= 500)
10976  195d be10          	ldw	x,_beep_dely
10977  195f a301f5        	cpw	x,#501
10978  1962 240c          	jruge	L7325
10979                     ; 4553 						if(fr_count < 2)
10981  1964 b619          	ld	a,_fr_count
10982  1966 a102          	cp	a,#2
10983                     ; 4555 							break_dirve();
10985                     ; 4556 							fr_count ++;
10987  1968 2523          	jrult	LC043
10988                     ; 4558 						else if(fr_count < 8)
10990  196a a108          	cp	a,#8
10991  196c 2411          	jruge	L1625
10992                     ; 4560 							PWM_ALL_OFF();
10994                     ; 4561 							fr_count ++;
10996  196e 2028          	jp	LC044
10997                     ; 4565 							beep_dely ++;
10998                     ; 4566 							fr_count = 0;
10999  1970               L7325:
11000                     ; 4569 					else if(beep_dely <= 1000)
11002  1970 a303e9        	cpw	x,#1001
11003  1973 240d          	jruge	L3525
11004                     ; 4571 						if(fr_count < 4)
11006  1975 b619          	ld	a,_fr_count
11007  1977 a104          	cp	a,#4
11008                     ; 4573 							break_dirve();
11010                     ; 4574 							fr_count ++;
11012  1979 2512          	jrult	LC043
11013                     ; 4576 						else if(fr_count < 12)
11015  197b a10c          	cp	a,#12
11016                     ; 4578 							PWM_ALL_OFF();
11018                     ; 4579 							fr_count ++;
11020  197d 2519          	jrult	LC044
11021  197f               L1625:
11022                     ; 4583 							beep_dely ++;
11025  197f 5c            	incw	x
11026                     ; 4584 							fr_count = 0;
11027  1980 201c          	jp	LC040
11028  1982               L3525:
11029                     ; 4587 					else if(beep_dely <= 2000)
11031  1982 a307d1        	cpw	x,#2001
11032  1985 241d          	jruge	L7625
11033                     ; 4589 						if(fr_count < 6)
11035  1987 b619          	ld	a,_fr_count
11036  1989 a106          	cp	a,#6
11037  198b 2407          	jruge	L1725
11038                     ; 4591 							break_dirve();
11040  198d               LC043:
11043  198d cd14f0        	call	_break_dirve
11045                     ; 4592 							fr_count ++;
11047  1990               LC042:
11053  1990 3c19          	inc	_fr_count
11055  1992 2013          	jra	L5325
11056  1994               L1725:
11057                     ; 4594 						else if(fr_count < 16)
11059  1994 a110          	cp	a,#16
11060  1996 2405          	jruge	L5725
11061                     ; 4596 							PWM_ALL_OFF();
11063  1998               LC044:
11066  1998 cd12ee        	call	_PWM_ALL_OFF
11068                     ; 4597 							fr_count ++;
11070  199b 20f3          	jp	LC042
11071  199d               L5725:
11072                     ; 4601 							beep_dely = 0;
11074  199d 5f            	clrw	x
11075                     ; 4602 							fr_count = 0;
11077  199e               LC040:
11078  199e bf10          	ldw	_beep_dely,x
11081  19a0 3f19          	clr	_fr_count
11082  19a2 2003          	jra	L5325
11083  19a4               L7625:
11084                     ; 4606 						beep_dely = 0;
11086  19a4 5f            	clrw	x
11087  19a5 bf10          	ldw	_beep_dely,x
11088  19a7               L5325:
11089                     ; 4608 				WDT_FLASH();
11091  19a7 35aa50e0      	mov	_IWDG_KR,#170
11093  19ab 20a7          	jra	L1325
11094  19ad               L7125:
11095                     ; 4611 		else if(debug_mode_flag == 11) //jin	//adbg
11097  19ad a10b          	cp	a,#11
11098  19af 2672          	jrne	L1515
11099                     ; 4613 			eerprom_write();
11101  19b1 cd0000        	call	_eerprom_write
11103  19b4               L7035:
11104                     ; 4616 				TIM1_CCR1H = 0;
11106  19b4 725f5265      	clr	_TIM1_CCR1H
11107                     ; 4617 				TIM1_CCR1L = 0;
11109  19b8 725f5266      	clr	_TIM1_CCR1L
11110                     ; 4619 				TIM1_CCR2H = 0;
11112  19bc 725f5267      	clr	_TIM1_CCR2H
11113                     ; 4620 				TIM1_CCR2L = 0;
11115  19c0 725f5268      	clr	_TIM1_CCR2L
11116                     ; 4622 				TIM1_CCR3H = 0;
11118  19c4 725f5269      	clr	_TIM1_CCR3H
11119                     ; 4623 				TIM1_CCR3L = 0;
11121  19c8 725f526a      	clr	_TIM1_CCR3L
11122                     ; 4624 				if(IRQ_UIF & TIM1_SR1)
11124  19cc 720152554c    	btjf	_TIM1_SR1,#0,L3135
11125                     ; 4626 					TIM1_SR1 &= (~IRQ_UIF);
11127  19d1 72115255      	bres	_TIM1_SR1,#0
11128                     ; 4627 					if(debug_light_count < 4000)
11130  19d5 ce014a        	ldw	x,_debug_light_count
11131  19d8 a30fa0        	cpw	x,#4000
11132  19db 242e          	jruge	L5135
11133                     ; 4629 						debug_light_count ++;
11135  19dd 5c            	incw	x
11136  19de cf014a        	ldw	_debug_light_count,x
11137                     ; 4630 						PWM_FLASH();
11139  19e1 35085258      	mov	_TIM1_CCMR1,#8
11142  19e5 35085259      	mov	_TIM1_CCMR2,#8
11145  19e9 3508525a      	mov	_TIM1_CCMR3,#8
11148  19ed 721a5257      	bset	_TIM1_EGR,#5
11149                     ; 4631 						PHASE_CCMR_CA();	
11152  19f1 35585258      	mov	_TIM1_CCMR1,#88
11155  19f5 35485259      	mov	_TIM1_CCMR2,#72
11158  19f9 3568525a      	mov	_TIM1_CCMR3,#104
11159                     ; 4632 						PHASE_CA();
11162  19fd 3514525c      	mov	_TIM1_CCER1,#20
11165  1a01 3511525d      	mov	_TIM1_CCER2,#17
11166                     ; 4633 						TIM1_EGR |= 0x20;					//刷新PWM
11169  1a05 721a5257      	bset	_TIM1_EGR,#5
11171  1a09 2012          	jra	L3135
11172  1a0b               L5135:
11173                     ; 4635 					else if(debug_light_count < 8000)
11175  1a0b a31f40        	cpw	x,#8000
11176  1a0e 2409          	jruge	L1235
11177                     ; 4637 						debug_light_count ++;
11179  1a10 5c            	incw	x
11180  1a11 cf014a        	ldw	_debug_light_count,x
11181                     ; 4638 						PWM_ALL_OFF();
11183  1a14 cd12ee        	call	_PWM_ALL_OFF
11186  1a17 2004          	jra	L3135
11187  1a19               L1235:
11188                     ; 4641 						debug_light_count = 0;
11190  1a19 5f            	clrw	x
11191  1a1a cf014a        	ldw	_debug_light_count,x
11192  1a1d               L3135:
11193                     ; 4643 				WDT_FLASH();
11195  1a1d 35aa50e0      	mov	_IWDG_KR,#170
11197  1a21 2091          	jra	L7035
11198  1a23               L1515:
11199                     ; 4647 		if((debug_mode_flag != 1) && (debug_mode_flag != 13))//jin	//adbg
11201  1a23 b64b          	ld	a,_debug_mode_flag
11202  1a25 a101          	cp	a,#1
11203  1a27 2714          	jreq	L3415
11205  1a29 a10d          	cp	a,#13
11206  1a2b 2710          	jreq	L3415
11207                     ; 4649 			debug_mode_flag = 1;
11209  1a2d 3501004b      	mov	_debug_mode_flag,#1
11210                     ; 4650 			set_debug_mode = 1;
11212  1a31 3501001a      	mov	_set_debug_mode,#1
11213                     ; 4651 			set_debug_count = 0;
11215  1a35 5f            	clrw	x
11216  1a36 bf17          	ldw	_set_debug_count,x
11217                     ; 4652 			debug_count_max = 1000;
11219  1a38 ae03e8        	ldw	x,#1000
11220  1a3b bf04          	ldw	_debug_count_max,x
11221  1a3d               L3415:
11222                     ; 4655 }
11225  1a3d 81            	ret	
11255                     ; 4659 void spt_chk_42(void)
11255                     ; 4660 {
11256                     	switch	.text
11257  1a3e               _spt_chk_42:
11261                     ; 4662 	spt_condition0 = SPT_PORT;
11263  1a3e c65010        	ld	a,_PD_IDR
11264  1a41 a480          	and	a,#128
11265  1a43 b702          	ld	_spt_condition0,a
11266                     ; 4663 	if (spt_condition0 == 0)
11268  1a45 2654          	jrne	L7335
11269                     ; 4665 		if (spt_condition1 == 0)
11271  1a47 725d01a0      	tnz	_spt_condition1
11272  1a4b 2616          	jrne	L1435
11273                     ; 4667 			if (spt_low_count > 88)	//16k
11275  1a4d ce0195        	ldw	x,_spt_low_count
11276  1a50 a30059        	cpw	x,#89
11277  1a53 2508          	jrult	L3435
11278                     ; 4670 				current_cmd_spt = 0;
11280  1a55 5f            	clrw	x
11281  1a56 bf0c          	ldw	_current_cmd_spt,x
11282                     ; 4671 				spt_com_count = 0;
11284  1a58 c70184        	ld	_spt_com_count,a
11286  1a5b 2058          	jra	L5635
11287  1a5d               L3435:
11288                     ; 4675 				spt_low_count ++;
11290  1a5d 5c            	incw	x
11291  1a5e cf0195        	ldw	_spt_low_count,x
11292  1a61 2052          	jra	L5635
11293  1a63               L1435:
11294                     ; 4679 			if (spt_high_count > spt_low_count)
11296  1a63 ce0193        	ldw	x,_spt_high_count
11297  1a66 c30195        	cpw	x,_spt_low_count
11298  1a69 2320          	jrule	L1535
11299                     ; 4681 				if (spt_com_count<2)
11301  1a6b c60184        	ld	a,_spt_com_count
11302  1a6e a102          	cp	a,#2
11303  1a70 2406          	jruge	L3535
11304                     ; 4682 					spt_com_count ++;
11306  1a72 725c0184      	inc	_spt_com_count
11308  1a76 201a          	jra	L3635
11309  1a78               L3535:
11310                     ; 4683 				else if(current_cmd_spt < 330)
11312  1a78 be0c          	ldw	x,_current_cmd_spt
11313  1a7a a3014a        	cpw	x,#330
11314  1a7d 2405          	jruge	L7535
11315                     ; 4684 					current_cmd_spt += 50;
11317  1a7f 1c0032        	addw	x,#50
11319  1a82 2003          	jp	LC045
11320  1a84               L7535:
11321                     ; 4686 					current_cmd_spt = 380;
11323  1a84 ae017c        	ldw	x,#380
11324  1a87               LC045:
11325  1a87 bf0c          	ldw	_current_cmd_spt,x
11326  1a89 2007          	jra	L3635
11327  1a8b               L1535:
11328                     ; 4691 				current_cmd_spt = 0;
11330  1a8b 5f            	clrw	x
11331  1a8c bf0c          	ldw	_current_cmd_spt,x
11332                     ; 4692 				spt_com_count =0;
11334  1a8e 725f0184      	clr	_spt_com_count
11335  1a92               L3635:
11336                     ; 4694 			spt_high_count = 0;
11338  1a92 5f            	clrw	x
11339  1a93 cf0193        	ldw	_spt_high_count,x
11340                     ; 4695 			spt_low_count = 0;
11342  1a96 cf0195        	ldw	_spt_low_count,x
11343  1a99 201a          	jra	L5635
11344  1a9b               L7335:
11345                     ; 4698 	else if (spt_condition1 > 0)
11347  1a9b c601a0        	ld	a,_spt_condition1
11348  1a9e 2715          	jreq	L5635
11349                     ; 4700 		if (spt_high_count > 88) //16k
11351  1aa0 ce0193        	ldw	x,_spt_high_count
11352  1aa3 a30059        	cpw	x,#89
11353  1aa6 2509          	jrult	L1735
11354                     ; 4703 			current_cmd_spt = 0;
11356  1aa8 5f            	clrw	x
11357  1aa9 bf0c          	ldw	_current_cmd_spt,x
11358                     ; 4704 			spt_com_count = 0;
11360  1aab 725f0184      	clr	_spt_com_count
11362  1aaf 2004          	jra	L5635
11363  1ab1               L1735:
11364                     ; 4707 			spt_high_count ++;
11366  1ab1 5c            	incw	x
11367  1ab2 cf0193        	ldw	_spt_high_count,x
11368  1ab5               L5635:
11369                     ; 4709 	spt_condition1 = spt_condition0;
11371  1ab5 55000201a0    	mov	_spt_condition1,_spt_condition0
11372                     ; 4710 }
11375  1aba 81            	ret	
11398                     ; 4713 void current_over(void) //every 48ms
11398                     ; 4714 {
11399                     	switch	.text
11400  1abb               _current_over:
11404                     ; 4716 }
11407  1abb 81            	ret	
11430                     ; 4718 void current_dec(void)
11430                     ; 4719 {
11431                     	switch	.text
11432  1abc               _current_dec:
11436                     ; 4721 }
11439  1abc 81            	ret	
11465                     ; 4724 void hall_down_delay(void) //every 48ms
11465                     ; 4725 {
11466                     	switch	.text
11467  1abd               _hall_down_delay:
11471                     ; 4726 	if(error_bank.bit.hall_wron_flag == 1)				//不用无HALL转
11473  1abd 720b002e10    	btjf	_error_bank,#5,L5245
11474                     ; 4728 		if(hall_down_count > 8)
11476  1ac2 c60162        	ld	a,_hall_down_count
11477  1ac5 a109          	cp	a,#9
11478  1ac7 2505          	jrult	L7245
11479                     ; 4731 			sys_state_flag.bit.hall_exit = 1;
11481  1ac9 7216002b      	bset	_sys_state_flag,#3
11484  1acd 81            	ret	
11485  1ace               L7245:
11486                     ; 4736 			hall_down_count ++;
11488  1ace 725c0162      	inc	_hall_down_count
11489  1ad2               L5245:
11490                     ; 4738 }
11493  1ad2 81            	ret	
11520                     ; 4740 void cdpi_on_check(void)
11520                     ; 4741 {
11521                     	switch	.text
11522  1ad3               _cdpi_on_check:
11526                     ; 4742 	if(pwm_duty_on_last < (current_cmd_average + 5))
11528  1ad3 be5c          	ldw	x,_current_cmd_average
11529  1ad5 1c0005        	addw	x,#5
11530  1ad8 c3010b        	cpw	x,_pwm_duty_on_last
11531  1adb 231d          	jrule	L5445
11532                     ; 4744 		if((pwm_duty_on_last + 5) > current_cmd_average)
11534  1add ce010b        	ldw	x,_pwm_duty_on_last
11535  1ae0 1c0005        	addw	x,#5
11536  1ae3 b35c          	cpw	x,_current_cmd_average
11537  1ae5 2313          	jrule	L5445
11538                     ; 4746 			if(cdpi_start_count >= 50)
11540  1ae7 c6010a        	ld	a,_cdpi_start_count
11541  1aea a132          	cp	a,#50
11542  1aec 2506          	jrult	L7445
11543                     ; 4747 				cdpi_on_flag = 1;
11545  1aee 3501010d      	mov	_cdpi_on_flag,#1
11547  1af2 200e          	jra	L5545
11548  1af4               L7445:
11549                     ; 4749 				cdpi_start_count ++;
11551  1af4 725c010a      	inc	_cdpi_start_count
11552  1af8 2008          	jra	L5545
11553  1afa               L5445:
11554                     ; 4753 			cdpi_start_count = 0;
11555                     ; 4754 			cdpi_on_flag = 0;			
11556                     ; 4759 		cdpi_start_count = 0;
11558                     ; 4760 		cdpi_on_flag = 0;
11561  1afa 725f010a      	clr	_cdpi_start_count
11563  1afe 725f010d      	clr	_cdpi_on_flag
11564  1b02               L5545:
11565                     ; 4763 	pwm_duty_on_last = current_cmd_average; 	//cdpi
11567  1b02 be5c          	ldw	x,_current_cmd_average
11568  1b04 cf010b        	ldw	_pwm_duty_on_last,x
11569                     ; 4764 }
11572  1b07 81            	ret	
11599                     ; 4766 void cvt_sel(void)
11599                     ; 4767 {
11600                     	switch	.text
11601  1b08               _cvt_sel:
11605                     ; 4768 	if(CVT_PORT == 0)
11607  1b08 c601d2        	ld	a,_cvt_flag
11608  1b0b 720a501018    	btjt	_PD_IDR,#5,L7645
11609                     ; 4770 		if(cvt_flag == 0)
11611  1b10 2611          	jrne	L1745
11612                     ; 4772 			if(cvt_on_count > 10)
11614  1b12 c60155        	ld	a,_cvt_on_count
11615  1b15 a10b          	cp	a,#11
11616  1b17 2505          	jrult	L3745
11617                     ; 4773 				cvt_flag = 1;
11619  1b19 350101d2      	mov	_cvt_flag,#1
11622  1b1d 81            	ret	
11623  1b1e               L3745:
11624                     ; 4775 				cvt_on_count ++;
11626  1b1e 725c0155      	inc	_cvt_on_count
11628  1b22 81            	ret	
11629  1b23               L1745:
11630                     ; 4778 			cvt_off_count = 0;
11632  1b23 725f0154      	clr	_cvt_off_count
11634  1b27 81            	ret	
11635  1b28               L7645:
11636                     ; 4782 		if(cvt_flag == 1)
11638  1b28 4a            	dec	a
11639  1b29 2611          	jrne	L3055
11640                     ; 4784 			if(cvt_off_count > 10)
11642  1b2b c60154        	ld	a,_cvt_off_count
11643  1b2e a10b          	cp	a,#11
11644  1b30 2505          	jrult	L5055
11645                     ; 4785 				cvt_flag = 0;
11647  1b32 725f01d2      	clr	_cvt_flag
11650  1b36 81            	ret	
11651  1b37               L5055:
11652                     ; 4787 				cvt_off_count ++;
11654  1b37 725c0154      	inc	_cvt_off_count
11656  1b3b 81            	ret	
11657  1b3c               L3055:
11658                     ; 4790 			cvt_on_count = 0;
11660  1b3c 725f0155      	clr	_cvt_on_count
11661                     ; 4792 }
11664  1b40 81            	ret	
11694                     ; 4794 void lv_display(void)
11694                     ; 4795 {
11695                     	switch	.text
11696  1b41               _lv_display:
11700                     ; 4796 	if(pw_delay < 60)
11702  1b41 c6015f        	ld	a,_pw_delay
11703  1b44 a13c          	cp	a,#60
11704  1b46 242f          	jruge	L3255
11705                     ; 4798 		LV_ON();
11707  1b48 721a5000      	bset	_PA_ODR,#5
11708                     ; 4799 		pw_delay ++;
11710  1b4c 725c015f      	inc	_pw_delay
11711                     ; 4800 		if(voltage_average <= voltage_pulv)
11713  1b50 5f            	clrw	x
11714  1b51 c6001f        	ld	a,_voltage_pulv
11715  1b54 97            	ld	xl,a
11716  1b55 bf00          	ldw	c_x,x
11717  1b57 be00          	ldw	x,_voltage_average
11718  1b59 b300          	cpw	x,c_x
11719  1b5b 2215          	jrugt	L5255
11720                     ; 4802 			if(pw_lv_count >= 20)
11722  1b5d c60109        	ld	a,_pw_lv_count
11723  1b60 a114          	cp	a,#20
11724  1b62 2509          	jrult	L7255
11725                     ; 4804 				pw_delay = 60;
11727  1b64 353c015f      	mov	_pw_delay,#60
11728                     ; 4805 				lv_flash_flag |= 0x01;
11730  1b68 721001d4      	bset	_lv_flash_flag,#0
11733  1b6c 81            	ret	
11734  1b6d               L7255:
11735                     ; 4808 				pw_lv_count ++;
11737  1b6d 725c0109      	inc	_pw_lv_count
11739  1b71 81            	ret	
11740  1b72               L5255:
11741                     ; 4811 			pw_lv_count = 0;
11743  1b72 725f0109      	clr	_pw_lv_count
11745  1b76 81            	ret	
11746  1b77               L3255:
11747                     ; 4815 		if((lv_flash_flag & 0x01) != 0x00)
11749  1b77 720101d424    	btjf	_lv_flash_flag,#0,L7355
11750                     ; 4817 			if(lv_flash_count > 11)
11752  1b7c c6015e        	ld	a,_lv_flash_count
11753  1b7f a10c          	cp	a,#12
11754  1b81 2518          	jrult	L1455
11755                     ; 4819 				lv_flash_count = 0;
11757  1b83 725f015e      	clr	_lv_flash_count
11758                     ; 4820 				if((lv_flash_flag & 0x02) == 0x00)
11760  1b87 720201d406    	btjt	_lv_flash_flag,#1,L3455
11761                     ; 4822 					lv_flash_flag |= 0x02;
11763  1b8c 721201d4      	bset	_lv_flash_flag,#1
11764                     ; 4823 					LV_ON();
11766  1b90 200e          	jp	L7355
11767  1b92               L3455:
11768                     ; 4827 					lv_flash_flag &= 0xFD;
11770  1b92 721301d4      	bres	_lv_flash_flag,#1
11771                     ; 4828 					LV_OFF();
11773  1b96 721b5000      	bres	_PA_ODR,#5
11775  1b9a 81            	ret	
11776  1b9b               L1455:
11777                     ; 4832 				lv_flash_count ++;
11779  1b9b 725c015e      	inc	_lv_flash_count
11781  1b9f 81            	ret	
11782  1ba0               L7355:
11783                     ; 4835 			LV_ON();
11786  1ba0 721a5000      	bset	_PA_ODR,#5
11787                     ; 4860 }
11790  1ba4 81            	ret	
11814                     ; 4861 void current_cmd_protect_sample(void)
11814                     ; 4862 {
11815                     	switch	.text
11816  1ba5               _current_cmd_protect_sample:
11820                     ; 4864 }
11823  1ba5 81            	ret	
11856                     ; 4866 void nohall_control(void)	//nnh  speed control
11856                     ; 4867 {
11857                     	switch	.text
11858  1ba6               _nohall_control:
11862                     ; 4868 	if(speed_motor_time < 69)
11864  1ba6 c60027        	ld	a,_speed_motor_time
11865  1ba9 a145          	cp	a,#69
11866  1bab 2406          	jruge	L3755
11867                     ; 4869 		speed_motor_time ++;
11869  1bad 725c0027      	inc	_speed_motor_time
11871  1bb1 200e          	jra	L5755
11872  1bb3               L3755:
11873                     ; 4872 		speed_motor_nohall = hall_count_nohall;
11875  1bb3 ce0000        	ldw	x,_hall_count_nohall
11876  1bb6 cf0021        	ldw	_speed_motor_nohall,x
11877                     ; 4873 		speed_motor_time = 0;
11879  1bb9 725f0027      	clr	_speed_motor_time
11880                     ; 4874 		hall_count_nohall = 0;
11882  1bbd 5f            	clrw	x
11883  1bbe cf0000        	ldw	_hall_count_nohall,x
11884  1bc1               L5755:
11885                     ; 4877 	nohall_pwm = speed_motor_nohall;
11887  1bc1 ce0021        	ldw	x,_speed_motor_nohall
11888                     ; 4881 	if(nohall_pwm < 30)
11890  1bc4 a3001e        	cpw	x,#30
11891  1bc7 2401          	jruge	L7755
11892                     ; 4882 		nohall_pwm = 0;
11894  1bc9 5f            	clrw	x
11895  1bca               L7755:
11896                     ; 4883 	if(nohall_pwm > 256)
11898  1bca a30101        	cpw	x,#257
11899  1bcd 2503          	jrult	L1065
11900                     ; 4884 		nohall_pwm = 256;
11902  1bcf ae0100        	ldw	x,#256
11903  1bd2               L1065:
11904  1bd2 cf0023        	ldw	_nohall_pwm,x
11905                     ; 4886 	TIM1_CCMR4 = PWM_MODE1;
11907  1bd5 3568525b      	mov	_TIM1_CCMR4,#104
11908                     ; 4887 	TIM1_CCER2 = BH_ON;
11910  1bd9 3510525d      	mov	_TIM1_CCER2,#16
11911                     ; 4889 	pwm_duty_low = (nohall_pwm);
11913  1bdd 5500240026    	mov	_pwm_duty_low,_nohall_pwm+1
11914                     ; 4890 	pwm_duty_high = (nohall_pwm)>>8;
11916  1be2 5500230025    	mov	_pwm_duty_high,_nohall_pwm
11917                     ; 4891 	TIM1_CCR4H = pwm_duty_high;
11919  1be7 550025526b    	mov	_TIM1_CCR4H,_pwm_duty_high
11920                     ; 4892 	TIM1_CCR4L = pwm_duty_low;
11922  1bec 550026526c    	mov	_TIM1_CCR4L,_pwm_duty_low
11923                     ; 4894 }
11926  1bf1 81            	ret	
11961                     ; 4899 void cvt_ver_cal(void)//cross zero
11961                     ; 4900 {
11962                     	switch	.text
11963  1bf2               _cvt_ver_cal:
11967                     ; 4912 		if(CROSS0_PORT == 0)
11969  1bf2 c6012f        	ld	a,_cross0_port_flag
11970  1bf5 7202501f12    	btjt	_PG_IDR,#1,L3165
11971                     ; 4914 			if(cross0_port_flag == 1)
11973  1bfa 4a            	dec	a
11974  1bfb 261f          	jrne	L7165
11975                     ; 4916 				cross0_port_flag = 0;
11977  1bfd c7012f        	ld	_cross0_port_flag,a
11978                     ; 4917 				cross0_pos_hall = svpwm_rotor_position;
11980  1c00 550000012e    	mov	_cross0_pos_hall,_svpwm_rotor_position
11981                     ; 4918 				cross0_pos_hall_ver = hall_ver;
11983  1c05 550001012d    	mov	_cross0_pos_hall_ver,_hall_ver+1
11984  1c0a 2010          	jra	L7165
11985  1c0c               L3165:
11986                     ; 4923 			if(cross0_port_flag == 0)
11988  1c0c 260e          	jrne	L7165
11989                     ; 4925 				cross0_port_flag = 1;
11991  1c0e 3501012f      	mov	_cross0_port_flag,#1
11992                     ; 4926 				cross0_neg_hall = svpwm_rotor_position;
11994  1c12 550000012c    	mov	_cross0_neg_hall,_svpwm_rotor_position
11995                     ; 4927 				cross0_neg_hall_ver = hall_ver;
11997  1c17 550001012b    	mov	_cross0_neg_hall_ver,_hall_ver+1
11998  1c1c               L7165:
11999                     ; 4936 		else*/if(speed_motor3 < 1000)//过零点调整
12001  1c1c be5e          	ldw	x,_speed_motor3
12002  1c1e a303e8        	cpw	x,#1000
12003  1c21 244c          	jruge	L3265
12004                     ; 4938 			if((rotor_position == 4) && (hall_pwm_cont == 0))	
12006  1c23 b640          	ld	a,_rotor_position
12007  1c25 a104          	cp	a,#4
12008  1c27 264a          	jrne	L1565
12010  1c29 be02          	ldw	x,_hall_pwm_cont
12011  1c2b 2646          	jrne	L1565
12012                     ; 4940 				if((cross0_pos_hall == 3) || (cross0_pos_hall == 2) || ((cross0_pos_hall == 6) && (cross0_pos_hall_ver < 128)))
12014  1c2d c6012e        	ld	a,_cross0_pos_hall
12015  1c30 a103          	cp	a,#3
12016  1c32 270f          	jreq	L1365
12018  1c34 a102          	cp	a,#2
12019  1c36 270b          	jreq	L1365
12021  1c38 a106          	cp	a,#6
12022  1c3a 2612          	jrne	L7265
12024  1c3c c6012d        	ld	a,_cross0_pos_hall_ver
12025  1c3f a180          	cp	a,#128
12026  1c41 240b          	jruge	L7265
12027  1c43               L1365:
12028                     ; 4942 					if(cvt_ver > -250)
12030  1c43 ce0000        	ldw	x,_cvt_ver
12031  1c46 a3ff07        	cpw	x,#65287
12032  1c49 2f28          	jrslt	L1565
12033                     ; 4943 						cvt_ver -=1;
12035  1c4b 5a            	decw	x
12036  1c4c 2022          	jp	LC048
12037  1c4e               L7265:
12038                     ; 4945 				else if((cross0_pos_hall == 5) || (cross0_pos_hall == 4) || ((cross0_pos_hall == 6) && (cross0_pos_hall_ver > 128)))
12040  1c4e c6012e        	ld	a,_cross0_pos_hall
12041  1c51 a105          	cp	a,#5
12042  1c53 270f          	jreq	L3465
12044  1c55 a104          	cp	a,#4
12045  1c57 270b          	jreq	L3465
12047  1c59 a106          	cp	a,#6
12048  1c5b 2616          	jrne	L1565
12050  1c5d c6012d        	ld	a,_cross0_pos_hall_ver
12051  1c60 a181          	cp	a,#129
12052  1c62 250f          	jrult	L1565
12053  1c64               L3465:
12054                     ; 4947 					if(cvt_ver < 250)
12056  1c64 ce0000        	ldw	x,_cvt_ver
12057  1c67 a300fa        	cpw	x,#250
12058  1c6a 2e07          	jrsge	L1565
12059                     ; 4948 						cvt_ver +=1;
12061  1c6c 5c            	incw	x
12062  1c6d 2001          	jp	LC048
12063  1c6f               L3265:
12064                     ; 4954 			cvt_ver = 0;
12066  1c6f 5f            	clrw	x
12067  1c70               LC048:
12068  1c70 cf0000        	ldw	_cvt_ver,x
12069  1c73               L1565:
12070                     ; 4969 }
12073  1c73 81            	ret	
12105                     ; 4971 void lock_c_v(void)
12105                     ; 4972 {
12106                     	switch	.text
12107  1c74               _lock_c_v:
12109  1c74 89            	pushw	x
12110       00000002      OFST:	set	2
12113                     ; 4973 	if(LOCK_PORT == 0)
12115  1c75 7208500150    	btjt	_PA_IDR,#4,L3665
12116                     ; 4975 		if(lock_port_low_count < 20)
12118  1c7a c60013        	ld	a,_lock_port_low_count
12119  1c7d a114          	cp	a,#20
12120  1c7f 2406          	jruge	L5665
12121                     ; 4976 			lock_port_low_count ++;
12123  1c81 725c0013      	inc	_lock_port_low_count
12125  1c85 204e          	jra	L1075
12126  1c87               L5665:
12127                     ; 4979 			if(lock_port_low_count < 52)
12129  1c87 a134          	cp	a,#52
12130  1c89 2425          	jruge	L1765
12131                     ; 4981 				lock_port_low_count ++;
12133  1c8b 725c0013      	inc	_lock_port_low_count
12134                     ; 4982 				if(current_average1 < 20)
12136  1c8f b600          	ld	a,_current_average1
12137  1c91 a114          	cp	a,#20
12138  1c93 2409          	jruge	L3765
12139                     ; 4983 					current_adj_sum += user_Prdata.byte.current_adj;
12141  1c95 ce0016        	ldw	x,_current_adj_sum
12142  1c98 72bb0002      	addw	x,_user_Prdata+2
12144  1c9c 2006          	jra	L5765
12145  1c9e               L3765:
12146                     ; 4985 					current_adj_sum += current_average1;
12148  1c9e 5f            	clrw	x
12149  1c9f 97            	ld	xl,a
12151  1ca0 72bb0016      	addw	x,_current_adj_sum
12152  1ca4               L5765:
12153  1ca4 cf0016        	ldw	_current_adj_sum,x
12154                     ; 4986 				voltage_adj_sum += voltage_average;
12156  1ca7 ce0014        	ldw	x,_voltage_adj_sum
12157  1caa 72bb0000      	addw	x,_voltage_average
12159  1cae 2022          	jp	LC049
12160  1cb0               L1765:
12161                     ; 4990 				user_Prdata.byte.current_adj = current_adj_sum >> 5;
12163  1cb0 ce0016        	ldw	x,_current_adj_sum
12164  1cb3 54            	srlw	x
12165  1cb4 54            	srlw	x
12166  1cb5 54            	srlw	x
12167  1cb6 54            	srlw	x
12168  1cb7 54            	srlw	x
12169  1cb8 bf02          	ldw	_user_Prdata+2,x
12170                     ; 4991 				user_Prdata.byte.voltage_adj = voltage_adj_sum >> 5;
12172  1cba ce0014        	ldw	x,_voltage_adj_sum
12173  1cbd 54            	srlw	x
12174  1cbe 54            	srlw	x
12175  1cbf 54            	srlw	x
12176  1cc0 54            	srlw	x
12177  1cc1 54            	srlw	x
12178  1cc2 bf00          	ldw	_user_Prdata,x
12179                     ; 4992 				DI();
12182  1cc4 9b            	sim	
12184                     ; 4993 				eerprom_write();
12186  1cc5 cd0000        	call	_eerprom_write
12188  1cc8 200b          	jra	L1075
12189  1cca               L3665:
12190                     ; 4999 		lock_port_low_count = 0;
12192  1cca 725f0013      	clr	_lock_port_low_count
12193                     ; 5000 		current_adj_sum = 0;
12195  1cce 5f            	clrw	x
12196  1ccf cf0016        	ldw	_current_adj_sum,x
12197                     ; 5001 		voltage_adj_sum = 0;
12199  1cd2               LC049:
12200  1cd2 cf0014        	ldw	_voltage_adj_sum,x
12201  1cd5               L1075:
12202                     ; 5003 }
12205  1cd5 85            	popw	x
12206  1cd6 81            	ret	
15916                     	xdef	_cdpi_on_check
15917                     	xdef	_hall_down_delay
15918                     	xdef	_sf_sel_on_off
15919                     	xdef	_SynchConSub
15920                     	xdef	_RotorSetSub
15921                     	xdef	_break_dirve
15922                     	xdef	_limit_speed
15923                     	xdef	_cvt_act_cacu_2
15924                     	xdef	_cvt_act_cacu_1
15925                     	xdef	_cvt_act_deal
15926                     	xdef	_square_sine_change
15927                     	xdef	_three_dang_deal
15928                     	switch	.bss
15929  0000               _send_battry_old:
15930  0000 00            	ds.b	1
15931                     	xdef	_send_battry_old
15932  0001               _speed_bike_temp_old1:
15933  0001 0000          	ds.b	2
15934                     	xdef	_speed_bike_temp_old1
15935  0003               _speed_bike_temp_old:
15936  0003 0000          	ds.b	2
15937                     	xdef	_speed_bike_temp_old
15938                     	xdef	_current_load
15939                     	xdef	_hall_speed_chk
15940  0005               _zero_start_number:
15941  0005 00            	ds.b	1
15942                     	xdef	_zero_start_number
15943  0006               _torque_change_number:
15944  0006 00            	ds.b	1
15945                     	xdef	_torque_change_number
15946                     	xdef	_speed_limit_data_load
15947                     	xdef	f_TIM1_PWM_IRQ
15948  0007               _lj_chk_tmie_count:
15949  0007 0000          	ds.b	2
15950                     	xdef	_lj_chk_tmie_count
15951  0009               _lj_chk_delta:
15952  0009 0000          	ds.b	2
15953                     	xdef	_lj_chk_delta
15954  000b               _lj_ad_app_old:
15955  000b 0000          	ds.b	2
15956                     	xdef	_lj_ad_app_old
15957  000d               _lj_speed_start_data:
15958  000d 0000          	ds.b	2
15959                     	xdef	_lj_speed_start_data
15960  000f               _lj_speed_start_time:
15961  000f 00            	ds.b	1
15962                     	xdef	_lj_speed_start_time
15963  0010               _jiaoyan_rec:
15964  0010 0000          	ds.b	2
15965                     	xdef	_jiaoyan_rec
15966  0012               _wheel:
15967  0012 00            	ds.b	1
15968                     	xdef	_wheel
15969  0013               _lock_port_low_count:
15970  0013 00            	ds.b	1
15971                     	xdef	_lock_port_low_count
15972  0014               _voltage_adj_sum:
15973  0014 0000          	ds.b	2
15974                     	xdef	_voltage_adj_sum
15975  0016               _current_adj_sum:
15976  0016 0000          	ds.b	2
15977                     	xdef	_current_adj_sum
15978  0018               _nohall_phase_change_delay:
15979  0018 0000          	ds.b	2
15980                     	xdef	_nohall_phase_change_delay
15981  001a               _nohall_start_delay_count:
15982  001a 00            	ds.b	1
15983                     	xdef	_nohall_start_delay_count
15984  001b               _startup_count:
15985  001b 0000          	ds.b	2
15986                     	xdef	_startup_count
15987  001d               _nohall_ol_step:
15988  001d 00            	ds.b	1
15989                     	xdef	_nohall_ol_step
15990                     	xdef	_nohall_ol_count
15991                     	xdef	_nhall_pwm_cont
15992                     	xdef	_nspeed_motor
15993  001e               _hall1:
15994  001e 00            	ds.b	1
15995                     	xdef	_hall1
15996  001f               _hall0:
15997  001f 00            	ds.b	1
15998                     	xdef	_hall0
15999                     	switch	.ubsct
16000  0000               _nohall_normal_count:
16001  0000 00            	ds.b	1
16002                     	xdef	_nohall_normal_count
16003                     	switch	.bss
16004  0020               _nohall_block_count:
16005  0020 00            	ds.b	1
16006                     	xdef	_nohall_block_count
16007                     	xdef	_nohall_start_delay
16008                     	xdef	_nohall_step
16009                     	xdef	_nohall_start_count
16010                     	xdef	_nohall_ready_count
16011                     	xdef	_nohall_ready_flag
16012  0021               _speed_motor_nohall:
16013  0021 0000          	ds.b	2
16014                     	xdef	_speed_motor_nohall
16015  0023               _nohall_pwm:
16016  0023 0000          	ds.b	2
16017                     	xdef	_nohall_pwm
16018  0025               _speed_motor_time_16:
16019  0025 0000          	ds.b	2
16020                     	xdef	_speed_motor_time_16
16021  0027               _speed_motor_time:
16022  0027 00            	ds.b	1
16023                     	xdef	_speed_motor_time
16024  0028               _t6_cs_tab_3:
16025  0028 000000000000  	ds.b	20
16026                     	xdef	_t6_cs_tab_3
16027  003c               _t6_cs_tab_2:
16028  003c 000000000000  	ds.b	20
16029                     	xdef	_t6_cs_tab_2
16030  0050               _t6_cs_tab:
16031  0050 000000000000  	ds.b	20
16032                     	xdef	_t6_cs_tab
16033  0064               _t6_ov_tab_3:
16034  0064 000000000000  	ds.b	10
16035                     	xdef	_t6_ov_tab_3
16036  006e               _t6_ov_tab_2:
16037  006e 000000000000  	ds.b	10
16038                     	xdef	_t6_ov_tab_2
16039  0078               _t6_ov_tab:
16040  0078 000000000000  	ds.b	10
16041                     	xdef	_t6_ov_tab
16042  0082               _t6_ver_tab_3:
16043  0082 000000000000  	ds.b	20
16044                     	xdef	_t6_ver_tab_3
16045  0096               _t6_ver_tab_2:
16046  0096 000000000000  	ds.b	20
16047                     	xdef	_t6_ver_tab_2
16048  00aa               _t6_ver_tab:
16049  00aa 000000000000  	ds.b	20
16050                     	xdef	_t6_ver_tab
16051  00be               _t6_count_tab_3:
16052  00be 000000000000  	ds.b	20
16053                     	xdef	_t6_count_tab_3
16054  00d2               _t6_count_tab_2:
16055  00d2 000000000000  	ds.b	20
16056                     	xdef	_t6_count_tab_2
16057  00e6               _t6_count_tab:
16058  00e6 000000000000  	ds.b	20
16059                     	xdef	_t6_count_tab
16060  00fa               _ccount:
16061  00fa 00            	ds.b	1
16062                     	xdef	_ccount
16063  00fb               _cvt_dn_count:
16064  00fb 00            	ds.b	1
16065                     	xdef	_cvt_dn_count
16066  00fc               _cvt_up_count:
16067  00fc 00            	ds.b	1
16068                     	xdef	_cvt_up_count
16069  00fd               _check_shake_count:
16070  00fd 00            	ds.b	1
16071                     	xdef	_check_shake_count
16072  00fe               _check_shake_count1:
16073  00fe 00            	ds.b	1
16074                     	xdef	_check_shake_count1
16075  00ff               _speed_set_last_count:
16076  00ff 0000          	ds.b	2
16077                     	xdef	_speed_set_last_count
16078  0101               _speed_set_count:
16079  0101 0000          	ds.b	2
16080                     	xdef	_speed_set_count
16081  0103               _speed_set_low_count:
16082  0103 0000          	ds.b	2
16083                     	xdef	_speed_set_low_count
16084  0105               _speed_set_high_count:
16085  0105 0000          	ds.b	2
16086                     	xdef	_speed_set_high_count
16087  0107               _sys_start_count1:
16088  0107 0000          	ds.b	2
16089                     	xdef	_sys_start_count1
16090                     	xdef	_voltage_pulv
16091  0109               _pw_lv_count:
16092  0109 00            	ds.b	1
16093                     	xdef	_pw_lv_count
16094  010a               _cdpi_start_count:
16095  010a 00            	ds.b	1
16096                     	xdef	_cdpi_start_count
16097  010b               _pwm_duty_on_last:
16098  010b 0000          	ds.b	2
16099                     	xdef	_pwm_duty_on_last
16100  010d               _cdpi_on_flag:
16101  010d 00            	ds.b	1
16102                     	xdef	_cdpi_on_flag
16103  010e               _ph_max_ver_count:
16104  010e 00            	ds.b	1
16105                     	xdef	_ph_max_ver_count
16106  010f               _cvt_speed_motor:
16107  010f 00            	ds.b	1
16108                     	xdef	_cvt_speed_motor
16109  0110               _speed_check_count2:
16110  0110 00            	ds.b	1
16111                     	xdef	_speed_check_count2
16112  0111               _speed_check_count1:
16113  0111 00            	ds.b	1
16114                     	xdef	_speed_check_count1
16115  0112               _speed_check_on_flag:
16116  0112 00            	ds.b	1
16117                     	xdef	_speed_check_on_flag
16118  0113               _pwm_duty_on_ini_count:
16119  0113 0000          	ds.b	2
16120                     	xdef	_pwm_duty_on_ini_count
16121  0115               _pwm_duty_high1:
16122  0115 00            	ds.b	1
16123                     	xdef	_pwm_duty_high1
16124  0116               _pwm_duty_low1:
16125  0116 00            	ds.b	1
16126                     	xdef	_pwm_duty_low1
16127  0117               _send_data_time:
16128  0117 00            	ds.b	1
16129                     	xdef	_send_data_time
16130  0118               _voltage_average_old_min:
16131  0118 0000          	ds.b	2
16132                     	xdef	_voltage_average_old_min
16133  011a               _voltage_average_old:
16134  011a 0000          	ds.b	2
16135                     	xdef	_voltage_average_old
16136  011c               _voltage_load_count:
16137  011c 0000          	ds.b	2
16138                     	xdef	_voltage_load_count
16139  011e               _time_100ms:
16140  011e 0000          	ds.b	2
16141                     	xdef	_time_100ms
16142  0120               _hall_speed_limit_count:
16143  0120 00            	ds.b	1
16144                     	xdef	_hall_speed_limit_count
16145  0121               _limit_speed_hall_delta_old:
16146  0121 0000          	ds.b	2
16147                     	xdef	_limit_speed_hall_delta_old
16148  0123               _limit_speed_hall_temp:
16149  0123 0000          	ds.b	2
16150                     	xdef	_limit_speed_hall_temp
16151  0125               _limit_speed_hall_old:
16152  0125 0000          	ds.b	2
16153                     	xdef	_limit_speed_hall_old
16154  0127               _limit_speed_number:
16155  0127 00            	ds.b	1
16156                     	xdef	_limit_speed_number
16157  0128               _speed_bike_temp:
16158  0128 0000          	ds.b	2
16159                     	xdef	_speed_bike_temp
16160  012a               _data_rx_dang:
16161  012a 00            	ds.b	1
16162                     	xdef	_data_rx_dang
16163                     	xdef	_data_rx_number
16164  012b               _cross0_neg_hall_ver:
16165  012b 00            	ds.b	1
16166                     	xdef	_cross0_neg_hall_ver
16167  012c               _cross0_neg_hall:
16168  012c 00            	ds.b	1
16169                     	xdef	_cross0_neg_hall
16170  012d               _cross0_pos_hall_ver:
16171  012d 00            	ds.b	1
16172                     	xdef	_cross0_pos_hall_ver
16173  012e               _cross0_pos_hall:
16174  012e 00            	ds.b	1
16175                     	xdef	_cross0_pos_hall
16176  012f               _cross0_port_flag:
16177  012f 00            	ds.b	1
16178                     	xdef	_cross0_port_flag
16179  0130               _cvt_torlance_adj:
16180  0130 00            	ds.b	1
16181                     	xdef	_cvt_torlance_adj
16182  0131               _cvt_debug_flag:
16183  0131 00            	ds.b	1
16184                     	xdef	_cvt_debug_flag
16185  0132               _cvt_act_on_count:
16186  0132 00            	ds.b	1
16187                     	xdef	_cvt_act_on_count
16188  0133               _cvt_act_off_count:
16189  0133 00            	ds.b	1
16190                     	xdef	_cvt_act_off_count
16191  0134               _cvt_speed_motor_6_temp:
16192  0134 0000          	ds.b	2
16193                     	xdef	_cvt_speed_motor_6_temp
16194  0136               _add_spdmt_count:
16195  0136 00            	ds.b	1
16196                     	xdef	_add_spdmt_count
16197  0137               _sum_speed_motor_6:
16198  0137 0000          	ds.b	2
16199                     	xdef	_sum_speed_motor_6
16200  0139               _speed_set_start_count:
16201  0139 00            	ds.b	1
16202                     	xdef	_speed_set_start_count
16203  013a               _speed_set_chk_flag:
16204  013a 00            	ds.b	1
16205                     	xdef	_speed_set_chk_flag
16206  013b               _speed_set_start_flag:
16207  013b 00            	ds.b	1
16208                     	xdef	_speed_set_start_flag
16209  013c               _speed_chg_up:
16210  013c 00            	ds.b	1
16211                     	xdef	_speed_chg_up
16212  013d               _speed_chg_dn:
16213  013d 00            	ds.b	1
16214                     	xdef	_speed_chg_dn
16215  013e               _speed_chg_count:
16216  013e 00            	ds.b	1
16217                     	xdef	_speed_chg_count
16218  013f               _cvt_198_flag:
16219  013f 00            	ds.b	1
16220                     	xdef	_cvt_198_flag
16221  0140               _cvt_check_down_count:
16222  0140 00            	ds.b	1
16223                     	xdef	_cvt_check_down_count
16224  0141               _cvt_check_up_count:
16225  0141 00            	ds.b	1
16226                     	xdef	_cvt_check_up_count
16227  0142               _speed_limit_down_count:
16228  0142 00            	ds.b	1
16229                     	xdef	_speed_limit_down_count
16230  0143               _speed_limit_up_count:
16231  0143 00            	ds.b	1
16232                     	xdef	_speed_limit_up_count
16233  0144               _power_low42_count:
16234  0144 00            	ds.b	1
16235                     	xdef	_power_low42_count
16236  0145               _cmd_sub_count:
16237  0145 00            	ds.b	1
16238                     	xdef	_cmd_sub_count
16239  0146               _cmd_add_count:
16240  0146 00            	ds.b	1
16241                     	xdef	_cmd_add_count
16242  0147               _start_count1:
16243  0147 00            	ds.b	1
16244                     	xdef	_start_count1
16245  0148               _one_min_flag:
16246  0148 00            	ds.b	1
16247                     	xdef	_one_min_flag
16248  0149               _speed_limit_flag:
16249  0149 00            	ds.b	1
16250                     	xdef	_speed_limit_flag
16251                     	xdef	_nhchk_pwm_match
16252  014a               _debug_light_count:
16253  014a 0000          	ds.b	2
16254                     	xdef	_debug_light_count
16255  014c               _ph_current_average_sum:
16256  014c 00000000      	ds.b	4
16257                     	xdef	_ph_current_average_sum
16258  0150               _current_average_sum:
16259  0150 00000000      	ds.b	4
16260                     	xdef	_current_average_sum
16261                     	xdef	_auto_debug_count
16262  0154               _cvt_off_count:
16263  0154 00            	ds.b	1
16264                     	xdef	_cvt_off_count
16265  0155               _cvt_on_count:
16266  0155 00            	ds.b	1
16267                     	xdef	_cvt_on_count
16268  0156               _dang_mode:
16269  0156 00            	ds.b	1
16270                     	xdef	_dang_mode
16271  0157               _key_do_count:
16272  0157 00            	ds.b	1
16273                     	xdef	_key_do_count
16274  0158               _key_undo_flag:
16275  0158 00            	ds.b	1
16276                     	xdef	_key_undo_flag
16277  0159               _key_read_count:
16278  0159 00            	ds.b	1
16279                     	xdef	_key_read_count
16280                     	xdef	_speed_chg_delay
16281  015a               _cvt_count_flag_count:
16282  015a 0000          	ds.b	2
16283                     	xdef	_cvt_count_flag_count
16284  015c               _cvt_count:
16285  015c 0000          	ds.b	2
16286                     	xdef	_cvt_count
16287  015e               _lv_flash_count:
16288  015e 00            	ds.b	1
16289                     	xdef	_lv_flash_count
16290  015f               _pw_delay:
16291  015f 00            	ds.b	1
16292                     	xdef	_pw_delay
16293  0160               _eco_off_count:
16294  0160 00            	ds.b	1
16295                     	xdef	_eco_off_count
16296  0161               _eco_on_count:
16297  0161 00            	ds.b	1
16298                     	xdef	_eco_on_count
16299  0162               _hall_down_count:
16300  0162 00            	ds.b	1
16301                     	xdef	_hall_down_count
16302  0163               _current_flag:
16303  0163 00            	ds.b	1
16304                     	xdef	_current_flag
16305                     	switch	.ubsct
16306  0001               _eco_flag:
16307  0001 00            	ds.b	1
16308                     	xdef	_eco_flag
16309  0002               _spt_condition0:
16310  0002 00            	ds.b	1
16311                     	xdef	_spt_condition0
16312                     	switch	.bss
16313  0164               _irpt_flag:
16314  0164 00            	ds.b	1
16315                     	xdef	_irpt_flag
16316                     	xdef	_Hall_REV_table
16317                     	xdef	_hall_turetable2
16318                     	xdef	_HALL_60C_table
16319                     	xdef	_Sensorless_next
16320                     	xdef	_setp_chk_last_hall
16321                     	xdef	_setp_dir_hall
16322                     	xdef	_setp_chk_hall
16323  0165               _cvt_average_old:
16324  0165 00            	ds.b	1
16325                     	xdef	_cvt_average_old
16326  0166               _cvt_average:
16327  0166 00            	ds.b	1
16328                     	xdef	_cvt_average
16329                     	switch	.ubsct
16330  0003               _rotor_count:
16331  0003 0000          	ds.b	2
16332                     	xdef	_rotor_count
16333  0005               _back_rotor_position_sensor:
16334  0005 00            	ds.b	1
16335                     	xdef	_back_rotor_position_sensor
16336  0006               _rotor_position_sensor:
16337  0006 00            	ds.b	1
16338                     	xdef	_rotor_position_sensor
16339  0007               _RoHallOk:
16340  0007 00            	ds.b	1
16341                     	xdef	_RoHallOk
16342  0008               _back_sensor_step2:
16343  0008 00            	ds.b	1
16344                     	xdef	_back_sensor_step2
16345  0009               _back_sensor_step:
16346  0009 00            	ds.b	1
16347                     	xdef	_back_sensor_step
16348                     	xdef	_period_count
16349                     	switch	.bss
16350  0167               _delay_test_count:
16351  0167 0000          	ds.b	2
16352                     	xdef	_delay_test_count
16353  0169               _sensor_pwm_duty:
16354  0169 0000          	ds.b	2
16355                     	xdef	_sensor_pwm_duty
16356                     	switch	.ubsct
16357  000a               _sensorless_rotor:
16358  000a 00            	ds.b	1
16359                     	xdef	_sensorless_rotor
16360  000b               _sensor_step:
16361  000b 00            	ds.b	1
16362                     	xdef	_sensor_step
16363  000c               _sf_down_count:
16364  000c 0000          	ds.b	2
16365                     	xdef	_sf_down_count
16366  000e               _sf_wait_flag:
16367  000e 00            	ds.b	1
16368                     	xdef	_sf_wait_flag
16369  000f               _time_count:
16370  000f 00            	ds.b	1
16371                     	xdef	_time_count
16372                     	xdef	_sys_step_36_number
16373                     	xdef	_sys_step_52_number
16374  0010               _beep_dely:
16375  0010 0000          	ds.b	2
16376                     	xdef	_beep_dely
16377  0012               _limit_beep_count:
16378  0012 00            	ds.b	1
16379                     	xdef	_limit_beep_count
16380  0013               _limit_beep_delay:
16381  0013 0000          	ds.b	2
16382                     	xdef	_limit_beep_delay
16383  0015               _limit_mode:
16384  0015 00            	ds.b	1
16385                     	xdef	_limit_mode
16386  0016               _limit_flag:
16387  0016 00            	ds.b	1
16388                     	xdef	_limit_flag
16389                     	xdef	_debug_count_max
16390  0017               _set_debug_count:
16391  0017 0000          	ds.b	2
16392                     	xdef	_set_debug_count
16393  0019               _fr_count:
16394  0019 00            	ds.b	1
16395                     	xdef	_fr_count
16396  001a               _set_debug_mode:
16397  001a 00            	ds.b	1
16398                     	xdef	_set_debug_mode
16399  001b               _debug_code:
16400  001b 0000          	ds.b	2
16401                     	xdef	_debug_code
16402                     	switch	.bss
16403  016b               _yyz_ob1:
16404  016b 00            	ds.b	1
16405                     	xdef	_yyz_ob1
16406                     	switch	.ubsct
16407  001d               _running_alarm:
16408  001d 00            	ds.b	1
16409                     	xdef	_running_alarm
16410                     	switch	.bss
16411  016c               _control_wait_count:
16412  016c 00            	ds.b	1
16413                     	xdef	_control_wait_count
16414                     	switch	.ubsct
16415  001e               _set_alarm_ready:
16416  001e 00            	ds.b	1
16417                     	xdef	_set_alarm_ready
16418                     	switch	.bss
16419  016d               _hall_moved_count:
16420  016d 0000          	ds.b	2
16421                     	xdef	_hall_moved_count
16422                     	switch	.ubsct
16423  001f               _lock_hall:
16424  001f 00            	ds.b	1
16425                     	xdef	_lock_hall
16426                     	switch	.bss
16427  016f               _dto_count:
16428  016f 0000          	ds.b	2
16429                     	xdef	_dto_count
16430  0171               _dto_status:
16431  0171 00            	ds.b	1
16432                     	xdef	_dto_status
16433  0172               _alm_lock_count:
16434  0172 0000          	ds.b	2
16435                     	xdef	_alm_lock_count
16436  0174               _hall_a_status:
16437  0174 00            	ds.b	1
16438                     	xdef	_hall_a_status
16439  0175               _alm_hall_count:
16440  0175 00            	ds.b	1
16441                     	xdef	_alm_hall_count
16442                     	switch	.ubsct
16443  0020               _CVT_dely:
16444  0020 00            	ds.b	1
16445                     	xdef	_CVT_dely
16446                     	switch	.bss
16447  0176               _voltage_load_time:
16448  0176 00            	ds.b	1
16449                     	xdef	_voltage_load_time
16450  0177               _speed_hall_flag:
16451  0177 00            	ds.b	1
16452                     	xdef	_speed_hall_flag
16453                     	switch	.ubsct
16454  0021               _hall_position_temp:
16455  0021 00            	ds.b	1
16456                     	xdef	_hall_position_temp
16457                     	switch	.bss
16458  0178               _hall_speed_motor2_old1:
16459  0178 0000          	ds.b	2
16460                     	xdef	_hall_speed_motor2_old1
16461  017a               _hall_speed_motor2_old:
16462  017a 0000          	ds.b	2
16463                     	xdef	_hall_speed_motor2_old
16464  017c               _abs_sel_dn_count:
16465  017c 00            	ds.b	1
16466                     	xdef	_abs_sel_dn_count
16467  017d               _abs_sel_up_count:
16468  017d 00            	ds.b	1
16469                     	xdef	_abs_sel_up_count
16470  017e               _brake_delay_count:
16471  017e 00            	ds.b	1
16472                     	xdef	_brake_delay_count
16473  017f               _brake_out_count:
16474  017f 00            	ds.b	1
16475                     	xdef	_brake_out_count
16476  0180               _spt_sel_dn_count:
16477  0180 00            	ds.b	1
16478                     	xdef	_spt_sel_dn_count
16479  0181               _spt_key_keep:
16480  0181 00            	ds.b	1
16481                     	xdef	_spt_key_keep
16482  0182               _ele_sel_up_count:
16483  0182 00            	ds.b	1
16484                     	xdef	_ele_sel_up_count
16485  0183               _spt_sel_up_count:
16486  0183 00            	ds.b	1
16487                     	xdef	_spt_sel_up_count
16488  0184               _spt_com_count:
16489  0184 00            	ds.b	1
16490                     	xdef	_spt_com_count
16491                     	switch	.ubsct
16492  0022               _pwm_duty_speed_old:
16493  0022 0000          	ds.b	2
16494                     	xdef	_pwm_duty_speed_old
16495                     	switch	.bss
16496  0185               _spt_low_high_f:
16497  0185 0000          	ds.b	2
16498                     	xdef	_spt_low_high_f
16499  0187               _spt_low_high_delta:
16500  0187 0000          	ds.b	2
16501                     	xdef	_spt_low_high_delta
16502  0189               _spt_low_high_count_sum:
16503  0189 0000          	ds.b	2
16504                     	xdef	_spt_low_high_count_sum
16505  018b               _spt_low_high_count_last_old:
16506  018b 0000          	ds.b	2
16507                     	xdef	_spt_low_high_count_last_old
16508  018d               _spt_low_high_count_last:
16509  018d 0000          	ds.b	2
16510                     	xdef	_spt_low_high_count_last
16511  018f               _spt_low_high_count_old:
16512  018f 0000          	ds.b	2
16513                     	xdef	_spt_low_high_count_old
16514  0191               _spt_low_high_count:
16515  0191 0000          	ds.b	2
16516                     	xdef	_spt_low_high_count
16517  0193               _spt_high_count:
16518  0193 0000          	ds.b	2
16519                     	xdef	_spt_high_count
16520  0195               _spt_low_count:
16521  0195 0000          	ds.b	2
16522                     	xdef	_spt_low_count
16523  0197               _spt_keep_out_bike:
16524  0197 00            	ds.b	1
16525                     	xdef	_spt_keep_out_bike
16526  0198               _spt_low_flag_bike:
16527  0198 00            	ds.b	1
16528                     	xdef	_spt_low_flag_bike
16529  0199               _spt_high_flag_bike:
16530  0199 00            	ds.b	1
16531                     	xdef	_spt_high_flag_bike
16532  019a               _spt_condition_old_bike:
16533  019a 00            	ds.b	1
16534                     	xdef	_spt_condition_old_bike
16535  019b               _spt_condition1_bike:
16536  019b 00            	ds.b	1
16537                     	xdef	_spt_condition1_bike
16538  019c               _spt_keep_out:
16539  019c 00            	ds.b	1
16540                     	xdef	_spt_keep_out
16541  019d               _spt_low_flag:
16542  019d 00            	ds.b	1
16543                     	xdef	_spt_low_flag
16544  019e               _spt_high_flag:
16545  019e 00            	ds.b	1
16546                     	xdef	_spt_high_flag
16547  019f               _spt_condition_old:
16548  019f 00            	ds.b	1
16549                     	xdef	_spt_condition_old
16550  01a0               _spt_condition1:
16551  01a0 00            	ds.b	1
16552                     	xdef	_spt_condition1
16553  01a1               _cvt_exit_count:
16554  01a1 00            	ds.b	1
16555                     	xdef	_cvt_exit_count
16556  01a2               _cvt_start_count:
16557  01a2 00            	ds.b	1
16558                     	xdef	_cvt_start_count
16559                     	switch	.ubsct
16560  0024               _pwm_up_count:
16561  0024 00            	ds.b	1
16562                     	xdef	_pwm_up_count
16563                     	switch	.bss
16564  01a3               _ph_low_count_max_count:
16565  01a3 00            	ds.b	1
16566                     	xdef	_ph_low_count_max_count
16567  01a4               _pwm_sub_count1:
16568  01a4 00            	ds.b	1
16569                     	xdef	_pwm_sub_count1
16570  01a5               _pwm_add_count1:
16571  01a5 00            	ds.b	1
16572                     	xdef	_pwm_add_count1
16573                     	switch	.ubsct
16574  0025               _pwm_duty_high:
16575  0025 00            	ds.b	1
16576                     	xdef	_pwm_duty_high
16577  0026               _pwm_duty_low:
16578  0026 00            	ds.b	1
16579                     	xdef	_pwm_duty_low
16580  0027               _PWM_mode:
16581  0027 00            	ds.b	1
16582                     	xdef	_PWM_mode
16583                     	xdef	_LJ_zero_error_chk
16584                     	xdef	_lj_chk
16585                     	xdef	_light_on_off_fun
16586                     	xdef	_chk_sendbus
16587                     	xdef	_spt_chk_single
16588                     	xdef	_uart_send_main
16589                     	xdef	_hall_speed_limit
16590                     	xdef	_speed_check_bike
16591                     	xdef	_uart_rx_dang_load
16592                     	xdef	_uart_rx_dang_deal
16593                     	xdef	_tx_sum_load
16594                     	xdef	_speed_load
16595                     	xdef	_error_load
16596                     	xdef	_controller_state_load
16597                     	xdef	_voltage_load
16598                     	xdef	_uart_rec_deal
16599                     	xdef	_lock_c_v
16600                     	xdef	_cvt_ver_cal
16601                     	xdef	_nohall_control
16602                     	xdef	_speed_limit_flag_check
16603                     	xdef	_STOP_drive_sin
16604                     	xdef	_lv_display
16605                     	xdef	_eco_sel
16606                     	xdef	_current_dec
16607                     	xdef	_current_over
16608                     	xdef	_spt_chk_42
16609                     	xdef	_cvt_speed
16610                     	xdef	_sandang_speed
16611                     	xdef	_hall_out
16612                     	xdef	_speed_limit_check
16613                     	xdef	_debug_save
16614                     	xdef	_STOP_drive
16615                     	xdef	_phase_abs_change
16616                     	xdef	_motor_brake
16617  0028               _motor_flag:
16618  0028 00            	ds.b	1
16619                     	xdef	_motor_flag
16620                     	xref.b	_user_Prdata
16621  0029               _sys_state_flag2:
16622  0029 0000          	ds.b	2
16623                     	xdef	_sys_state_flag2
16624  002b               _sys_state_flag:
16625  002b 000000        	ds.b	3
16626                     	xdef	_sys_state_flag
16627  002e               _error_bank:
16628  002e 000000        	ds.b	3
16629                     	xdef	_error_bank
16630                     	switch	.bss
16631  01a6               _hand_enable_flag:
16632  01a6 00            	ds.b	1
16633                     	xdef	_hand_enable_flag
16634  01a7               _send_data_flag:
16635  01a7 00            	ds.b	1
16636                     	xdef	_send_data_flag
16637  01a8               _hand_no_speed_limit:
16638  01a8 00            	ds.b	1
16639                     	xdef	_hand_no_speed_limit
16640  01a9               _limit_speed_hall_delta:
16641  01a9 0000          	ds.b	2
16642                     	xdef	_limit_speed_hall_delta
16643  01ab               _limit_speed_hall_1:
16644  01ab 0000          	ds.b	2
16645                     	xdef	_limit_speed_hall_1
16646  01ad               _limit_current_speed:
16647  01ad 0000          	ds.b	2
16648                     	xdef	_limit_current_speed
16649  01af               _speed_bike:
16650  01af 0000          	ds.b	2
16651                     	xdef	_speed_bike
16652  01b1               _dang_limit_pwm:
16653  01b1 0000          	ds.b	2
16654                     	xdef	_dang_limit_pwm
16655  01b3               _dang_limit_current:
16656  01b3 00            	ds.b	1
16657                     	xdef	_dang_limit_current
16658  01b4               _data_rx:
16659  01b4 000000000000  	ds.b	6
16660                     	xdef	_data_rx
16661  01ba               _data_rx_temp:
16662  01ba 000000000000  	ds.b	6
16663                     	xdef	_data_rx_temp
16664                     	xdef	_data_tx
16665  01c0               _yyz_ob:
16666  01c0 0000          	ds.b	2
16667                     	xdef	_yyz_ob
16668                     	xref	_sp_ph_current_limit_10p
16669                     	xref	_sp_ph_current_limit_max
16670  01c2               _cvt_torlance_save:
16671  01c2 00            	ds.b	1
16672                     	xdef	_cvt_torlance_save
16673  01c3               _cvt_speed_motor_6:
16674  01c3 0000          	ds.b	2
16675                     	xdef	_cvt_speed_motor_6
16676  01c5               _cvt_reg_status:
16677  01c5 00            	ds.b	1
16678                     	xdef	_cvt_reg_status
16679  01c6               _cvt_act_flag:
16680  01c6 00            	ds.b	1
16681                     	xdef	_cvt_act_flag
16682  01c7               _cvt_reg_flag:
16683  01c7 00            	ds.b	1
16684                     	xdef	_cvt_reg_flag
16685                     	xdef	_alarm_flag
16686  01c8               _mode_360_count:
16687  01c8 00            	ds.b	1
16688                     	xdef	_mode_360_count
16689                     	xref	_hall_ver
16690  01c9               _square_sine_change_flag:
16691  01c9 00            	ds.b	1
16692                     	xdef	_square_sine_change_flag
16693  01ca               _speed_limit_flag2:
16694  01ca 00            	ds.b	1
16695                     	xdef	_speed_limit_flag2
16696  01cb               _cvt_on_flag:
16697  01cb 00            	ds.b	1
16698                     	xdef	_cvt_on_flag
16699  01cc               _hall_pwm_cont_3:
16700  01cc 0000          	ds.b	2
16701                     	xdef	_hall_pwm_cont_3
16702  01ce               _speed_motor_3:
16703  01ce 0000          	ds.b	2
16704                     	xdef	_speed_motor_3
16705                     	xref	_cvt_ver
16706                     	xref	_current_adj_battry
16707  01d0               _motor_alm_status_lock:
16708  01d0 00            	ds.b	1
16709                     	xdef	_motor_alm_status_lock
16710                     	xref	_speed_motor_6
16711  01d1               _chall_ver_zero_flag:
16712  01d1 00            	ds.b	1
16713                     	xdef	_chall_ver_zero_flag
16714  01d2               _cvt_flag:
16715  01d2 00            	ds.b	1
16716                     	xdef	_cvt_flag
16717                     	xref	_pwm_duty_on_ini
16718                     	xref	_tim2_6_flag
16719  01d3               _hall_ver_zero_flag:
16720  01d3 00            	ds.b	1
16721                     	xdef	_hall_ver_zero_flag
16722                     	xref	_current_high_flag
16723  01d4               _lv_flash_flag:
16724  01d4 00            	ds.b	1
16725                     	xdef	_lv_flash_flag
16726                     	xdef	_current_cmd_spt
16727                     	xref.b	_current_average1
16728                     	xdef	_hall_turetable
16729                     	switch	.ubsct
16730  0031               _cvt_rotor_position_back:
16731  0031 00            	ds.b	1
16732                     	xdef	_cvt_rotor_position_back
16733  0032               _cvt_rotor_position:
16734  0032 00            	ds.b	1
16735                     	xdef	_cvt_rotor_position
16736  0033               _rotor_position2:
16737  0033 00            	ds.b	1
16738                     	xdef	_rotor_position2
16739  0034               _rotor_position1:
16740  0034 00            	ds.b	1
16741                     	xdef	_rotor_position1
16742  0035               _CVT_hall_count:
16743  0035 0000          	ds.b	2
16744                     	xdef	_CVT_hall_count
16745  0037               _current_cmd_average_key:
16746  0037 0000          	ds.b	2
16747                     	xdef	_current_cmd_average_key
16748                     	xref.b	_current_cmd_average1
16749                     	xref.b	_control_temp
16750  0039               _CVT_dep:
16751  0039 00            	ds.b	1
16752                     	xdef	_CVT_dep
16753                     	xref	_c_offset
16754  003a               _sf_up_count:
16755  003a 0000          	ds.b	2
16756                     	xdef	_sf_up_count
16757                     	switch	.bss
16758  01d5               _ph_low_count_max_back:
16759  01d5 00            	ds.b	1
16760                     	xdef	_ph_low_count_max_back
16761                     	switch	.ubsct
16762  003c               _alarm_switch:
16763  003c 00            	ds.b	1
16764                     	xdef	_alarm_switch
16765                     	xref	_current_adj_table
16766                     	switch	.bss
16767  01d6               _delay_counter:
16768  01d6 0000          	ds.b	2
16769                     	xdef	_delay_counter
16770                     	xdef	_hall_pwm_cont
16771                     	switch	.ubsct
16772  003d               _Auto_SPT:
16773  003d 00            	ds.b	1
16774                     	xdef	_Auto_SPT
16775  003e               _ModeFlag:
16776  003e 00            	ds.b	1
16777                     	xdef	_ModeFlag
16778  003f               _hall_drive_back:
16779  003f 00            	ds.b	1
16780                     	xdef	_hall_drive_back
16781  0040               _rotor_position:
16782  0040 00            	ds.b	1
16783                     	xdef	_rotor_position
16784  0041               _speed_num:
16785  0041 00            	ds.b	1
16786                     	xdef	_speed_num
16787  0042               _pwm_cut_count:
16788  0042 00            	ds.b	1
16789                     	xdef	_pwm_cut_count
16790  0043               _pwm_add_count:
16791  0043 00            	ds.b	1
16792                     	xdef	_pwm_add_count
16793  0044               _pwm_sub_count:
16794  0044 00            	ds.b	1
16795                     	xdef	_pwm_sub_count
16796                     	xref	_current_adj_12
16797  0045               _ph_low_count_max:
16798  0045 00            	ds.b	1
16799                     	xdef	_ph_low_count_max
16800  0046               _hall_ok_count:
16801  0046 00            	ds.b	1
16802                     	xdef	_hall_ok_count
16803  0047               _Restart_cont:
16804  0047 00            	ds.b	1
16805                     	xdef	_Restart_cont
16806                     	xref.b	_current_cmd_protect_average
16807                     	xref.b	_start_current
16808  0048               _hall_count:
16809  0048 0000          	ds.b	2
16810                     	xdef	_hall_count
16811                     	xref.b	_voltage_average
16812  004a               _motor_stop_count2:
16813  004a 00            	ds.b	1
16814                     	xdef	_motor_stop_count2
16815  004b               _debug_mode_flag:
16816  004b 00            	ds.b	1
16817                     	xdef	_debug_mode_flag
16818                     	xdef	_mode_flag
16819  004c               _motor_stop_count:
16820  004c 00            	ds.b	1
16821                     	xdef	_motor_stop_count
16822                     	xdef	_position_flag
16823  004d               _controlchg_flag:
16824  004d 00            	ds.b	1
16825                     	xdef	_controlchg_flag
16826                     	xdef	_speed_motor2
16827  004e               _speed_motor:
16828  004e 0000          	ds.b	2
16829                     	xdef	_speed_motor
16830  0050               _pwm_brake_max:
16831  0050 0000          	ds.b	2
16832                     	xdef	_pwm_brake_max
16833  0052               _pwm_duty_brake:
16834  0052 0000          	ds.b	2
16835                     	xdef	_pwm_duty_brake
16836  0054               _pwm_duty_speed:
16837  0054 0000          	ds.b	2
16838                     	xdef	_pwm_duty_speed
16839  0056               _pwm_duty_on1:
16840  0056 0000          	ds.b	2
16841                     	xdef	_pwm_duty_on1
16842  0058               _pwm_duty_on:
16843  0058 0000          	ds.b	2
16844                     	xdef	_pwm_duty_on
16845  005a               _pwm_duty_on_old:
16846  005a 0000          	ds.b	2
16847                     	xdef	_pwm_duty_on_old
16848  005c               _current_cmd_average:
16849  005c 0000          	ds.b	2
16850                     	xdef	_current_cmd_average
16851  005e               _speed_motor3:
16852  005e 0000          	ds.b	2
16853                     	xdef	_speed_motor3
16854                     	xref.b	_sys_step
16855                     	xref.b	_current_temp
16856                     	xref.b	_current_max
16857                     	xref	_svpwm_rotor_position
16858                     	xref	_nohall_speed_low_count
16859                     	xref	_hall_count_nohall
16860                     	switch	.bss
16861  01d8               _hall_change_count:
16862  01d8 0000          	ds.b	2
16863                     	xdef	_hall_change_count
16864  01da               _brk_error_flag:
16865  01da 00            	ds.b	1
16866                     	xdef	_brk_error_flag
16867  01db               _run_mode:
16868  01db 00            	ds.b	1
16869                     	xdef	_run_mode
16870                     	xref	_lj_ad_app
16871  01dc               _bb_candence:
16872  01dc 0000          	ds.b	2
16873                     	xdef	_bb_candence
16874  01de               _bike_rpm_old:
16875  01de 0000          	ds.b	2
16876                     	xdef	_bike_rpm_old
16877  01e0               _bike_rpm:
16878  01e0 0000          	ds.b	2
16879                     	xdef	_bike_rpm
16880  01e2               _spt_high_count_bike:
16881  01e2 0000          	ds.b	2
16882                     	xdef	_spt_high_count_bike
16883  01e4               _spt_low_count_bike:
16884  01e4 0000          	ds.b	2
16885                     	xdef	_spt_low_count_bike
16886  01e6               _zero_add_torque:
16887  01e6 00            	ds.b	1
16888                     	xdef	_zero_add_torque
16889  01e7               _lj_change_time_count:
16890  01e7 0000          	ds.b	2
16891                     	xdef	_lj_change_time_count
16892  01e9               _lj_ad_app_change:
16893  01e9 0000          	ds.b	2
16894                     	xdef	_lj_ad_app_change
16895  01eb               _lj_ad_app_last:
16896  01eb 0000          	ds.b	2
16897                     	xdef	_lj_ad_app_last
16898                     	xref	_lj_zero_auto_corrent_count
16899  01ed               _current_cmd_average1_old:
16900  01ed 0000          	ds.b	2
16901                     	xdef	_current_cmd_average1_old
16902  01ef               _start_2s_count:
16903  01ef 0000          	ds.b	2
16904                     	xdef	_start_2s_count
16905  01f1               _speed_bike_load_count:
16906  01f1 00            	ds.b	1
16907                     	xdef	_speed_bike_load_count
16908                     	xref	_current_ph_lj_time
16909                     	xref	_current_ph_lj_delta
16910                     	xref	_current_ph_lj_old
16911                     	xref	_current_ph_lj
16912                     	xref	_control_lj_zero_table
16913                     	xref	_control_lj_temp_table
16914  01f2               _start_1s_count:
16915  01f2 0000          	ds.b	2
16916                     	xdef	_start_1s_count
16917  01f4               _torque_level:
16918  01f4 00            	ds.b	1
16919                     	xdef	_torque_level
16920  01f5               _bb_candence_old:
16921  01f5 00            	ds.b	1
16922                     	xdef	_bb_candence_old
16923  01f6               _max_speed_limit:
16924  01f6 00            	ds.b	1
16925                     	xdef	_max_speed_limit
16926                     	xdef	_cvt_sel
16927                     	xdef	_MotorStartSub
16928                     	xdef	_current_cmd_protect_sample
16929                     	xref	_svpwm_ver
16930                     	xref	_rotor_ver
16931                     	xdef	_motor_lock_drive
16932                     	xref	_current_num
16933                     	xdef	_PWM_ALL_OFF
16934                     	xdef	_phase_lock_change
16935                     	xdef	_phase_change
16936                     	xdef	_Motor_start_m
16937                     	xref	_ad_data
16938                     	xdef	_brake_pwm_duty
16939                     	xdef	_spt_sel
16940                     	xdef	_abs_sel
16941                     	xdef	_sf_sel
16942                     	xdef	_motor_drive
16943                     	xref	_hall_read
16944                     	xdef	_dir_sf_mode
16945                     	xref	_eerprom_write
16946                     	xref	_motor_stop
16947                     	xdef	_brake_chk
16948                     	xdef	_spt_chk
16949                     	xref	_adc_sampel_ph
16950                     	xref	_adc_sample
16951                     	xref	_adc_channel
16952                     	xref	_TM1_INI
16953                     	xref.b	c_lreg
16954                     	xref.b	c_x
16955                     	xref.b	c_y
16975                     	xref	c_bmulx
16976                     	xref	c_lcmp
16977                     	xref	c_lursh
16978                     	xref	c_smul
16979                     	xref	c_ludv
16980                     	xref	c_lmul
16981                     	xref	c_ltor
16982                     	xref	c_rtol
16983                     	xref	c_uitolx
16984                     	xref	c_idiv
16985                     	xref	c_sdivx
16986                     	end
