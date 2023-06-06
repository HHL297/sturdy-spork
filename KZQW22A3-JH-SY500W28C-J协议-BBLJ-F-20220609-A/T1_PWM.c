#include "hand_tble.h" 



void conconditon_chg(void);
void debug(void);
void motor_brake(void);
void phase_abs_change(u8 hall_position_temp);
void STOP_drive(void);
void MotorStartSub(void);
void debug_save(void);
void debug_main(void);
void speed_limit_check(void);
void hall_out(void);
void sandang_speed(void);
void cvt_speed(void);
void spt_chk_42(void);
void current_over(void);
void current_dec(void);
void eco_sel(void);
void lv_display(void);
void speed_show(void);
void STOP_drive_sin(void);
void IO_IN(void);
void IO_IN_HALL(void);
void IO_OUT(void);
void PWM_IO_IN(void);
void PWM_OUT(void);
void check_hall_position(void);
void speed_limit_flag_check (void);
void current_cmd_protect_sample(void);
void nohall_control(void);
void msp_change_chk(void);
void cvt_ver_cal(void);
void lock_c_v(void);
void uart_rec_deal(void);
void voltage_load(void);
void controller_state_load(void);
void error_load(void);
void speed_load(void);
void tx_sum_load(void);
void uart_rx_dang_deal(void);
void uart_rx_dang_load(void);
void speed_check_bike(void);
void hall_speed_limit(void);
void uart_send_main(void);
void spt_chk_single(void);
unsigned char chk_sendbus(void);
void light_on_off_fun(void);
void lj_chk(void);
void LJ_zero_error_chk(void);

//void uart_send(void);
//void uart2_send_data(void);
//void uart2_send_char(unsigned char data_send);

ERROR_BANK error_bank;
SYS_STATE_FLAG sys_state_flag;
SYS_STATE_FLAG2 sys_state_flag2;
MOTOR_FLAG motor_flag;
PWM_MODE PWM_mode;


u16 hall_count;
u8 pwm_duty_low;
u8 pwm_duty_high;
u8 pwm_add_count;
u8 @near pwm_add_count1;
u8 pwm_cut_count;
u8 pwm_sub_count;
u8 @near pwm_sub_count1;

u8 ph_low_count_max;
un8 ph_low_count_max_back;
un8 ph_low_count_max_count;

u16 pwm_duty_on;

u16 pwm_duty_on_old;
u16 pwm_duty_brake;

u16 pwm_brake_max;
u8 pwm_up_count;

u8 @near cvt_start_count;
u8 @near cvt_exit_count;

u16 current_cmd_average;
u16 current_cmd_average_key;


un8 spt_condition1;
un8 spt_condition_old;
un8 spt_high_flag ;
un8 spt_low_flag ;
un8 spt_keep_out ;

un8 spt_condition1_bike;
un8 spt_condition_old_bike;
un8 spt_high_flag_bike ;
un8 spt_low_flag_bike ;
un8 spt_keep_out_bike ;
un16 spt_low_count_bike ;
un16 spt_high_count_bike ;

un16 spt_low_count ;
un16 spt_high_count ;
un16 spt_low_high_count ;
un16 spt_low_high_count_old ;
un16 spt_low_high_count_last;
un16 spt_low_high_count_last_old;
un16 spt_low_high_count_sum ;
un16 spt_low_high_delta ;
un16 spt_low_high_f ;
u16 pwm_duty_on1;
u16 pwm_duty_speed;
u16 pwm_duty_speed_old;
un8 spt_com_count ;
un8 spt_sel_up_count;
un8 ele_sel_up_count;

un8 spt_key_keep;
un8 spt_sel_dn_count;


un8 brake_out_count ;
un8 brake_delay_count ;
un8 abs_sel_up_count;
un8 abs_sel_dn_count;

u16 @near hall_speed_motor2_old;
u16 @near hall_speed_motor2_old1;

u16 speed_motor;
u16 speed_motor2 = 500;
u16 speed_motor3;

u16 hall_pwm_cont = 500;
u16 delay_counter;

u8 cvt_rotor_position ;
u8 cvt_rotor_position_back ;

u8 rotor_position ;
u8 rotor_position1 ;
u8 rotor_position2 ;
u8 hall_drive_back ;
u8 hall_position_temp;


u8 @near speed_hall_flag;
u8 @near voltage_load_time;

u8 @near hand_no_speed_limit;

u8 controlchg_flag;
unsigned char CVT_dep;
unsigned char CVT_dely;

u16 CVT_hall_count;

unsigned char alarm_switch ;
un8 alm_hall_count;
un8 hall_a_status ;

unsigned int @near alm_lock_count ;
unsigned char @near motor_alm_status_lock ;
unsigned char @near dto_status ;
unsigned int @near dto_count ;

unsigned char lock_hall ;

unsigned int @near hall_moved_count ;


unsigned char set_alarm_ready ;

un8 control_wait_count ;

unsigned char running_alarm ;

u8@near yyz_ob1;

unsigned int debug_code ;
unsigned char debug_mode_flag ;
unsigned char set_debug_mode;
unsigned char fr_count ;
unsigned int set_debug_count ;
unsigned int debug_count_max = 1000;
unsigned char limit_flag ;
unsigned char limit_mode ;
unsigned int limit_beep_delay;
unsigned char limit_beep_count;
unsigned int beep_dely;
unsigned char sys_step_52_number = 0;
unsigned char sys_step_36_number = 0;


u8 speed_num;

u8 Auto_SPT;


unsigned char time_count;

u8 motor_stop_count;
u8 motor_stop_count2;
u8 Restart_cont;



unsigned char sf_wait_flag ;
unsigned char mode_flag = 1;
unsigned int sf_down_count ;
unsigned int sf_up_count ;




u8 sensor_step;
unsigned char ModeFlag ;

u8 sensorless_rotor;
unsigned @near int  sensor_pwm_duty;
unsigned @near int  delay_test_count;
unsigned char sensor_step ;
unsigned char position_flag = 1;
unsigned int  period_count = defperiod_count;						//250ms
unsigned char back_sensor_step;
unsigned char back_sensor_step2;
unsigned char hall_ok_count;
unsigned char RoHallOk;
unsigned char rotor_position_sensor;
unsigned char back_rotor_position_sensor;
unsigned int rotor_count;
u8 @near cvt_on_flag;
u8 @near cvt_average;
u8 @near cvt_average_old;
//unsigned char nohall_start_delay ;


const unsigned char setp_chk_hall[7] = {3,1,5,4,6,2,0};
const unsigned char setp_dir_hall[7] = {2,3,1,5,4,6,0};
const unsigned char setp_chk_last_hall[7] = {0,3,6,2,5,1,4};
const unsigned char Sensorless_next[8] = {0,2,0,1,4,3,5,0};
const unsigned char HALL_60C_table[8] = {2,6,0,4,3,7,1,5};
const unsigned char hall_turetable[8]={0,5,3,1,6,4,2,0};
const unsigned char hall_turetable2[8]={0,3,6,2,5,1,4,0};
//const unsigned char Hall_REV_table[8] = {0,6,5,4,3,2,1,7};
//const unsigned char Hall_REV_table[8] = {0,4,1,5,2,6,3,7};
const unsigned char Hall_REV_table[8] = {0,5,3,1,6,4,2,7};

u8@near irpt_flag;



unsigned int current_cmd_spt = 0;
u8 spt_condition0;
u8 eco_flag;
//u8 current_e;
//u8 current_i;
//u8 i_big_count;
//u8 i_small_count;

u8@near current_flag;
u8@near hall_down_count;
u8@near eco_on_count;
u8@near eco_off_count;
u8@near pw_delay;
u8@near lv_flash_flag;
u8@near lv_flash_count;
u8@near hall_ver_zero_flag;
u16@near cvt_count;
u16@near cvt_count_flag_count;
u16@near speed_chg_delay = 100;
//u16@near limit_speed_count;

u8@near chall_ver_zero_flag;

u8 @near key_read_count;
u8 @near key_undo_flag;
u8 @near key_do_count;
u8 @near dang_mode;
u8 @near square_sine_change_flag;


u8 @near cvt_on_count;
u8 @near cvt_off_count;
u8 @near cvt_flag;
u8 @near brk_error_flag;



u16@near auto_debug_count = 0;
unsigned long@near current_average_sum;
unsigned long@near ph_current_average_sum;
u16@near debug_light_count;


u8@near nhchk_pwm_match[3][6] = {
0,1,2,2,1,0,
1,0,0,1,2,2,
2,2,1,0,0,1
};
//u8@near nhchk_pwm_table_h[3];
//u8@near nhchk_pwm_table_l[3];
//unsigned long @near current_save_temp;
/////////////////////////////////////////////////yyz
u8 @near speed_limit_flag;
u8 @near speed_limit_flag2;
u8 @near one_min_flag;
u8 @near start_count1;
u8 @near cmd_add_count;
u8 @near cmd_sub_count;
u8@near power_low42_count;

u16@near speed_motor_3;
u16@near hall_pwm_cont_3;

u8 @near speed_limit_up_count;
			
u8 @near speed_limit_down_count;
u8 @near cvt_check_up_count;
u8 @near cvt_check_down_count;
u8 @near cvt_198_flag,speed_chg_count,speed_chg_dn,speed_chg_up;

u8 @near speed_set_start_flag,speed_set_chk_flag,speed_set_chk_flag;
u8 @near speed_set_start_count;

u16 @near sum_speed_motor_6;
u8 @near add_spdmt_count;
u16 @near cvt_speed_motor_6;
u16 @near cvt_speed_motor_6_temp;
u8 @near cvt_reg_status;
u8 @near cvt_reg_flag;
u8 @near cvt_act_flag;
u8 @near cvt_act_off_count;
u8 @near cvt_act_on_count;
u8 @near cvt_start_count;
u8 @near cvt_exit_count;
u8 @near cvt_on_count;
u8 @near cvt_off_count;
u8 @near cvt_flag;
u8 @near cvt_debug_flag;
u8 @near cvt_torlance_adj;
u8 @near cvt_torlance_save;
u16 @near hall_change_count;

//u16@near yyz_log[10];

u8@near	cross0_port_flag;
u8@near	cross0_pos_hall;
u8@near	cross0_pos_hall_ver;

u8@near	cross0_neg_hall;
u8@near	cross0_neg_hall_ver;

u8@near data_tx[8] = {0x46,0,0,0,0,0,0,0};//{0x43,0x0a,0,0,0,0,0,0,0x4d};
u8@near data_rx_temp[6];//10
u8@near data_rx[6];//10
u8@near data_rx_number = 0;
u8@near data_rx_dang ;
u8@near dang_limit_current ;
u16@near dang_limit_pwm ;
//u8@near dang_limit_ratio ;
u16@near speed_bike ;
u16@near speed_bike_temp ;
//unsigned char xj=0,jiaoyan_rec=0;
//u8@near limit_current_hand ; //limit speed
u16@near limit_current_speed ;
u8@near limit_speed_number;
//u8@near limit_speed_hall;
u16@near limit_speed_hall_1;
//u8@near limit_speed_hall_2;

u16@near limit_speed_hall_old;
u16@near limit_speed_hall_temp;
u16@near limit_speed_hall_delta;
u16@near limit_speed_hall_delta_old;
u8@near hall_speed_limit_count;
u16@near time_100ms;
u16@near voltage_load_count;
u16@near voltage_average_old;
u16@near voltage_average_old_min;

u8@near send_data_time;

u8@near send_data_flag;

u8@near hand_enable_flag;

u16@near start_2s_count;
u16@near start_1s_count;
u16@near bike_rpm;
u16@near bb_candence;
/*const unsigned int pwm_duty_sin[28] = {
0 ,
0	,
0	,
1	,
1	,
2	,
2	,
3	,
3	,
4	,
4	,
5	,
5	,
5,
6	,
6	,
7	,
7	,
8	,
8	,
9	,
9	,
10	,
10	,
10	,
11	,
11	,
12	,
12	,
13	,
13	,
14	,
14	,
15	,
15	,
16	,
16	,
16	,
17	,
17	,
18	,
18	,
19	,
19	,
20	,
20	,
21	,
21	,
21	,
22	,
22	,
23	,
23	,
24	,
24	,
25	,
25	,
26	,
26	,
26	,
27	,
27	,
28	,
28	,
29	,
29	,
30	,
30	,
31	,
31	,
32	,
32	,
32	,
33	,
33	,
34	,
34	,
35	,
35	,
36	,
36	,
37	,
37	,
37	,
38	,
38	,
39	,
39	,
40	,
40	,
41	,
41	,
42	,
42	,
42	,
43	,
43	,
44	,
44	,
45	,
45	,
46	,
46	,
47	,
47	,
48	,
48	,
48	,
49	,
49	,
50	,
50	,
51	,
51	,
52	,
52	,
53	,
53	,
53	,
54	,
54	,
55	,
55	,
56	,
56	,
57	,
57	,
58	,
58	,
58	,
59	,
59	,
60	,
60	,
61	,
61	,
62	,
62	,
63	,
63	,
64	,
64	,
64	,
65	,
65	,
66	,
66	,
67	,
67	,
68	,
68	,
69	,
69	,
69	,
70	,
70	,
71	,
71	,
72	,
72	,
73	,
73	,
74	,
74	,
74	,
75	,
75	,
76	,
76	,
77	,
77	,
78	,
78	,
79	,
79	,
80	,
80	,
80	,
81	,
81	,
82	,
82	,
83	,
83	,
84	,
84	,
85	,
85	,
85	,
86	,
86	,
87	,
87	,
88	,
88	,
89	,
89	,
90	,
90	,
90	,
91	,
91	,
92	,
92	,
93	,
93	,
94	,
94	,
95	,
95	,
96	,
96	,
96	,
97	,
97	,
98	,
98	,
99	,
99	,
100	,
100	,
101	,
101	,
101	,
102	,
102	,
103	,
103	,
104	,
104	,
105	,
105	,
106	,
106	,
106	,
107	,
107	,
108	,
108	,
109	,
109	,
110	,
110	,
111	,
111	,
112	,
112	,
112	,
113	,
113	,
114	,
114	,
115	,
115	,
116	,
116	,
117	,
117	,
117	,
118	,
118	,
119	,
119	,
120	,
120	,
121	,
121	,
122	,
122	,
122	,
123	,
123	,
124	,
124	,
125	,
125	,
126	,
126	,
127	,
127	,
128
};	*/
u8 @near pwm_duty_low1;
u8 @near pwm_duty_high1;
u16@near pwm_duty_on_ini_count;
u8@near speed_check_on_flag;
u8@near speed_check_count1;
u8@near speed_check_count2;
u8@near cvt_speed_motor;
u8@near ph_max_ver_count;



u8 @near cdpi_on_flag;
u16 @near pwm_duty_on_last;
u8 @near cdpi_start_count;

u8 @near mode_360_count,pw_lv_count,voltage_pulv = 500;
u16 @near sys_start_count1,speed_set_high_count,speed_set_low_count,speed_set_low_count,speed_set_high_count,speed_set_count,speed_set_last_count,speed_set_count,speed_set_last_count,speed_set_last_count;

u8@near check_shake_count1;
u8@near check_shake_count;
u8@near cvt_up_count;
u8@near cvt_dn_count,ccount;
unsigned@near  char alarm_flag = 0;

u16 @near sum_speed_motor_6;
u8 @near add_spdmt_count;
u16 @near cvt_speed_motor_6;
u16 @near cvt_speed_motor_6_temp;
u8 @near cvt_reg_status;
u8 @near cvt_reg_flag;
u8 @near cvt_act_flag;
u8 @near cvt_act_off_count;
u8 @near cvt_act_on_count;
u8 @near cvt_start_count;
u8 @near cvt_exit_count;
u8 @near cvt_on_count;
u8 @near cvt_off_count;
u8 @near cvt_flag;


u16 @near t6_count_tab[10];
u16 @near t6_count_tab_2[10];
u16 @near t6_count_tab_3[10];

u16 @near t6_ver_tab[10];
u16 @near t6_ver_tab_2[10];
u16 @near t6_ver_tab_3[10];

u8 @near t6_ov_tab[10];
u8 @near t6_ov_tab_2[10];
u8 @near t6_ov_tab_3[10];

u16 @near t6_cs_tab[10];
u16 @near t6_cs_tab_2[10];
u16 @near t6_cs_tab_3[10];

u8@near speed_motor_time;
u16@near speed_motor_time_16;
u16@near nohall_pwm;

u16@near speed_motor_nohall;

unsigned char@near nohall_ready_flag = 0;
unsigned char@near	nohall_ready_count = 0;
unsigned int@near nohall_start_count = 0;
signed char@near nohall_step = 0;
u16@near	nohall_start_delay = 0;
unsigned char@near	nohall_block_count;
unsigned char	nohall_normal_count;

u16@near yyz_ob;


u8@near hall0;
u8@near hall1;
u16@near nspeed_motor = 400;
u16@near nhall_pwm_cont = 400;

u16@near nohall_ol_count[6] = {2000,1600,1300,1000,700,400};
u8@near nohall_ol_step;
u16@near startup_count;
u8@near nohall_start_delay_count;
u16@near nohall_phase_change_delay;

