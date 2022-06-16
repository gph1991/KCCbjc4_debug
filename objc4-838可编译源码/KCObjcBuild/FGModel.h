//
//  FGModel.h
//  KCObjcBuild
//
//  Created by penghao1 on 2022/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@interface FGStudent : NSObject
//
//@end

void printPool(void);

@interface FGModel : NSObject

-(void)something;

-(void)testAuto;

-(void)testSyn;

@end

@interface FGSonModel : FGModel

@end

NS_ASSUME_NONNULL_END
