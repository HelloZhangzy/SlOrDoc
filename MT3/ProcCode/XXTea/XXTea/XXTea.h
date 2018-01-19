// 下列 ifdef 块是创建使从 DLL 导出更简单的
// 宏的标准方法。此 DLL 中的所有文件都是用命令行上定义的 XXTEA_EXPORTS
// 符号编译的。在使用此 DLL 的
// 任何其他项目上不应定义此符号。这样，源文件中包含此文件的任何其他项目都会将
// XXTEA_API 函数视为是从 DLL 导入的，而此 DLL 则将用此宏定义的
// 符号视为是被导出的。
#ifdef XXTEA_EXPORTS
#define XXTEA_API __declspec(dllexport)
#else
#define XXTEA_API __declspec(dllimport)
#endif

// 此类是从 XXTea.dll 导出的
class XXTEA_API CXXTea {
public:
	CXXTea(void);
	// TODO: 在此添加您的方法。
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