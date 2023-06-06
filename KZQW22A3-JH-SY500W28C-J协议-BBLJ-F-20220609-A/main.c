/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "hand_tble.h" 
//#include "main_h.h"
//

///////////////////////////////////////
unsigned char sys_step = 0;
///////////////////////////////////////////////
//unsigned char xi=0,xk=0;
//void uart2_send_data(void);
void Init_UART2(void);
void data_load(void);
////////////////////////////////////////////////////////////////
main()
{
 	DI();
	WDT_INI();	
	RAM_INI();
	OPTIONSET_INI();	
	OSC_INI();
	IO_INI();
	TM1_INI();
	TM2_INI();
	AD_INI();
//	CLP_ON();			//打开下三桥电源
	EI();
	Init_UART2();
	data_load();
	//y42
	current_s = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 5);
	current_s1 = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 3);
	current_s2 = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 2);
	while(1)
	{

		_asm("nop");
		
		/*if((UART2_SR & 0x80) != 0)
		{
			UART2_DR = data_tx[xk];
			if(xk < 8) xk += 1;
			else xk = 0;
		}*/
			//	_asm("wfi");
		//uart2_send_data();
		_asm("nop");
	}
}

void data_load(void)
{
	voltage_count = 10;
	voltage1 = user_Prdata.byte.voltage_adj;
	voltage2 = voltage1; 
	send_data_flag = 0;
	current_cmd_protect_average= 280; 
	speed_bike = 0;
	hand_no_speed_limit = 0;
	//limit_speed_hall = 14;//15;// 25KM LIMIT 
	limit_speed_hall_1 = 135;//20
	speed_bike_load_count = 0;
	//limit_speed_hall_2 = (limit_speed_hall * 6) >> 3;//27
//limit_speed_hall_3 = (limit_speed_hall * 6 ) >> 3;//27
//	time_100ms = 0;
	start_2s_count = 10;
	bike_rpm = 1;
	zero_add_torque = 30;
	lj_change_time_count = 0;
	lj_ad_app_change = 0;
	max_speed_limit = 32;
}

void OSC_INI(void)
{		//int osc 16mhz
	CLK_CKDIVR = 0x00;			//FMAST = 16MHZ,FCPU = 16MHZ
	
	CLK_ICKR |= 0x01;			//使能LRC HRC//16mhz内部时钟
	CLK_ICKR &= 0xF7;
	
	while((CLK_ICKR & 0xFD) == 0);//等待 HRC RADY
	
	if(CLK_CMSR != HSI)
		CLK_SWR = HSI;			//使用内部高速时钟，默认状态
	
	CLK_SWCR |= 0x02;
	
	CLK_PCKENR2 = 0x00;			//关闭外设时钟
	CLK_PCKENR1 = 0x08;			//关闭外设时钟	//uart 
	////**********************//////
	
	CLK_CKDIVR = 0x00;			//16mhz内部时钟
	CLK_SWIMCCR = 0x00;			//SWIM _CLK 
	
	CLK_CSSR |= 0x01;			//启动时钟安全系统	
}
///////////////////////////////////////////////
///////////////////////////////////////////////
void IO_INI(void)
{
#ifdef   S58
	PA_ODR |= 0x00;			//0~7	
	PA_DDR |= 0x20;			//输入口
	PA_CR1 |= 0xFF;			//启用内部上啦
	PA_CR2 |= 0x20;			//输入模式是禁止外部中断，
	
	PB_ODR |= 0x00;//0x07;//0x00;//	//0X00		//0~7		/PWM下桥
	PB_DDR |= 0x07;			//
	PB_CR1 |= 0x0F;			//
	PB_CR2 |= 0x0F;			//
	
	PC_ODR |= 0x00;			//0~7		/PWM上桥
	PC_DDR |= 0x1E;			//
	PC_CR1 |= 0xFF;			//
	PC_CR2 |= 0x1E;			//	
	
	PD_ODR |= 0x00;			//0~7	
	PD_DDR |= 0x21;			//
	PD_CR1 |= 0xFF;			//
	PD_CR2 |= 0x00;			//	
	
	PE_ODR |= 0x00;			//0~7	
	PE_DDR |= 0x40;			//
	PE_CR1 |= 0xFF;			//
	PE_CR2 |= 0x00;			//		
	
	PG_ODR |= 0x00;			//0~7	
	PG_DDR |= 0x01;			//
	PG_CR1 |= 0xFF;			//
	PG_CR2 |= 0x01;			//
#endif
}
//////////////////////////////////