u16@near current_adj_sum;
u16@near voltage_adj_sum;
u8@near lock_port_low_count;

u8 @near wheel;
u8 @near max_speed_limit;
u16 @near jiaoyan_rec;

/*u16@near nohall_start_delay_t[50] = {
117	,
109	,
101	,
93	,
85	,
78	,
70	,
62	,
54	,
46	,
42	,
37	,
32	,
28	,
23	,
18	,
14	,
9	,
4	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
0	,
};

*/

u8 @near lj_speed_start_time;
u16 @near lj_speed_start_data;
u16 @near lj_ad_app_old;

u16@near lj_chk_delta;
u16@near lj_chk_tmie_count;

u8 @near torque_level;
u8 @near run_mode;

u16@near lj_ad_app_last;
u16@near lj_ad_app_change;
u16@near lj_change_time_count;

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
@far @interrupt @svlreg void TIM1_PWM_IRQ (void)
{
	if(IRQ_BIF & TIM1_SR1)							//�ж��Ƿ��Ƕ�·����
	{
		TIM1_SR1 &= (~IRQ_BIF);		
		error_bank.bit.current_flow_flag = 1;	//һ��ͨ��·����
	
		WDT_FLASH();    								//ˢ��WDT
	}
	
	if(IRQ_UIF & TIM1_SR1)							//�ж�ˢ�±��λ
	{
		TIM1_SR1 &= (~IRQ_UIF);
		{
			ADC_CSR &= 0x7f;
			ADC_CR1 |= 0x01;			//��ʼת��
			hall_read();
		
			if((sys_step & 0x01) == 0x00)
			{
				if((sys_step & 0x01f) == 2)		//32*62.5 = 2 + 32    2,34,
				{
					cvt_speed();
				}
				else if(sys_step == 6)	//16  = 6 + 16   ,6,22,38,54
				{
					LJ_zero_error_chk();//spt_chk();//uart_send_data();//if(control_temp < 245)
				}
				else if(sys_step == 22)
				{
					brake_chk();
				}
				else if(sys_step == 38)
				{
					//current_cmd_protect_sample();
					speed_check_bike(); //speed_limit_check();
						 //limit_speed();
						 
					if((sys_state_flag.bit.spt_flag > 0) && (spt_low_high_count_old < 500))//candence
					{
						if(spt_low_high_count_old < 3)//1
						{
							bb_candence_old = 255;
						}
						else
						{
							bb_candence_old = 833 / spt_low_high_count_old;//1667			
						}
					}
					else 
						bb_candence_old = 0;	

						if(bb_candence_old > bb_candence)bb_candence ++;
						else if(bb_candence_old < bb_candence)bb_candence --;
						 
				}		
				else if(sys_step == 54)// (|| ((sys_step & 0x1f) == 16))
				{
					//if(time_100ms == 0)
					//{
						//while((UART2_SR & 0x80) == 0x00);
						//UART2_DR = data_tx[time_100ms];
						if(send_data_time < 100)send_data_time ++;
						if(voltage_load_time < 100)voltage_load_time ++;
						/*if((UART2_SR & 0x80) > 0)
						{
							UART2_DR = data_tx[time_100ms];
							if(time_100ms < 8) time_100ms += 1;
							else time_100ms = 0;
						}*/
					//hall_speed_limit();
					//speed_check_bike();
					/*if(MODE_PORT == 0)            ///Ǧ��
					{
						voltage_count = 30;
						voltage1 = user_Prdata.byte.voltage_adj;
						voltage2 = voltage1;
					}
					else                      ////﮵�
					{
						voltage_count = 10;
						//voltage1 = (user_Prdata.byte.voltage_adj*68)/63;
						voltage1 = voltage_average_L;
						voltage2 = voltage_average_L1;
					}*/
					/*
					if(((speed_motor > 10) || ((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0))) && (start_2s_count < 150))start_2s_count ++;
					else //if(speed_motor < 11)
					{
						if(start_2s_count > 10)start_2s_count --;
						else start_2s_count = 10;
				  }	
*/
					if((((sys_state_flag.bit.spt_flag > 0) && (sys_state_flag.bit.lj_flag > 0)) || ((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0))) && (start_2s_count < 150) && (data_rx_dang > 0) && (error_bank.all_flag == 0) && (sys_state_flag.bit.brk_flag == 0))
					{
						if(start_1s_count < 1)start_1s_count ++;
						else
						{
							start_2s_count ++; 
							start_1s_count = 0;
						}
					}
					else
					{
						if(start_2s_count > 10)start_2s_count --;
						else start_2s_count = 10;
						start_1s_count = 0;
					}				
					
					//if((speed_motor > 15) && (start_1s_count < 255))start_1s_count ++;
					//else if(speed_motor < 16)start_1s_count = 0;
					
					if(lj_change_time_count < 15)//15* 4 = 60ms
					{
						lj_change_time_count ++;						
					}
					else
					{
						lj_change_time_count = 0;
						if(lj_ad_app > lj_ad_app_last)lj_ad_app_change = lj_ad_app - lj_ad_app_last;
						else lj_ad_app_change = 0;
						lj_ad_app_last = lj_ad_app; 						
					}
				}			
				else if(sys_step == 4)			//32*62.5
				{
					hall_speed_chk();//hall_speed_limit();//square_sine_change(); //no hall check
				}
				else if(sys_step == 8)
				{
					//speed_check_bike();
					light_on_off_fun();
	#ifdef ALM_FUN				
					conconditon_chg();
	#else
	
	#endif		
				}
				else if(sys_step == 10)			//2ms
				{
					spt_chk();
	#ifdef	ABS_FUN			
						abs_sel();
	#else
	
	#endif
					//cvt_act_cacu_1();		//CVT_AI
				}
				else if(sys_step == 24)
				{	
					lj_chk();//spt_chk();//spt_chk_single();
	#ifdef ONE_KEY_FUN		
					if((com_flag == 0) && (alarm_flag == 0))
						one_key_chk();
	#else
	
	#endif
				}
				else if((sys_step & 0x1f) == 16)		//16,48
				{					
	#ifdef ONE_KEY_FUN					
						com_deal();
	#else
						
	#endif	
					
				}
				else if(sys_step == 30)
				{
					cvt_act_deal();
				}
				else if(sys_step == 32)
				{
					spt_chk();//nohall_control();//push_6km_run();//
				}	
				else if(sys_step == 36)
				{
					if(sys_step_36_number == 1)
					{
						uart_rx_dang_deal();
					}
					else if(sys_step_36_number == 2)
					{
						uart_rec_deal();
					}
					else if(sys_step_36_number == 3)
					{
						uart_rx_dang_load();
					}
					if(sys_step_36_number < 3)sys_step_36_number ++ ;
					else sys_step_36_number = 0;
					/**/
	/*#ifdef ONE_KEY_FUN
						voltage_low_alarm();
	#else
					
	#endif*/
				}
				else if(sys_step == 44)
				{
					cvt_act_cacu_2();
				}		
				else if(sys_step == 46)
				{
					lock_c_v();
				}
				else if(sys_step == 50)
				{
					cdpi_on_check();
				}
				else if(sys_step == 52)
				{
					if(sys_step_52_number == 0)
					{
						voltage_load();
					}
					else if(sys_step_52_number == 1)
					{
						//controller_state_load();
					}
					else if(sys_step_52_number == 2)
					{
						error_load();
					}
					else if(sys_step_52_number == 3)
					{
						speed_load();
					}
					else if(sys_step_52_number == 4)
					{
						tx_sum_load();
					}
					
					if(sys_step_52_number < 4)sys_step_52_number ++ ;
					else sys_step_52_number = 0;
				}
				else if(sys_step == 0)			//4ms
				{
					if(time_count == 0)					//
					{									//100MS dely
						motor_stop();		
					}
					else if(time_count == 1)
					{									//50ms
						/*if(error_bank.bit.voltage_low_flag == 1)
						{	
							ccount ++ ;
							if(ccount < 10)
							V_ON();
							else if(ccount < 20)
							V_OFF();
							else
							ccount = 0;
						}
						else
						{
						 V_OFF();
						 ccount = 0;
						}*/
					/*	if((data_rx[1] & 0x80) > 0)//lamp 
							LAMP_ON();
						else 
							LAMP_OFF();*/
					}
					
	
					if(time_count == 3)
					{
						speed_limit_data_load();//change limit_speed
					}
					else if(time_count == 4)
					{
						current_load();
					}
					else if(time_count == 5)
					{
						
					}
					else if(time_count == 6)
					{
						
					}
					else if(time_count == 7)
					{
						hall_speed_limit();
					}			
	
	
	#ifdef ONE_KEY_FUN	
					if(time_count == 8)
					{
	
					}
					else if(time_count == 9)
					{
	
					}
	#else
		#ifdef	GB_ALARM_VOICE
					if(time_count == 8)
					{
	
					}
					else if(time_count == 9)
					{
	
					}
					else if(time_count == 10)
					{
	
					}
		#endif
					
	#endif				
					time_count ++;
					if(time_count >= 25)
						time_count  = 0;			
				}
				else
				{
					ad_data();
				}
			}
			else
			{
				current_num();
			}
	
			adc_sampel_ph();

			adc_channel();
	
			svpwm_ver();	

			if(alarm_switch == 0)
			{
				if(error_bank.all_flag > 0)
				//if((error_bank.all_flag != 0)||((lv_flash_flag & 0x01) == 0x01))	//y42
				{
					/*if((speed_motor2 > 250) || (speed_motor2 < 4))
					{
						position_flag = 1;				//��λ��־��λ
						ModeFlag = 0;					//ģʽ��־
					}
					else
					{
						ModeFlag = 1;
					}*/			
					motor_flag.all_flag = 0x00; 
					if(square_sine_change_flag == 1)
					{
						if(PWM_mode.all_flag > 0)
							STOP_drive();
					}
					else
						PWM_ALL_OFF();
				}
				else
				{
					if(sys_state_flag.bit.brk_flag == 0)		//y42
					{
						if(current_cmd_average > 0)
						{
							if(running_alarm == 0)
							{
								if((ModeFlag == 0) && (sys_state_flag.bit.hall_exit > 0) && (square_sine_change_flag == 1))
									SynchConSub();
								else
								{
									if(motor_flag.all_flag != DRIVE_BIT)
									{
										pwm_duty_on_old = (pwm_duty_on_ini >> 1);
										mode_360_count = 0;
										tim2_6_flag = 0;
										cvt_ver = 0;
									}
									
									motor_drive();	
								}								
								motor_flag.all_flag = DRIVE_BIT;
							}
							else 
							{
								if(square_sine_change_flag == 1)
								{
									if(PWM_mode.all_flag > 0)
										STOP_drive();
								}
								else
									PWM_ALL_OFF();	
							}								
						}
						else
						{
							/*if((speed_motor2 > 250) || (speed_motor2 < 4))//cl2012.11.27
							{
								ModeFlag = 0;					//ģʽ��־
							}
							else
							{
								ModeFlag = 1;
							}*/
							//motor_flag.all_flag = 0x00; //y42
							if(square_sine_change_flag == 1)
							{
								if(PWM_mode.all_flag > 0)
									STOP_drive();
							}
							else if((current_average1 > c_offset)||(speed_motor2 > 350))
									STOP_drive_sin();
							else
							{
								mode_360_count = 0;
								tim2_6_flag = 0;
								cvt_ver = 0;							
								PWM_ALL_OFF();
							}
						}
					}
					else
					{
						/*if((speed_motor2 > 250) || (speed_motor2< 4))//cl2012.11.27
						{
							ModeFlag = 0;					//ģʽ��־
						}
						else
						{
							ModeFlag = 1;
						}*/
						
						if((sys_state_flag.bit.brake_charge_flag > 0)&& (square_sine_change_flag == 1))
						{
							motor_brake();				//abs
						//	STOP_drive();
							motor_flag.all_flag = ABS_BIT;
						}
						else
						{
							motor_flag.all_flag = 0x00; 
							
							if(square_sine_change_flag == 1)
							{
								if(PWM_mode.all_flag > 0)
									STOP_drive();
							}
							else if(current_average1 > c_offset)	//
									STOP_drive_sin();
							else
							{
									mode_360_count = 0;
									tim2_6_flag = 0;
									cvt_ver = 0;							
									PWM_ALL_OFF();
							}
						}
					}
				}
			}
			else
			{	
				if(square_sine_change_flag == 1)
				{
					if(error_bank.bit.current_flow_flag == 0)
					{
						if(motor_alm_status_lock == 1)
								motor_lock_drive();
	#ifdef ALM_FUN
						else if(dto_status == 1)
								dto_lock_drive();
	#endif
						else
						{
								mode_360_count = 0;
								tim2_6_flag = 0;
								cvt_ver = 0;							
								PWM_ALL_OFF();
						}
					}
					else
					{
						alarm_switch = 0;
						mode_360_count = 0;
						tim2_6_flag = 0;
						cvt_ver = 0;							
						PWM_ALL_OFF();
					}
				}
				else
				{
						mode_360_count = 0;
						tim2_6_flag = 0;
						cvt_ver = 0;							
						PWM_ALL_OFF();
				}
				motor_flag.all_flag = 0x00;
			}
			
			adc_sample();					//12,16,20,24
			
			if(sys_step >= 63)						//4ms
			{
				sys_step = 0xff;
				WDT_FLASH();    //ˢ��WDT
			}
			

			sys_step ++;
		}	
		
		if(send_data_flag == 1)/*((send_data_time > 10) || (send_data_flag > 0))*/
		{
			tx_sum_load();
			uart_send_main();
		}
		//if(data_rx_number >= 9) uart_send_main();
		
		if((UART2_SR & 0x20) > 0)//xz
	  {
			data_rx_temp[data_rx_number] = UART2_DR;//
			/**/if(data_rx_number == 0)
			{
				if((data_rx_temp[0] != 0x46) && (data_rx_temp[0] != 0x53))//0x3a
				{
					data_rx_number = 0;
					return;
				}
			}
			if((data_rx_temp[0] == 0x46) || (data_rx_temp[0] == 0x53))//0x3a
				data_rx_number++;//
			
			//else data_rx_number = 0;
			//if(data_rx_number >= 6)data_rx_number = 0;
		//	else data_rx_number++;
	  }
		
	 
	}
	
	 
 	return;
}
////////////////////////////////////////////////////////////////////////////////
//


void light_on_off_fun(void)
{
	if((data_rx[1] & 0x80) > 0)//lamp if((data_rx[1] & 0x01) > 0)
	{						
		LAMP_ON();
		if(sys_state_flag.bit.brk_flag > 0)BRAKE_LIGHT_ON();
		else 
		{
			if((PD_ODR & 0x01) > 0)BRAKE_LIGHT_OFF();
			else BRAKE_LIGHT_ON();
		}
	}
	else 
	{
		LAMP_OFF();
		if(sys_state_flag.bit.brk_flag > 0)
		{
			if((PD_ODR & 0x01) > 0)BRAKE_LIGHT_OFF();
			else BRAKE_LIGHT_ON();
		}
		else BRAKE_LIGHT_OFF();
	}
	
	if((data_rx[1] & 0x20) > 0)RIGHT_LIGHT_ON();
	else RIGHT_LIGHT_OFF();
	
	if((data_rx[1] & 0x40) > 0)LEFT_LIGHT_ON();
	else LEFT_LIGHT_OFF();
}


//
void speed_limit_data_load(void)
{	
	if(wheel == 0)wheel = 20;//wheel = 26;//
	if((max_speed_limit == 0) || ((control_temp > 245) && (sys_state_flag.bit.protect_flag == 0)))
	{
		limit_speed_hall_1 = 60 * wheel / 32;
	}
	else
		limit_speed_hall_1 = 60 * wheel / max_speed_limit;

}


unsigned char chk_sendbus(void)
{
	if(UART2_SR & 0x80)
	{
		return 1;
	}
	else
		return 0;
}

void uart_send_main(void)
{
	if(chk_sendbus() > 0)
	{
		UART2_DR = data_tx[time_100ms];
		if(time_100ms < 7) time_100ms += 1;//12
		else 
		{
			time_100ms = 0;
			send_data_time = 0;
			send_data_flag = 0;
		}
	}
}


void LJ_zero_error_chk(void)
{
	if(sys_state_flag.bit.lj_zero_chk_flag == 0)
	{
		if(current_ph_lj_time < 437)current_ph_lj_time ++;
		if(current_ph_lj_time < 420)control_lj_zero_table[1] = 0;
		if((current_ph_lj_time > 420) && (current_ph_lj_time <= 436))
		{
			control_lj_zero_table[1] += control_lj_temp_table[1];
			lj_ad_app_old = control_lj_temp_table[1];
			lj_speed_start_time = 0;
		}
		else 
		{
			control_lj_zero_table[0] = (control_lj_zero_table[1] >> 4);//+ 10;
			control_lj_zero_table[1] = control_lj_zero_table[0];//error check
			if((error_bank.bit.LJ_flag == 0) && (control_lj_zero_table[0] > 0))
				sys_state_flag.bit.lj_zero_chk_flag = 1;
			lj_zero_auto_corrent_count = 0;
			lj_ad_app_last = control_lj_zero_table[0];
		}
		
		#ifdef LJ_ERROR_CHK
		//control_lj_temp_old 
		if((current_ph_lj_time > 420) && (current_ph_lj_time < 436) && ((control_lj_temp_table[1] < 40) || (control_lj_temp_table[1] > 436)))//< 0.2v || > 3.5v
		{
			#ifdef LJ_SPEED_SELECT
				run_mode = 1;
			#endif
			error_bank.bit.LJ_flag = 1;
		}
		#endif
	}

	

	/*if((current_ph_lj_time > 450)&&((control_lj_zero_table[0] > 410) || (control_lj_zero_table[0] < 150) || (control_lj_temp_table[1] < 150)))
	{
		error_bank.bit.LJ_flag = 1;
	}
	else error_bank.bit.LJ_flag = 0;*/
}
u8 @near torque_change_number;
u8@near bb_candence_old;
u8@near zero_start_number;
u8@near zero_add_torque;

