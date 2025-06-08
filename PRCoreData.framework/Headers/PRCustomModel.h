//
//  PRCustomModel.h
//  PRCoreData
//
//  Created by huihao on 2025/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PRCustomModel : NSObject<NSCopying,NSSecureCoding>
@property (nonatomic, copy) NSString *uniqueId;

@end

NS_ASSUME_NONNULL_END
