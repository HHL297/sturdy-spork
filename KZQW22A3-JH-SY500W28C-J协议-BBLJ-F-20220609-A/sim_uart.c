#include "hand_tble.h" 



TMM4_FLAG TMM4_flag;
CERRENT_TEMP Current_temp;
///////////////////////////////////////

unsigned @near int sleep_count;
unsigned @near int voltage_table[5];
unsigned @near char uart_dan_mode ;
#ifdef	SIM_UART

unsigned @near char uart_dan_back ;
unsigned @near char uart_read_port ;
unsigned @near char uart_read_start ;
unsigned @near char uart_read_data ;
unsigned @near char uart_step ;
unsigned @near char uart_read_count ;
unsigned @near char uart_send_port ;
unsigned @near char uart_send_data ;
unsigned @near char uart_xor_temp ;
unsigned @near char uart_send_dely ;
unsigned @near char current_dang;
unsigned @near char br_flag,br_flag_back,br_count;

///////////////////////////////////////////////////////////////
void sim_uart_send(void)				//1K	ɨ��
{
	uart_send_dely ++;
	if(uart_send_dely > 100)		//100ms
	{
		if(TMM4_flag.bit.sleep_flag == 1)
		{
			uart_send_data = 0x0e;	
		}
		else
		{
			if(br_flag_back == 0)
			{
				uart_send_data = 0;
			}
			else if(br_flag_back == 1)
			{
				uart_send_data = 0x02;
			}
			else if(br_flag_back == 2)
			{
				uart_send_data = 0x04;			
			}
			else if(br_flag_back == 3)
			{
				uart_send_data = 0x06;
			}
			else if(br_flag_back == 4)
			{
				uart_send_data = 0x08;
			}
			else if(br_flag_back == 5)
			{
				uart_send_data = 0x0a;
			}
			else
			{
				uart_send_data = 0;
			}
		}
		
		if(uart_send_dely == 101)
			uart_send_port = (uart_send_data^0xff);
		if(uart_send_dely == 105)
			uart_send_dely = 0;
	}
	else
	{
		uart_send_port = 0;
	}
	
	if(uart_send_port & 0x10)
	{
		SIM_UART_DN();
	}
	else
	{
		SIM_UART_UP();
	}
	uart_send_port <<=1;
}




