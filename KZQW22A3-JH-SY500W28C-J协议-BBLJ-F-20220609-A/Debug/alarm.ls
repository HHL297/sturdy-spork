   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
2777                     	switch	.data
2778  0000               _com_data_pc:
2779  0000 80            	dc.b	128
2780                     	bsct
2781  0000               _alarm_over_flag:
2782  0000 00            	dc.b	0
2783                     	switch	.data
2784  0001               _onekey_CD_count:
2785  0001 03e8          	dc.w	1000
2814                     ; 904 void speed_chg_chk(void)
2814                     ; 905 {
2816                     	switch	.text
2817  0000               _speed_chg_chk:
2821                     ; 908 }
2824  0000 81            	ret	
2847                     ; 911 void speed_chg_alarm(void)				//100ms
2847                     ; 912 {
2848                     	switch	.text
2849  0001               _speed_chg_alarm:
2853                     ; 914 }
2856  0001 81            	ret	
4201                     	xdef	_onekey_CD_count
4202                     	xdef	_alarm_over_flag
4203                     	switch	.bss
4204  0000               _low_power_count:
4205  0000 00            	ds.b	1
4206                     	xdef	_low_power_count
4207  0001               _speed_num_back_count:
4208  0001 00            	ds.b	1
4209                     	xdef	_speed_num_back_count
4210  0002               _speed_num_back:
4211  0002 00            	ds.b	1
4212                     	xdef	_speed_num_back
4213  0003               _voice_dely:
4214  0003 0000          	ds.b	2
4215                     	xdef	_voice_dely
4216  0005               _err_code:
4217  0005 00            	ds.b	1
4218                     	xdef	_err_code
4219  0006               _power_low_reset_count:
4220  0006 0000          	ds.b	2
4221                     	xdef	_power_low_reset_count
4222  0008               _power_low_count:
4223  0008 0000          	ds.b	2
4224                     	xdef	_power_low_count
4225  000a               _chg_mode_alarm_count:
4226  000a 0000          	ds.b	2
4227                     	xdef	_chg_mode_alarm_count
4228  000c               _chg_mode_up_count:
4229  000c 00            	ds.b	1
4230                     	xdef	_chg_mode_up_count
4231  000d               _chg_mode_dn_count:
4232  000d 00            	ds.b	1
4233                     	xdef	_chg_mode_dn_count
4234  000e               _stop_all_count:
4235  000e 00            	ds.b	1
4236                     	xdef	_stop_all_count
4237  000f               _stop_high_count:
4238  000f 00            	ds.b	1
4239                     	xdef	_stop_high_count
4240  0010               _stop_low_count:
4241  0010 00            	ds.b	1
4242                     	xdef	_stop_low_count
4243  0011               _stop_big_count:
4244  0011 0000          	ds.b	2
4245                     	xdef	_stop_big_count
4246  0013               _speed_err_count:
4247  0013 00            	ds.b	1
4248                     	xdef	_speed_err_count
4249  0014               _two_err_count:
4250  0014 00            	ds.b	1
4251                     	xdef	_two_err_count
4252  0015               _sf_on_count:
4253  0015 00            	ds.b	1
4254                     	xdef	_sf_on_count
4255  0016               _sf_high_count:
4256  0016 00            	ds.b	1
4257                     	xdef	_sf_high_count
4258  0017               _sf_low_count:
4259  0017 00            	ds.b	1
4260                     	xdef	_sf_low_count
4261  0018               _sf_voltage_count:
4262  0018 00            	ds.b	1
4263                     	xdef	_sf_voltage_count
4264  0019               _voltage_ten_count:
4265  0019 0000          	ds.b	2
4266                     	xdef	_voltage_ten_count
4267  001b               _voltage_five_count:
4268  001b 0000          	ds.b	2
4269                     	xdef	_voltage_five_count
4270  001d               _voltage_off_count:
4271  001d 0000          	ds.b	2
4272                     	xdef	_voltage_off_count
4273  001f               _voltage_alarm_flag:
4274  001f 00            	ds.b	1
4275                     	xdef	_voltage_alarm_flag
4276  0020               _Send_n_count:
4277  0020 00            	ds.b	1
4278                     	xdef	_Send_n_count
4279  0021               _Send_p_count:
4280  0021 00            	ds.b	1
4281                     	xdef	_Send_p_count
4282  0022               _Send_Count:
4283  0022 00            	ds.b	1
4284                     	xdef	_Send_Count
4285  0023               _Send_dely:
4286  0023 0000          	ds.b	2
4287                     	xdef	_Send_dely
4288  0025               _Send_Data:
4289  0025 00            	ds.b	1
4290                     	xdef	_Send_Data
4291  0026               _com_stop:
4292  0026 00            	ds.b	1
4293                     	xdef	_com_stop
4294  0027               _com_n_count:
4295  0027 00            	ds.b	1
4296                     	xdef	_com_n_count
4297  0028               _com_p_count:
4298  0028 00            	ds.b	1
4299                     	xdef	_com_p_count
4300  0029               _com_end:
4301  0029 0000          	ds.b	2
4302                     	xdef	_com_end
4303                     	xdef	_com_data_pc
4304  002b               _com_data:
4305  002b 00            	ds.b	1
4306                     	xdef	_com_data
4307  002c               _com_nop:
4308  002c 0000          	ds.b	2
4309                     	xdef	_com_nop
4310                     	switch	.ubsct
4311  0000               _gb_alarm_err_back:
4312  0000 0000          	ds.b	2
4313                     	xdef	_gb_alarm_err_back
4314  0002               _gb_alarm_err:
4315  0002 0000          	ds.b	2
4316                     	xdef	_gb_alarm_err
4317  0004               _gb_alarm_flag_back:
4318  0004 0000          	ds.b	2
4319                     	xdef	_gb_alarm_flag_back
4320  0006               _gb_alarm_flag:
4321  0006 0000          	ds.b	2
4322                     	xdef	_gb_alarm_flag
4323  0008               _onekey:
4324  0008 00            	ds.b	1
4325                     	xdef	_onekey
4326  0009               _symbol:
4327  0009 00            	ds.b	1
4328                     	xdef	_symbol
4329  000a               _work_flag:
4330  000a 00            	ds.b	1
4331                     	xdef	_work_flag
4332  000b               _alarm:
4333  000b 00            	ds.b	1
4334                     	xdef	_alarm
4335  000c               _alarm2:
4336  000c 00            	ds.b	1
4337                     	xdef	_alarm2
4338  000d               _Alarm_Flag:
4339  000d 00            	ds.b	1
4340                     	xdef	_Alarm_Flag
4341                     	switch	.bss
4342  002e               _com_start:
4343  002e 0000          	ds.b	2
4344                     	xdef	_com_start
4345  0030               _com_flag:
4346  0030 00            	ds.b	1
4347                     	xdef	_com_flag
4348  0031               _onekey_current_flow_flag:
4349  0031 00            	ds.b	1
4350                     	xdef	_onekey_current_flow_flag
4351  0032               _current_flow_count:
4352  0032 00            	ds.b	1
4353                     	xdef	_current_flow_count
4354                     	xdef	_speed_chg_alarm
4355                     	xdef	_speed_chg_chk
4375                     	end
