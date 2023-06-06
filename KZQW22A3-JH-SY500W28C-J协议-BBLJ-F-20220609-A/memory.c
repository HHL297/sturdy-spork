#include "hand_tble.h" 

volatile unsigned char OPT0 	@0x4800;
volatile unsigned char OPT1 	@0x4801;
volatile unsigned char NOPT1 	@0x4802;
volatile unsigned char OPT2 	@0x4803;
volatile unsigned char NOPT2 	@0x4804;
volatile unsigned char OPT3 	@0x4805;
volatile unsigned char NOPT3 	@0x4806;
volatile unsigned char OPT4 	@0x4807;
volatile unsigned char NOPT4 	@0x4808;
volatile unsigned char OPT5 	@0x4809;
volatile unsigned char NOPT5 	@0x480A;
volatile unsigned char OPT6 	@0x480B;
volatile unsigned char NOPT6 	@0x480C;
volatile unsigned char OPT7 	@0x480D;
volatile unsigned char NOPT7 	@0x480E;
volatile unsigned char OPTBL 	@0x487E;
volatile unsigned char NOPTBL 	@0x487F;



volatile unsigned char eeprom_rom_0 	@0x4000;
volatile unsigned char eeprom_rom_1 	@0x4001;
volatile unsigned char eeprom_rom_2 	@0x4002;
volatile unsigned char eeprom_rom_3 	@0x4003;
volatile unsigned char eeprom_rom_4 	@0x4004;
volatile unsigned char eeprom_rom_5 	@0x4005;
volatile unsigned char eeprom_rom_6 	@0x4006;
volatile unsigned char eeprom_rom_7 	@0x4007;
volatile unsigned char eeprom_rom_8 	@0x4008;
volatile unsigned char eeprom_rom_9 	@0x4009;
volatile unsigned char eeprom_rom_a 	@0x400A;
volatile unsigned char eeprom_rom_b 	@0x400B;
volatile unsigned char eeprom_rom_c 	@0x400C;
volatile unsigned char eeprom_rom_d 	@0x400D;
volatile unsigned char eeprom_rom_e 	@0x400E;
volatile unsigned char eeprom_rom_f 	@0x400F;

volatile unsigned char eeprom_rom_end 	@0x427F;
volatile unsigned char MCU_ID[12] 		@0x4865;

#define OPT0_ROP_READOUT_PROTECTION 	(0xAA)

#define OPT1_UBC(n)					(n)
#define OPT2_DEFAULT				0x00
#define OPT2_AFR7_ALTERNATIVE		0x80
#define OPT2_AFR6_ALTERNATIVE		0x40
#define OPT2_AFR5_ALTERNATIVE		0x20
#define OPT2_AFR4_ALTERNATIVE		0x10
#define OPT2_AFR3_ALTERNATIVE		0x08
#define OPT2_AFR2_ALTERNATIVE		0x04
#define OPT2_AFR1_ALTERNATIVE		0x02
#define OPT2_AFR0_ALTERNATIVE		0x01


#define OPT0_DATA					OPT0_ROP_READOUT_PROTECTION			//使能读保护 0xaa OPT0_ROP_READOUT_PROTECTION
#define OPT1_DATA					0x00
#ifdef 	T20_V1
	#define OPT2_DATA				((OPT2_DEFAULT | OPT2_AFR0_ALTERNATIVE) | OPT2_AFR1_ALTERNATIVE) //| OPT2_AFR3_ALTERNATIVE
#else
	#define OPT2_DATA				((OPT2_DEFAULT | OPT2_AFR5_ALTERNATIVE)) //| OPT2_AFR3_ALTERNATIVE
#endif
#define OPT3_DATA					0x00
#define OPT4_DATA					0x00
#define OPT5_DATA					0x00		
#define OPT6_DATA					0x00
#define OPT7_DATA					0x00
#define OPTBL_BL					0x00


#define SYS_KEY						0x56			//系统密锁  0x400a
#define NSYS_KEY					0xAE			//系统密锁	0x400b

#define DUL		(3)
#define EOP		(2)

#define OPT		(7)
#define WPRG	0x40
#define ERASE	0x20
#define FPRG	0x10
#define PRG		0x01


extern unsigned int AD_ValueH ;
extern unsigned char AD_ValueL ;
extern unsigned int control_temp;

