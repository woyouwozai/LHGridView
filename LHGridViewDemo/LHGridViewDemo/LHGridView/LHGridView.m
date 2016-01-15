//
//  LHGridView.m
//  LHGridViewDemo
//
//  Created by helly on 15/11/8.
//  Copyright © 2015年 com.dnetzj.com. All rights reserved.
//

#import "LHGridView.h"
#define ksepLineWidth 0.2

@interface LHGridView ()<UIScrollViewDelegate>
{
    NSMutableArray *_mergeCellArr;//被合并的单元格
}

@end

@implementation LHGridView


-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.layer.masksToBounds = YES;
        
        self.titleLeftView = [[UIView alloc] init];
        self.titleRightView = [[UIView alloc] init];
        
        
        self.bodyScrollView = [[UIScrollView alloc]init];
        
        self.bodyLeftView = [[UIView alloc] init];
//        self.bodyLeftView.layer.borderColor = [UIColor grayColor].CGColor;
//        self.bodyLeftView.layer.borderWidth = 0.5;
        
        self.bodyRightScrollView = [[UIScrollView alloc] init];
        self.bodyRightScrollView.delegate = self;
        
        self.bodyRightScrollViewSubview = [[UIView alloc] init];
//        self.bodyRightScrollViewSubview.layer.borderColor = [UIColor grayColor].CGColor;
//        self.bodyRightScrollViewSubview.layer.borderWidth = 0.5;
        
        [self.bodyRightScrollView addSubview:self.bodyRightScrollViewSubview];
        [self.bodyScrollView addSubview:self.bodyLeftView];
        [self.bodyScrollView addSubview:self.bodyRightScrollView];
        
        [self addSubview:self.titleLeftView];
        [self addSubview:self.titleRightView];
        [self addSubview:self.bodyScrollView];
        
        _titleBgColor = [UIColor orangeColor];
        _bodyLeftEvenBgColor = [UIColor lightGrayColor];
        _bodyLeftUnEvenBgColor = [UIColor whiteColor];
        _bodyRigtEvenBgColor = [UIColor lightGrayColor];
        _bodyRightUnEvenBgColor = [UIColor whiteColor];
        
        _titleFont = [UIFont systemFontOfSize:14];
        _bodyFont = [UIFont systemFontOfSize:14];
        
        _titleFontColor = [UIColor whiteColor];
        _bodyFontColor = [UIColor blackColor];
        
        _sepTitleLineColor = [UIColor grayColor];
        _sepBodyLineColor = [UIColor grayColor];
        
        _mergeCellArr = [[NSMutableArray alloc] init];
        
    }
    return self;
}

-(void)layoutSubviews
{
    //set content subview frame
    
    NSInteger allWidth = [self getAllContentWidth];
    NSInteger fixWidth = [self getFixColumnWidth];
    
    _titleLeftView.frame = CGRectMake(0, 0, fixWidth, _rowHeight*_fixRow);
    _titleLeftView.backgroundColor = _sepTitleLineColor;
    
    _titleRightView.frame = CGRectMake(_titleLeftView.frame.size.width,
                                             0,
                                             allWidth - _titleLeftView.frame.size.width,
                                       _titleLeftView.frame.size.height);
    _titleRightView.backgroundColor = _sepTitleLineColor;
    
    _bodyScrollView.frame = CGRectMake(0,
                                               _titleLeftView.frame.size.height,
                                               self.frame.size.width,
                                               self.frame.size.height - _titleLeftView.frame.size.height);//该contentSize的高还需在呈现数据的时候动态计算。宽不能变否则就能任何方向滑动了
    
    
    //该高需在datasource赋值后才能计算
    _bodyLeftView.frame = CGRectMake(0,
                                             0,
                                             _titleLeftView.frame.size.width,
                                     (_dataSource.count - _fixRow)*_rowHeight);
    _bodyLeftView.backgroundColor = _sepBodyLineColor;
    
    _bodyRightScrollView.frame = CGRectMake(_bodyLeftView.frame.size.width,
                                                    0,
                                                    self.frame.size.width - _bodyLeftView.frame.size.width,
                                                    self.frame.size.height - _titleRightView.frame.size.height);//该frame的高和contentSize还需在呈现数据的时候动态计算
    _bodyRightScrollViewSubview.frame = CGRectMake(0, 0, allWidth - _bodyLeftView.frame.size.width, _bodyLeftView.frame.size.height);
    _bodyRightScrollViewSubview.backgroundColor = _sepBodyLineColor;
    
    [self refreshDataAndView];
}


