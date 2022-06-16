//
//  FGModel.m
//  KCObjcBuild
//
//  Created by penghao1 on 2022/3/21.
//

#import "FGModel.h"

extern void _objc_autoreleasePoolPrint(void);

//@implementation FGStudent
//
//@end

@interface FGModel()

@property(nonatomic, strong) NSObject *student;

@end

@implementation FGModel

//+(void)load {
//    [self description];
//}

+(void)initialize {
    
}

/*
 只有当属性是对象且使用了copy/atomic修饰时，设置时会生成类似objc_setProperty_atomic,objc_setProperty_atomic_copy
 这些函数最终使用不同的参数调用了reallySetProperty
 但(nonatomic, strong)这种类型的是不会生成这些函数的，是直接掉用objc_storeStrong
 
 只有当属性是对象且使用了copy/atomic修饰时，获取时则生成objc_getProperty，根据不同的修饰传入不同的参数
 
*/
-(void)setStudent:(NSObject *)student {

}

void printPool(void) {
    printf("start\n");
    _objc_autoreleasePoolPrint();
    printf("end\n");
}

-(void)testAuto {
    printPool();
    @autoreleasepool {
        printPool();
        for (int i = 0; i < 5; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            NSLog(@"%d, %p", i + 1, arr);
        }
        printPool();
        @autoreleasepool {
            printPool();
            for (int i = 0; i < 5; i++) {
                NSMutableSet *set = [NSMutableSet set];
                NSLog(@"%d, %p", i + 1, set);
            }
            printPool();
        }
        printPool();
    }
    printPool();
    int a = 0;
}

-(void)something {
    NSLog(@"something");
}

-(void)invoke {
    @synchronized (self) {
        NSLog(@"invoke:%@",[NSThread currentThread]);
        sleep(5);
    }
}

-(void)testSyn {
    @synchronized (self) {
        NSLog(@"testSyn:%@",[NSThread currentThread]);
        NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(invoke) object:nil];
        [thread1 start];

    //    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(invoke) object:nil];
    //    [thread2 start];
        NSLog(@"finish");
            
        while (1) {
            
        }
    }
}



@end

@implementation FGSonModel

//+(void)load {
//    [self description];
//}
//
//+(void)initialize {
//    
//}

@end
