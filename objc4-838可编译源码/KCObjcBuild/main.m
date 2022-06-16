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

// nlclslist是有+load方法的类
// catlist是有类别的类
// nlcatlist是有+load的类别

extern void
instrumentObjcMessageSends(BOOL flag);

// CLANG_OPTIMIZATION_PROFILE_FILE
// $(SRCROOT)/OptimizationProfiles/$(PROJECT_NAME).profdata

void testBit(void);
void testWeak(void);
void testAssociation(void);
void testAutoRelease(void);
void testSynchronize(void);

#define FGKeyPath(KEYPATH) \
@((((void)KEYPATH), \
({ const char *path = strchr(#KEYPATH, '.'); path + 1; })))

#define FBKVOKeyPath(KEYPATH) \
@(((void)(NO && ((void)KEYPATH, NO)), \
({ const char *fbkvokeypath = strchr(#KEYPATH, '.'); fbkvokeypath + 1; })))

int main(int argc, const char * argv[]) {
    testSynchronize();
//    testBit();
//    testAssociation();
//    testWeak();
//    testAutoRelease();
//
//    @autoreleasepool {
//        NSLog(@"Hello, KCObjcBuild!");
//    }
    
    // 1 0000 0000 0000 0000 1000 0000 1100 1000
    // 0x1000080c8
    return 0;
}

void testWeak(void) {
    FGModel *model = [[FGModel alloc] init];
    FGModel *model2 = [[FGModel alloc] init];

    // 增加一个weak
    __weak typeof(model) wmodel1 = model;//只要是初次赋值objc_initWeak
    wmodel1 = nil;// 只要再次赋值，就是objc_storeWeak
    // 增加一个weak
    __weak typeof(model) wmodel2 = model;//objc_initWeak
    
    __weak typeof(model) wmodel3 = model;//objc_initWeak

    __weak typeof(model) wmodel4 = model;//objc_initWeak

    __weak typeof(model) wmodel5 = model;//objc_initWeak
    
    model = nil;

    wmodel1 = nil;
    
    wmodel2 = nil;
}

void testAssociation(void) {
    NSObject *objc = [[NSObject alloc] init];
    [objc class];
    
    FGModel *model = [[FGModel alloc] init];
    objc.obj = model;
    
    FGModel *model2 = [[FGModel alloc] init];
    objc.obj = model2;

    FGModel *model3 = objc.obj;
//        objc.obj = nil;
}

void testAutoRelease(void) {
    printPool();
    FGModel *model = [[FGModel alloc] init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [model testAuto];
    });
    printPool();
//    while (1) {
//        
//    }
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

void testSynchronize(void) {
    FGModel *model = [[FGModel alloc] init];
    [model testSyn];
    
//    @synchronized (model) {
//        NSLog(@"fine1");
//        @synchronized (model) {
//            NSLog(@"fine2");
//        }
//        [NSThread callStackSymbols];
//    }
//
//    @synchronized (model) {
//
//    }
//    
//    dispatch_queue_t queue = dispatch_queue_create("fgqueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_set_target_queue(queue, dispatch_get_global_queue(0, 0));
//    
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
//        @synchronized (model) {
//            dispatch_sync(queue, ^{
//                @synchronized (model) {
//                    [model testAuto];
//                }
//            });
//        }
////    });
    
    
    
//    while (1) {
//        
//    }
}
