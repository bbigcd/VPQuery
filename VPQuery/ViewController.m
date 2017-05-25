//
//  ViewController.m
//  VPQuery
//
//  Created by chendi on 2017/5/24.
//  Copyright © 2017年 chendi. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController()

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *userNameTextField;

@property (weak) IBOutlet NSDatePicker *beginDatePicker;
@property (weak) IBOutlet NSDatePicker *endDatePicker;


@property (nonatomic, strong) Model *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.beginDatePicker.dateValue = [NSDate date];
    self.endDatePicker.dateValue = [NSDate date];
    self.model = [[Model alloc] init];
    // Do any additional setup after loading the view.
    
    [self.tableView reloadData];
}

- (IBAction)queryButtonClick:(id)sender {
    if(_userNameTextField.stringValue.length == 0){
        NSAlert *alert = [[NSAlert alloc] init];
        //增加一个按钮
        [alert addButtonWithTitle:@"好"];
        //提示的标题
        [alert setMessageText:@"提示"];
        //提示的详细内容
        [alert setInformativeText:@"请输入用户名"];
        //设置告警风格
        [alert setAlertStyle:NSWarningAlertStyle];
        //开始显示告警
        [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
            //用户点击告警上面的按钮后的回调
        }];
        return;
    }
    [self.model getTestDataArr];
    [self.tableView reloadData];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return self.model.testDataArr.count;
}

// 设置Cell，未设置cell，将无法把数据源正确显示在界面上
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSTextField *view   = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 100, 50)];
    view.editable = NO;
    return view;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    NSInteger index = [tableView.tableColumns indexOfObject:tableColumn];
    return self.model.testDataArr[row][index];
}


@end
