# LHGridView
GridView in iOS

#Propertys

@property(nonatomic,assign)NSInteger columnNum;//总列数

@property(nonatomic,assign)NSInteger fixRow;//固定行数

@property(nonatomic,assign)NSInteger fixCol;//固定列数

@property(nonatomic,assign)NSInteger rowHeight;//行高

@property(nonatomic,assign)BOOL isTitleSepLine;//是否显示分割线

@property(nonatomic,assign)BOOL isBodySepLine;

@property(nonatomic,strong)UIColor *sepTitleLineColor;//分割线颜色

@property(nonatomic,strong)UIColor *sepBodyLineColor;//分割线颜色

@property(nonatomic,strong)NSArray *dataSource;//数据源@[@[],@[]] 包含表头和表体

@property(nonatomic,strong)NSArray *columnsWidthArr;//列宽的数组 @["100",@"90",@"100"]

@property(nonatomic,strong)NSArray *titleMergeArr;//标题合并数组 @[@{@"col":@"2",@"row":@"0",@"span":@"2"}] （第2列 第0行 合并后面的2个单元格）


@property(nonatomic,strong)UIColor *titleBgColor;//表头背景色

@property(nonatomic,strong)UIColor *bodyLeftEvenBgColor;//表体左边偶数行背景色

@property(nonatomic,strong)UIColor *bodyLeftUnEvenBgColor;//表体左边奇数行背景色

@property(nonatomic,strong)UIColor *bodyRigtEvenBgColor;

@property(nonatomic,strong)UIColor *bodyRightUnEvenBgColor;

@property(nonatomic,strong)UIFont *titleFont
;
@property(nonatomic,strong)UIFont *bodyFont;

@property(nonatomic,strong)UIColor *titleFontColor;

@property(nonatomic,strong)UIColor *bodyFontColor;

#How To Use:


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