void add_protel(void);
void Read_MCU_ID(void);

void OPTIONSET_def(void)
{
	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
	while(!(FLASH_IAPSR & (1<<DUL)));
	
	FLASH_CR2 	|= (unsigned char)(1<<OPT);
	FLASH_NCR2 	&= (unsigned char)(~(1<<OPT));

	OPT0 = (unsigned char)(0x00);
	WDT_FLASH();
	
	OPT1 = (unsigned char)(OPT1_DATA);
	NOPT1 = (unsigned char)(0xff ^ (OPT1_DATA));
	WDT_FLASH();
	
	NOPT2 = (unsigned char)(0xff ^ (OPT2_DATA));		
	OPT2 = (unsigned char)(OPT2_DATA);	
	
	WDT_FLASH();
	OPT3 = (unsigned char)(OPT3_DATA);
	NOPT3 = (unsigned char)(0xff ^ (OPT3_DATA));	
	WDT_FLASH();
	
	OPT4 = (unsigned char)(OPT4_DATA);
	NOPT4 = (unsigned char)(0xff ^ (OPT4_DATA));	
	WDT_FLASH();
	OPT5 = (unsigned char)(OPT5_DATA);
	NOPT5 = (unsigned char)(0xff ^ (OPT5_DATA));	
	WDT_FLASH();
//	OPT6 = (unsigned char)(OPT6_DATA);
//	NOPT6 = (unsigned char)(~ (OPT6_DATA));	
//	WDT_FLASH();
//	OPT7 = (unsigned char)(OPT7_DATA);
//	NOPT7 = (unsigned char)(~ (OPT7_DATA));	
//	WDT_FLASH();
//	OPTBL = (unsigned char)(OPTBL_BL);
//	NOPTBL = (unsigned char)(~ (OPTBL_BL));
//	WDT_FLASH();
	
	FLASH_CR2 	&= (unsigned char)(~(1<<OPT));
	FLASH_NCR2 	|= (unsigned char)(1<<OPT);
	WDT_FLASH();
	FLASH_IAPSR &= (unsigned char)(~(1<<DUL));	
}

//////////////////////////////////////////////////////////////////////////////////
void OPTIONSET_INI(void)
{
#ifdef DEBUG_MODE
	if((OPT1 != (OPT1_DATA)) || (OPT2 != (OPT2_DATA)) || (OPT3 != (OPT3_DATA)) || (OPT4 != (OPT4_DATA)) || (OPT5 != (OPT5_DATA)))
	{
		OPTIONSET_def();
		eerprom_write();
	}
#else
	if((eeprom_rom_6 == SYS_KEY) && (eeprom_rom_7 == NSYS_KEY))
	{
		if((eeprom_rom_a != (u8)(control_temp >> 8)) || (eeprom_rom_b != (u8)control_temp))
		{
			add_protel();
			eerprom_write();
		}
	}


	if((OPT0 != (OPT0_ROP_READOUT_PROTECTION)) || (OPT1 != (OPT1_DATA)) || (OPT2 != (OPT2_DATA)) || (OPT3 != (OPT3_DATA)) || (OPT4 != (OPT4_DATA)) || (OPT5 != (OPT5_DATA)))
	{
		add_protel();
		if(eeprom_rom_e > 2)
		{
			clear_sys_key();
		//	while(1);
		}
		else
		{
			FLASH_IAPSR	|= 0x08;
			FLASH_DUKR = 0xAE;
			FLASH_DUKR = 0x56;
			
			FLASH_CR2 = 0;
			FLASH_NCR2 = 0xFF;
			FLASH_CR2 	|= (unsigned char)(WPRG);
			FLASH_NCR2 	&= (unsigned char)(~(WPRG));
			
			WDT_FLASH();
			eeprom_rom_c = eeprom_rom_c;
			eeprom_rom_d = eeprom_rom_d;
			WDT_FLASH();
			eeprom_rom_e += 1;
			eeprom_rom_f += 1;
			WDT_FLASH();
			FLASH_IAPSR &= (unsigned char)(~(0x08));
		}
	}
#endif
}

