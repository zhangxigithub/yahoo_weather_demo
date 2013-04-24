//项目的基本配置
//在xxxx-Profix.pch中引用
#import "ZXMacro.h"

#define kAppName @"KuxunHuoche"
#define kJiPiaoScheme @"kxplane:"


#define kGreen RGB(83, 168, 0)
#define kLightGreen RGB(140, 214, 35)
#define kGray  HexRGB(0x666666)
#define kGrayLight  RGB(170, 170, 170)
#define kGrayText RGB(118, 118, 118)
#define kGreenPicker RGB(113, 229, 0)


#define kFontBold15 [UIFont fontWithName:@"Arial Rounded MT Bold" size:15]
#define kFontBold16 [UIFont fontWithName:@"Arial Rounded MT Bold" size:16]
#define kFontBold18 [UIFont fontWithName:@"Arial Rounded MT Bold" size:18]
#define kFontBold19 [UIFont fontWithName:@"Arial Rounded MT Bold" size:19]


#define kFont11 [UIFont systemFontOfSize:11]
#define kFont12 [UIFont systemFontOfSize:12]
#define kFont13 [UIFont systemFontOfSize:13]
#define kFont14 [UIFont systemFontOfSize:14]
#define kFont15 [UIFont systemFontOfSize:15]
#define kFont16 [UIFont systemFontOfSize:16]
#define kFont17 [UIFont systemFontOfSize:17]
#define kFont18 [UIFont systemFontOfSize:18]

#define kFontVerdana15 [UIFont fontWithName:@"Verdana" size:15]
#define kFontVerdana16 [UIFont fontWithName:@"Verdana" size:16]
#define kFontVerdana17 [UIFont fontWithName:@"Verdana" size:17]
#define kFontVerdana18 [UIFont fontWithName:@"Verdana" size:18]
#define kFontVerdana19 

#define kFontBoldMT15 [UIFont fontWithName:@"Arial-BoldMT" size:15]
#define kFontBoldMT21 [UIFont fontWithName:@"Arial-BoldMT" size:21]

//*********************************************

//release屏蔽NSLog
#ifdef DEBUG
//#define clientURL @"http://api.m.kuxun.cn/"
#define clientURL @"http://60.28.194.175:8086/"

#else

#define clientURL @"http://api.m.kuxun.cn/"

#endif



#define theApp ((ZXAppDelegate *)[UIApplication sharedApplication].delegate)
#define theNav ((ZXAppDelegate *)[UIApplication sharedApplication].delegate.navigationController)

