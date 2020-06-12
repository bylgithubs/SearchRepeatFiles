//
//  ViewController.m
//  SearchRepeatFiles
//
//  Created by Civet on 2020/6/12.
//  Copyright © 2020 PersonalONBYL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *repeatFiles = [[NSMutableArray alloc] init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileList = [[NSArray alloc] init]; //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    fileList = [fileManager subpathsOfDirectoryAtPath:@"/Users/civet/F3235807/SmartGitRepository/iOS/Civet_kou/Civet" error:&error];
    
    for (int i= 0; i < fileList.count; i++)
    {
        if ([fileList[i] containsString:@"/"])
        {
            NSString * temp = [fileList[i] componentsSeparatedByString:@"/"].lastObject;
            if ([temp containsString:@".h"]||[temp containsString:@".m"])
            {
                NSString *string = @"";
                for (int j=i; j<fileList.count; j++)
                {
                    if ([fileList[i] isEqualToString:fileList[j]])
                    {
                        NSLog(@"~~~~~~~~~~~~11111~~~~~~~%@",fileList[i]);
                        continue;
                        
                    }else
                    {
                        NSString * temp2 = [fileList[j] componentsSeparatedByString:@"/"].lastObject;
                        if ([temp isEqualToString:temp2]){
                            string = [string stringByAppendingString:[NSString stringWithFormat:@"%@\n",fileList[j]]];
                        }
                    }
                    
                }
                if (string != nil && ![string isEqualToString:@""]) {
                    string = [fileList[i] stringByAppendingString:[NSString stringWithFormat:@"\n%@=================================",string]];
                    [repeatFiles addObject:string];
                }
                
            }
            
        }
    }
    NSMutableArray *arr = repeatFiles;
    NSLog(@"=======%@",repeatFiles);
}


@end