////////////////////////////////////////////////
void add_protel(void)
{
	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
	while(!(FLASH_IAPSR & (1<<DUL)));

	FLASH_CR2 	|= (unsigned char)(1<<OPT);
	FLASH_NCR2 	&= (unsigned char)(~(1<<OPT));
	
	OPT0 = (unsigned char)(OPT0_ROP_READOUT_PROTECTION);
	WDT_FLASH();	
	
	OPT1 = (unsigned char)(OPT1_DATA);
	NOPT1 = (unsigned char)(0xff ^ (OPT1_DATA));
	WDT_FLASH();
	
	NOPT2 = (unsigned char)(0xff ^ (OPT2_DATA));		
	OPT2 = (unsigned char)(OPT2_DATA);	
	
	WDT_FLASH();
	OPT3 = (unsigned char)(OPT3_DATA);
	NOPT3 = (unsigned char)(0xff ^ (OPT3_DATA));	
	WDT_FLASH();
	
	OPT4 = (unsigned char)(OPT4_DATA);
	NOPT4 = (unsigned char)(0xff ^ (OPT4_DATA));	
	WDT_FLASH();
	OPT5 = (unsigned char)(OPT5_DATA);
	NOPT5 = (unsigned char)(0xff ^ (OPT5_DATA));	
	WDT_FLASH();
//	OPT6 = (unsigned char)(OPT6_DATA);
//	NOPT6 = (unsigned char)(~ (OPT6_DATA));	
//	WDT_FLASH();
//	OPT7 = (unsigned char)(OPT7_DATA);
//	NOPT7 = (unsigned char)(~ (OPT7_DATA));	
//	WDT_FLASH();
//	OPTBL = (unsigned char)(OPTBL_BL);
//	NOPTBL = (unsigned char)(~ (OPTBL_BL));
//	WDT_FLASH();
	
	FLASH_CR2 	&= (unsigned char)(~(1<<OPT));
	FLASH_NCR2 	|= (unsigned char)(1<<OPT);
	WDT_FLASH();
	FLASH_IAPSR &= (unsigned char)(~(1<<DUL));	
}


///////////////////////////////////////////////////
void clear_sys_key(void)
{
	FLASH_IAPSR	|= 0x08;
	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
	FLASH_CR2 = 0;
	FLASH_NCR2 = 0xFF;
	FLASH_CR2 	|= (unsigned char)(WPRG);
	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
	
	WDT_FLASH();
	eeprom_rom_0 = 0;
	WDT_FLASH();
	eeprom_rom_1 = 0;
	WDT_FLASH();
	eeprom_rom_2 = 0;
	WDT_FLASH();
	eeprom_rom_3 = 0;
	WDT_FLASH();
	eeprom_rom_4 = 0;
	WDT_FLASH();
	eeprom_rom_5 = 0;
	WDT_FLASH();
//	eeprom_rom_6 = 0;
//	WDT_FLASH();
//	eeprom_rom_7 = 0;
//	WDT_FLASH();
	eeprom_rom_a = 0;
	WDT_FLASH();
	eeprom_rom_b = 0;

	FLASH_IAPSR &= (unsigned char)(~(0x08));	
}

/////////////////////////////////////////////////////////////
void eeprom_read(void)
{
	Read_MCU_ID();
	user_Prdata.byte.voltage_adj = eeprom_rom_1;
	user_Prdata.byte.voltage_adj = (user_Prdata.byte.voltage_adj << 8) + eeprom_rom_0;
	user_Prdata.byte.current_adj = eeprom_rom_2;
	user_Prdata.byte.limit_adj = eeprom_rom_4;	
	user_Prdata.byte.limit_adj =  (user_Prdata.byte.limit_adj << 8) + eeprom_rom_3;
	user_Prdata.byte.ph_current_adj = eeprom_rom_5;
	cvt_torlance_save = eeprom_rom_6;	
	
#ifdef DEBUG_MODE
	error_bank.bit.sys_key_flag = 0;
#else
	if((eeprom_rom_a == (u8)(control_temp >> 8)) && (eeprom_rom_b == (u8)control_temp) && (user_Prdata.byte.current_adj > 0) && (OPT0 == OPT0_ROP_READOUT_PROTECTION))
	{
		error_bank.bit.sys_key_flag = 0;
	}
	else
	{
		if(eeprom_rom_a != 0x00)
		{
			clear_sys_key();
		}
		error_bank.bit.sys_key_flag = 1; 
	}
#endif
}