void lj_chk(void)//153
{	
	if(/*(sys_state_flag.bit.spt_flag > 0) &&*/ (error_bank.bit.LJ_flag == 0) && (run_mode == 0) && (current_ph_lj_time > 436) && 
	((control_lj_temp_table[1] > (control_lj_zero_table[0] + 153))  || ((sys_state_flag.bit.spt_flag > 0) && ((control_lj_temp_table[1] > (control_lj_zero_table[0] + 30)) || (sys_state_flag.bit.lj_flag > 0) || (lj_ad_app_change > 10)))))
	//if((error_bank.bit.LJ_flag == 0) && (run_mode == 0) && (current_ph_lj_time > 436) && ((control_lj_temp_table[1] > (control_lj_zero_table[0] + 30)) /*zero_add_torque*/|| ((sys_state_flag.bit.spt_flag > 0) && ((sys_state_flag.bit.lj_flag > 0) || (lj_ad_app_change > 5)))))//
	{
			if(control_lj_temp_table[1] > control_lj_zero_table[0])
			{
				control_lj_temp_table[0] = control_lj_temp_table[1] - control_lj_zero_table[0];
				current_ph_lj_old = (control_lj_temp_table[0] >> 1)  + (control_lj_temp_table[0] >> 3) + (data_rx_dang >> 1);//(control_lj_temp_table[0] >> 2) + (control_lj_temp_table[0] >> 3);
			}
			else
			{			
				//if(data_rx_dang > 4)current_ph_lj_old = 1;
				//else current_ph_lj_old = 1;
				current_ph_lj_old = 1;
			}
			
			current_ph_lj = current_ph_lj_old;
			//bb_candence = 30;
			//bike_rpm = 210;
			/*if(data_rx_dang > 4)	
			{
				if(sys_state_flag.bit.spt_flag == 0)
					current_ph_lj_old = (current_ph_lj_old * 2) / bike_rpm;
				else if(bb_candence > 10)//10
					current_ph_lj_old = (current_ph_lj_old * bb_candence) / bike_rpm;
				else 
					current_ph_lj_old = (current_ph_lj_old * 10) / bike_rpm;//
			}
			else*/
			{
					//if(sys_state_flag.bit.spt_flag == 0)
						//current_ph_lj_old = (current_ph_lj_old * 2) / bike_rpm;
					//else 
					if(bb_candence > 10)//10
						current_ph_lj = (current_ph_lj * bb_candence) / bike_rpm;
					else 
						current_ph_lj = (current_ph_lj * 10) / bike_rpm;//
			}
			
			//if(current_ph_lj_old < 1)current_ph_lj_old = 1;
			/*
			if(current_ph_lj < current_ph_lj_old)
			{
				current_ph_lj_delta = current_ph_lj_old - current_ph_lj;
				
				current_ph_lj = current_ph_lj + current_ph_lj_delta;
			}
			else if(current_ph_lj > current_ph_lj_old)
			{
				current_ph_lj_delta = current_ph_lj - current_ph_lj_old;
			//	if(current_ph_lj_delta > 3)current_ph_lj_delta >>= 2;
				//else current_ph_lj_delta = 1;
				
				if(current_ph_lj > current_ph_lj_delta)current_ph_lj = current_ph_lj - current_ph_lj_delta;
			}
			*/
		  current_ph_lj = ((current_ph_lj * torque_level) >> 6);	//
			
			if(current_ph_lj > user_Prdata.byte.current_adj)current_ph_lj = user_Prdata.byte.current_adj;
			else if(current_ph_lj < 5)current_ph_lj = 5;
			
			//current_ph_lj = 15;
		  sys_state_flag.bit.lj_flag = 1;
		
		/*
		#ifdef ZERO_START
			if(zero_start_number < 250)//
				zero_start_number ++;
		#endif
		*/
			
	}
	else 
	{
		/*if(current_ph_lj > 0)
		{
			if(LJ_stop_number > 15)
			{
				LJ_stop_number = 0;
			  current_ph_lj --;
			}
			else LJ_stop_number ++;
		}*/
		current_ph_lj = 0;
		current_ph_lj_old = 0;
		current_ph_lj_delta = 0;
		sys_state_flag.bit.lj_flag = 0;
		control_lj_temp_table[0] = 0;
		zero_start_number = 0;
		//LJ_dec_number = 0;
		//LJ_inc_number = 0;
	}

}

void hall_speed_chk(void)
{
	//limit_speed_hall_old = hall_speed_motor2_old << 3;
	//limit_speed_hall_temp = (speed_motor2 << 3);	
	limit_speed_hall_old = (speed_motor2 << 3) / 3 + (hall_speed_motor2_old << 3) / 3 + (hall_speed_motor2_old1 << 3) / 3;
	hall_speed_motor2_old =  speed_motor2 ;
	hall_speed_motor2_old1 = hall_speed_motor2_old;
  if(limit_speed_hall_temp > limit_speed_hall_old)
	{
		limit_speed_hall_delta = limit_speed_hall_temp - limit_speed_hall_old;
		if(limit_speed_hall_delta > 7)//
		{
			limit_speed_hall_delta >>= 3;
			limit_speed_hall_temp -= limit_speed_hall_delta;
		}
		else limit_speed_hall_temp --;
	}
	else if(limit_speed_hall_temp < limit_speed_hall_old)
	{
		limit_speed_hall_delta = limit_speed_hall_old - limit_speed_hall_temp;
		if(limit_speed_hall_delta > 7)//
		{
			limit_speed_hall_delta >>= 3;
			limit_speed_hall_temp += limit_speed_hall_delta;
		}
		else limit_speed_hall_temp ++;
	}
}


void hall_speed_limit(void)
{	
		if(limit_speed_hall_temp < limit_speed_hall_1)//
	{
		if(limit_current_speed > pwm_duty_on_old)limit_current_speed = pwm_duty_on_old;
		if((limit_current_speed > ((limit_speed_hall_1 - limit_speed_hall_temp) >> 3)) && ((limit_speed_hall_1 - limit_speed_hall_temp ) >= 8))limit_current_speed = limit_current_speed - ((limit_speed_hall_1 - limit_speed_hall_temp ) >> 3);
		else if(limit_current_speed > 0)limit_current_speed --;
		
	}
	else if(limit_speed_hall_temp > limit_speed_hall_1)//
	{
		if((limit_speed_hall_temp - limit_speed_hall_1) >= 2)limit_current_speed = limit_current_speed + ((limit_speed_hall_temp - limit_speed_hall_1) >> 1);
		else limit_current_speed ++;		
	}
	if(limit_current_speed < 60)limit_current_speed = 60;//60
	else if(limit_current_speed > 280)limit_current_speed = 280;//60

}

void current_load(void)//
{
	if(current_average1 > 0) data_tx[2] = current_average1;//(current_average1 >> 1);
	else data_tx[2] = 0;
}

void controller_state_load(void)//
{
	if(speed_motor2 < 500 )data_tx[2] |= 0x04;
	else data_tx[2] &= 0xfb;
}

void error_load(void)
{
	// error_bank 	
	if(error_bank.bit.current_flow_flag > 0) data_tx[6] = 0x21; ////��·����
	else if((sys_state_flag.bit.protect_flag > 0) && (control_temp < 900)) data_tx[6] = 0x22;//hand error
	else if(error_bank.bit.ph_lost_flag > 0) data_tx[6] = 0x23;   //���ȱ��		
	else if(error_bank.bit.hall_wron_flag > 0) data_tx[6] = 0x24; //hall error
	else if(brk_error_flag > 0)data_tx[6] = 0x25; //hall
	else if(error_bank.bit.temperature_flag > 0) data_tx[6] = 0x26;  //�¶ȱ���
	else if(error_bank.bit.motor_stop_flag > 0) data_tx[6] = 0x27;  ////��ת����		
	//else if(error_bank.bit.voltage_low_flag > 0) data_tx[6] = 0x28;  //Ƿѹ����
	else if(error_bank.bit.voltage_over_flag > 0) data_tx[6] = 0x29;  //��ѹ����

	else data_tx[6] = 0;
	
	/*else if(error_bank.bit.voltage_low_flag > 0) //data_tx[5] = 8;  //Ƿѹ����
	{
		data_tx[2] |= 0x01;  //Ƿѹ����
		data_tx[8] = 8;  //Ƿѹ����
	}
	else if(error_bank.bit.voltage_over_flag > 0) data_tx[8] = 9;  //��ѹ����
	//else if(error_bank.bit.temperature_flag > 0) data_tx[5] = 10;
	else data_tx[5] = 0;
	if(error_bank.bit.voltage_low_flag == 0)data_tx[8] &= 0xfe;  //Ƿѹ����*/
}

u16 @near speed_bike_temp_old;
u16 @near speed_bike_temp_old1;

void speed_load(void)
{
	//if(speed_motor2)
	if((spt_high_count_bike + spt_low_count_bike) > 450)
	{
		data_tx[3] = 0x0d;//speed_motor2 ;
		data_tx[4] = 0x0d;
		speed_bike_temp = 0xd0d;
	}
	else 
	{
		//speed_bike_temp_old = (speed_bike << 2);
		//speed_bike_temp_old = (speed_bike_temp_old << 2) + (speed_bike_temp_old << 1);
		speed_bike_temp_old1 = (speed_bike_temp_old << 2);
	/**/
		if(speed_bike_temp_old1 > speed_bike_temp)
		{
			if((speed_bike_temp_old1 - speed_bike_temp) > 15)speed_bike_temp = speed_bike_temp + ((speed_bike_temp_old1 - speed_bike_temp) >> 4);
			else if(speed_bike_temp_old1 > speed_bike_temp)speed_bike_temp ++;
		}
		else if(speed_bike_temp_old1 < speed_bike_temp)		
		{
			if((speed_bike_temp - speed_bike_temp_old1) > 15)speed_bike_temp = speed_bike_temp - ((speed_bike_temp - speed_bike_temp_old1) >> 4);
			else if(speed_bike_temp_old1 < speed_bike_temp)speed_bike_temp --;
		}
		
		data_tx[4] = (speed_bike_temp & 0xff);
		data_tx[3] =  (speed_bike_temp >> 8) & 0xff;
	}
}
void tx_sum_load(void)
{
	data_tx[7] = (data_tx[1] ^ data_tx[2] ^ data_tx[3] ^ data_tx[4] ^  data_tx[5] ^ data_tx[6]) & 0xff ;
	//data_tx[10] = ((data_tx[1] + data_tx[2] + data_tx[3] + data_tx[4] +  data_tx[5] + data_tx[6] + data_tx[7]+ data_tx[8]) >> 8) & 0xff;
}

u8@near send_battry_old;

void voltage_load(void)
{
	if((current_average1 < current_adj_battry) && (voltage_average > user_Prdata.byte.voltage_adj) && (voltage_load_time > 25))//&& (current_average1 < current_adj_battry))
	{
		//if(voltage_average > user_Prdata.byte.voltage_adj)
		//{
			if(current_average1 < current_adj_table[0]) //current_adj_table[0] = user_Prdata.byte.voltage_adj / 16
			{
				if(voltage_average > (user_Prdata.byte.voltage_adj + 21))//11
				{
					send_battry_old = (voltage_average - user_Prdata.byte.voltage_adj - 21) >> 4;//1v 11 5 data_tx[1]
					
					if(data_tx[1] == 0)data_tx[1] = send_battry_old;
					else if(data_tx[1] > send_battry_old)data_tx[1] --;
					else if(data_tx[1] < send_battry_old)data_tx[1] ++;
					
					if(data_tx[1] > 5)data_tx[1] = 5;
					error_bank.bit.voltage_low_flag = 0;
				}
				else data_tx[1] = 0;
				
				voltage_load_count = 0;
			}
			/*else if(voltage_load_count > 100)
			{
				data_tx[1] = (voltage_average_old_min - user_Prdata.byte.voltage_adj) >> 4;
				if(data_tx[1] > 5)data_tx[1] = 5;
				error_bank.bit.voltage_low_flag = 0;
				voltage_load_count = 0;
			}
			else 
			{
				voltage_load_count ++;
				if((voltage_average_old_min > voltage_average) || (voltage_average_old_min < 100))voltage_average_old_min = voltage_average; 
			}*/
	  //}
		//else data_tx[5] = 0;
		//data_tx[5] &= 0xf7;
			voltage_load_time = 0;
	}
	else if(voltage_average <= user_Prdata.byte.voltage_adj )
	{
		data_tx[1] = 0;
		voltage_load_count = 0;
  }
	/*else if((voltage_average < (user_Prdata.byte.voltage_adj + 3)) &&())
	{
		data_tx[1] = 0;
		voltage_load_count = 0;
		//data_tx[5] |= 0x08;
	}*/
	
	//data_tx[8] = (data_tx[0] + data_tx[1] + data_tx[5]+ data_tx[6]+ data_tx[7] ) & 0xff ;
}
/*void voltage_load(void)
{
	if((voltage_average > user_Prdata.byte.voltage_adj) && (current_average1 < current_adj_battry))
	{
		if(current_average1 < current_adj_table[0]) //current_adj_table[0] = user_Prdata.byte.voltage_adj / 16
		{
			data_tx[1] = (voltage_average - user_Prdata.byte.voltage_adj - 11) / 5;//1v 11
			error_bank.bit.voltage_low_flag = 0;
			voltage_load_count = 0;
		}
		else if(voltage_load_count > 100)
		{
			data_tx[1] = (voltage_average_old_min - user_Prdata.byte.voltage_adj) / 5;
			error_bank.bit.voltage_low_flag = 0;
			voltage_load_count = 0;
		}
		else 
		{
			voltage_load_count ++;
			if(voltage_average_old_min > voltage_average)voltage_average_old_min = voltage_average; 
		}
		//data_tx[5] &= 0xf7;
	}
	else if(voltage_average < (user_Prdata.byte.voltage_adj + 3))
	{
		data_tx[1] = 0;
		voltage_load_count = 0;
		//data_tx[5] |= 0x08;
	}
	//data_tx[8] = (data_tx[0] + data_tx[1] + data_tx[5]+ data_tx[6]+ data_tx[7] ) & 0xff ;
}*/
u16@near bike_rpm_old;

u8@near speed_bike_load_count ;

void speed_check_bike(void) //
{
	//speed_bike
	spt_condition1_bike = SPEED_CHECK_PORT; //PEIN & 0x01;

	if(spt_condition_old_bike > 0)	//��?��?��??a??��???
	{
		if(spt_condition1_bike == 0)		//�̡�?��?��?a�̨���???
		{
			spt_low_flag_bike = 1;		//??�̨���?????��y����??
			spt_high_flag_bike = 0;		//????��?????��y����??	
			/*
			if(speed_bike_load_count < 5) //6li
			{
				if(speed_bike_load_count > 0)speed_bike += (spt_high_count_bike + spt_low_count_bike);
				speed_bike_load_count ++;
			}
			else */
			{
				speed_bike_temp_old = speed_bike + (spt_high_count_bike + spt_low_count_bike);
				//speed_bike_temp_old = ((speed_bike_temp_old * 19) / 18);
				bike_rpm_old = 15000 / speed_bike_temp_old;//
				if(bike_rpm_old > bike_rpm)bike_rpm = bike_rpm + ((bike_rpm_old - bike_rpm) >> 2);
				else if(bike_rpm_old < bike_rpm)bike_rpm = bike_rpm - ((bike_rpm - bike_rpm_old) >> 2);
				if(bike_rpm < 20)bike_rpm = 20;
				speed_bike = 0;
				speed_bike_load_count = 0;
			}
			
			spt_high_count_bike = 0;		//??��?��?��???��?????��y?��
			spt_low_count_bike = 0;		//??��?��?��?�̨���?????��y?��
		}
	}
	else
	{
		if(spt_condition1_bike > 0)
		{
			spt_low_flag_bike = 0;		//??�̨���?????��y����??	
			spt_high_flag_bike = 1;		//????��?????��y����??
		}
	}
	spt_condition_old_bike = spt_condition1_bike;

	if(spt_low_flag_bike == 1)
	{
		spt_low_count_bike += 1;
		if(spt_low_count_bike > 500)//900
		{
			speed_bike_temp_old = 900;
			spt_low_count_bike = 500;
			bike_rpm = 30;//1
		}
	}
	if(spt_high_flag_bike == 1)
	{
		spt_high_count_bike += 1;
		if(spt_high_count_bike > 500)//900
		{
			speed_bike_temp_old = 900;
			spt_high_count_bike = 500;
			bike_rpm = 30;//1
		}
	}
		
		if(bike_rpm > 66)zero_add_torque = 5;
		else zero_add_torque = 30 - (bike_rpm >> 2) - (bike_rpm >> 3);
	
}

