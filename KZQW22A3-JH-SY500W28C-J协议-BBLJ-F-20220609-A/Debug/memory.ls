   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2892                     ; 92 void OPTIONSET_def(void)
2892                     ; 93 {
2894                     	switch	.text
2895  0000               _OPTIONSET_def:
2899                     ; 94 	FLASH_DUKR = 0xAE;
2901  0000 35ae5064      	mov	_FLASH_DUKR,#174
2902                     ; 95 	FLASH_DUKR = 0x56;
2904  0004 35565064      	mov	_FLASH_DUKR,#86
2906  0008               L1002:
2907                     ; 96 	while(!(FLASH_IAPSR & (1<<DUL)));
2909  0008 7207505ffb    	btjf	_FLASH_IAPSR,#3,L1002
2910                     ; 98 	FLASH_CR2 	|= (unsigned char)(1<<OPT);
2912  000d 721e505b      	bset	_FLASH_CR2,#7
2913                     ; 99 	FLASH_NCR2 	&= (unsigned char)(~(1<<OPT));
2915  0011 721f505c      	bres	_FLASH_NCR2,#7
2916                     ; 101 	OPT0 = (unsigned char)(0x00);
2918  0015 725f4800      	clr	_OPT0
2919                     ; 102 	WDT_FLASH();
2921  0019 35aa50e0      	mov	_IWDG_KR,#170
2922                     ; 104 	OPT1 = (unsigned char)(OPT1_DATA);
2924  001d 725f4801      	clr	_OPT1
2925                     ; 105 	NOPT1 = (unsigned char)(0xff ^ (OPT1_DATA));
2927  0021 35ff4802      	mov	_NOPT1,#255
2928                     ; 106 	WDT_FLASH();
2930  0025 35aa50e0      	mov	_IWDG_KR,#170
2931                     ; 108 	NOPT2 = (unsigned char)(0xff ^ (OPT2_DATA));		
2933  0029 35df4804      	mov	_NOPT2,#223
2934                     ; 109 	OPT2 = (unsigned char)(OPT2_DATA);	
2936  002d 35204803      	mov	_OPT2,#32
2937                     ; 111 	WDT_FLASH();
2939  0031 35aa50e0      	mov	_IWDG_KR,#170
2940                     ; 112 	OPT3 = (unsigned char)(OPT3_DATA);
2942  0035 725f4805      	clr	_OPT3
2943                     ; 113 	NOPT3 = (unsigned char)(0xff ^ (OPT3_DATA));	
2945  0039 35ff4806      	mov	_NOPT3,#255
2946                     ; 114 	WDT_FLASH();
2948  003d 35aa50e0      	mov	_IWDG_KR,#170
2949                     ; 116 	OPT4 = (unsigned char)(OPT4_DATA);
2951  0041 725f4807      	clr	_OPT4
2952                     ; 117 	NOPT4 = (unsigned char)(0xff ^ (OPT4_DATA));	
2954  0045 35ff4808      	mov	_NOPT4,#255
2955                     ; 118 	WDT_FLASH();
2957  0049 35aa50e0      	mov	_IWDG_KR,#170
2958                     ; 119 	OPT5 = (unsigned char)(OPT5_DATA);
2960  004d 725f4809      	clr	_OPT5
2961                     ; 120 	NOPT5 = (unsigned char)(0xff ^ (OPT5_DATA));	
2963  0051 35ff480a      	mov	_NOPT5,#255
2964                     ; 121 	WDT_FLASH();
2966  0055 35aa50e0      	mov	_IWDG_KR,#170
2967                     ; 132 	FLASH_CR2 	&= (unsigned char)(~(1<<OPT));
2969  0059 721f505b      	bres	_FLASH_CR2,#7
2970                     ; 133 	FLASH_NCR2 	|= (unsigned char)(1<<OPT);
2972  005d 721e505c      	bset	_FLASH_NCR2,#7
2973                     ; 134 	WDT_FLASH();
2975  0061 35aa50e0      	mov	_IWDG_KR,#170
2976                     ; 135 	FLASH_IAPSR &= (unsigned char)(~(1<<DUL));	
2978  0065 7217505f      	bres	_FLASH_IAPSR,#3
2979                     ; 136 }
2982  0069 81            	ret	
3012                     ; 139 void OPTIONSET_INI(void)
3012                     ; 140 {
3013                     	switch	.text
3014  006a               _OPTIONSET_INI:
3018                     ; 142 	if((OPT1 != (OPT1_DATA)) || (OPT2 != (OPT2_DATA)) || (OPT3 != (OPT3_DATA)) || (OPT4 != (OPT4_DATA)) || (OPT5 != (OPT5_DATA)))
3020  006a 725d4801      	tnz	_OPT1
3021  006e 2619          	jrne	L7102
3023  0070 c64803        	ld	a,_OPT2
3024  0073 a120          	cp	a,#32
3025  0075 2612          	jrne	L7102
3027  0077 725d4805      	tnz	_OPT3
3028  007b 260c          	jrne	L7102
3030  007d 725d4807      	tnz	_OPT4
3031  0081 2606          	jrne	L7102
3033  0083 725d4809      	tnz	_OPT5
3034  0087 2706          	jreq	L5102
3035  0089               L7102:
3036                     ; 144 		OPTIONSET_def();
3038  0089 cd0000        	call	_OPTIONSET_def
3040                     ; 145 		eerprom_write();
3042  008c cd019a        	call	_eerprom_write
3044  008f               L5102:
3045                     ; 188 }
3048  008f 81            	ret	
3087                     ; 191 void add_protel(void)
3087                     ; 192 {
3088                     	switch	.text
3089  0090               _add_protel:
3093                     ; 193 	FLASH_DUKR = 0xAE;
3095  0090 35ae5064      	mov	_FLASH_DUKR,#174
3096                     ; 194 	FLASH_DUKR = 0x56;
3098  0094 35565064      	mov	_FLASH_DUKR,#86
3100  0098               L3402:
3101                     ; 195 	while(!(FLASH_IAPSR & (1<<DUL)));
3103  0098 7207505ffb    	btjf	_FLASH_IAPSR,#3,L3402
3104                     ; 197 	FLASH_CR2 	|= (unsigned char)(1<<OPT);
3106  009d 721e505b      	bset	_FLASH_CR2,#7
3107                     ; 198 	FLASH_NCR2 	&= (unsigned char)(~(1<<OPT));
3109  00a1 721f505c      	bres	_FLASH_NCR2,#7
3110                     ; 200 	OPT0 = (unsigned char)(OPT0_ROP_READOUT_PROTECTION);
3112  00a5 35aa4800      	mov	_OPT0,#170
3113                     ; 201 	WDT_FLASH();	
3115  00a9 35aa50e0      	mov	_IWDG_KR,#170
3116                     ; 203 	OPT1 = (unsigned char)(OPT1_DATA);
3118  00ad 725f4801      	clr	_OPT1
3119                     ; 204 	NOPT1 = (unsigned char)(0xff ^ (OPT1_DATA));
3121  00b1 35ff4802      	mov	_NOPT1,#255
3122                     ; 205 	WDT_FLASH();
3124  00b5 35aa50e0      	mov	_IWDG_KR,#170
3125                     ; 207 	NOPT2 = (unsigned char)(0xff ^ (OPT2_DATA));		
3127  00b9 35df4804      	mov	_NOPT2,#223
3128                     ; 208 	OPT2 = (unsigned char)(OPT2_DATA);	
3130  00bd 35204803      	mov	_OPT2,#32
3131                     ; 210 	WDT_FLASH();
3133  00c1 35aa50e0      	mov	_IWDG_KR,#170
3134                     ; 211 	OPT3 = (unsigned char)(OPT3_DATA);
3136  00c5 725f4805      	clr	_OPT3
3137                     ; 212 	NOPT3 = (unsigned char)(0xff ^ (OPT3_DATA));	
3139  00c9 35ff4806      	mov	_NOPT3,#255
3140                     ; 213 	WDT_FLASH();
3142  00cd 35aa50e0      	mov	_IWDG_KR,#170
3143                     ; 215 	OPT4 = (unsigned char)(OPT4_DATA);
3145  00d1 725f4807      	clr	_OPT4
3146                     ; 216 	NOPT4 = (unsigned char)(0xff ^ (OPT4_DATA));	
3148  00d5 35ff4808      	mov	_NOPT4,#255
3149                     ; 217 	WDT_FLASH();
3151  00d9 35aa50e0      	mov	_IWDG_KR,#170
3152                     ; 218 	OPT5 = (unsigned char)(OPT5_DATA);
3154  00dd 725f4809      	clr	_OPT5
3155                     ; 219 	NOPT5 = (unsigned char)(0xff ^ (OPT5_DATA));	
3157  00e1 35ff480a      	mov	_NOPT5,#255
3158                     ; 220 	WDT_FLASH();
3160  00e5 35aa50e0      	mov	_IWDG_KR,#170
3161                     ; 231 	FLASH_CR2 	&= (unsigned char)(~(1<<OPT));
3163  00e9 721f505b      	bres	_FLASH_CR2,#7
3164                     ; 232 	FLASH_NCR2 	|= (unsigned char)(1<<OPT);
3166  00ed 721e505c      	bset	_FLASH_NCR2,#7
3167                     ; 233 	WDT_FLASH();
3169  00f1 35aa50e0      	mov	_IWDG_KR,#170
3170                     ; 234 	FLASH_IAPSR &= (unsigned char)(~(1<<DUL));	
3172  00f5 7217505f      	bres	_FLASH_IAPSR,#3
3173                     ; 235 }
3176  00f9 81            	ret	
3212                     ; 239 void clear_sys_key(void)
3212                     ; 240 {
3213                     	switch	.text
3214  00fa               _clear_sys_key:
3218                     ; 241 	FLASH_IAPSR	|= 0x08;
3220  00fa 7216505f      	bset	_FLASH_IAPSR,#3
3221                     ; 242 	FLASH_DUKR = 0xAE;
3223  00fe 35ae5064      	mov	_FLASH_DUKR,#174
3224                     ; 243 	FLASH_DUKR = 0x56;
3226  0102 35565064      	mov	_FLASH_DUKR,#86
3227                     ; 244 	FLASH_CR2 = 0;
3229  0106 725f505b      	clr	_FLASH_CR2
3230                     ; 245 	FLASH_NCR2 = 0xFF;
3232  010a 35ff505c      	mov	_FLASH_NCR2,#255
3233                     ; 246 	FLASH_CR2 	|= (unsigned char)(WPRG);
3235  010e 721c505b      	bset	_FLASH_CR2,#6
3236                     ; 247 	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
3238  0112 721d505c      	bres	_FLASH_NCR2,#6
3239                     ; 249 	WDT_FLASH();
3241  0116 35aa50e0      	mov	_IWDG_KR,#170
3242                     ; 250 	eeprom_rom_0 = 0;
3244  011a 725f4000      	clr	_eeprom_rom_0
3245                     ; 251 	WDT_FLASH();
3247  011e 35aa50e0      	mov	_IWDG_KR,#170
3248                     ; 252 	eeprom_rom_1 = 0;
3250  0122 725f4001      	clr	_eeprom_rom_1
3251                     ; 253 	WDT_FLASH();
3253  0126 35aa50e0      	mov	_IWDG_KR,#170
3254                     ; 254 	eeprom_rom_2 = 0;
3256  012a 725f4002      	clr	_eeprom_rom_2
3257                     ; 255 	WDT_FLASH();
3259  012e 35aa50e0      	mov	_IWDG_KR,#170
3260                     ; 256 	eeprom_rom_3 = 0;
3262  0132 725f4003      	clr	_eeprom_rom_3
3263                     ; 257 	WDT_FLASH();
3265  0136 35aa50e0      	mov	_IWDG_KR,#170
3266                     ; 258 	eeprom_rom_4 = 0;
3268  013a 725f4004      	clr	_eeprom_rom_4
3269                     ; 259 	WDT_FLASH();
3271  013e 35aa50e0      	mov	_IWDG_KR,#170
3272                     ; 260 	eeprom_rom_5 = 0;
3274  0142 725f4005      	clr	_eeprom_rom_5
3275                     ; 261 	WDT_FLASH();
3277  0146 35aa50e0      	mov	_IWDG_KR,#170
3278                     ; 266 	eeprom_rom_a = 0;
3280  014a 725f400a      	clr	_eeprom_rom_a
3281                     ; 267 	WDT_FLASH();
3283  014e 35aa50e0      	mov	_IWDG_KR,#170
3284                     ; 268 	eeprom_rom_b = 0;
3286  0152 725f400b      	clr	_eeprom_rom_b
3287                     ; 270 	FLASH_IAPSR &= (unsigned char)(~(0x08));	
3289  0156 7217505f      	bres	_FLASH_IAPSR,#3
3290                     ; 271 }
3293  015a 81            	ret	
3327                     ; 274 void eeprom_read(void)
3327                     ; 275 {
3328                     	switch	.text
3329  015b               _eeprom_read:
3333                     ; 276 	Read_MCU_ID();
3335  015b cd02f0        	call	_Read_MCU_ID
3337                     ; 277 	user_Prdata.byte.voltage_adj = eeprom_rom_1;
3339  015e c64001        	ld	a,_eeprom_rom_1
3340  0161 5f            	clrw	x
3341  0162 97            	ld	xl,a
3342  0163 bf00          	ldw	_user_Prdata,x
3343                     ; 278 	user_Prdata.byte.voltage_adj = (user_Prdata.byte.voltage_adj << 8) + eeprom_rom_0;
3345  0165 4f            	clr	a
3346  0166 cb4000        	add	a,_eeprom_rom_0
3347  0169 2401          	jrnc	L42
3348  016b 5c            	incw	x
3349  016c               L42:
3350  016c b701          	ld	_user_Prdata+1,a
3351  016e 9f            	ld	a,xl
3352  016f b700          	ld	_user_Prdata,a
3353                     ; 279 	user_Prdata.byte.current_adj = eeprom_rom_2;
3355  0171 c64002        	ld	a,_eeprom_rom_2
3356  0174 5f            	clrw	x
3357  0175 97            	ld	xl,a
3358  0176 bf02          	ldw	_user_Prdata+2,x
3359                     ; 280 	user_Prdata.byte.limit_adj = eeprom_rom_4;	
3361  0178 c64004        	ld	a,_eeprom_rom_4
3362  017b 5f            	clrw	x
3363  017c 97            	ld	xl,a
3364  017d bf05          	ldw	_user_Prdata+5,x
3365                     ; 281 	user_Prdata.byte.limit_adj =  (user_Prdata.byte.limit_adj << 8) + eeprom_rom_3;
3367  017f 4f            	clr	a
3368  0180 cb4003        	add	a,_eeprom_rom_3
3369  0183 2401          	jrnc	L62
3370  0185 5c            	incw	x
3371  0186               L62:
3372  0186 b706          	ld	_user_Prdata+6,a
3373  0188 9f            	ld	a,xl
3374  0189 b705          	ld	_user_Prdata+5,a
3375                     ; 282 	user_Prdata.byte.ph_current_adj = eeprom_rom_5;
3377  018b 5540050004    	mov	_user_Prdata+4,_eeprom_rom_5
3378                     ; 283 	cvt_torlance_save = eeprom_rom_6;	
3380  0190 5540060000    	mov	_cvt_torlance_save,_eeprom_rom_6
3381                     ; 286 	error_bank.bit.sys_key_flag = 0;
3383  0195 721b0001      	bres	_error_bank+1,#5
3384                     ; 301 }
3387  0199 81            	ret	
3431                     ; 306 void eerprom_write(void)
3431                     ; 307 {
3432                     	switch	.text
3433  019a               _eerprom_write:
3437                     ; 308 	Read_MCU_ID();
3439  019a cd02f0        	call	_Read_MCU_ID
3441                     ; 309 	FLASH_IAPSR	|= 0x08;
3443  019d 7216505f      	bset	_FLASH_IAPSR,#3
3444                     ; 311 	FLASH_DUKR = 0xAE;
3446  01a1 35ae5064      	mov	_FLASH_DUKR,#174
3447                     ; 312 	FLASH_DUKR = 0x56;
3449  01a5 35565064      	mov	_FLASH_DUKR,#86
3451  01a9               L3012:
3452                     ; 313 	while(!(FLASH_IAPSR & (1<<DUL)));
3454  01a9 7207505ffb    	btjf	_FLASH_IAPSR,#3,L3012
3455                     ; 314 	FLASH_CR2 = 0;
3457  01ae 725f505b      	clr	_FLASH_CR2
3458                     ; 315 	FLASH_NCR2 = 0xFF;
3460  01b2 35ff505c      	mov	_FLASH_NCR2,#255
3461                     ; 317 	FLASH_CR2 	|= (unsigned char)(WPRG);
3463  01b6 721c505b      	bset	_FLASH_CR2,#6
3464                     ; 318 	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
3466  01ba 721d505c      	bres	_FLASH_NCR2,#6
3467                     ; 319 	WDT_FLASH();
3469  01be 35aa50e0      	mov	_IWDG_KR,#170
3470                     ; 320 	eeprom_rom_0 = user_Prdata.byte.voltage_adj;
3472  01c2 5500014000    	mov	_eeprom_rom_0,_user_Prdata+1
3473                     ; 321 	WDT_FLASH();
3475  01c7 35aa50e0      	mov	_IWDG_KR,#170
3476                     ; 322 	eeprom_rom_1 = (user_Prdata.byte.voltage_adj >> 8);
3478  01cb 5500004001    	mov	_eeprom_rom_1,_user_Prdata
3479                     ; 323 	WDT_FLASH();
3481  01d0 35aa50e0      	mov	_IWDG_KR,#170
3482                     ; 324 	eeprom_rom_2 = user_Prdata.byte.current_adj;
3484  01d4 5500034002    	mov	_eeprom_rom_2,_user_Prdata+3
3485                     ; 325 	WDT_FLASH();
3487  01d9 35aa50e0      	mov	_IWDG_KR,#170
3488                     ; 326 	eeprom_rom_3 = user_Prdata.byte.limit_adj;
3490  01dd 5500064003    	mov	_eeprom_rom_3,_user_Prdata+6
3491                     ; 327 	WDT_FLASH();
3493  01e2 35aa50e0      	mov	_IWDG_KR,#170
3494                     ; 328 	eeprom_rom_4 = (user_Prdata.byte.limit_adj >> 8);
3496  01e6 5500054004    	mov	_eeprom_rom_4,_user_Prdata+5
3497                     ; 329 	WDT_FLASH();
3499  01eb 35aa50e0      	mov	_IWDG_KR,#170
3500                     ; 330 	eeprom_rom_5 = user_Prdata.byte.ph_current_adj;
3502  01ef 5500044005    	mov	_eeprom_rom_5,_user_Prdata+4
3503                     ; 331 	WDT_FLASH();
3505  01f4 35aa50e0      	mov	_IWDG_KR,#170
3506                     ; 332 	eeprom_rom_6 = cvt_torlance_save;
3508  01f8 5500004006    	mov	_eeprom_rom_6,_cvt_torlance_save
3509                     ; 333 	WDT_FLASH();
3511  01fd 35aa50e0      	mov	_IWDG_KR,#170
3512                     ; 334 	eeprom_rom_7 = 0;
3514  0201 725f4007      	clr	_eeprom_rom_7
3515                     ; 335 	WDT_FLASH();
3517  0205 35aa50e0      	mov	_IWDG_KR,#170
3518                     ; 336 	eeprom_rom_8 = 0;
3520  0209 725f4008      	clr	_eeprom_rom_8
3521                     ; 337 	WDT_FLASH();
3523  020d 35aa50e0      	mov	_IWDG_KR,#170
3524                     ; 338 	eeprom_rom_9 = 0;	
3526  0211 725f4009      	clr	_eeprom_rom_9
3527                     ; 339 	WDT_FLASH();	
3529  0215 35aa50e0      	mov	_IWDG_KR,#170
3530                     ; 340 	eeprom_rom_a = (u8)(control_temp >> 8);
3532  0219 550000400a    	mov	_eeprom_rom_a,_control_temp
3533                     ; 341 	WDT_FLASH();
3535  021e 35aa50e0      	mov	_IWDG_KR,#170
3536                     ; 342 	eeprom_rom_b = (u8)control_temp;
3538  0222 550001400b    	mov	_eeprom_rom_b,_control_temp+1
3539                     ; 343 	WDT_FLASH();
3541  0227 35aa50e0      	mov	_IWDG_KR,#170
3542                     ; 344 	FLASH_IAPSR &= (u8)(~(0x08));
3544  022b 7217505f      	bres	_FLASH_IAPSR,#3
3545                     ; 345 	WDT_FLASH();
3547  022f 35aa50e0      	mov	_IWDG_KR,#170
3548                     ; 346 }
3551  0233 81            	ret	
3604                     ; 350 void eerprom_write_hall_mode(unsigned int return_data)
3604                     ; 351 {
3605                     	switch	.text
3606  0234               _eerprom_write_hall_mode:
3608  0234 89            	pushw	x
3609  0235 89            	pushw	x
3610       00000002      OFST:	set	2
3613                     ; 353 	if(return_data > 500)
3615  0236 a301f5        	cpw	x,#501
3616  0239 2505          	jrult	L1312
3617                     ; 354 		return_data = 500;
3619  023b ae01f4        	ldw	x,#500
3620  023e 1f03          	ldw	(OFST+1,sp),x
3621  0240               L1312:
3622                     ; 356 	write_data = return_data + 1;
3624  0240 1e03          	ldw	x,(OFST+1,sp)
3625  0242 5c            	incw	x
3626  0243 1f01          	ldw	(OFST-1,sp),x
3628                     ; 357 	FLASH_IAPSR	|= 0x08;
3630  0245 7216505f      	bset	_FLASH_IAPSR,#3
3631                     ; 358 	FLASH_DUKR = 0xAE;
3633  0249 35ae5064      	mov	_FLASH_DUKR,#174
3634                     ; 359 	FLASH_DUKR = 0x56;
3636  024d 35565064      	mov	_FLASH_DUKR,#86
3637                     ; 360 	FLASH_CR2 = 0;
3639  0251 725f505b      	clr	_FLASH_CR2
3640                     ; 361 	FLASH_NCR2 = 0xFF;
3642  0255 35ff505c      	mov	_FLASH_NCR2,#255
3643                     ; 363 	FLASH_CR2 	|= (unsigned char)(WPRG);
3645  0259 721c505b      	bset	_FLASH_CR2,#6
3646                     ; 364 	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
3648  025d 721d505c      	bres	_FLASH_NCR2,#6
3649                     ; 366 	WDT_FLASH();
3651  0261 35aa50e0      	mov	_IWDG_KR,#170
3652                     ; 367 	eeprom_rom_c = (write_data >> 8);
3654  0265 7b01          	ld	a,(OFST-1,sp)
3655  0267 c7400c        	ld	_eeprom_rom_c,a
3656                     ; 368 	eeprom_rom_d = (unsigned char)write_data;
3658  026a 7b02          	ld	a,(OFST+0,sp)
3659  026c c7400d        	ld	_eeprom_rom_d,a
3660                     ; 369 	WDT_FLASH();
3662  026f 35aa50e0      	mov	_IWDG_KR,#170
3663                     ; 370 	eeprom_rom_e = eeprom_rom_e;
3665  0273 55400e400e    	mov	_eeprom_rom_e,_eeprom_rom_e
3666                     ; 371 	eeprom_rom_f = eeprom_rom_f;	
3668  0278 55400f400f    	mov	_eeprom_rom_f,_eeprom_rom_f
3669                     ; 372 	WDT_FLASH();
3671  027d 35aa50e0      	mov	_IWDG_KR,#170
3672                     ; 373 	FLASH_IAPSR &= (unsigned char)(~(0x08));		
3674  0281 7217505f      	bres	_FLASH_IAPSR,#3
3675                     ; 374 }
3678  0285 5b04          	addw	sp,#4
3679  0287 81            	ret	
3716                     ; 377 unsigned int eerprom_read_hall_mode(void)
3716                     ; 378 {
3717                     	switch	.text
3718  0288               _eerprom_read_hall_mode:
3720       00000002      OFST:	set	2
3723                     ; 380 	read_temp = eeprom_rom_c;
3725  0288 c6400c        	ld	a,_eeprom_rom_c
3726  028b 5f            	clrw	x
3727  028c 97            	ld	xl,a
3729                     ; 381 	read_temp = (read_temp<< 8) + eeprom_rom_d;
3731  028d 4f            	clr	a
3732  028e cb400d        	add	a,_eeprom_rom_d
3733  0291 2401          	jrnc	L04
3734  0293 5c            	incw	x
3735  0294               L04:
3736  0294 02            	rlwa	x,a
3738                     ; 382 	return(read_temp);
3742  0295 81            	ret	
3783                     ; 387 void shout_dowm(void)
3783                     ; 388 {
3784                     	switch	.text
3785  0296               _shout_dowm:
3787  0296 5204          	subw	sp,#4
3788       00000004      OFST:	set	4
3791                     ; 390 	if(voltage_average < (user_Prdata.byte.voltage_adj - (user_Prdata.byte.voltage_adj>>2)))
3793  0298 be00          	ldw	x,_user_Prdata
3794  029a 54            	srlw	x
3795  029b 54            	srlw	x
3796  029c 1f01          	ldw	(OFST-3,sp),x
3798  029e be00          	ldw	x,_user_Prdata
3799  02a0 72f001        	subw	x,(OFST-3,sp)
3800  02a3 b300          	cpw	x,_voltage_average
3801  02a5 2334          	jrule	L7612
3802                     ; 392 		if(flash_count == 5)
3804  02a7 c60000        	ld	a,_flash_count
3805  02aa a105          	cp	a,#5
3806  02ac 2605          	jrne	L1712
3807                     ; 393 			flash_count = 1;
3809  02ae a601          	ld	a,#1
3810  02b0 c70000        	ld	_flash_count,a
3811  02b3               L1712:
3812                     ; 395 		if(flash_count < 3)
3814  02b3 a103          	cp	a,#3
3815  02b5 2406          	jruge	L3712
3816                     ; 397 			flash_count ++;
3818  02b7 725c0000      	inc	_flash_count
3820  02bb 2030          	jra	L5022
3821  02bd               L3712:
3822                     ; 399 		else if(flash_count == 3)
3824  02bd a103          	cp	a,#3
3825  02bf 262c          	jrne	L5022
3826                     ; 401 			flash_count = 4;
3828  02c1 35040000      	mov	_flash_count,#4
3829                     ; 402 			return_data = eerprom_read_hall_mode();
3831  02c5 adc1          	call	_eerprom_read_hall_mode
3833  02c7 1f03          	ldw	(OFST-1,sp),x
3835                     ; 403 			if(return_data > 300)
3837  02c9 a3012d        	cpw	x,#301
3838  02cc 2508          	jrult	L1022
3839                     ; 405 				PWM_ALL_OFF();
3841  02ce cd0000        	call	_PWM_ALL_OFF
3843                     ; 407 					clear_sys_key();
3845  02d1 cd00fa        	call	_clear_sys_key
3848  02d4 2017          	jra	L5022
3849  02d6               L1022:
3850                     ; 413 				eerprom_write_hall_mode(return_data);
3852  02d6 cd0234        	call	_eerprom_write_hall_mode
3854  02d9 2012          	jra	L5022
3855  02db               L7612:
3856                     ; 417 	else if(voltage_average > (user_Prdata.byte.voltage_adj + 1))	
3858  02db be00          	ldw	x,_user_Prdata
3859  02dd 5c            	incw	x
3860  02de b300          	cpw	x,_voltage_average
3861  02e0 240b          	jruge	L5022
3862                     ; 419 		if(flash_count == 10)
3864  02e2 c60000        	ld	a,_flash_count
3865  02e5 a10a          	cp	a,#10
3866  02e7 2604          	jrne	L5022
3867                     ; 420 			flash_count = 5;
3869  02e9 35050000      	mov	_flash_count,#5
3870  02ed               L5022:
3871                     ; 422 }
3874  02ed 5b04          	addw	sp,#4
3875  02ef 81            	ret	
3903                     ; 426 void Read_MCU_ID(void)
3903                     ; 427 {
3904                     	switch	.text
3905  02f0               _Read_MCU_ID:
3907  02f0 89            	pushw	x
3908       00000002      OFST:	set	2
3911                     ; 428 	AD_Value = 0;
3913  02f1 5f            	clrw	x
3914  02f2 bf00          	ldw	_AD_Value,x
3915                     ; 429 	AD_ValueH = 0;
3917                     ; 430 	AD_ValueL = 0;
3919  02f4 3f00          	clr	_AD_ValueL
3920                     ; 431 	control_temp = 0;
3922  02f6 bf00          	ldw	_control_temp,x
3923                     ; 432 	for(AD_ValueL = 0;AD_ValueL < 12;AD_ValueL ++)
3925  02f8 4f            	clr	a
3926  02f9 b700          	ld	_AD_ValueL,a
3927  02fb               L3222:
3928                     ; 434 		AD_Value += MCU_ID[AD_ValueL];
3930  02fb 5f            	clrw	x
3931  02fc 97            	ld	xl,a
3932  02fd d64865        	ld	a,(_MCU_ID,x)
3933  0300 bb01          	add	a,_AD_Value+1
3934  0302 b701          	ld	_AD_Value+1,a
3935  0304 2402          	jrnc	L65
3936  0306 3c00          	inc	_AD_Value
3937  0308               L65:
3938                     ; 435 		AD_ValueH = (AD_Value + (AD_ValueL * AD_ValueL) + (15 - AD_ValueL) * 3);
3940  0308 4f            	clr	a
3941  0309 97            	ld	xl,a
3942  030a a60f          	ld	a,#15
3943  030c b000          	sub	a,_AD_ValueL
3944  030e 2401          	jrnc	L06
3945  0310 5a            	decw	x
3946  0311               L06:
3947  0311 02            	rlwa	x,a
3948  0312 89            	pushw	x
3949  0313 58            	sllw	x
3950  0314 72fb01        	addw	x,(1,sp)
3951  0317 5b02          	addw	sp,#2
3953  0319 1f01          	ldw	(OFST-1,sp),x
3955  031b b600          	ld	a,_AD_ValueL
3956  031d 97            	ld	xl,a
3957  031e 42            	mul	x,a
3958  031f 72bb0000      	addw	x,_AD_Value
3959  0323 72fb01        	addw	x,(OFST-1,sp)
3960  0326 bf00          	ldw	_AD_ValueH,x
3961                     ; 436 		control_temp += (AD_ValueH + (AD_ValueH >> 4) + ((AD_ValueH & 0x000f) << 8));
3963  0328 b601          	ld	a,_AD_ValueH+1
3964  032a a40f          	and	a,#15
3965  032c 02            	rlwa	x,a
3966  032d 4f            	clr	a
3967  032e 02            	rlwa	x,a
3968  032f 1f01          	ldw	(OFST-1,sp),x
3970  0331 be00          	ldw	x,_AD_ValueH
3971  0333 54            	srlw	x
3972  0334 54            	srlw	x
3973  0335 54            	srlw	x
3974  0336 54            	srlw	x
3975  0337 72bb0000      	addw	x,_AD_ValueH
3976  033b 72fb01        	addw	x,(OFST-1,sp)
3977  033e 72bb0000      	addw	x,_control_temp
3978  0342 bf00          	ldw	_control_temp,x
3979                     ; 432 	for(AD_ValueL = 0;AD_ValueL < 12;AD_ValueL ++)
3981  0344 3c00          	inc	_AD_ValueL
3984  0346 b600          	ld	a,_AD_ValueL
3985  0348 a10c          	cp	a,#12
3986  034a 25af          	jrult	L3222
3987                     ; 438 }
3990  034c 85            	popw	x
3991  034d 81            	ret	
4322                     	xdef	_eerprom_read_hall_mode
4323                     	xdef	_eerprom_write_hall_mode
4324                     	xdef	_OPTIONSET_def
4325                     	xdef	_Read_MCU_ID
4326                     	xdef	_add_protel
4327                     	xref.b	_AD_ValueL
4328                     	xref.b	_AD_ValueH
4329                     	xref.b	_user_Prdata
4330                     	xref.b	_error_bank
4331                     	xref	_cvt_torlance_save
4332                     	xref.b	_control_temp
4333                     	xref	_flash_count
4334                     	xref.b	_voltage_average
4335                     	xref.b	_AD_Value
4336                     	xdef	_shout_dowm
4337                     	xdef	_clear_sys_key
4338                     	xref	_PWM_ALL_OFF
4339                     	xdef	_eerprom_write
4340                     	xdef	_eeprom_read
4341                     	xdef	_OPTIONSET_INI
4342                     	xref.b	c_x
4361                     	xref	c_bmulx
4362                     	end
