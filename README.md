# LHGridView
GridView in iOS


how to use:


LHGridView *gridView = [[LHGridView alloc] init];
    gridView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20);
    gridView.columnNum = 7;
    gridView.fixCol = 1;
    gridView.fixRow = 2;
    gridView.rowHeight = 60;
    gridView.isTitleSepLine = YES;
    gridView.sepTitleLineColor = [UIColor whiteColor];
    gridView.isBodySepLine = YES;
    gridView.sepBodyLineColor = [UIColor orangeColor];
    
    gridView.dataSource = @[
                            @[@"title0_0",@"title0_1",@"title0_2",@"title0_3",@"",@"",@"title0_6"],
                            @[@"title1_0",@"title1_1",@"title1_2",@"title1_3",@"title1_4",@"title1_5",@"title1_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            @[@"leftbody2_0",@"body2_1",@"body2_2",@"body2_3",@"body2_4",@"body2_5",@"body2_6"],
                            ];
    gridView.columnsWidthArr = @[@"100",@"60",@"150",@"100",@"100",@"100",@"100"];
    gridView.titleMergeArr = @[@{@"col":@"3",@"row":@"0",@"span":@"3"}];
    
    [self.view addSubview:gridView];