////////////////////////////////////////////////////////////////////////////
void WDT_INI(void)
{
	IWDG_KR = 0x55;		//开锁
	IWDG_PR = 0x03;		//看门狗分频  64K/32 =  2K = 500US    4,8,16,32,64,128,256,
	IWDG_RLR = 20;		//20*500us = 10ms
	IWDG_KR = 0xAA;		//上锁
	IWDG_KR = 0xCC;		//启动看门狗
}


////////////////////////////////////////////////////////////////////////////
void SPI_ini(void)
{
	CLK_PCKENR1 |= 0x02;				//使能SPI时钟
	
	
	
	
	
}

////////////////////////////////////////////////////////////////////////////
void sci_ini(void)
{
	CLK_PCKENR1 |= 0x04;			//使能uart时钟
	
	
	
	
	
	
	
}
////////////////////////////////////////////////\
//PWM初始化，16k，分辨率500
//
//
//
////////////////////////////////////////////////
void TM1_INI(void)
{
	CLK_PCKENR1 |= 0x80;		//使能TIM1时钟
	
	TIM1_OISR = 0x00;				//
	TIM1_PSCRH  = 0x00;   
	TIM1_PSCRL  = 0x01;   

	TIM1_ARRH   = 0x01;   
	TIM1_ARRL   = 0x00;
	TIM1_RCR    = 0x01;   		//03 8k   01 16k

	TIM1_CCR1H = (u8)(500 >> 8);
	TIM1_CCR1L = (u8)500;
	
	TIM1_CCR2H = (u8)(500 >> 8);
	TIM1_CCR2L = (u8)500;
	
	TIM1_CCR3H = (u8)(500 >> 8);
	TIM1_CCR3L = (u8)500;
	
	TIM1_CCR4H  = 0x00;
	TIM1_CCR4L  = 0x00;
	
	SVPWM_PH();
	TIM1_EGR |= 0x20;					//刷新PWM	

	TIM1_IER    = 0x81;   				//启动break and updata IE	
	
#ifdef LP_PWM	
	TIM1_DTR = 0x5f;	//0x85					//8*FTIM = 1us 死区时间//6us
#else
		TIM1_DTR = 0x58;//39;						//8*FTIM = 1us 死区时间
#endif
	//TIM1_CR2   = 0x21;	
	TIM1_CR2   = 0x21;					//更新事件被选为触发输入
	
	TIM1_BKR    = 0x92; 				//b2
	
	TIM1_CR1    = 0xA5; 				//中间对齐模式，向下计数时触发中断。
	TIM1_CCER2 = ((TIM1_CCER2 & 0x1f) | 0x10);
	TIM1_CCMR4 = PWM_MODE1;
	PWM_ALL_OFF();
	TIM1_EGR   |= 0x01;
}
////////////////////////////////////////////////////////////////////////
void NOHALL_TIM1(void)
{
	CLK_PCKENR1 |= 0x80;		//使能TIM1时钟
	TIM1_OISR = 0x00;				//
	TIM1_PSCRH  = 0x00;   
	TIM1_PSCRL  = 0x01;   
	TIM1_ARRH   = 0x01; 
	TIM1_ARRL   = 0x00;
	TIM1_RCR    = 0x01;   		//03 8k   01 16k 
	TIM1_CCMR1 = PWM_HOLD_OFF;   
	TIM1_CCMR2 = PWM_HOLD_OFF;   
	TIM1_CCMR3 = PWM_HOLD_OFF; 
	TIM1_CCMR4 = PWM_HOLD_OFF;		
	TIM1_CCER1 = PWM_ALLON; 			
	TIM1_CCER2 = (PWM_ALLON) & 0xff;			
	TIM1_CCR1H  = 0x00;    
	TIM1_CCR1L  = 0x00;
	TIM1_CCR2H  = 0x00;   
	TIM1_CCR2L  = 0x00;
	TIM1_CCR3H  = 0x00;   
	TIM1_CCR3L  = 0x00;
	TIM1_CCR4H  = 0x00;
	TIM1_CCR4L  = 0x00;
	TIM1_IER    = 0x81;   				//启动break and updata IE	
	TIM1_DTR = 0;
	TIM1_CR2   = 0x21;					//更新事件被选为触发输入
	TIM1_BKR    = 0x92; 				//b2
	TIM1_CR1    = 0xA5; 				//中间对齐模式，向下计数时触发中断。
	PWM_ALL_OFF();
	TIM1_EGR   |= 0x01;
}
//////////////////////////////////////////////////////////////////////////////
void TM2_INI(void)
{
	CLK_PCKENR1 |= 0x20;		//使能TIM2时钟
	
	TIM2_CNTRH = 0x00; //TIM2计数器高8位(TIM1_CNTRH)
	TIM2_CNTRL = 0x00;
	
	TIM2_SR1 &= 0x00;  //状态寄存器1
	TIM2_SR2 &= 0x00;
	
	TIM2_PSCR = 0x08;  //time2两分频   2
	
	TIM2_CCMR1 = 0x01;   
	TIM2_CCMR2 = 0x01;   
	TIM2_CCMR3 = 0x01; 
	
	TIM2_CCER1 = 0x11; 			
	TIM2_CCER2 = 0x01;			
	
	TIM2_CCR1H  = 0x00;    
	TIM2_CCR1L  = 0x00;
	TIM2_CCR2H  = 0x00;   
	TIM2_CCR2L  = 0x00;
	TIM2_CCR3H  = 0x00;   
	TIM2_CCR3L  = 0x00;

	//TIM1_IER    = 0x81;   				//启动break and updata IE	
	
	TIM2_CR1    = 0x01; 				//中间对齐模式，向下计数时触发中断。
	
	TIM2_ARRH   = 0xEA;   
	TIM2_ARRL   = 0x60;
	
	TIM2_EGR   |= 0x01;
}

