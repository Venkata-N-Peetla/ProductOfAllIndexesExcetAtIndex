//
//  ViewController.m
//  ProductOfAllIndexesExcetAtIndex
//
//  Created by Venkata Narasimham Peetla on 1/30/18.
//  Copyright © 2018 PEETLA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *inputArray = @[@1, @3, @5, @7];
    NSArray *resultArray = GetProductsOfAllIndexesExceptAtIndexFromArray(inputArray);
    NSLog(@"resultArray is %@", resultArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSArray<NSNumber *> *GetProductsOfAllIndexesExceptAtIndexFromArray(NSArray<NSNumber *> *inputArray) {
    NSCAssert(inputArray.count > 1, @"Invalid parameter: getting the product of numbers at other indices requires at least two elements in array");
    NSMutableArray<NSNumber *> *outputArray = [NSMutableArray array];

    NSNumber *product = @1;

    //Step:1 getting the product of before index.
    for (NSUInteger i = 0; i < inputArray.count; i++) {
        outputArray[i] = product;
        product = @(product.integerValue * inputArray[i].integerValue);
    }
    NSLog(@"outputArray -  getting the product of before index %@", outputArray);

    product = @1;
    //Step:2 getting the product of after index.
    for (NSUInteger i = inputArray.count; i > 0; i--) {
        outputArray[i-1] = @(outputArray[i-1].integerValue * product.integerValue);
        product = @(product.integerValue * inputArray[i-1].integerValue);
    }
    NSLog(@"outputArray - getting the product of after index %@", outputArray);

    //final output array.
    return outputArray;
}

@end