#pragma mark - customfunction

-(NSInteger)getAllContentWidth
{
    NSInteger allWidth = 0;
    for(int col = 0;col < _columnsWidthArr.count ; col++)
    {
        allWidth += [[_columnsWidthArr objectAtIndex:col] integerValue];
    }
    return allWidth;
}

-(NSInteger)getFixColumnWidth
{
    NSInteger fixColumnWidth = 0;
    for(int col = 0;col < _fixCol ; col++)
    {
        fixColumnWidth += [[_columnsWidthArr objectAtIndex:col] integerValue];
    }
    return fixColumnWidth;
}

- (void)refreshDataAndView
{
    for (UILabel *lab in _titleLeftView.subviews){
        [lab removeFromSuperview];
    }
    for (UILabel *lab in _titleRightView.subviews){
        [lab removeFromSuperview];
    }
    for (UILabel *lab in _bodyLeftView.subviews){
        [lab removeFromSuperview];
    }
    for (UILabel *lab in _bodyRightScrollViewSubview.subviews){
        [lab removeFromSuperview];
    }
    [self loadTitle];
    [self loadBody];
    
}

//判断是否是被合并的cell
-(BOOL)isMergeCell:(NSInteger)col andRow:(NSInteger)row
{
    for(NSDictionary *dic in _mergeCellArr)
    {
        if([[dic objectForKey:@"col"] integerValue] == col && [[dic objectForKey:@"row"] integerValue] == row)
        {
            return YES;
        }
    }
    return NO;
}

- (void)loadTitle
{
    float columnOffsetY = 0.0;
    
    //遍历固定行
    for(int fixrow = 0;fixrow < _fixRow;fixrow++)
    {
        NSInteger columnOffsetLeft = 0;
        NSInteger columnOffsetRight = 0;
        
        NSMutableArray *titleArray = [_dataSource objectAtIndex:fixrow];
        
        //遍历改行的titile
        for (int column = 0; column < _columnNum; column++) {
            NSInteger columnWidth = [[_columnsWidthArr objectAtIndex:column] integerValue];
            
            UILabel *lab = [[UILabel alloc] init];
            lab.backgroundColor = _titleBgColor;
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text = [titleArray objectAtIndex:column];
            lab.font = _titleFont;
            lab.textColor = _titleFontColor;
            
            //leftview
            if (column < _fixCol) {
            lab.frame = CGRectMake(columnOffsetLeft, columnOffsetY, columnWidth-ksepLineWidth, _rowHeight-ksepLineWidth);
                [_titleLeftView addSubview:lab];
                columnOffsetLeft += [[_columnsWidthArr objectAtIndex:column] integerValue];
            }
            //rightview
            else
            {
                //先设置普通情况下的width 如果有合并就在计算合并后的width 再判断是否是被合并的单元格如果是就设置成宽为0
                NSInteger width = columnWidth;
                
                //计算合并的宽
                if(_titleMergeArr)
                {
                    for(NSDictionary *dic in _titleMergeArr)
                    {
                        NSString *col = [dic objectForKey:@"col"];
                        NSString *row = [dic objectForKey:@"row"];
                        NSString *span = [dic objectForKey:@"span"];
                        if(col && row && span)
                        {
                            NSInteger colInt = [col integerValue];
                            NSInteger rowInt = [row integerValue];
                            NSInteger spanInt = [span integerValue];
                            if(column == colInt && fixrow == rowInt)
                            {
                                for(int j = column+1; j<column+spanInt;j++)
                                {
                                    width += [[_columnsWidthArr objectAtIndex:j] integerValue];
                                    [_mergeCellArr addObject:@{@"col":[NSString stringWithFormat:@"%d",j],@"row":[NSString stringWithFormat:@"%ld",(long)rowInt]}];
                                }
                                break;
                            }
                        }
                    }
                }
                //判断是否被合并
                if([self isMergeCell:column andRow:fixrow]){width = 0;}
                
                lab.frame = CGRectMake(columnOffsetRight, columnOffsetY, (width-ksepLineWidth)>=0?(width-ksepLineWidth):0, _rowHeight-ksepLineWidth);
                
                [_titleRightView addSubview:lab];
                columnOffsetRight += [[_columnsWidthArr objectAtIndex:column] integerValue];
                
            }
        }
        columnOffsetY += _rowHeight;
    }
    
}