void uart_rx_dang_load(void)
{
	// dang_limit_current 
	// dang_limit_pwm 
	// dang_limit_ratio 
	if((data_rx_dang == 0) || (data_rx[0] == 83))// stop
	{
		dang_limit_pwm = 0;
		torque_level = 0;
		dang_limit_current = 0;
		//torque_level_up = 1;
	}
	else if(data_rx_dang == 1)
	{
		dang_limit_pwm = 280;//112;//126; // 100
		torque_level = 35;
		dang_limit_current = sp_ph_current_limit_max;
	//	torque_level_up = 1;
	}
	else if(data_rx_dang == 2)
	{
		dang_limit_pwm = 280;//154;//140
		torque_level = 50;
		dang_limit_current = sp_ph_current_limit_max;
		//torque_level_up = 3;
	}
	else if(data_rx_dang == 3)
	{
		dang_limit_pwm = 280;//182;//168
		torque_level = 65;
		dang_limit_current = sp_ph_current_limit_max;
	//torque_level_up = 7;
	}
	else if(data_rx_dang == 4)
	{
		dang_limit_pwm = 280;//200;//220
		torque_level = 80;
		dang_limit_current = sp_ph_current_limit_max;
		//torque_level_up = 15;
	}
	else if(data_rx_dang == 5)
	{
		dang_limit_pwm = 280;//280
		torque_level = 105;//
		dang_limit_current = sp_ph_current_limit_max;
		//torque_level_up = 31;
	}
	
	
	
	/*else if(data_rx_dang == 6)
	{
		dang_limit_pwm = 205;//280
		dang_limit_current = sp_ph_current_limit_max;
	}
	else if(data_rx_dang == 7)
	{
		dang_limit_pwm = 225;//280
		dang_limit_current = sp_ph_current_limit_max;
	}
	else if(data_rx_dang == 8)
	{
		dang_limit_pwm = 250;//280
		dang_limit_current = sp_ph_current_limit_max;
	}
	else if(data_rx_dang == 9)
	{
		dang_limit_pwm = 280;//280
		dang_limit_current = sp_ph_current_limit_max;
	}*/
	else //no yibiao
	{
		dang_limit_pwm = 280;
		torque_level = 105;//
		dang_limit_current = sp_ph_current_limit_max;
	}
	
	if((data_rx[1] & 0x10) > 0)//6km
	{
		dang_limit_pwm = 80;//80
		dang_limit_current = sp_ph_current_limit_10p;//sp_ph_current_limit_20p
	}
	
	//if(data_rx_dang < 3)add_base_torque = (10 - (data_rx_dang << 1));
	//else add_base_torque = 0;
}
void uart_rx_dang_deal(void)
{
	/*if((data_rx[1] & 0x10) > 0) data_rx_dang = 0;
	else if((data_rx[1] & 0x80) > 0) data_rx_dang = 1;
	else if((data_rx[1] & 0x40) > 0) data_rx_dang = 2;
	else if((data_rx[1] & 0x02) > 0) data_rx_dang = 3;
	else if((data_rx[1] & 0x04) > 0) data_rx_dang = 4;
	else if((data_rx[1] & 0x08) > 0) data_rx_dang = 5;
	//else if((data_rx[1] & 0x20) > 0) data_rx_dang = 6;
	else data_rx_dang = 7;
	if((data_rx[1] & 0x20) > 0) data_rx_dang = 6;*/
	if((data_rx[1] & 0x0f) == 15)data_rx_dang = 0;
	else if((data_rx[1] & 0x0f) > 0)data_rx_dang = data_rx[1] & 0x0f;
	
	/*if((control_temp > 300) && (sys_state_flag.bit.protect_flag == 0) && ((data_rx[1] & 0x0f) == 15))
	{
		hand_no_speed_limit = 1;
	}
	else
	{
		hand_no_speed_limit = 0;
	}*/
	
	/*if((control_temp > 300) && (sys_state_flag.bit.protect_flag == 0))// 210 xz
	{
		data_rx_dang = 5;
	}*/
}

void uart_rec_deal(void)
{
	unsigned char xj=0;//,jiaoyan_rec=0;
	if(data_rx_number >= 5)//9
	{
		data_rx_number = 0;
		//jiaoyan_rec = (data_rx_temp[1] xor data_rx_temp[2])  xor data_rx_temp[3];//+data_rx_temp[4]+data_rx_temp[5];
		if(/*((jiaoyan_rec & 0xff) == data_rx_temp[4]) &&*/ (data_rx_temp[5] == 0x0d) && ((data_rx_temp[0] == 0x46) || (data_rx_temp[0] == 0x53)))//&& ((jiaoyan_rec >> 8) == data_rx_temp[7])
		{
			for(xj = 0;xj <= 5;xj++)//
			data_rx[xj] = data_rx_temp[xj];
			send_data_flag = 1;
			
			data_tx[5] = data_rx[3];
		}
		
		//wheel = data_rx[2] & 0x07;
		if((data_rx[2] & 0x07) == 0)wheel = 16;
		else if((data_rx[2] & 0x07) == 1)wheel = 18;
		else if((data_rx[2] & 0x07) == 2)wheel = 20;
		else if((data_rx[2] & 0x07) == 3)wheel = 22;
		else if((data_rx[2] & 0x07) == 4)wheel = 24;
		else if((data_rx[2] & 0x07) == 5)wheel = 26;
		else if((data_rx[2] & 0x07) == 6)wheel = 28;
		else if((data_rx[2] & 0x07) == 7)wheel = 29;
		
		max_speed_limit = ((data_rx[2] & 0xf8) >> 3) + 20 ;// 10//data_rx[5];
		
		xj = 0 ;
			

	}	
}


/*
void speed_show(void)
{
	if(debug_mode_flag == 13)
	{
		if(speed_check_on_flag == 0)
		{
			speed_check_count2 = 0;
			if(speed_check_count1 > 100)
			{
				speed_check_on_flag = 1;
				pwm_duty_on_old = 250;
			}
			else
				speed_check_count1 ++;
		}
		else
		{
			speed_check_count1 = 0;
			if(speed_check_count2 > 100)
			{
				speed_check_on_flag = 0;
				pwm_duty_on_old = 0;
			}
			else
				speed_check_count2 ++;
		}
	}
		
	if(pwm_duty_on_old >= 280)//ma��ָ��//llz
	{
		pwm_duty_on_old = 280;
	}
	 
	if(((PWM_mode.all_flag & 0x01) == 0x01) || (debug_mode_flag == 13))
	{
		pwm_duty_low1 = (pwm_duty_sin[pwm_duty_on_old]);
		pwm_duty_high1 = (pwm_duty_sin[pwm_duty_on_old])>>8;
	}
	else
	{
		pwm_duty_on_ini_count = (pwm_duty_on_ini >> 1);
		pwm_duty_low1 = (pwm_duty_sin[pwm_duty_on_ini_count]);
		pwm_duty_high1 = (pwm_duty_sin[pwm_duty_on_ini_count])>>8;
	}
	
	TIM1_CCR4H = pwm_duty_high1;
	TIM1_CCR4L = pwm_duty_low1;
}
*/
//
////////////////////////////////////////////////////////////////////////////////
void three_dang_deal(void)
{


}
//////////////////////////////////////////////////////////////////////////////
void square_sine_change(void)
{
	if((sys_state_flag.bit.brake_charge_flag == 1)||(sys_state_flag.bit.hall_exit == 1)|| (alarm_switch != 0) || (set_debug_mode > 0))
	{
		if(square_sine_change_flag == 0)
		{
			square_sine_change_flag = 1;
			PWM_ALL_OFF();
			NOHALL_TIM1();
		}
	}
	else
	{
		if(square_sine_change_flag == 1)
		{
			square_sine_change_flag = 0;
			PWM_ALL_OFF();
			TM1_INI();
		}
		
	}
 // square_sine_change_flag = 0;
}
////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////
//��������
/////////////////////////////////////////////////
void sandang_speed(void)
{ 
 /* if(SPEED_CHG_PORT > 0)
	{
		if(speed_chg_up == 0)
		{
			speed_chg_up = 1;
			if(speed_chg_count > 1)
			{
				speed_chg_count = 0;
			}
			else
			speed_chg_count ++ ;
		}
		
	}
  else
	   speed_chg_up = 0;*/

} 
////////////////////////////////////////////////
//CVT����
/////////////////////////////////////////////////
void cvt_speed(void)
{
	if((dang_mode == 2) && (current_cmd_average1 >= 280) && (pwm_duty_on_old >= 280) && (square_sine_change_flag == 0))//HZ
	{
		cvt_dn_count = 0;
		if(cvt_up_count > 20)
			cvt_on_flag = 1;
		else
			cvt_up_count ++;
	}
	else if((dang_mode != 2) || (current_cmd_average1 < 250)||(pwm_duty_on_old < 250)||(square_sine_change_flag == 1))
	{
		cvt_up_count = 0;
		if(cvt_dn_count > 20)
			cvt_on_flag = 0;
		else
			cvt_dn_count ++;
	}
	//cvt_on_flag = 1;
}
///////////////////////////////////////////////////////
void cvt_act_deal(void)
{
	if(cvt_on_flag == 1)
	{
		if(current_average1 >= current_adj_table[2])
		{
			if(cvt_act_flag == 0)
			{
				if(cvt_act_on_count >= 20)
					cvt_act_flag = 1;
				else
					cvt_act_on_count ++;
			}
			else
				cvt_act_off_count = 0;
		}
		else
		{
			if(cvt_reg_flag == 0)
			{
				if(cvt_act_flag == 1)
				{
					if(cvt_act_off_count >= 20)
						cvt_act_flag = 0;
					else
						cvt_act_off_count ++;
				}
				else
				{
					cvt_act_on_count = 0;
					cvt_reg_status = 1;
				}
			}
			else
			{
				cvt_off_count = 0;
				cvt_act_flag = 1;
			}
		}
	}
	else
	{
		cvt_act_on_count = 0;
		cvt_act_flag = 0;
		cvt_reg_flag = 0;
		cvt_reg_status = 0;
	}
}

void cvt_act_cacu_1(void)
{
	if((cvt_reg_flag == 0)&&(cvt_reg_status == 1))
	{
		if(add_spdmt_count < 150)
		{
			add_spdmt_count ++;
			if(add_spdmt_count > 134) 
				sum_speed_motor_6 = sum_speed_motor_6 + speed_motor_6;
			else
				sum_speed_motor_6 = 0;
		}
		else
		{
			cvt_reg_flag = 1;
			cvt_speed_motor_6_temp = sum_speed_motor_6 >> 4;
			add_spdmt_count = 0;
			sum_speed_motor_6 = 0;
		}
	}
	else
	{
		add_spdmt_count = 0;
		sum_speed_motor_6 = 0;
	}			
}

void cvt_act_cacu_2(void)
{
	if(cvt_reg_flag == 1)
	{
		cvt_speed_motor_6 = cvt_speed_motor_6_temp  - (cvt_speed_motor_6_temp >> 4) - (cvt_speed_motor_6_temp >> 5);// - (cvt_speed_motor_6_temp >> 5)
	}
}


