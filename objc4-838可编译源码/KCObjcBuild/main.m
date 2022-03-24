//
//  main.m
//  KCObjcBuild
//
//  Created by cooci on 2022/2/24.
//
/**
 KC 重磅提示 调试工程很重要 源码直观就是爽
 ⚠️编译调试不能过: 请你检查以下几小点⚠️
 ①: 编译 targets 选择: KCObjcBuild
 ②: enable hardened runtime -> NO
 ③: build phase -> denpendenice -> objc
 ④: team 选择 None
 iOS进阶内容重磅分享 认准: KC_Cooci 麻烦来一个 👍
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "FGModel.h"
#import "FGModel+Tool.h"


void testBit(void);


int main(int argc, const char * argv[]) {
    testBit();

    @autoreleasepool {
        NSLog(@"Hello, KCObjcBuild!");
        NSObject *objc = [[NSObject alloc] init];
        [objc class];
        
        FGModel *model = [[FGModel alloc] init];
        objc.obj = model;
        
        FGModel *model2 = [[FGModel alloc] init];
        objc.obj = model2;

        FGModel *model3 = objc.obj;
//        objc.obj = nil;
        
        __weak typeof(model) wmodel = model;//objc_initWeak
        [model something];
        Class cls = object_getClass(model);
        //0x0000000ffffffff8ULL
        // 0x0001 0111 0000 0011 1101 1000 0111 0111
        NSLog(@"开心调试 %@ 底层源码",objc);
    }
    
    // 1 0000 0000 0000 0000 1000 0000 1100 1000
    // 0x1000080c8
    return 0;
}



struct Student {
    uintptr_t a:1;// 低位，放在低地址
    uintptr_t b:1;//
    uintptr_t c:1;//
    uintptr_t d:1;//
    uintptr_t e:1;//
    uintptr_t f:1;//
    uintptr_t g:1;//
    uintptr_t h:1;//
    uintptr_t i:8;//
};

void testBit(void) {
    struct Student stu;
    stu.a = 1;
    stu.b = 1;
    stu.c = 1;
    stu.d = 1;
    stu.e = 1;
    stu.f = 0;
    stu.g = 0;
    stu.h = 1;
    stu.i = 10;
    
    printf("%p",&stu);
    //stu的值: 9f 0a
}
