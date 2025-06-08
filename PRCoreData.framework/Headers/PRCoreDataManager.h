//
//  PRCoreDataManager.h
//  PRCoreData
//
//  Created by huihao on 2025/5/22.
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <PRCustomModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface PRCoreDataManager : NSObject
+ (instancetype)sharedManager;
/**
 *@brief Persistent Container（iOS 10+）
 */
@property (readonly, strong) NSPersistentContainer * persistentContainer;
/**
 *@brief Main Thread Context（viewContext）
 */
@property (readonly, strong) NSManagedObjectContext * context;
/**
 *@brief Context Saving Method
 */
- (void)saveContext;

- (NSManagedObjectContext *)newBackgroundContext;
#pragma mark ------------- Save Data
/**
 *@brief Save Data
 *@param modelType  Class name
 *@param model data
 */
- (void)pr_saveModel:(PRCustomModel *)model type:(NSString *)modelType;
/**
 *@brief Save Data
 *@param model data
 */
- (void)pr_saveModel:(PRCustomModel *)model;
#pragma mark ------------- Read Data
/**
 *@brief Query Data by Class
 *@param modelType  Class name
 *@return Model Array Matching Criteria
 */
- (NSArray *)pr_fetchAllModelFromType:(NSString *)modelType;
/**
 *@brief Query Data by Class
 *@param modelType Class name
 *@param modelClass 类
 *@return Model Array Matching Criteria
 */
- (NSArray *)pr_fetchAllModelFromType:(NSString *)modelType modelClass:(Class)modelClass;
/**
 * @brief更新model记录id<NSCopying> model
 * @param model Model Object to Update
 * @param modelType Class Name to Update
 */
- (void)pr_UpdateModel:(id)model withModelId:(NSString *)modelId type:(NSString *)modelType;
#pragma mark ------------- Delete Data
/**
 *@brief Delete Specified Model
 *@param modelType Class name
 *@param modelId Model uniqueId
 */
- (void)pr_deleteModelWithId:(NSString *)modelId modelType:(NSString *)modelType;
/**
 *@brief Delete Specified Model
 *@param model Model
 */
- (void)pr_deleteModelWithmodel:(PRCustomModel *)model;
/**
 *@brief Batch Delete
 *@param modelType Class name
 */
- (void)pr_deleteAllModelWithModelType:(NSString *)modelType;
#pragma mark ------------- Batch Insert Data
/**
 *@brief Batch Insert
 *@param modelType Class name
 *@param models Model Array
 */
- (void)pr_batchInsertModels:(NSArray<id> *)models modelType:(NSString *)modelType;
#pragma mark ------------- Batch Update Data
/**
 *@brief Batch Update
 *@param predicate Filter Conditions
 */
//- (void)pr_batchUpdateWithPreducate:(NSPredicate *)predicate updateHandler:(void (^)(PRGenericModel *))handler;
@end

NS_ASSUME_NONNULL_END