- (void)loadBody
{
    NSInteger rowCount = _dataSource.count - _fixRow;
    
    float columnOffsetY = 0.0;
    
    //遍历行
    for (NSInteger row = 0; row < rowCount; row++) {
        
        NSInteger index = row + _fixRow;
        
        NSInteger columnOffsetLeft = 0;
        NSInteger columnOffsetRight = 0;
        
        NSMutableArray *rowData = [_dataSource objectAtIndex:index];
        
        for (int column = 0; column < _columnNum; column++) {
            NSInteger columnWidth = [[_columnsWidthArr objectAtIndex:column] integerValue];
            
            UILabel *lab = [[UILabel alloc] init];
            lab.backgroundColor = [UIColor clearColor];
            lab.textAlignment = NSTextAlignmentCenter;
            [lab setText:[NSString stringWithFormat:@"%@",[rowData objectAtIndex:column]]];
            lab.font = _bodyFont;
            
            if (column < _fixCol)
            {
                lab.frame = CGRectMake(columnOffsetLeft, columnOffsetY, columnWidth-ksepLineWidth, _rowHeight-ksepLineWidth);
                //                NSLog(@"left:%ld,%@",(long)row,lab);
                if (row%2 == 0) {
                    lab.backgroundColor = _bodyLeftEvenBgColor;
                }
                else
                {
                    lab.backgroundColor = _bodyLeftUnEvenBgColor;
                }
                [_bodyLeftView addSubview:lab];
                columnOffsetLeft += [[_columnsWidthArr objectAtIndex:column] integerValue];
                
            }
            else
            {
                lab.frame = CGRectMake(columnOffsetRight, columnOffsetY, columnWidth-ksepLineWidth, _rowHeight-ksepLineWidth);
                //                NSLog(@"right:%ld,%@",(long)row,lab);
                [_bodyRightScrollViewSubview addSubview:lab];
                if (row%2 == 0) {
                    lab.backgroundColor = _bodyRigtEvenBgColor;
                }
                else
                {
                    lab.backgroundColor = _bodyRightUnEvenBgColor;
                }
                columnOffsetRight += [[_columnsWidthArr objectAtIndex:column] integerValue];
                
            }
            
        }
        
        columnOffsetY += _rowHeight;
        
        //scrollview 和 rightScrollView的contentSize
        NSInteger allWidth = [self getAllContentWidth];
        _bodyScrollView.contentSize = CGSizeMake(_bodyScrollView.frame.size.width,
                                                 columnOffsetY);
        _bodyRightScrollView.contentSize = CGSizeMake(allWidth - _bodyLeftView.frame.size.width,
                                                      columnOffsetY);
        _bodyRightScrollView.frame = CGRectMake(_bodyRightScrollView.frame.origin.x,
                                                _bodyRightScrollView.frame.origin.y,
                                                _bodyRightScrollView.frame.size.width,
                                                columnOffsetY);
        
        
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    self.titleRightView.frame = CGRectMake((scrollView.contentOffset.x - self.titleLeftView.frame.size.width)*-1,
                                            0,
                                            self.titleRightView.frame.size.width,
                                            self.titleRightView.frame.size.height);
    [self bringSubviewToFront:self.titleLeftView];
}


@end
