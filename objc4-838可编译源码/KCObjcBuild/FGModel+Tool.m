//
//  FGModel+Tool.m
//  KCObjcBuild
//
//  Created by penghao1 on 2022/3/23.
//

#import "FGModel+Tool.h"
#import <objc/runtime.h>

@implementation NSObject (Tool)

+(void)load {
    
}

//+(void)initialize {
    // 类里面的initialize会被category的initialize覆盖，因为initialize是objc_msgSend方式调用的。
    // load不会被category的load覆盖，因为是从mach-o里面取出method，然后直接调用的，没有消息发送的流程
//}

/*
    OBJC_ASSOCIATION_ASSIGN = 0,
    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
    OBJC_ASSOCIATION_RETAIN = 0x301,0011 0000 0001
    OBJC_ASSOCIATION_COPY = 0x303,0011,0000,0011

*/
- (void)setObj:(FGModel *)obj {
    int a = OBJC_ASSOCIATION_RETAIN;
//    objc_setAssociatedObject(self, "set", obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, "set", obj, OBJC_ASSOCIATION_RETAIN);
}

-(FGModel *)obj {
    return objc_getAssociatedObject(self, "set");
}

@end

@implementation FGModel (Tool)

+(void)initialize {
    // 类里面的initialize会被category的initialize覆盖，因为initialize是objc_msgSend方式调用的。
    // load不会被category的load覆盖，因为是从mach-o里面取出method，然后直接调用的，没有消息发送的流程
}

@end