///////////////////////////////////////////////////////
//�ֶ�ǿ������
//////////////////////////////////////////////////////
void limit_speed(void)
{  
	if(speed_limit_port == 0)
	{
		if(sys_state_flag.bit.hall_exit == 0)
			current_cmd_protect_average = user_Prdata.byte.limit_adj;
		else
			current_cmd_protect_average = user_Prdata.byte.limit_adj - 25;
	}
	else
	{
		current_cmd_protect_average = 280;
	}		
}
//////////////////////////////////////////////////////////////////
void speed_limit_flag_check (void)
{
		
}
////////////////////////////////////////////////////////////////
void speed_limit_check(void)
{
	 /*if(MODE_PORT1 == 0)
		{
			if(eco_flag == 1)              //////////////////////yhj
			{
					current_cmd_protect_average = 170;
					if(sys_state_flag.bit.hall_exit > 0)
					current_cmd_protect_average = 150;
			}
			else
			{
					current_cmd_protect_average = 150;
					if(sys_state_flag.bit.hall_exit > 0)
					current_cmd_protect_average = 130;
			}
		}
		else*/
		{
			
			/**/if(eco_flag == 1)
			{
				current_cmd_protect_average = 234;
				if(sys_state_flag.bit.hall_exit > 0)
					current_cmd_protect_average = 210;
			}
			else
			{
				current_cmd_protect_average= 280;  
				//if(sys_state_flag.bit.hall_exit > 0)
				//	current_cmd_protect_average = 183;				
			}				
		}
		if(eco_flag == 1)
		{
			if(current_temp > current_adj_12)
				current_temp = current_adj_12;
		}
		else
		{
			if(current_temp > user_Prdata.byte.current_adj)
				current_temp = user_Prdata.byte.current_adj;
			
		}
	/*if(sys_start_count1 < 5000)//20S
	{
		if(sys_start_count1 > 5)
		{
			if(sys_start_count1 < 250)	// 2J_splimitpw_fix
			{
				if((sys_state_flag.bit.brk_flag > 0) && (control_temp > 800) && (onekey.err == 0))
				{
					if(speed_set_start_count >= 10)
						speed_set_start_flag = 1;
					else
						speed_set_start_count ++;
				}
				else
					speed_set_start_count = 0;
			}
			
			if(speed_set_start_flag == 1)
			{
				if(control_temp > 800)
				{
					speed_set_high_count = 0;
					if(speed_set_chk_flag == 0)
					{
						if(speed_set_low_count < 15)
							speed_set_low_count ++;
						else
							speed_set_chk_flag = 1;
					}
				}
				else
				{ 
					speed_set_low_count = 0;
					if(speed_set_chk_flag == 1)
					{
						if(speed_set_high_count < 15)			
							speed_set_high_count ++;
						else
						{
							speed_set_chk_flag = 0;
							
							if(speed_set_count < 2)//��תת�Ѵ���
							{
								speed_set_count ++;
								speed_set_last_count = 0;
							}
						}
					}
				}

			
			
				if((sys_state_flag.bit.brk_flag > 0) && (control_temp > 800) && (onekey.err == 0))
				{	
					if(speed_set_count == 2)
					{
						if(speed_set_last_count > 1000)//4S
						{
							speed_set_last_count = 1000;
							sys_start_count1 = 5000;
							user_Prdata.byte.limit_adj = 280;
							eerprom_write();
							speed_set_start_flag = 0;
						}
						else
							speed_set_last_count ++;
					}
					else if(speed_set_count == 0)
					{
						if(speed_set_last_count > 1000)//4S
						{
							speed_set_last_count = 1000;
							sys_start_count1 = 5000;
							user_Prdata.byte.limit_adj = 175;
							eerprom_write();
							speed_set_start_flag = 0;
						}
						else
							speed_set_last_count ++;
					}
				}
			}
		}
		sys_start_count1 ++;
	}
	else
		speed_set_start_flag = 0;
		
		current_cmd_protect_average = user_Prdata.byte.limit_adj;
	
		current_cmd_protect_average1 = 280;

		 if(LSPD_PORT == 0)
		 {
			 if(check_shake_count < 25)
				 check_shake_count++;
			 else
			 {
				 check_shake_count = 25;
				 dang_mode = 0;
			 }
		 }
		 else if(CVT_PORT == 0)
		 {
			 if(check_shake_count1 < 25)
				 check_shake_count1++;
			 else
			 {
				 check_shake_count1 = 25;
				 dang_mode = 2;
			 }
		 }
		 else
		 {
			if(check_shake_count > 0)
				check_shake_count--;
			if(check_shake_count1 > 0)
				check_shake_count1--;
			if((check_shake_count == 0)&&(check_shake_count1 == 0))
				dang_mode = 1;
		 }


		if(dang_mode == 0)
		{
			if(current_cmd_protect_average1 > (current_cmd_protect_average >> 1) + (current_cmd_protect_average >> 3))
				current_cmd_protect_average1 = (current_cmd_protect_average >> 1) + (current_cmd_protect_average >> 3);//175;	//���ٵ�ռ�ձ�=268/400=67%	
		}
		else if(dang_mode == 2)
		{

		}
		else
		{
			
		}*/
}
////////////////////////////////////////////////////////////////////////////////////
void STOP_drive_sin(void)
{
//	ph_low_count_max = 0;
//	if((pwm_duty_on_old < 30)||((error_bank.all_flag & 0xC400) > 0) || (debug_mode_flag > 0)||(speed_motor2 >= 350))
	if((pwm_duty_on_old < 10)||((error_bank.all_flag & 0xDE00) > 0) || (debug_mode_flag > 0)) // slow off
	{
		PWM_ALL_OFF();
		pwm_duty_on_old = 0;
		pwm_duty_on = 0;
		pwm_sub_count = 0;
		hall_drive_back = 0;
		motor_flag.all_flag = 0x00;	//y42
	}
	else
	{
		//motor_flag.all_flag = DRIVE_BIT; //y42
		if((current_high_flag > 0))// || (sys_state_flag.bit.current_over_flag > 0))
		{
			if(pwm_sub_count == 0)
			{
				if(pwm_duty_on_old >= 1)
					pwm_duty_on_old -= 1;
				if(pwm_duty_on_old > 250)
					pwm_duty_on_old = 250;
			}
			pwm_sub_count++;
			if(pwm_sub_count >= 1)
				pwm_sub_count = 0;
		}
		else if((current_average1 >= c_offset)||(speed_motor2 >= 250))
		{
			if(pwm_sub_count == 0)
			{
				if(pwm_duty_on_old >= 1)
					pwm_duty_on_old -= 1;
					
				if(pwm_duty_on_old >250)
					pwm_duty_on_old = 250;
			}
			pwm_sub_count++;
			if(pwm_sub_count >= 35)
				pwm_sub_count = 0;
		}
		if(pwm_duty_on_old < 5)
			pwm_duty_on_old = 0;
		pwm_duty_on = pwm_duty_on_old;

		if(square_sine_change_flag == 1)
			phase_change(rotor_position);
		else
			rotor_ver();
	}
}
/////////////////////////////////
//�����������
////////////////////////////////
void hall_out(void)
{
//	if(EHALL_COUNT==0)
//		{	
//			EHALL_OUT_L;
//		}
//	else
//	EHALL_OUT_H;
	
}
////////////////////////////////////////////////////////////////////////////////
//brake_chk()
////////////////////////////////////////////////////////////////////////////////
void brake_chk(void)						//2ms
{
#ifdef S49
	if((BREAK_PORT2 > 0) || (BREAK_PORT == 0))				// Ϊ1�����ƶ���־
#else
	if((BREAK_PORT == 0))				// Ϊ1�����ƶ���־
#endif	
	{
		if(brake_out_count < 10)
		{
			brake_out_count += 1;		//���ؼ�������1
			sys_state_flag.bit.brk_flag = 0;		//�ƶ����ر�־λΪ0
		}
		else
		{
			brake_out_count = 10;
			sys_state_flag.bit.brk_flag = 1;		//��λ���ر�־
			pwm_duty_on1 = 0;
			spt_com_count = 0;
			sys_state_flag.bit.sf_flag = 0;				//���Զ�Ѳ����־
			
			if(mode_flag == 0)
 		    	mode_flag = 1;			
			if(limit_flag == 12)
			{
				limit_flag = 11;
			}
			//
			if(limit_flag == 11)
			{
				limit_flag = 7;
				if(current_cmd_average > 500)
					user_Prdata.byte.limit_adj = 500;
				else if(current_cmd_average <= 90)
					user_Prdata.byte.limit_adj = 90;
				else
					user_Prdata.byte.limit_adj = current_cmd_average;
			}
		}
	}
	else											//Ϊ0�����ر�־
	{
		brake_out_count = 0;
		brake_delay_count = 0;
		sys_state_flag.bit.brake_charge_flag = 0;
		sys_state_flag.bit.brk_flag = 0;			//���㿪�ر�־
		brk_error_flag = 0;
		pwm_duty_brake = 0;
		pwm_brake_max = 0;
		if(limit_flag == 8)
		{
			limit_flag = 12;
		}		
	}

	if(sys_state_flag.bit.brk_flag > 0)
	{
		if(brake_delay_count < 30)
		{
			brake_delay_count += 1;			//��ʱ��������1
			sys_state_flag.bit.brake_charge_flag = 0;
			pwm_duty_brake = 0;
		}
		else	//��ʱʱ�䵽��
		{
			if(sys_state_flag.bit.abs_sel_flag > 0)
				sys_state_flag.bit.brake_charge_flag = 1;				//�ƶ���־λ��1
				
			brake_delay_count = 30;
			
			if(speed_motor2 > 300)
			{
				if(limit_flag == 7)
				{
					limit_flag = 0;
					debug_mode_flag = 8;
				}
			}			
		}
	}
	
#ifdef  ONE_KEY_FUN	
	if(onekey.bit.stop_err_flag > 0)
	{
		if(work_flag.bit.stop > 0)
		{
			sys_state_flag.bit.brk_flag = 0;
			sys_state_flag.bit.brake_charge_flag = 0;
		}
		else
		{
			sys_state_flag.bit.brk_flag = 1;
			sys_state_flag.bit.brake_charge_flag = 0;
		}
	}
#endif	
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

void spt_chk_single(void)
{
	
}
u16@near current_cmd_average1_old;
void spt_chk(void)
{
	spt_condition1 = SPT_PORT; //PAIN & 0x40;
	/*if(speed_motor2 > 400) //��?��?
	{
		spt_condition1 = 0;
		spt_com_count = 0;
		sys_state_flag.bit.spt_flag = 0;
	}*/

	if(spt_condition_old > 0)	//��?��?��??a??��???
	{
		if(spt_condition1 == 0)		//�̡�?��?��?a�̨���???
		{
			spt_low_flag = 1;		//??�̨���?????��y����??
			spt_high_flag = 0;		//????��?????��y����??	
				
			//if(spt_keep_out == 0)  	// shorter than 300 ms?
			{
				//if((spt_high_count > spt_low_count))// && (speed_motor2 < 400))		//??��?????��y?��??�����̨�????��y?��?
				{
					/*if(spt_com_count < 1)//1
					{
						spt_com_count ++;
						//pwm_duty_speed = 0;
					}
					else*/
					{
						
						if(spt_low_high_count_old > 0) spt_low_high_count_last = spt_low_high_count_old;
						else 
						{
							spt_low_high_count_last = 450;
							//if(data_rx_dang < 3)pwm_duty_on1 = 120;
							//else pwm_duty_on1 = 230; 
							pwm_duty_on1 = 60;  
						}
						spt_low_high_count_old = spt_high_count + spt_low_count;
						
							if(run_mode == 0)
							{
								/*if(pwm_duty_on1 < 120)pwm_duty_on1 = 120;
								if(pwm_duty_on1 < 280)pwm_duty_on1 = pwm_duty_on1 + ((280 - pwm_duty_on1) >> 1);
								else pwm_duty_on1 = 280;*/
								pwm_duty_on1 = 280;
							}
							else 
							{
								if(spt_low_high_count_old > 3)
								{
									pwm_duty_speed = 15000 / spt_low_high_count_old + 60; //60  6300
									if(pwm_duty_speed > 280) pwm_duty_speed = 280;
								}
								else pwm_duty_speed = 60;
								
								if(pwm_duty_on1 < pwm_duty_speed)spt_low_high_delta = pwm_duty_speed - pwm_duty_on1;
								else if(pwm_duty_on1 > pwm_duty_speed)spt_low_high_delta = pwm_duty_on1 - pwm_duty_speed;
								
								//spt_low_high_delta *= spt_low_high_delta;
								if(spt_low_high_delta > 7)spt_low_high_delta >>= 3;  
								else if(spt_low_high_delta > 0)spt_low_high_delta = 1; 								
								
								if(pwm_duty_on1 < 80)pwm_duty_on1 = 80;
								if(pwm_duty_on1 < pwm_duty_speed)
								 pwm_duty_on1 += spt_low_high_delta;
								else if(pwm_duty_on1 > pwm_duty_speed)
								 pwm_duty_on1 -= spt_low_high_delta;//pwm_duty_on1 = pwm_duty_speed;//
							
								if(pwm_duty_on1 > 280)
									pwm_duty_on1 = 280;								
							}
							sys_state_flag.bit.spt_flag = 1;
							hand_enable_flag = 1;
						}
				}
				/*else
				{
					pwm_duty_on1 = 0;
					spt_com_count = 0;
					sys_state_flag.bit.spt_flag = 0;        	//�����a??3y?����|����??
					pwm_duty_speed = 0; 
					pwm_duty_speed_old = 0;
					spt_low_high_count = 0;
					spt_low_high_count_old =0;
					spt_low_high_count_last = 0;
					spt_low_high_count_sum = 0;
				}*/
			}
			/*else 
			{	
				spt_com_count = 0;
			}*/
			spt_high_count = 0;		//??��?��?��???��?????��y?��
			spt_low_count = 0;		//??��?��?��?�̨���?????��y?��
		}
	}
	else
	{
		if(spt_condition1 > 0)
		{
			spt_low_flag = 0;		//??�̨���?????��y����??	
			spt_high_flag = 1;		//????��?????��y����??
		}
	}
	spt_condition_old = spt_condition1;

	if(spt_low_flag == 1)
	{
		if(spt_low_count < 500)spt_low_count += 1;
		if((spt_low_count > 450) && (sys_state_flag.bit.spt_flag > 0))//(|| (control_temp > 200))
		{
			spt_keep_out = 1;			//�̨���???����??��?3��,2???DD?����|?D??
			sys_state_flag.bit.spt_flag = 0;
			spt_com_count = 0;
			//spt_low_count = 0;
			pwm_duty_on1 = 0;
			pwm_duty_speed = 0; 
			pwm_duty_speed_old = 0;
			spt_low_high_count = 0;
			spt_low_high_count_old =0;
			spt_low_high_count_last = 0;
			spt_low_high_count_sum = 0;
			
		}
		else spt_keep_out = 0;
	}
	
	if(spt_high_flag == 1)
	{
		if(spt_high_count < 500)spt_high_count += 1;
		if((spt_high_count > 450) && (sys_state_flag.bit.spt_flag > 0)) //(|| (control_temp > 200))
		{
			spt_com_count = 0;
			spt_keep_out = 1;			//??��???����??��?3��,2???DD?����|?D??
			sys_state_flag.bit.spt_flag = 0;
		  //spt_high_count = 0;
			pwm_duty_on1 = 0;
			pwm_duty_speed = 0;
			pwm_duty_speed_old = 0;
			spt_low_high_count = 0;
			spt_low_high_count_old =0;
			spt_low_high_count_last = 0;
			spt_low_high_count_sum = 0;
		}
		else spt_keep_out = 0;
	}
		if(((spt_high_count + spt_low_count) > ((spt_low_high_count_last << 1) /*+ (spt_low_high_count_last << 1)*/))  && (spt_low_high_count_old > 5) && (spt_low_high_count_last > 0)) 
		{	
			//pwm_duty_on1 >> 3;
			spt_keep_out = 1;	
			pwm_duty_on1 = 0;
			spt_com_count = 0;
			sys_state_flag.bit.spt_flag = 0;        	//�����a??3y?����|����??
			pwm_duty_speed = 0; 
			pwm_duty_speed_old = 0;
			spt_low_high_count = 0;
			spt_low_high_count_old =0;
			spt_low_high_count_last = 0;
			spt_low_high_count_sum = 0;
		}		
		
		/*
		if(sys_state_flag.bit.spt_flag == 0)
		{
			if((lj_ad_app_change > 5) && (control_lj_temp_table[1] > (control_lj_zero_table[0] + 153)) &&(sys_state_flag.bit.lj_flag > 0) && (zero_start_number < 500))
			{
				zero_start_number ++;
				pwm_duty_on1 = 280;
				sys_state_flag.bit.spt_flag = 1;
			}
		}*/
}


/*void spt_chk(void)
{
#ifdef SPT_SEL_FUN		
	if(sys_state_flag.bit.spt_sel_flag > 0)
#endif	
	//if(mode_flag == 0)
		spt_condition1 = SPT_PORT; //PAIN & 0x40;

#ifdef SPT_NO_ZERO
		if(speed_motor2 > 400)
		{
			spt_condition1 = 0;
			spt_com_count = 0;
			sys_state_flag.bit.spt_flag = 0;
		}
#endif

	if(spt_condition_old > 0)	//��һ��Ϊ�ߵ�ƽ
	{
		if(spt_condition1 == 0)		//��ǰֵΪ�͵�ƽ
		{
			spt_low_flag = 1;		//�õ͵�ƽ������־
			spt_high_flag = 0;		//��ߵ�ƽ������־	
				
			if(spt_keep_out == 0)  	// shorter than 300 ms?
			{
				if((spt_high_count > spt_low_count))// && (speed_motor2 < 400))		//�ߵ�ƽ����ֵ���ڵ�ƽ����ֵ?
				{
					if(spt_com_count < 2)
						spt_com_count ++;
					else
					{
#ifdef SIM_UART
						if(pwm_duty_on1 < 500)
							pwm_duty_on1 += 30;
							
						if(pwm_duty_on1 > 500)
							pwm_duty_on1 = 500;
#else					
            if(square_sine_change_flag == 0)///����
						{
							if(pwm_duty_on1 < 218)
								pwm_duty_on1 += 20;
							if(pwm_duty_on1 > 218)
								pwm_duty_on1 = 200;
						}
						else
						{
			     		if(pwm_duty_on1 < 195)
								pwm_duty_on1 += 15;
							if(pwm_duty_on1 > 175)
								pwm_duty_on1 = 175;
												
						}
#endif
						sys_state_flag.bit.spt_flag = 1;
					}
				}
				else
 			    {
					pwm_duty_on1 = 0;
					pwm_duty_on1 = 0;
					spt_com_count = 0;
					sys_state_flag.bit.spt_flag = 0;        	//��ת���������־
				}
			}
			else 
			{	
				spt_com_count = 0;
			}
			spt_high_count = 0;		//����һ�θߵ�ƽ����ֵ
			spt_low_count = 0;		//����һ�ε͵�ƽ����ֵ
		}
	}
	else
	{
		if(spt_condition1 > 0)
		{
			spt_low_flag = 0;		//��͵�ƽ������־	
			spt_high_flag = 1;		//�øߵ�ƽ������־
		}
	}
	spt_condition_old = spt_condition1;

	if(spt_low_flag == 1)
	{
		spt_low_count += 1;
		if(spt_low_count > 166)
		{
			spt_keep_out = 1;			//�͵�ƽʱ��̫��,�����������ж�
			sys_state_flag.bit.spt_flag = 0;
			spt_com_count = 0;
			spt_low_count = 0;
			pwm_duty_on1 = 0;
		}
		else spt_keep_out = 0;
	}
	
	if(spt_high_flag == 1)
	{
		spt_high_count += 1;
		if(spt_high_count > 500)
		{
			spt_com_count = 0;
			spt_keep_out = 1;			//�ߵ�ƽʱ��̫��,�����������ж�
			sys_state_flag.bit.spt_flag = 0;
			spt_high_count = 0;
			pwm_duty_on1 = 0;
		}
		else spt_keep_out = 0;
	}	
}*/

/////////////////////////////////////////////////
//��������
//
//
/////////////////////////////////////////////////
void phase_change(u8 PR_hall_position_temp)
{
	if(pwm_duty_on >= 256)
	{
		pwm_duty_on = 256;
	//	PWM_FLASH();
	}
//	if(ph_pwm_duty_on < pwm_duty_on)
//		pwm_duty_on = ph_pwm_duty_on

	pwm_duty_low = (pwm_duty_on);
	pwm_duty_high = (pwm_duty_on)>>8;
	
	hall_position_temp = PR_hall_position_temp;
	
	TIM1_CCR1H = pwm_duty_high;
	TIM1_CCR1L = pwm_duty_low;
	
	TIM1_CCR2H = pwm_duty_high;
	TIM1_CCR2L = pwm_duty_low;
	
	TIM1_CCR3H = pwm_duty_high;
	TIM1_CCR3L = pwm_duty_low;
	
	if((hall_drive_back !=  hall_position_temp))
	{
		if(hall_drive_back > 0)
		{
			if((hall_turetable[hall_drive_back]!= hall_position_temp))
			{
				if(hall_turetable2[hall_drive_back]!= hall_position_temp)
					hall_position_temp = 0;
			}
		}
			
		if((PWM_mode.all_flag &  (~DRIVE_BIT)) > 0)
		{
			hall_position_temp = 0;
		}
		
		if(pwm_duty_on == 256)
		{
			PWM_FLASH();	
		}
		
		if(hall_position_temp == 1)
		{//C+B-
		//	TIM1_CCR3H = pwm_duty_high;
		//	TIM1_CCR3L = pwm_duty_low;	
			PHASE_CCMR_CB();
			PHASE_CB();
		}
		else if(hall_position_temp == 5)
		{//A+B-
		//	TIM1_CCR1H = pwm_duty_high;
		//	TIM1_CCR1L = pwm_duty_low;	
			PHASE_CCMR_AB();	
			PHASE_AB();
		}
		else if(hall_position_temp == 4)
		{//A+C-
		//	TIM1_CCR1H = pwm_duty_high;
		//	TIM1_CCR1L = pwm_duty_low;	
			PHASE_CCMR_AC();	
			PHASE_AC();
		}
		else if(hall_position_temp == 6)
		{//B+C-
		//	TIM1_CCR2H = pwm_duty_high;
		//	TIM1_CCR2L = pwm_duty_low;	
			PHASE_CCMR_BC();	
			PHASE_BC();
		}
		else if(hall_position_temp == 2)
		{//B+A-
		//	TIM1_CCR2H = pwm_duty_high;
		//	TIM1_CCR2L = pwm_duty_low;
			PHASE_CCMR_BA();	
			PHASE_BA();
		}
		else if(hall_position_temp == 3)
		{//C+A-
		//	TIM1_CCR3H = pwm_duty_high;
		//	TIM1_CCR3L = pwm_duty_low;	
			PHASE_CCMR_CA();
			PHASE_CA();
		}
		else
		{
			PWM_ALL_OFF();		
		}
		TIM1_EGR |= 0x20;					//ˢ��PWM
		hall_drive_back = hall_position_temp;
	}
	PWM_mode.all_flag = DRIVE_BIT;
}

void phase_lock_change(u8 PR_hall_position_temp) //nohall lock start
{
	if(pwm_duty_on >= 256)
	{
		pwm_duty_on = 256;
	//	PWM_FLASH();
	}
//	if(ph_pwm_duty_on < pwm_duty_on)
//		pwm_duty_on = ph_pwm_duty_on

	pwm_duty_low = (pwm_duty_on);
	pwm_duty_high = (pwm_duty_on)>>8;
	
	hall_position_temp = PR_hall_position_temp;
	
	TIM1_CCR1H = pwm_duty_high;
	TIM1_CCR1L = pwm_duty_low;
	
	TIM1_CCR2H = pwm_duty_high;
	TIM1_CCR2L = pwm_duty_low;
	
	TIM1_CCR3H = pwm_duty_high;
	TIM1_CCR3L = pwm_duty_low;
	
	if((hall_drive_back !=  hall_position_temp))
	{
		if(hall_drive_back > 0)
		{
			if((hall_turetable[hall_drive_back]!= hall_position_temp))
			{
				if(hall_turetable2[hall_drive_back]!= hall_position_temp)
					hall_position_temp = 0;
			}
		}
			
		if((PWM_mode.all_flag &  (~DRIVE_BIT)) > 0)
		{
			hall_position_temp = 0;
		}
		
		if(pwm_duty_on == 256)
		{
			PWM_FLASH();	
		}
		
		if(hall_position_temp == 1)
		{//C+B-
		//	TIM1_CCR3H = pwm_duty_high;
		//	TIM1_CCR3L = pwm_duty_low;	
			PHASE_CCMR_C_AB();
			PHASE_C_AB();
		}
		else if(hall_position_temp == 5)
		{//A+B-
		//	TIM1_CCR1H = pwm_duty_high;
		//	TIM1_CCR1L = pwm_duty_low;	
			PHASE_CCMR_AC_B();	
			PHASE_AC_B();
		}
		else if(hall_position_temp == 4)
		{//A+C-
		//	TIM1_CCR1H = pwm_duty_high;
		//	TIM1_CCR1L = pwm_duty_low;	
			PHASE_CCMR_A_BC();	
			PHASE_A_BC();
		}
		else if(hall_position_temp == 6)
		{//B+C-
		//	TIM1_CCR2H = pwm_duty_high;
		//	TIM1_CCR2L = pwm_duty_low;	
			PHASE_CCMR_AB_C();	
			PHASE_AB_C();
		}
		else if(hall_position_temp == 2)
		{//B+A-
		//	TIM1_CCR2H = pwm_duty_high;
		//	TIM1_CCR2L = pwm_duty_low;
			PHASE_CCMR_B_AC();	
			PHASE_B_AC();
		}
		else if(hall_position_temp == 3)
		{//C+A-
		//	TIM1_CCR3H = pwm_duty_high;
		//	TIM1_CCR3L = pwm_duty_low;	
			PHASE_CCMR_BC_A();
			PHASE_BC_A();
		}
		else
		{
			PWM_ALL_OFF();		
		}
		TIM1_EGR |= 0x20;					//ˢ��PWM
		hall_drive_back = hall_position_temp;
	}
	PWM_mode.all_flag = DRIVE_BIT;
}
///////////////////////////////////////////////////
//
//
//
//
///////////////////////////////////////////////////

void phase_abs_change(u8 PR_hall_position_temp)
{
	if(pwm_duty_brake >= 400) 
	{
		pwm_duty_brake = 400;
		PWM_FLASH();
	}
	hall_position_temp = PR_hall_position_temp;
	pwm_duty_low = pwm_duty_brake;
	pwm_duty_high = pwm_duty_brake>>8;
	
	if(PWM_mode.all_flag != ABS_BIT)
	{
		hall_position_temp = 0;
		PWM_mode.all_flag = ABS_BIT;
	}
	
	TIM1_CCMR1 = PWM_MODE1;
	TIM1_CCMR2 = PWM_MODE1;
	TIM1_CCMR3 = PWM_MODE1;	
	
	TIM1_CCR1H = PWMDUTY_OFFH;
	TIM1_CCR1L = PWMDUTY_OFFL;	
	
	TIM1_CCR2H = PWMDUTY_OFFH;
	TIM1_CCR2L = PWMDUTY_OFFL;	
	
	TIM1_CCR3H = PWMDUTY_OFFH;
	TIM1_CCR3L = PWMDUTY_OFFL;	
	
	TIM1_CCR1H = pwm_duty_high;
	TIM1_CCR1L = pwm_duty_low;	
	
	TIM1_CCR2H = pwm_duty_high;
	TIM1_CCR2L = pwm_duty_low;	
	
	TIM1_CCR3H = pwm_duty_high;
	TIM1_CCR3L = pwm_duty_low;
	
	TIM1_CCER1 = 0x44;
	TIM1_CCER2 = 0x14;
	
	/*if((hall_position_temp == 1) || (hall_position_temp == 3))
	{//C+B-
		TIM1_CCR3H = pwm_duty_high;
		TIM1_CCR3L = pwm_duty_low;
	//	PHASE_C();
	}
	else if((hall_position_temp == 5) || (hall_position_temp == 4))
	{//A+B-
		TIM1_CCR1H = pwm_duty_high;
		TIM1_CCR1L = pwm_duty_low;
	//	PHASE_A();		
	}
	else if((hall_position_temp == 6) || (hall_position_temp == 2))
	{//B+C-
		TIM1_CCR2H = pwm_duty_high;
		TIM1_CCR2L = pwm_duty_low;
	//	PHASE_B();		
	}
	else if(hall_position_temp == 0)
	{
		PWM_ALL_OFF();
		PWM_mode.all_flag = ABS_BIT;
	}*/
	TIM1_EGR |= 0x20;					//ˢ��PWM
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////�ƶ�ռ�ձȼ����ӳ���/////////////////////////////////
void brake_pwm_duty(void)
{
	if(speed_motor2 <= 10)
		pwm_brake_max = 0;
	else
	{
		pwm_brake_max = ((speed_motor2 - 2) * 15);
	}

	if(speed_motor2 > 120)
		pwm_brake_max = 0;
		
	if(pwm_brake_max > 400)
		pwm_brake_max = 400;

	if(pwm_up_count > 4)
	{
		pwm_up_count = 0;
		if(pwm_duty_brake < pwm_brake_max)
		{
			pwm_duty_brake ++;
		}
		else
			pwm_duty_brake = pwm_brake_max;
	}
	else
		pwm_up_count ++;
}

///////////////////////////////////////////////////////////////////////////
//
//
//
///////////////////////////////////////////////////////////////////////////
void PWM_ALL_OFF(void)
{
	PWM_FLASH();
	TIM1_CCMR1 = PWM_HOLD_OFF;
	TIM1_CCMR2 = PWM_HOLD_OFF;
	TIM1_CCMR3 = PWM_HOLD_OFF;


	TIM1_CCR1H = 0x00;
	TIM1_CCR1L = 0x00;
	TIM1_CCR2H = 0x00;
	TIM1_CCR2L = 0x00;
	TIM1_CCR3H = 0x00;
	TIM1_CCR3L = 0x00;
	
	TIM1_CCER1 &= 0xee;
	TIM1_CCER2 &= 0xfe;	
	TIM1_CCER1 |= 0X44;
	TIM1_CCER2 |= 0X04;
	TIM1_EGR |= 0x20;
	pwm_duty_on = 0;
	pwm_duty_on_old = 0;	
	sensor_pwm_duty = 0;
	PWM_mode.all_flag = 0;
	motor_flag.all_flag = 0x00;
}

////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
void motor_brake(void)
{
//	brake_pwm_duty();
	phase_abs_change(rotor_position);
//	pwm_duty_on = 0;
//	pwm_duty_on_old = 0;
}


////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void motor_drive(void)
{
	if(square_sine_change_flag == 1)
	{
		#ifdef AUTO_PHS	
			if((sys_state_flag.bit.ph_flag > 0))// && (sys_state_flag.bit.phs_flag > 0))
			{
				pwm_duty_on = 255;
				sys_state_flag.bit.phs_flag = 1;
			}
			else
			{
				pwm_duty_on = pwm_duty_on_old;
				sys_state_flag.bit.phs_flag = 0;
			}
		#else 	
			
			ph_low_count_max = 0;
			if(ph_low_count_max > 0)
			{
				ph_low_count_max --;
				if(ph_low_count_max == 0)
					pwm_duty_on = ((255 + pwm_duty_on_old) >> 1);
				else
					pwm_duty_on = 255;
			}
			else
			{
				ph_low_count_max = 0;	
				pwm_duty_on = pwm_duty_on_old;
			}
		#endif	
			
		#ifdef CVT_MODE
			phase_change(cvt_rotor_position);
		#else
			phase_change(rotor_position);
		#endif

	}
	else
		rotor_ver();
}
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

void STOP_drive(void)
{
//	ph_low_count_max = 0;
	if((pwm_duty_on_old < 30)||((error_bank.all_flag & 0xD600) > 0) || (debug_mode_flag > 0)|| (speed_motor2 >= 350))
	{
		PWM_ALL_OFF();
		pwm_duty_on_old = 0;
		pwm_duty_on = 0;
		pwm_sub_count = 0;
		hall_drive_back = 0;
		motor_flag.all_flag = 0x00;	//y42
	}
	else
	{
		//motor_flag.all_flag = DRIVE_BIT; //y42
		if((sys_state_flag.bit.current_over_flag > 0))// || (sys_state_flag.bit.current_over_flag > 0))
		{
			if(pwm_sub_count == 0)
			{
				if(pwm_duty_on_old >= 1)
					pwm_duty_on_old -= 1;
				if(pwm_duty_on_old > MAX_PWMDUTY)
					pwm_duty_on_old = MAX_PWMDUTY;
			}
			pwm_sub_count++;
			if(pwm_sub_count >= 4)
				pwm_sub_count = 0;
		}
		else// if(current_average1 >= c_offset)// || (pwm_duty_on_old < 20))
		{
			if(pwm_sub_count == 0)
			{
				if(pwm_duty_on_old >= 1)
					pwm_duty_on_old -= 1;
				if(pwm_duty_on_old > MAX_PWMDUTY)
					pwm_duty_on_old = MAX_PWMDUTY;
			}
			pwm_sub_count++;
			if(pwm_sub_count >= 4)
				pwm_sub_count = 0;
		}
		if(pwm_duty_on_old < 10)
			pwm_duty_on_old = 0;
		pwm_duty_on = pwm_duty_on_old;

 	if(square_sine_change_flag == 1)
			phase_change(rotor_position);
		else
			rotor_ver();

	}
}

///////////////////////////////////////
#ifdef	ALM_FUN
void dto_lock_drive(void)
{
	if(PWM_mode.all_flag &  (~LOCK_BIT) > 0)
	{
		PWM_FLASH();
		TIM1_CCMR1 = PWM_HOLD_OFF;
		TIM1_CCMR2 = PWM_HOLD_OFF;
		TIM1_CCMR3 = PWM_HOLD_OFF;
		TIM1_CCR1H = 0x00;
		TIM1_CCR1L = 0x00;
		TIM1_CCR2H = 0x00;
		TIM1_CCR2L = 0x00;
		TIM1_CCR3H = 0x00;
		TIM1_CCR3L = 0x00;
		
		TIM1_CCER1 &= 0xee;
		TIM1_CCER2 &= 0xfe;	
		TIM1_CCER1 |= 0X44;
		TIM1_CCER2 |= 0X04;
		TIM1_EGR |= 0x20;
		pwm_duty_on_old = 0;
		PWM_mode.all_flag = LOCK_BIT;
	}
	else
	{
		PWM_FLASH();
		TIM1_CCMR1 = PWM_HOLD_ON;
		TIM1_CCMR2 = PWM_HOLD_ON;
		TIM1_CCMR3 = PWM_HOLD_ON;
		TIM1_CCR1H = 0x03;
		TIM1_CCR1L = 0xE8;
		TIM1_CCR2H = 0x03;
		TIM1_CCR2L = 0xE8;
		TIM1_CCR3H = 0x03;
		TIM1_CCR3L = 0xE8;
		
		TIM1_CCER1 &= 0xee;
		TIM1_CCER2 &= 0xfe;	
		TIM1_CCER1 |= 0X44;
		TIM1_CCER2 |= 0X04;
		TIM1_EGR |= 0x20;
		pwm_duty_brake = 0;
		pwm_duty_on = 0;
		pwm_duty_on_old = 0;
		PWM_mode.all_flag = LOCK_BIT;
	}
}
#endif
////////////////////////////////////////////
///////////////////////////////////////////
void motor_lock_drive(void)
{
	if((current_high_flag > 0))				//current limit
	{
		if(pwm_sub_count1 == 0)
		{
			if(pwm_duty_on_old >= 10)
				pwm_duty_on_old -= 5;
		}	

		pwm_sub_count1 ++;

		if(pwm_sub_count1 >= 7)
			pwm_sub_count1 = 0;

		pwm_duty_on = pwm_duty_on_old;
	}
	else
	{
		if(pwm_duty_on_old < 150)
		{
			if(pwm_add_count1 == 0)
				pwm_duty_on_old += 1;
						
			pwm_add_count1 ++;
						
			if(pwm_add_count1 >= 40)
				pwm_add_count1 = 0;
		}
		else
			pwm_duty_on_old = 150;
				
		pwm_duty_on = pwm_duty_on_old;
	}
	pwm_duty_high = pwm_duty_on >>8;
	pwm_duty_low = pwm_duty_on;	
	
	
    if((PWM_mode.all_flag &  (~ALM_BIT)) > 0)
	{
		pwm_duty_high = 0;
		pwm_duty_low = 0;
	}
	
	if(pwm_duty_on == 500)
		PWM_FLASH();
		
    TIM1_CCR1H = pwm_duty_high;
	TIM1_CCR1L = pwm_duty_low;
	
	TIM1_CCR2H = pwm_duty_high;
	TIM1_CCR2L = pwm_duty_low;
	
	TIM1_CCR3H = pwm_duty_high;
	TIM1_CCR3L = pwm_duty_low;

	if((lock_hall == 7)||(lock_hall == 0))
	{
        PHASE_CCMR_CB();       
		PHASE_CB();
	}
	else if((lock_hall == 1)||(lock_hall == 4))
	{
        PHASE_CCMR_AB();	
		PHASE_AB();
	}
	else if((lock_hall == 2)||(lock_hall == 5))
	{
        PHASE_CCMR_BC();	
		PHASE_BC();
	}
	else if((lock_hall == 3)||(lock_hall == 6))
	{
        PHASE_CCMR_CA();
		PHASE_CA();
	}
	else if((lock_hall == 8))
	{
        PWM_ALL_OFF();
	}
	/*
		if((lock_hall == 7)||(lock_hall == 0))
	{
        PHASE_CCMR_AC();       
		PHASE_AC();
	}
	else if((lock_hall == 1)||(lock_hall == 4))
	{
        PHASE_CCMR_BC();	
		PHASE_BC();
	}
	else if((lock_hall == 2)||(lock_hall == 5))
	{
        PHASE_CCMR_CA();	
		PHASE_CA();
	}
	else if((lock_hall == 3)||(lock_hall == 6))
	{
        PHASE_CCMR_AB();
		PHASE_AB();
	}
	else if((lock_hall == 8))
	{
        PWM_ALL_OFF();
	}
	*/
	PWM_mode.all_flag = ALM_BIT;
    TIM1_EGR |= 0x20;	
}
//////////////////////////////////////////
/////////////////////////////////////////
void break_dirve(void)
{	
	TIM1_CCR1H = 0;
	TIM1_CCR1L = 80;
	
	TIM1_CCR2H = 0;
	TIM1_CCR2L = 80;	
	
	TIM1_CCR3H = 0;
	TIM1_CCR3L = 80;	
	PWM_FLASH();	
	PHASE_CCMR_CB();
	PHASE_CB();	
	TIM1_EGR |= 0x20; 
}

/////////////////////////////////////////////////////////////////////////////
//
//�����źŲ���
////////////////////////////////////////////////////////////////////////////
#ifdef	ALM_FUN

void conconditon_chg(void)
{
	u8 hall_alm;
	hall_alm = rotor_position1;
	controlchg_flag = ALM_PORT;					//low voltage means that key is put down
    //controlchg_flag = 1 ;
	
	if(controlchg_flag == 0)					//read brake condition 
	{
		//sys_state_flag.bit.sf_flag = 0;
		if(alarm_switch != 1)                           
		{
			if(speed_motor2 >= 50)
			{
				if(control_wait_count < 20)
					control_wait_count += 1;	//��ť��������1
				else if(control_wait_count < 50)
				{
					control_wait_count ++;
					set_alarm_ready = 2;
				}
				else
				{
					control_wait_count = 50;
					alarm_switch = 1;
					running_alarm = 0;
				}
			}
			else
			{
				alarm_switch = 0;
				alm_hall_count = 0;
				hall_a_status = hall_alm;
				alm_lock_count = 0;
				dto_count = 0;
				dto_status = 0;
				motor_alm_status_lock = 0;
				hall_moved_count = 0;
				hall_change_count = 0;
				control_wait_count = 0;
				running_alarm = 1;
			}
		}
		else
		{
			control_wait_count = 50;
			alarm_switch = 1;
			running_alarm = 0;
		}
	}
	else 
	{
		if(alarm_switch == 1)
			set_alarm_ready = 1;
		alarm_switch = 0;
		alm_hall_count = 0;
		hall_a_status = hall_alm;
		alm_lock_count = 0;
		dto_count = 0;
		dto_status = 0;
		motor_alm_status_lock = 0;
		hall_moved_count = 0;
		hall_change_count = 0;
		control_wait_count = 0;
		running_alarm = 0;
	}

	if(motor_alm_status_lock == 1)
	{
		if(alm_lock_count >= 500)				//
		{
			alm_lock_count = 0;
			motor_alm_status_lock = 0;
			dto_count = 0;
			alm_hall_count = 0;
			hall_a_status = hall_alm;
		}
		else
		{
			alm_lock_count ++;
		}
	}
	else if(dto_status == 1)
	{
		if(dto_count == 1250)
		{
			dto_count = 0;
			dto_status = 0;
			alm_hall_count = 0;
			hall_a_status = hall_alm;
		}
		else
		{
			if(hall_a_status == hall_alm)
				dto_count ++;
			else
			{
				if(hall_change_count == 3)
				{
					if(alm_hall_count == 4)
					{
						motor_alm_status_lock = 1;
					//	pwm_duty_on_old = 0;
						hall_a_status = hall_alm;
						lock_hall = hall_a_status;
						alm_lock_count = 0;
						alm_hall_count = 0;
					}
					else
					{
						alm_hall_count ++;
						hall_a_status = hall_alm;
					}
					hall_change_count = 0;
					dto_count = 0;
				}
				else 
					hall_change_count ++;
			}
		}
	}
	else
	{
		if(hall_a_status == hall_alm)
		{
			if(hall_moved_count == 1250)
			{
				hall_moved_count = 1250;
				alm_hall_count = 0;
				hall_change_count = 0;
				hall_a_status = hall_alm;
			}
			else	
				hall_moved_count ++;
		}
		else
		{
			if(hall_change_count == 3)
			{
				if(alm_hall_count == 6)
				{
					dto_status = 1;     //  ������
					hall_a_status = hall_alm ;
					dto_count = 0;
					alm_hall_count = 0;
				}
				else
				{
					alm_hall_count ++;
					hall_a_status = hall_alm;
				}
				hall_change_count = 0;
				hall_moved_count = 0;
			}
			else	
				hall_change_count ++;
		}
	}
}

#endif
//////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////


void RotorSetSub(void)//nohall run
{
	PWM_ALL_OFF();
	rotor_position_sensor = IHALL_PORT;
	sensor_pwm_duty = Min_pwm_protion;
	current_max = start_current;

	motor_stop_count = 0;
	period_count = defperiod_count;
	delay_test_count = 0;
	pwm_add_count = 0;
	pwm_sub_count = 0;
	position_flag = 0;			// set flag 
	RoHallOk = 0;
	
	if(current_cmd_average > 0)
	{
		Restart_cont ++;
		if(Restart_cont > Re_Start_over_count)
			error_bank.bit.restart_flag = 1;
	}
	
	sensor_step = Sensorless_next[rotor_position_sensor];
	
	if(sensor_step >= 5)
	{
		sensor_step = 0;
	}
	else
		sensor_step += 1;	
	
	sensorless_rotor = rotor_position_sensor;
	back_sensor_step = sensorless_rotor;
	back_sensor_step2 =  sensorless_rotor;
	hall_ok_count = 0;
	rotor_count = 0;
}

/////////////////////////////////////////////////////////////////////////////
//SynchConSub()
/////////////////////////////////////////////////////////////////////////////

void SynchConSub(void)
{
	/*rotor_position_sensor = IHALL_PORT;
	delay_test_count ++;
	if(back_rotor_position_sensor == rotor_position_sensor)
	{
		rotor_count ++;
		if(rotor_count > 5)//DefNum)
		{
			if(setp_chk_hall[sensor_step] == rotor_position_sensor)
			{
				rotor_count = 0;
				if(sensor_step >= 5)
				{
					sensor_step = 0;
				}
				else
					sensor_step += 1;
				
				sensorless_rotor = rotor_position_sensor;
				
				if(back_sensor_step == setp_chk_last_hall[rotor_position_sensor])
				{
					hall_ok_count ++;
					if(hall_ok_count > 1)
						delay_test_count = 0;
				}
				else
				{
					hall_ok_count = 0;
				}
				
				if(hall_ok_count > 12)//(DefNum >> 2))			//У�����
				{
					ModeFlag = 1;
					speed_dn_count = 0;
					speed_ok_count = 0;
				}
				back_sensor_step = rotor_position_sensor;
			}
			else
			{
				if(rotor_count > (DefNum * 3))
				{
					sensor_step = Sensorless_next[rotor_position_sensor];
					delay_test_count = 0;
				}
				if(rotor_count > period_count)
				{
					rotor_count = 0;
					if(sensor_step >= 5)
					{
						sensor_step = 0;
					}
					else
						sensor_step += 1;					
				}
				sensorless_rotor = setp_dir_hall[sensor_step];
			}
		}
	}
	else
	{
		rotor_count = 0;
	}
	
	back_rotor_position_sensor = rotor_position_sensor;
	
	if(delay_test_count >= period_count)
	{
		delay_test_count = 0;
		sensor_step = Sensorless_next[rotor_position_sensor];
		
		if(sensor_step >= 5)
		{
			sensor_step = 0;
		}
		else
			sensor_step += 1;
		
		RoHallOk = 0;
		sensorless_rotor = setp_dir_hall[sensor_step];
		back_sensor_step = sensorless_rotor;
		back_sensor_step2 =  sensorless_rotor;		
	}
	
	sys_state_flag.bit.ph_flag = 0;
	sys_state_flag.bit.phs_flag = 0;
	ph_low_count_max = 0;
	pwm_duty_on = sensor_pwm_duty;
	pwm_duty_on_old = pwm_duty_on;*/
	signed char a;

	nohall_start_count ++;
	
		if(current_high_flag == 1)
		{
			pwm_add_count = 1;
			if(pwm_sub_count == 0)
			{
				if(pwm_duty_on_old > 240)
					pwm_duty_on_old = 240;	
					
				if(pwm_duty_on_old >= 10)
				{
					if(current_average1 > (current_max + (current_max >> 1)))
						pwm_duty_on_old -= (pwm_duty_on_old >> 3);
					else if(current_average1 > (current_max + (current_max >> 2)))
						pwm_duty_on_old -= (pwm_duty_on_old >> 4);
					else if(current_average1 > (current_max + (current_max >> 3)))
						pwm_duty_on_old -= (pwm_duty_on_old >> 5);
					else
						pwm_duty_on_old -= 1;
				}
				else
					pwm_duty_on_old = 0;
			}
			
			pwm_sub_count++;
			if(pwm_sub_count >= 15)				//4
				pwm_sub_count = 0;
				
		}
		else
		{
			pwm_sub_count = 1;
			//current_cmd_max_duty = 	current_cmd_average;
			if(current_cmd_average1 > pwm_duty_on_old)
			{
				if(pwm_duty_on_old < 10)
					pwm_duty_on_old = 10;
					
				if(pwm_add_count == 0)
				{
						pwm_duty_on_old += 1;
				}

				if(pwm_duty_on_old > 240)
					pwm_duty_on_old = 255;

				pwm_add_count++;
				if(pwm_add_count >= 5)
					pwm_add_count = 0;
			}
			else if(current_cmd_average1 < pwm_duty_on_old) //xz
			{
				if(pwm_cut_count == 0)
				{
					if(pwm_duty_on_old > 0)
						pwm_duty_on_old --;
				}
				pwm_cut_count ++;
				
				if(pwm_duty_on_old < 5) 
					pwm_duty_on_old = 0;
					
				if(pwm_cut_count >= 5)//5
					pwm_cut_count = 0;
			}
			
		}
		
		pwm_duty_on = pwm_duty_on_old;

	if(pwm_duty_on <= 32)
		pwm_duty_on = 32;
	if(pwm_duty_on >= 120)
		pwm_duty_on = 120;
	a = rotor_position;
	

	rotor_position = setp_chk_hall[nohall_step];
	
	if(startup_count < 254)
	{
		phase_lock_change(rotor_position);
		startup_count ++;
	}
	else if(startup_count == 254)
	{
		if(rotor_position1 != rotor_position)
			phase_lock_change(rotor_position);
		else
		{
			phase_change(rotor_position);
			startup_count = 255;
			if(nohall_step < 5)
				nohall_step ++;
			else
				nohall_step = 0;
		}
	}
	else
	{
		phase_change(rotor_position);

	if(rotor_position1 == hall_turetable[rotor_position])
	{
		if(nohall_ready_count < 10)
		{
			if(1)//(nohall_start_delay >= (nohall_start_delay_t[nohall_ready_count] << 1))
			{
				nohall_ready_count ++;
				nohall_start_count = 0;
				//nohall_step = Hall0;
				if(nohall_step < 5)
					nohall_step ++;
				else
					nohall_step = 0;
				nohall_start_delay =0;
				
				nspeed_motor = nhall_pwm_cont;
				nhall_pwm_cont = 0;
			}
			else
				nohall_start_delay ++;
		}
		else if(nspeed_motor < 100)
		{
			ModeFlag = 1;
			startup_count = 0;
			nohall_start_delay_count = 0;
			nohall_phase_change_delay = 0;
//			nohall_start_delay = nohall_start_delay_t[0];
			nohall_speed_low_count = 0;
			//hall_pwm_cont = 100;	//yy
			nohall_ready_count = 0;
			nohall_start_delay = 0;
			nohall_start_count = 0;
			startup_count = 0;
			nspeed_motor = 400;
			
			pwm_duty_on_old = pwm_duty_on;
		}
		else
		{
			nspeed_motor = nhall_pwm_cont;
			nhall_pwm_cont = 0;
			if(nohall_step < 5)
				nohall_step ++;
			else
				nohall_step = 0;
		}
		
		nohall_start_count = 0;
	}
	else
	{
		if(nhall_pwm_cont < 400)
			nhall_pwm_cont ++;
		else
			nspeed_motor = 400;
	}
	//else if(rotor_position1 != rotor_position)
		//nohall_ready_count = 0;
	//else
		//nohall_start_delay =0;

	}


	if(nohall_start_count == 16000)
	{	
		//startup_count = 0;
		nohall_ready_count = 0;
		nohall_start_count = 0;
		//nohall_start_delay = nohall_start_delay_t[29];
		if(nohall_step < 5)
			nohall_step ++;
		else
			nohall_step = 0;
	}
	
	/*if(ModeFlag == 1)
	{
		//rotor_position = rotor_position1;
		rotor_position2 = 0;
	}
	else*/
		rotor_position = a;
}

///////////////////////////////////////////////

void MotorStartSub(void)//nohall work
{
	if(position_flag == 1)//
		RotorSetSub();
	else
	{
		if((sys_state_flag.bit.current_over_flag > 0) || (sys_state_flag.bit.phcurrent_over_flag > 0))			//current limit
		{
			if(pwm_sub_count == 0)
			{
				if(sensor_pwm_duty > Min_pwm_protion)
					sensor_pwm_duty --;
			}
			pwm_sub_count++;
				
			if(pwm_sub_count >= 4)
				pwm_sub_count = 0;
		}
		else
		{
		 	if(sensor_pwm_duty < Max_pwm_protion)
			{
				if(pwm_add_count >= Start_PS_TIME)
				{
					sensor_pwm_duty ++;
					pwm_add_count = 0;
				}
				else
					pwm_add_count ++;
			}
		}
		SynchConSub();//
	}
}

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

void Motor_start_m(void)//
{
	if(sensor_pwm_duty > 0)//
	{
		phase_change(sensorless_rotor);
	}
}

///////////////////////////////////////////////////////////////

void dir_sf_mode(void)		//62.5* 64 = 4MS
{
	if(MODE_PORT > 0)//sf_read_flag == 0x02)
	{
		if(sf_wait_flag == 1)
		{
			if(sf_up_count >= 25)
			{
				if((mode_flag == 1)&&(sf_down_count <= 1499))
				{
					if(sys_state_flag.bit.sf_flag > 0)
						sys_state_flag.bit.sf_flag = 0;
					else
						mode_flag = 0;
				}
			 	else if(mode_flag == 0)
					mode_flag = 1;
				sf_down_count = 0;
				sf_wait_flag = 0;
		   	}
			else
				sf_up_count ++;
		}
		else
			sf_down_count = 0;
	}
	else
	{
		if(sf_wait_flag == 0)
		{
			if(sf_down_count >= 25)
			{
				sf_wait_flag = 1;
			}
			else
				sf_down_count ++;
		}
		else if(sf_down_count >= 1500)
		{
			sf_down_count = 1500;
			if((mode_flag == 1)&&(current_cmd_average >= 15)&&(sys_state_flag.bit.sf_flag == 0))
				sys_state_flag.bit.sf_flag = 1;
		}
		else
		{
			sf_down_count ++;
			sf_up_count == 0;
		}
	}	
}
void eco_sel(void)
{
	if(ECO_PORT == 0)
	{
		eco_on_count ++;
		if(eco_on_count > 50)
		{
			eco_on_count = 50;
			eco_off_count = 0;
			eco_flag = 1;
		}
	}
	else
	{
		eco_off_count ++;
		if(eco_off_count > 50)
		{
			eco_off_count = 50;
			eco_on_count = 0;
			eco_flag = 0;
		}		
	}
}

////////////////////////////////////////////////////
/*
void sf_sel_bscc(void)
{
	if(SF_CVT_PORT == 0)			//1500 * 4
	{							//4ms
		sf_up_count ++;
		if(sf_up_count > 20)
		{
			sf_down_count = 0;
			sys_state_flag.bit.sf_sel_flag = 1;
			if(sf_up_count >= 250)		//����1S
			{
				if((current_cmd_average > 15) && (speed_motor2 < 400))
				{
					if(sf_up_count < 3000)	//����6�룬�Զ�ȡ��Ѳ��
					{
						if((speed_num == 0))
							speed_num = 1;
					}
					else
					{
						speed_num = 0;
						sf_up_count = 3000;
					}
				}
				else
				{
					sf_up_count = 20;
				}
				sys_state_flag.bit.sf_flag = 0;
			}
		}
	}
	else
	{
		sf_down_count ++;
		if(sf_down_count > 20)
		{
			if((sf_up_count < 250) && (sys_state_flag.bit.sf_sel_flag > 0))
			{
				if(sys_state_flag.bit.sf_flag > 0)
				{
					sys_state_flag.bit.sf_flag = 0;
				}
				else
				{
					if(current_cmd_average >= 15)
						sys_state_flag.bit.sf_flag = 1;
				}
			}
			speed_num = 0;
			sf_down_count = 20;
			sf_up_count = 0;
			sys_state_flag.bit.sf_sel_flag = 0;
		}		
	}
	
	if(sys_state_flag.bit.sf_flag > 0)
	{
		SF_LIGHT_ON();
	}
	else
	{
		SF_LIGHT_OFF();
	}
}
*/
///////////////////////////////////////////////////
void sf_sel(void)
{


}
//////////////////////////////////////////////////////////////////

void sf_sel_on_off(void)
{

}
////////////////////////////////////////////////////
////////////////////////////////////////////////////
/*
void sf_sel_6A(void)
{
	if(SF_SEL_PORT == 0)			//1500 * 4
	{							//4ms
		if(sf_up_count > 20)		//
		{
			if((current_cmd_average > 15) && (speed_motor2 < 400) && (sys_state_flag.bit.spt_flag == 0))
			{
				sf_up_count ++;
				if(sf_up_count > 2000)		//����6�룬�Զ�Ѳ��
				{
					sf_up_count = 2000;
					sys_state_flag.bit.sf_flag = 1;
				}
			}
			else
			{
				sf_up_count = 20;
			}
			sf_down_count = 0;
			sys_state_flag.bit.sf_sel_flag = 1;
		}
		else
		{
			sf_up_count ++;
		}
	}
	else
	{
		sf_down_count ++;
		if(sf_down_count > 20)
		{
			sf_down_count = 20;
			if(sys_state_flag.bit.sf_sel_flag > 0)
			{
				if(sf_up_count < 2000)
				{
					if((current_cmd_average > 15) && (speed_motor2 < 400) && (sys_state_flag.bit.sf_flag == 0))
						sys_state_flag.bit.sf_flag = 1;
					else
						sys_state_flag.bit.sf_flag = 0;
				}
				else
				{
					sys_state_flag.bit.sf_flag = 0;
				}
			}
			sf_up_count = 0;
			sys_state_flag.bit.sf_sel_flag = 0;
		}
	}
	
	if(sys_state_flag.bit.sf_flag > 0)
	{
		SF_LIGHT_ON();
	}
	else
	{
		SF_LIGHT_OFF();
	}
}

*/



/////////////////////////////////////////////////////

void abs_sel(void)
{/*
	if(ABS_SEL_PORT == 0) //(ABS_SEL_PORT == 0)
	{
		abs_sel_up_count ++;
		if(abs_sel_up_count > 20)			//50*2ms = 100ms
		{
			abs_sel_up_count = 20;
			abs_sel_dn_count = 0;
			sys_state_flag.bit.abs_sel_flag = 1;
		}
	}
	else
	{
		abs_sel_dn_count ++;
		if(abs_sel_dn_count > 20)
		{
			abs_sel_dn_count = 20;
			abs_sel_up_count = 0;
			sys_state_flag.bit.abs_sel_flag = 0;
			sys_state_flag.bit.brake_charge_flag = 0;
		}
	}*/
}


/////////////////////////////////////////////////////////
void spt_sel(void)
{
/*	if(SPT_SEL_PORT > 0)
	{
		spt_sel_up_count ++;
		if(spt_sel_up_count > 20)
		{
			spt_sel_up_count = 20;
			spt_sel_dn_count = 0;
			sys_state_flag.bit.spt_sel_flag = 0;
		//	SPT_LIGHT_ON();
		}
	}
	else
	{
		spt_sel_dn_count ++;
		if(spt_sel_dn_count > 20)
		{
			spt_sel_up_count = 0;
			spt_sel_dn_count = 20;
			sys_state_flag.bit.spt_sel_flag = 1;
		//	SPT_LIGHT_OFF();
		}			
	}*/
}
/*
void spt_sel(void)
{
	if(SPT_SEL_PORT == 0)
	{
		spt_sel_up_count ++;
		if(spt_sel_up_count > 20)
		{
			spt_sel_up_count = 20;
			spt_sel_dn_count = 0;
			sys_state_flag.bit.spt_sel_flag = 1;
			sys_state_flag2.bit.EleDir_flag = 0;
		}
	}
	else if(ELEDIR_SEL_PORT == 0)
	{
		ele_sel_up_count ++;
		if(ele_sel_up_count > 20)
		{
			ele_sel_up_count = 20;
			spt_sel_dn_count = 0;
			sys_state_flag2.bit.EleDir_flag = 1;
			sys_state_flag.bit.spt_sel_flag = 0;
		}
	}
	else
	{
		spt_sel_dn_count ++;
		if(spt_sel_dn_count > 20)
		{
			spt_sel_up_count = 0;
			ele_sel_up_count = 0;
			spt_sel_dn_count = 20;
			sys_state_flag.bit.spt_sel_flag = 0;
			sys_state_flag2.bit.EleDir_flag = 0;
		}			
	}
}
*/

//////////////////////////////////////////////////////
/*
void spt_sel_6a(void)
{
	if(Auto_SPT == 0)
	{
		if(SPT_SEL_PORT == 0)
		{
			spt_sel_up_count ++;
			if(spt_sel_up_count > 20)
			{
				spt_sel_up_count = 20;
				spt_sel_dn_count = 0;
				if(spt_key_keep == 1)
				{
					if(sys_state_flag.bit.spt_sel_flag > 0)
						sys_state_flag.bit.spt_sel_flag = 0;
					else
						sys_state_flag.bit.spt_sel_flag = 1;
				}
				spt_key_keep = 0;
			}
		}
		else
		{
			spt_sel_dn_count ++;
			if(spt_sel_dn_count > 20)
			{
				spt_sel_up_count = 0;
				spt_sel_dn_count = 20;
				spt_key_keep = 1;			
			//	sys_state_flag.bit.spt_sel_flag = 0;
			}
		}
		
		if(sys_state_flag.bit.spt_sel_flag > 0)
			SPT_LIGHT_ON();
		else
			SPT_LIGHT_OFF();		
	}
	else
	{
		if(SPT_SEL_PORT == 0)
		{
			spt_sel_up_count ++;
			if(spt_sel_up_count > 20)
			{
				spt_sel_up_count = 20;
				spt_sel_dn_count = 0;
				sys_state_flag.bit.spt_sel_flag = 1;
			}			
		}
		else
		{
			spt_sel_dn_count ++;
			if(spt_sel_dn_count > 20)
			{
				spt_sel_up_count = 0;
				spt_sel_dn_count = 20;			
				sys_state_flag.bit.spt_sel_flag = 0;
			}			
		}

		if(sys_state_flag.bit.spt_flag > 0)
			SPT_LIGHT_ON();
		else
			SPT_LIGHT_OFF();
	}
	
	if(sys_state_flag.bit.spt_sel_flag == 0)
		sys_state_flag.bit.spt_flag = 0;
	

}
*/

///////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////
void debug_save(void)
{
	if(debug_mode_flag > 0)
	{
		if(debug_mode_flag == 2) //s-
		{
			if(user_Prdata.byte.current_adj >= 41)
				user_Prdata.byte.current_adj -= 1;
		}
		else if(debug_mode_flag == 3) //s+
		{
			if(user_Prdata.byte.current_adj <= 160)
				user_Prdata.byte.current_adj += 1;
		}
		else if(debug_mode_flag == 4) //b-
		{
			if(user_Prdata.byte.current_adj >= 41)
				user_Prdata.byte.current_adj -= 10;
		}
		else if(debug_mode_flag == 5) //b+
		{
			if(user_Prdata.byte.current_adj <= 160)
				user_Prdata.byte.current_adj += 10;
			else
				user_Prdata.byte.current_adj = 160;
		}
		else if(debug_mode_flag == 20)
		{
			if(user_Prdata.byte.ph_current_adj <= 200)
				user_Prdata.byte.ph_current_adj += 2;
			else
				user_Prdata.byte.ph_current_adj = 200;
		}
		else if(debug_mode_flag == 21)
		{
			if(user_Prdata.byte.ph_current_adj >= 50)
				user_Prdata.byte.ph_current_adj -= 2;
			else
				user_Prdata.byte.ph_current_adj = 50;
		}	
		else if((debug_mode_flag == 6)||(debug_mode_flag == 7)||(debug_mode_flag == 9)||(debug_mode_flag == 8)) //save
		{
			PWM_ALL_OFF();
			DI();
			if(debug_mode_flag == 6)  //save_voltage
			{
				user_Prdata.byte.voltage_adj = voltage_average;
			}
			eerprom_write();
			fr_count = 0;
			beep_dely = 0;
			while(1)
			{
				if(IRQ_UIF & TIM1_SR1)
				{
					TIM1_SR1 &= (~IRQ_UIF);
					if(beep_dely <= 500)
					{
						if(fr_count < 2)
						{
							break_dirve();
							fr_count ++;
						}
						else if(fr_count < 8)
						{
							PWM_ALL_OFF();
							fr_count ++;
						}
						else
						{
							beep_dely ++;
							fr_count = 0;
						}
					}
					else if(beep_dely <= 1000)
					{
						if(fr_count < 4)
						{
							break_dirve();
							fr_count ++;
						}
						else if(fr_count < 12)
						{
							PWM_ALL_OFF();
							fr_count ++;
						}
						else
						{
							beep_dely ++;
							fr_count = 0;
						}
					}
					else if(beep_dely <= 2000)
					{
						if(fr_count < 6)
						{
							break_dirve();
							fr_count ++;
						}
						else if(fr_count < 16)
						{
							PWM_ALL_OFF();
							fr_count ++;
						}
						else
						{
							beep_dely = 0;
							fr_count = 0;
						}
					}
					else
						beep_dely = 0;
				}
				WDT_FLASH();
			}
		}
		else if(debug_mode_flag == 11) //jin	//adbg
		{
			eerprom_write();
			while(1)
			{
				TIM1_CCR1H = 0;
				TIM1_CCR1L = 0;
	
				TIM1_CCR2H = 0;
				TIM1_CCR2L = 0;
		
				TIM1_CCR3H = 0;
				TIM1_CCR3L = 0;
				if(IRQ_UIF & TIM1_SR1)
				{
					TIM1_SR1 &= (~IRQ_UIF);
					if(debug_light_count < 4000)
					{
						debug_light_count ++;
						PWM_FLASH();
						PHASE_CCMR_CA();	
						PHASE_CA();
						TIM1_EGR |= 0x20;					//ˢ��PWM
					}
					else if(debug_light_count < 8000)
					{
						debug_light_count ++;
						PWM_ALL_OFF();
					}
					else
						debug_light_count = 0;
				}
				WDT_FLASH();
			}
		}//jin		
		
		if((debug_mode_flag != 1) && (debug_mode_flag != 13))//jin	//adbg
		{
			debug_mode_flag = 1;
			set_debug_mode = 1;
			set_debug_count = 0;
			debug_count_max = 1000;
		}
	}
}

//y42 ����
/////////////////////////////////////////////////////////////
void spt_chk_42(void)
{

	spt_condition0 = SPT_PORT;
	if (spt_condition0 == 0)
	{				
		if (spt_condition1 == 0)
		{
			if (spt_low_count > 88)	//16k
			{						
				//spt_flag = 0;
				current_cmd_spt = 0;
				spt_com_count = 0;
				//spt_high_count = 1000;
			}
			else
				spt_low_count ++;
		}
		else
		{
			if (spt_high_count > spt_low_count)
			{
				if (spt_com_count<2)
					spt_com_count ++;
				else if(current_cmd_spt < 330)
					current_cmd_spt += 50;
				else
					current_cmd_spt = 380;
			}
			else
			{	
				//spt_flag = 0;
				current_cmd_spt = 0;
				spt_com_count =0;
			}
			spt_high_count = 0;
			spt_low_count = 0;
		}
	}
	else if (spt_condition1 > 0)
	{
		if (spt_high_count > 88) //16k
		{	
			//spt_flag = 0;
			current_cmd_spt = 0;
			spt_com_count = 0;
		}
		else
			spt_high_count ++;
	}
	spt_condition1 = spt_condition0;
}

/////////////////////////////////////////////////////////////
void current_over(void) //every 48ms
{

}
/////////////////////////////////////////////////////////////
void current_dec(void)
{

}

/////////////////////////////////////////////////////////////
void hall_down_delay(void) //every 48ms
{
	if(error_bank.bit.hall_wron_flag == 1)				//������HALLת
	{
		if(hall_down_count > 8)
		{
			//error_bank.bit.hall_wron_flag = 0;	//y42
			sys_state_flag.bit.hall_exit = 1;
			/*if((speed_motor2 < 250) && (speed_motor2 > 4))//if(speed_motor2 < 180)
				ModeFlag = 1;			*/
		}
		else
			hall_down_count ++;
	}
}
///////////////////////////////////////////////////////
void cdpi_on_check(void)
{
	if(pwm_duty_on_last < (current_cmd_average + 5))
	{
		if((pwm_duty_on_last + 5) > current_cmd_average)
		{
			if(cdpi_start_count >= 50)
				cdpi_on_flag = 1;
			else
				cdpi_start_count ++;
		}
		else
		{
			cdpi_start_count = 0;
			cdpi_on_flag = 0;			
		}
	}
	else
	{
		cdpi_start_count = 0;
		cdpi_on_flag = 0;
	}
	
	pwm_duty_on_last = current_cmd_average; 	//cdpi
}
////////////////////////////////////////////////////
void cvt_sel(void)
{
	if(CVT_PORT == 0)
	{
		if(cvt_flag == 0)
		{
			if(cvt_on_count > 10)
				cvt_flag = 1;
			else
				cvt_on_count ++;
		}
		else
			cvt_off_count = 0;
	}
	else
	{
		if(cvt_flag == 1)
		{
			if(cvt_off_count > 10)
				cvt_flag = 0;
			else
				cvt_off_count ++;
		}
		else
			cvt_on_count = 0;
	}
}

void lv_display(void)
{
	if(pw_delay < 60)
	{
		LV_ON();
		pw_delay ++;
		if(voltage_average <= voltage_pulv)
		{
			if(pw_lv_count >= 20)
			{
				pw_delay = 60;
				lv_flash_flag |= 0x01;
			}
			else
				pw_lv_count ++;
		}
		else
			pw_lv_count = 0;
	}
	else
	{
		if((lv_flash_flag & 0x01) != 0x00)
		{
			if(lv_flash_count > 11)
			{
				lv_flash_count = 0;
				if((lv_flash_flag & 0x02) == 0x00)
				{
					lv_flash_flag |= 0x02;
					LV_ON();
				}
				else
				{
					lv_flash_flag &= 0xFD;
					LV_OFF();
				}
			}
			else
				lv_flash_count ++;
		}
		else
			LV_ON();
	}
	/*if(lv_flash_flag == 0)
	{
		lv_dw_count = 0;
		if(lv_up_count < 244)
			lv_up_count ++;
		else
		{
			lv_flash_flag = 1;
			LV_ON();
		}
	}
	else
	{
		lv_up_count = 0;
		if(lv_dw_count < 244)
			lv_dw_count ++;
		else
		{
			lv_flash_flag = 0;
			LV_OFF();
		}
	}*/
		
}
void current_cmd_protect_sample(void)
{
	
}

void nohall_control(void)	//nnh  speed control
{
	if(speed_motor_time < 69)
		speed_motor_time ++;
	else
	{
		speed_motor_nohall = hall_count_nohall;
		speed_motor_time = 0;
		hall_count_nohall = 0;
	}

	nohall_pwm = speed_motor_nohall;
	//if(nohall_pwm < pwm_duty_on)
		//nohall_pwm = pwm_duty_on;
	
	if(nohall_pwm < 30)
		nohall_pwm = 0;
	if(nohall_pwm > 256)
		nohall_pwm = 256;
	//\\nohall_pwm = 0;
	TIM1_CCMR4 = PWM_MODE1;
	TIM1_CCER2 = BH_ON;
	
	pwm_duty_low = (nohall_pwm);
	pwm_duty_high = (nohall_pwm)>>8;
	TIM1_CCR4H = pwm_duty_high;
	TIM1_CCR4L = pwm_duty_low;
	
}

////////////////////////////////////////////////////////////////


void cvt_ver_cal(void)//cross zero
{
	/*if(current_average1 <= 5)
	{
		if((rotor_position == 4) && (hall_pwm_cont == 0))	
		{
			if(cvt_ver > 0)
				cvt_ver --;
			if(cvt_ver < 0)
				cvt_ver ++;
		}
	}*/
	{
		if(CROSS0_PORT == 0)
		{
			if(cross0_port_flag == 1)
			{
				cross0_port_flag = 0;
				cross0_pos_hall = svpwm_rotor_position;
				cross0_pos_hall_ver = hall_ver;
			}
		}
		else
		{
			if(cross0_port_flag == 0)
			{
				cross0_port_flag = 1;
				cross0_neg_hall = svpwm_rotor_position;
				cross0_neg_hall_ver = hall_ver;
			}
		}
		/*if(AD_Value < 10)
		{
			if(cvt_ver<0)cvt_ver++;
			else if(cvt_ver > 0)cvt_ver--;
			else cvt_ver = 0;
		}
		else*/if(speed_motor3 < 1000)//��������
		{
			if((rotor_position == 4) && (hall_pwm_cont == 0))	
			{
				if((cross0_pos_hall == 3) || (cross0_pos_hall == 2) || ((cross0_pos_hall == 6) && (cross0_pos_hall_ver < 128)))
				{
					if(cvt_ver > -250)
						cvt_ver -=1;
				}
				else if((cross0_pos_hall == 5) || (cross0_pos_hall == 4) || ((cross0_pos_hall == 6) && (cross0_pos_hall_ver > 128)))
				{
					if(cvt_ver < 250)
						cvt_ver +=1;
				}	
			}
		}
		
		else
			cvt_ver = 0;
	}
	/*if(current_cmd_average == 0)
	{
		if(cvt_ver > 0)
		{
			if(cvt_ver > 10)
				cvt_ver -= 10;
			else
				cvt_ver = 0;
		}
		
		if(cvt_ver < 0)
			cvt_ver ++;
	}		*/
}

void lock_c_v(void)
{
	if(LOCK_PORT == 0)
	{
		if(lock_port_low_count < 20)
			lock_port_low_count ++;
		else
		{
			if(lock_port_low_count < 52)
			{
				lock_port_low_count ++;
				if(current_average1 < 20)
					current_adj_sum += user_Prdata.byte.current_adj;
				else
					current_adj_sum += current_average1;
				voltage_adj_sum += voltage_average;
			}
			else
			{
				user_Prdata.byte.current_adj = current_adj_sum >> 5;
				user_Prdata.byte.voltage_adj = voltage_adj_sum >> 5;
				DI();
				eerprom_write();
			}
		}
	}
	else
	{
		lock_port_low_count = 0;
		current_adj_sum = 0;
		voltage_adj_sum = 0;
	}	
}