///////////////////////////////////////////////////////////////
void eerprom_write(void)
{
	Read_MCU_ID();
	FLASH_IAPSR	|= 0x08;

	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
	while(!(FLASH_IAPSR & (1<<DUL)));
	FLASH_CR2 = 0;
	FLASH_NCR2 = 0xFF;

	FLASH_CR2 	|= (unsigned char)(WPRG);
	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
	WDT_FLASH();
	eeprom_rom_0 = user_Prdata.byte.voltage_adj;
	WDT_FLASH();
	eeprom_rom_1 = (user_Prdata.byte.voltage_adj >> 8);
	WDT_FLASH();
	eeprom_rom_2 = user_Prdata.byte.current_adj;
	WDT_FLASH();
	eeprom_rom_3 = user_Prdata.byte.limit_adj;
	WDT_FLASH();
	eeprom_rom_4 = (user_Prdata.byte.limit_adj >> 8);
	WDT_FLASH();
	eeprom_rom_5 = user_Prdata.byte.ph_current_adj;
	WDT_FLASH();
	eeprom_rom_6 = cvt_torlance_save;
	WDT_FLASH();
	eeprom_rom_7 = 0;
	WDT_FLASH();
	eeprom_rom_8 = 0;
	WDT_FLASH();
	eeprom_rom_9 = 0;	
	WDT_FLASH();	
	eeprom_rom_a = (u8)(control_temp >> 8);
	WDT_FLASH();
	eeprom_rom_b = (u8)control_temp;
	WDT_FLASH();
	FLASH_IAPSR &= (u8)(~(0x08));
	WDT_FLASH();
}


/////////////////////////////////////////////////////////
void eerprom_write_hall_mode(unsigned int return_data)
{
	unsigned int write_data;
	if(return_data > 500)
		return_data = 500;
	
	write_data = return_data + 1;
	FLASH_IAPSR	|= 0x08;
	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
	FLASH_CR2 = 0;
	FLASH_NCR2 = 0xFF;
	
	FLASH_CR2 	|= (unsigned char)(WPRG);
	FLASH_NCR2 	&= (unsigned char)(~(WPRG));
	
	WDT_FLASH();
	eeprom_rom_c = (write_data >> 8);
	eeprom_rom_d = (unsigned char)write_data;
	WDT_FLASH();
	eeprom_rom_e = eeprom_rom_e;
	eeprom_rom_f = eeprom_rom_f;	
	WDT_FLASH();
	FLASH_IAPSR &= (unsigned char)(~(0x08));		
}

////////////////////////////////////////////////////////
unsigned int eerprom_read_hall_mode(void)
{
	unsigned int read_temp;
	read_temp = eeprom_rom_c;
	read_temp = (read_temp<< 8) + eeprom_rom_d;
	return(read_temp);
}

////////////////////////////////////////////////////////

void shout_dowm(void)
{
	unsigned int return_data;
	if(voltage_average < (user_Prdata.byte.voltage_adj - (user_Prdata.byte.voltage_adj>>2)))
	{
		if(flash_count == 5)
			flash_count = 1;
			
		if(flash_count < 3)
		{
			flash_count ++;
		}
		else if(flash_count == 3)
		{
			flash_count = 4;
			return_data = eerprom_read_hall_mode();
			if(return_data > 300)
			{
				PWM_ALL_OFF();
				//if(error_bank.bit.sys_key_flag == 0)
					clear_sys_key();
					
			//	while(1);
			}
			else
			{
				eerprom_write_hall_mode(return_data);
			}
		}
	}
	else if(voltage_average > (user_Prdata.byte.voltage_adj + 1))	
	{
		if(flash_count == 10)
			flash_count = 5;
	}
}

///////////////////////////////////////////////////////////

void Read_MCU_ID(void)
{
	AD_Value = 0;
	AD_ValueH = 0;
	AD_ValueL = 0;
	control_temp = 0;
	for(AD_ValueL = 0;AD_ValueL < 12;AD_ValueL ++)
	{
		AD_Value += MCU_ID[AD_ValueL];
		AD_ValueH = (AD_Value + (AD_ValueL * AD_ValueL) + (15 - AD_ValueL) * 3);
		control_temp += (AD_ValueH + (AD_ValueH >> 4) + ((AD_ValueH & 0x000f) << 8));
	}
}