//////////////////////////////////////////////////////////////////////////////
void sim_uart_rend(void)				//8Kɨ��
{
	if(SIM_UART_PORT)
		uart_read_port = 1;				//ɨ��˿�
	else
		uart_read_port = 0;
		
	if(uart_read_start == 0)					//δ��ʼ��������ʱ���ж��Ƿ�����
	{
		if(uart_read_count>0)//��ʱ����ֵ����0ʱ�ſ�ʼɨ��˿�ֵ
			uart_read_count --;
		else
		{
			if(uart_read_port == 0x00)			//���������Ѷ�ţ��������ճ���
			{
				if(uart_step > 0)				//������⵽����ֵ����ƫ����ʱȷ����ʼ��������
					uart_step --;
				else 
				{
					uart_read_start = 1;		//�迪ʼ�������ݱ��λ
					uart_read_count = 0;		//
					uart_xor_temp = 0;
				}
			}
			else
			{
				uart_step = 3;					//��λƫ���� ��x��*120us
			}
		}
	}

	if(uart_read_start == 1)
	{
		if(uart_step == 3)						//���ղ���Ϊ3ʱ��ʼ������
		{
			uart_read_count ++;					//��������λ����ֵ����
			if(uart_read_count >=5)				//���յ���λ����ʱΪһ��ͨѶ����
			{
				uart_read_count = 18;			//������һ�����ݺ���ʱ 18 ��120us �ټ���������ϵ��źţ���ֹ��ͨѶ��һ��ͨѶ���ٴν���ͨѶ
				uart_read_start = 0;			//�����ʼ���ձ��λ
				uart_step = 2;					//�趨ƫ����= ��1+x��*120us
				if(uart_read_data == 0x02)		//���ݴ����ж��Ƿ���ȷ
				{
					uart_dan_mode = 0;			//��һ������
				}
				else if(uart_read_data == 0x04)
				{
					uart_dan_mode = 1;			//�ڶ�������
				}
				else if(uart_read_data == 0x06)
				{
					uart_dan_mode = 2;			//����������
				}
				else if(uart_read_data == 0x08)
				{
					uart_dan_mode = 3;			//���ĵ�����
				}
				else if(uart_read_data == 0x0a)
				{
					uart_dan_mode = 4;			//���嵲����
				}
				else if(uart_read_data == 0x0e)	//ȡ������״̬
				{
					error_bank.bit.sleep_err = 0;
				//	TMM4_flag.bit.sleep_flag = 0;
					sleep_count = 0;
				}
				if(uart_dan_back != uart_dan_mode)
				{
					error_bank.bit.sleep_err = 0;
				//	TMM4_flag.bit.sleep_flag = 0;
					sleep_count = 0;
				}
				uart_dan_back = uart_dan_mode;
												//������ݲ���ȷ������ԭ�����ݲ��䡣
				////////////////////////////////////////
				///////////////////////////////////////
				uart_read_data = 0;				//������յ�������
			}
			else
				uart_read_data <<=1;			//���û�е�����λ���ݣ����������λ�ƶ����Ա����ݽ�����Ĵ���
		}
		uart_step ++;							//���ղ�������
		if(uart_read_start == 1)
		{
			if(uart_step <= 3)
			{
				uart_xor_temp += uart_read_port;
				if(uart_step == 3)
				{
					if(uart_xor_temp == 0x03)
					{
						uart_read_data |= 0x01;
					}
					else if(uart_xor_temp == 0x00)
					{
						uart_read_data &= 0xfe;	
					}
					else
					{
						uart_read_count = 108;			//������һ�����ݺ���ʱ 108 ��120us �ټ���������ϵ��źţ���ֹ��ͨѶ��һ��ͨѶ���ٴν���ͨѶ
						uart_read_start = 0;			//�����ʼ���ձ��λ
						uart_step = 2;					//�趨ƫ����= ��1+x��*120us
						uart_xor_temp = 0;
					}
				}
			}
			else
			{
				uart_xor_temp = 0;
			}
		}
		if(uart_step == 8)						//���ղ�������ڣ�λ X * 125us   8*125 = 1000 us   
			uart_step = 0;
	}
}

/////////////////////////////////////////////////////
void current_dang_mode(void)
{
	if(uart_dan_mode == 0)   //��һ��
	{//1.5A
		current_dang = Current_temp.byte.current1;
	}
	else if(uart_dan_mode == 1)	//�ڶ���
	{//3A
		current_dang = Current_temp.byte.current2;
	}
	else if(uart_dan_mode == 2)	//������
	{//6A
		current_dang = Current_temp.byte.current3;
	}
	else if(uart_dan_mode == 3)   //���ĵ�
	{//9A
		current_dang = Current_temp.byte.current4;
	}
	else if(uart_dan_mode == 4)	//���嵵
	{//12A
		current_dang = user_Prdata.byte.current_adj;
	}
}
////////////////////////////////////////////////////////

void voltage_chk(void)
{
	if(error_bank.bit.voltage_low_flag == 1)
	{
		br_flag = 0;
	}
	else
	{
		if(voltage_average >= (voltage_table[4]))		//��ߵ�  5��
		{
			br_flag = 5;
		}
		else if(voltage_average >= (voltage_table[3]))	//���ĵ�
		{
			br_flag = 4;
		}
		else if(voltage_average >= (voltage_table[2]))	//������
		{
			br_flag = 3;
		}
		else if(voltage_average >= (voltage_table[1]))	//�ڶ���
		{
			br_flag = 2;
		}
		else if(voltage_average >= voltage_table[0])	//��һ��
		{
			br_flag = 1;
		}
		else 
		{
			br_flag = 1;
		}
	}
	
	br_count ++;
	if(br_count >= 120)				//
	{
		if(br_flag_back > br_flag)
		{
			br_flag_back --;
		}
		else if(br_flag_back < br_flag)
		{
			br_flag_back ++;
		}
		br_count = 0;
	}
}


#endif