//////////////////////////////////////////////////
void RAM_INI(void)
{
	error_bank.all_flag = 0;
	sys_state_flag.all_flag = 0;
	Alarm_Flag.all_flag = 0;
	sys_state_flag2.bit.chg_mode_cc = 1;
	sys_state_flag2.bit.start_flag = 1;
//	sys_state_flag2.bit.GB_alarm_start = 1;
//	sys_state_flag.bit.hall_exit = 1; 
	pwm_duty_on_old = 0;
	pwm_duty_on = 0;
	run_flag = 0;
	sc_current_count = 0;
	current_zero_count = 0;
	sc_ref = 0;
	speed_num = 1;
	current_cmd_average = 0;
	delay_counter = 0;
	ph_low_count_max = 0;  
	flash_count = 10;
	sys_start_time = 0;
	uart_dan_mode = 4;
	Auto_SPT = 0;
	eeprom_read(); 
	
	
	if((user_Prdata.byte.voltage_adj > 700) || (user_Prdata.byte.voltage_adj == 0))
		user_Prdata.byte.voltage_adj = 357;//495;//475;//654
		
	if((user_Prdata.byte.current_adj > 160) || (user_Prdata.byte.current_adj == 0))
		user_Prdata.byte.current_adj = 60;//126;
		
	if((user_Prdata.byte.limit_adj > 500) || (user_Prdata.byte.limit_adj == 0))
		user_Prdata.byte.limit_adj = 280;
		
	if((user_Prdata.byte.ph_current_adj > 100) || (user_Prdata.byte.ph_current_adj == 0))
		user_Prdata.byte.ph_current_adj = PH_CURRENT_MAX;

	if((cvt_torlance_save > 200)||(cvt_torlance_save == 0))
		cvt_torlance_save = 60;
		
	voltage_adj_table54 = (user_Prdata.byte.voltage_adj * 54)/42;
	voltage_adj_table49 = (user_Prdata.byte.voltage_adj * 49)/42;
	voltage_adj_table48 = (user_Prdata.byte.voltage_adj * 48)/42;
	voltage_adj_table47 = (user_Prdata.byte.voltage_adj * 47)/42;
	voltage_adj_table46 = (user_Prdata.byte.voltage_adj * 46)/42;
	voltage_adj_table45 = (user_Prdata.byte.voltage_adj * 45)/42;
	voltage_adj_table42 = (user_Prdata.byte.voltage_adj * 42)/42;
//	current_adj_lowp;
	delvoltage = voltage_adj_table47 - user_Prdata.byte.voltage_adj;
	//MAX_P = voltage_adj_table49 * user_Prdata.byte.current_adj;
	//MAX_protect = voltage_adj_table48 * 500; 
	
	low_current_cmd_protect = 500;
	
	current_adj_lowp = user_Prdata.byte.current_adj;
	current_adj_table[0] = (user_Prdata.byte.current_adj >> 4);
	current_adj_table[1] = (user_Prdata.byte.current_adj >> 3);											//1/8
	current_adj_table[2] = (user_Prdata.byte.current_adj >> 2);											//2/8
	current_adj_table[3] = (user_Prdata.byte.current_adj >> 2) + (user_Prdata.byte.current_adj >> 3);	//3
	current_adj_table[4] = (user_Prdata.byte.current_adj >> 1);											//4
	current_adj_table[5] = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 3);	//5
	current_adj_table[6] = (user_Prdata.byte.current_adj >> 1) + (user_Prdata.byte.current_adj >> 2);	//6
	current_adj_table[7] = user_Prdata.byte.current_adj - (user_Prdata.byte.current_adj >> 3);			//7/8
	current_adj_fifteen = user_Prdata.byte.current_adj*15/18;
	current_adj_I = user_Prdata.byte.current_adj >> 1;	//yn42
	current_adj_II = user_Prdata.byte.current_adj - (user_Prdata.byte.current_adj >> 2);	//yn42
	current_adj_III = user_Prdata.byte.current_adj;
	current_adj_battry = user_Prdata.byte.current_adj / 13 * 6;
	//current_adj_battry1 = user_Prdata.byte.current_adj / 26 ;
	
	ph_current_adj_table[1] = (user_Prdata.byte.ph_current_adj >> 3);
	ph_current_adj_table[2] = (user_Prdata.byte.ph_current_adj >> 2);
	ph_current_adj_table[3] = (user_Prdata.byte.ph_current_adj >> 2) + (user_Prdata.byte.ph_current_adj >> 3);
	ph_current_adj_table[4] = user_Prdata.byte.ph_current_adj >> 1;
	ph_current_adj_table[5] = (user_Prdata.byte.ph_current_adj >> 1) + (user_Prdata.byte.ph_current_adj >> 3);
	ph_current_adj_table[6] = (user_Prdata.byte.ph_current_adj >> 1) + (user_Prdata.byte.ph_current_adj >> 2);
	ph_current_adj_table[7] = user_Prdata.byte.ph_current_adj - (user_Prdata.byte.ph_current_adj >> 3);
	
	voltage_adj_table[0] = (user_Prdata.byte.voltage_adj >> 3);											//1/8
	voltage_adj_table[1] = (user_Prdata.byte.voltage_adj >> 2);											//2/8
	voltage_adj_table[2] = (user_Prdata.byte.voltage_adj >> 1);											//4/8
	voltage_adj_table[3] = (user_Prdata.byte.voltage_adj - (user_Prdata.byte.voltage_adj >> 2));		//6/8
	
	
	Current_temp.byte.current5 = user_Prdata.byte.current_adj;
	
	delay_counter = Current_temp.byte.current5;				//100%

	delay_counter = delay_counter*9;

	Current_temp.byte.current4 = delay_counter/10;			//90%

	delay_counter -= Current_temp.table[4];
	Current_temp.byte.current3 = delay_counter/10;			//80%

	delay_counter -= Current_temp.table[4];
	Current_temp.byte.current2 = delay_counter/10;			//70%

	delay_counter -= Current_temp.table[4];
	Current_temp.byte.current1 = (delay_counter/10);		//60%

	delay_counter = 0;

	voltage_table [4] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) + (user_Prdata.byte.voltage_adj >> 5) + (user_Prdata.byte.voltage_adj >> 7) + (user_Prdata.byte.voltage_adj >> 8);
	voltage_table [4] = voltage_table [4] - (voltage_table [4]>>4);

	voltage_table [3] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) + (user_Prdata.byte.voltage_adj >> 6) + (user_Prdata.byte.voltage_adj >> 7);
	voltage_table [3] = voltage_table [3] - (voltage_table [3]>>4);

	voltage_table [2] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 8) + (user_Prdata.byte.voltage_adj >> 7);
	voltage_table [2] = voltage_table [2] - (voltage_table [2]>>4);

	voltage_table [1] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 6) + (user_Prdata.byte.voltage_adj >> 8);
	voltage_table [1] = voltage_table [1] - (voltage_table [1]>>4);

	voltage_table [0] = user_Prdata.byte.voltage_adj + (user_Prdata.byte.voltage_adj >> 2) - (user_Prdata.byte.voltage_adj >> 4) + (user_Prdata.byte.voltage_adj >> 5);
	voltage_table [0] = voltage_table [0] - (voltage_table [0]>>4);

	current_adj_table_add[0] = user_Prdata.byte.current_adj + current_adj_table[4];
	current_adj_table_add[1] = user_Prdata.byte.current_adj + current_adj_table[3];
	current_adj_table_add[2] = user_Prdata.byte.current_adj + current_adj_table[1];
	
	//current_v = user_Prdata.byte.current_adj - 10;	//y42
	current_v = user_Prdata.byte.current_adj;	//y42
	current_temp = user_Prdata.byte.current_adj;
	current_speed = (user_Prdata.byte.current_adj*16)/18;
	current_max = user_Prdata.byte.current_adj;
	step_current = (current_max >> 4);			//
	start_current = current_speed;
	current_max_low_step = (current_max >> 1);
	
	sp_ph_current_limit_max = user_Prdata.byte.current_adj;	
	sp_ph_current_limit_10p = user_Prdata.byte.current_adj / 10;
	sp_ph_current_limit_20p = user_Prdata.byte.current_adj * 2 / 10;
	sp_ph_current_limit_30p = user_Prdata.byte.current_adj * 3 / 10;
	sp_ph_current_limit_40p	= user_Prdata.byte.current_adj * 4 / 10;
	sp_ph_current_limit_50p = user_Prdata.byte.current_adj * 5 / 10;
	sp_ph_current_limit_60p =	user_Prdata.byte.current_adj * 6 / 10;
	sp_ph_current_limit_70p = user_Prdata.byte.current_adj * 7 / 10;
	sp_ph_current_limit_80p = user_Prdata.byte.current_adj * 8 / 10;
	sp_ph_current_limit_90p = user_Prdata.byte.current_adj * 9 / 10;
	
	current_adj_12 = (u16)(user_Prdata.byte.current_adj*12/17);//ECO
	current_3a = user_Prdata.byte.current_adj/6;
	voltage_average_L = user_Prdata.byte.voltage_adj *22/21 ;
	voltage_average_L1 = user_Prdata.byte.voltage_adj ;
	voltage_average_H = user_Prdata.byte.voltage_adj;
	voltage_average_H = (voltage_average_H * 9)/6+(user_Prdata.byte.voltage_adj >> 4);//(voltage_average_H * 9)/6;(user_Prdata.byte.voltage_adj >> 4);
	
	current_adj_18a = user_Prdata.byte.current_adj * 18 / 20;
	current_adj_10a = user_Prdata.byte.current_adj * 10 / 17;
	
	cvt_add = (cvt_torlance_save >> 1);///5/8
	
}


void Init_UART2(void)//stm8s105c6只有异步串行口2可以使用
{
		UART2_CR1=0x00;
		UART2_CR2=0x00;
		UART2_CR3=0x00;		
		// 设置波特率，必须注意以下几点：
		//    (1) 必须先写BRR2
		//    (2) BRR1存放的是分频系数的第11位到第4位，
		//    (3) BRR2存放的是分频系数的第15位到第12位，和第3位
		//        到第0位
		// 例如对于波特率位9600时，分频系数=2000000/9600=208
		// 对应的十六进制数为00D0，BBR1=0D,BBR2=00
		//UART2_BRR2=0x00;
		//UART2_BRR1=0x0d;
		UART2_BRR2=0x02;
		UART2_BRR1=0x68;
		UART2_CR2=0x0c;//允许接收，发送
		//UART2_CR2=0x2c;//允许接收，发送，开接收中断
}

/*void UART2_sendchar(unsigned char data)
{
	while((UART2_SR & 0x80)==0x00);
	UART2_DR=data;
}*/




				




