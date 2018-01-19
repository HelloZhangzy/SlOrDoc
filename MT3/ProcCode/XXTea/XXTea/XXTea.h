// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� XXTEA_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// XXTEA_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#ifdef XXTEA_EXPORTS
#define XXTEA_API __declspec(dllexport)
#else
#define XXTEA_API __declspec(dllimport)
#endif

// �����Ǵ� XXTea.dll ������
class XXTEA_API CXXTea {
public:
	CXXTea(void);
	// TODO: �ڴ�������ķ�����
};

	extern XXTEA_API int nXXTea;

	XXTEA_API int fnXXTea(void);

	#define DELTA 0x9e3779b9
	#define MX (((z>>5^y<<2) + (y>>3^z<<4)) ^ ((sum^y) + (key[(p&3)^e] ^ z)))
	/*************************************************************************
	v is the n word data vector
	k is the 4 word key,128bits
	n is negative for decoding
	if n is zero result is 1 and no coding or decoding takes place, 
	otherwise the result is zero
	assumes 32 bit 'long' and same endian coding and decoding
	**************************************************************************/	
	XXTEA_API void btea(_int16 Mod,char* Data,_int16 Len,char* Key);
	XXTEA_API uint16_t crc_sum(uint8_t *puchMsg, uint16_t usDataLen);