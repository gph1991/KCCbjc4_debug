//
//  FGModel+Tool.h
//  KCObjcBuild
//
//  Created by penghao1 on 2022/3/23.
//

#import "FGModel.h"

NS_ASSUME_NONNULL_BEGIN

// AutoreleasePool
/*
 1，AssociationsManager 有个get函数返回了一个静态的Storage属性，Storage是ExplicitInitDenseMap<DisguisedPtr<objc_object>, ObjectAssociationMap>的别名，即提供了object对象到ObjectAssociationMap的映射
 2，ObjectAssociationMap是DenseMap<const void *, ObjcAssociation>的别名，即提供了指针（key）到ObjcAssociation的映射
 3，class ObjcAssociation的定义有，uintptr_t _policy和id _value;即策略和value。
 
 
 
 */
// Weak
// Association
// RunLoop
// KVO/KVC
// Zombie

@interface NSObject (Tool)

@property(nonatomic, strong) FGModel *obj;

@end


//@interface FGModel (Tool)
//
//@property(nonatomic, strong) NSObject *obj;
//
//@end

NS_ASSUME_NONNULL_END
