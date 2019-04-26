//
//  ViewController.m
//  CategorysDemo
//
//  Created by eyoung on 2018/3/31.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <JTCalendar/JTCalendar.h>
#import "YYHelper.h"
#import "ViewController.h"
#import "NextController.h"
#import "Show3DController.h"
#import "DynamicNaviController.h"
#import "YYArrangeView.h"
#import "FirePoint.h"
#import "YYPopView.h"
#import "DashesLine.h"
#import "CircleView.h"
#import "PiercedLabel.h"
#import "DrawTestView.h"
#import "YYChartsBarView.h"
#import "SimpleChartsView.h"
#import "SimpleChartPieView.h"
#import "YYLineGraphView.h"
#import "BigImageCell.h"
#import "YYGradientAlphaView.h"
#import "YYBlockTypedef.h"
#import "YYEasyStore.h"
#import "FMDBManager.h"
#import "UIButton+Badge.h"
#import "UITableView+CommonInit.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate, UIScrollViewDelegate, JTCalendarDelegate>

@property (strong, nonatomic) UIButton * testButton;
@property (copy, nonatomic) YYBlock block;

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) NSMutableArray * dataSourceArr;

@property (strong, nonatomic) JTCalendarManager * calendarManager;

@end

@implementation ViewController{
    CALayer * testlayer;
    NSDate * _dateSelected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //测试按钮
    [self.view addSubview:self.testButton];
    [self.testButton addTarget:self action:@selector(testButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加数据
//    for (int i = 1; i < 10; i++) {
//        NSString * usid = [NSString stringWithFormat:@"user%@",@(i)];
//        NSString * name = [NSString stringWithFormat:@"name%@",@(i)];
//        NSString * head = [NSString stringWithFormat:@"head%@",@(i)];
//        [[FMDBManager shared] updateUser:usid withName:name head:head];
//    }
    
    //日期字符串与日期转换
    //[self dateStringTransform];
  	
    //时间戳转字符串
	//[self timestampTest];
    
    //UIButton 角标
    //[self showButtonBadge];
    
    //演示重定义Block
    //[self testBlockDefine];
    
    //获取字符串高度
    //[self showGetStringSize];
    
    //排列视图演示数据
    //[self showTestArrangeView];
    
    //折线图
    //[self showTestLineGraph];
    
    //饼状图
    //[self showPieView];
    
    //环形图
    //[self showCycleViews];
    
    //随便画点啥
    //[self showDrawSomething];
    
    //虚线
    //[self showDashesLine];
    
    //测试倒计时
    //[self.testButton addTarget:self action:@selector(countDownTestAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //测试弹出框
    //[self.testButton addTarget:self action:@selector(testButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //渐变色
//    YYGradientAlphaView * newView = [self jbsView];
//    [self.view addSubview:newView];
//    UIImageView * jbsImgView = [[UIImageView alloc] initWithImage:[self jbsImage]];
//    jbsImgView.top = newView.bottom+20;
//    [self.view addSubview:jbsImgView];
//    UIImageView * textImgView = [[UIImageView alloc] initWithImage:[self jbsImageWithStr:@"字符"]];
//    textImgView.top = jbsImgView.bottom+20;
//    [self.view addSubview:textImgView];
    
    //存储方法测试
    //[self readEasyStore];
    //[self.testButton setTitle:@"删除数据" forState:UIControlStateNormal];
    //[self.testButton addTarget:self action:@selector(clearEasyStore) forControlEvents:UIControlEventTouchUpInside];
    //写存储数据按钮
    //YYGradientButton * writeBtn = [YYGradientButton gradientButtonWithFram:CGRectMake(25*KScale, self.testButton.top-25*KScale-45*KScale, Kwidth-50*KScale, 45*KScale)];
    //[writeBtn setTitle:@"存储数据" forState:UIControlStateNormal];
    //[writeBtn addTarget:self action:@selector(writeEasyStore) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:writeBtn];
    
    //UITableView缺省视图及下拉刷新测试
    //[self.view addSubview:self.tableView];
    //下拉刷新动画测试
//    NSMutableArray * idleArr = [NSMutableArray array];
//    for (int idx = 1; idx < 6; idx++) {
//        NSString * imgName = [NSString stringWithFormat:@"timg%@.tiff",@(idx)];
//        [idleArr addObject:[UIImage imageNamed:imgName]];
//    }
//    NSMutableArray * pullArr = [NSMutableArray array];
//    for (int idx = 6; idx < 12; idx++) {
//        NSString * imgName = [NSString stringWithFormat:@"timg%@.tiff",@(idx)];
//        [pullArr addObject:[UIImage imageNamed:imgName]];
//    }
//    NSMutableArray * fresArr = [NSMutableArray array];
//    for (int idx = 12; idx < 18; idx++) {
//        NSString * imgName = [NSString stringWithFormat:@"timg%@.tiff",@(idx)];
//        [fresArr addObject:[UIImage imageNamed:imgName]];
//    }
//    [self.tableView setRefreshIdleArrayIdleArray:idleArr pullArray:pullArr freshArray:fresArr refreshTarget:self refreshAction:@selector(refreshTableViewData)];
    
    //YY导航栏按钮
    //[self showPushNavigationVCButtons];
    
    //新折线图
    //[self showSimpleChartLineView];
    
    //柱状图
    //[self showTestChartsBarView];
    
    //CaTextLayer
    //[self showCATestLayer];
    
    //AttributString
    //[self showAttributeStringLabel];
    
    //镂空文字
    //[self showPiercedText];
    
    //创建日历视图
    //[self setupCalendarView];
}

#pragma mark --------Getters--------

//测试按钮初始化
- (UIButton *)testButton{
    if (!_testButton) {
        _testButton = [YYHelper gradientButtonWithFram:CGRectMake(25*KScale, Kheight-SafeAreaBottomHeight-45*KScale-20*KScale, Kwidth-50*KScale, 45*KScale)];
        [_testButton setTitle:@"测试按钮" forState:UIControlStateNormal];
    }
    return _testButton;
}

//UITableView
- (UITableView *)tableView{
    if (!_tableView) {
        //_tableView = [UITableView tableViewWithFrame:CGRectMake(0, statueBarHeight, Kwidth, self.testButton.top-statueBarHeight-10*KScale) delegate:self nodataDelegate:nil refreshTarget:self refreshAction:@selector(refreshTableViewData) loadMoreAction:@selector(loadMoreTableViewData)];
        _tableView = [YYHelper getTableViewWithFrame:CGRectMake(0, SafeAreaTopHeight, Kwidth, self.testButton.top-SafeAreaTopHeight-10*KScale) style:UITableViewStyleGrouped separatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showEmptyView = YES;
        [_tableView registerClass:[BigImageCell class] forCellReuseIdentifier:@"tableViewCellReuseId"];
    }
    return _tableView;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
        for (NSInteger idx = 0; idx < 33; idx++) {
            [_dataSourceArr addObject:@(idx)];
        }
    }
    return _dataSourceArr;
}

- (void)setupBgImageForTableView:(UITableView *)tableView{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"lakeside_sunset" ofType:@"png"];
    UIImageView * bigImgView = [[UIImageView alloc] initWithFrame:tableView.frame];
    bigImgView.image = [UIImage imageWithContentsOfFile:imagePath];
    [tableView setBackgroundColor:UIColor.clearColor];
    [tableView.superview insertSubview:bigImgView belowSubview:tableView];
}

//测试按钮事件
- (void)testButtonAction:(UIButton *)sender{
//    UILabel * testLabel = [[UILabel alloc] initWithFrame:CGRectMake(25*KScale, 64, Kwidth-50*KScale, 40)];
//    testLabel.backgroundColor = [UIColor whiteColor];
//    testLabel.textColor = [UIColor grayColor];
//    testLabel.textAlignment = NSTextAlignmentCenter;
//    testLabel.text = @"这是一个测试文本";
//    YYPopView * popView = [YYPopView yy_popViewType:YYPopViewTypeCenter withView:testLabel];
//    [popView show];
    
//    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, 200)];
//    bottomView.backgroundColor = [UIColor whiteColor];
//    YYPopView * popView1 = [YYPopView yy_popViewType:YYPopViewTypeBottom withView:bottomView];
//    [popView1 show];
    
    //[self goup];
    
    //Show3DController * show3dVC = [[Show3DController alloc] init];
    //[self.navigationController pushViewController:show3dVC animated:YES];
    
    //NextController * nextVC = [[NextController alloc] init];
    //[self.navigationController pushViewController:nextVC animated:YES];
    
//    static int idx = 1;
//    NSString * usid = [NSString stringWithFormat:@"user%@",@(idx)];
//    [[FMDBManager shared] selectNameHeadOfUser:usid complete:^(NSDictionary *resultDic) { }];
//    idx++;
//    if (idx >= 10) {
//        idx = 0;
//    }
}

#pragma mark ----------放烟花----------
- (CGFloat)randomAngle{
    NSInteger randomInt = random()%3600;
    CGFloat angle = randomInt/3600.0*M_PI;
    CGFloat result = random()%2?angle:-angle;
    return result;
}

//放烟花 --升空
- (void)goup{
    CGPoint startP = CGPointMake(Kwidth/2, self.testButton.top);
    CGPoint controlP = CGPointMake(Kwidth/2, 200);
    CGPoint endP = CGPointMake(Kwidth/2, 200);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startP.x, startP.y);
    CGPathAddQuadCurveToPoint(path, NULL, controlP.x , controlP.y, endP.x, endP.y);
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.delegate = self;
    animate.duration = 3;
    animate.fillMode = kCAFillModeForwards;
    animate.repeatCount = 0;
    animate.path = path;
    animate.removedOnCompletion = NO;
    CGPathRelease(path);
    
    CALayer * newLayer = [[CALayer alloc] init];
    newLayer.backgroundColor = [UIColor sy_randomColor].CGColor;
    newLayer.masksToBounds = YES;
    newLayer.cornerRadius = 5;
    newLayer.frame = CGRectMake(startP.x, startP.y, 10, 10);
    [self.view.layer addSublayer:newLayer];
    [newLayer addAnimation:animate forKey:@"jakillTest"];
    
    //动画结束后移除上升的point
    [self performSelector:@selector(removeShell:) withObject:newLayer afterDelay:animate.duration+0.01];
}

- (void)removeShell:(CALayer *)shell{
    [shell removeFromSuperlayer];
}

//放烟花 --爆炸
- (void)doBallisticMovement{
    for (NSInteger idx = 0; idx < 15; idx++) {
        FirePoint * point = [[FirePoint alloc] initWithStartP:CGPointMake(Kwidth/2, 200) andDirection:[self randomAngle] andSpeed:Kwidth/2/3];
        [self.view.layer addSublayer:point];
        [point doBallisticMovement];
    }
}

- (void)animationDidStart:(CAAnimation *)anim{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [testlayer removeFromSuperlayer];
        //爆炸
        [self doBallisticMovement];
        [self performSelector:@selector(doBallisticMovement) withObject:nil afterDelay:0.1];
        [self performSelector:@selector(doBallisticMovement) withObject:nil afterDelay:0.2];
    }
}

#pragma mark ----------新柱状图----------
- (void)showTestChartsBarView{
    YYChartsBarView * chartBarView = [[YYChartsBarView alloc] initWithFrame:CGRectMake(13*KScale, SafeAreaTopHeight+30*KScale, Kwidth-26*KScale, 230*KScale)];
    [self.view addSubview:chartBarView];
    
    NSArray * lightArr = @[@(3),@(6),@(2),@(5),@(9),@(3)];
    NSArray * deepArr = @[@(1),@(2),@(1),@(3),@(4),@(2)];
    [chartBarView updateWithValues:[self modelsWithValuesArr:lightArr] forTitle:@"浅睡眠" andColor:UIColor.orangeColor];
    [chartBarView updateWithValues:[self modelsWithValuesArr:deepArr] forTitle:@"深睡眠" andColor:UIColor.redColor];
}

- (NSArray *)modelsWithValuesArr:(NSArray *)arr{
    NSMutableArray * theArr = [NSMutableArray array];
    for (NSInteger idx = 0; idx < arr.count; idx++) {
        SimpleChartsDataModel * model = [[SimpleChartsDataModel alloc] init];
        model.time = [YYHelper getNowTimestamp]+24*360*1000;
        model.data = [arr[idx] integerValue];
        [theArr addObject:model];
    }
    return theArr;
}

#pragma mark ----------新折线图----------
- (void)showSimpleChartLineView{
    //创建、加载视图
    SimpleChartsView * newLineView = [[SimpleChartsView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight+50*KScale, Kwidth, 240*KScale)];
    [self.view addSubview:newLineView];
    
    //添加数据
    NSArray * modelsArr = [self simpleChartData];
    newLineView.lineChartView.xAxis.labelCount = MIN(modelsArr.count, 8);
    [newLineView updateWithValues:modelsArr forTitle:@"" andColor:[UIColor sy_colorWithString:@"#5D96FF"]];
}

- (NSArray <SimpleChartsDataModel *>*)simpleChartData{
    NSMutableArray * dataSourceArr = [NSMutableArray array];
    NSDictionary * orignDataDic = @{@"0":@(100),@"3":@(130),@"6":@(170),@"9":@(150),@"12":@(138),@"15":@(125),@"18":@(103),@"21":@(139),@"24":@(170)};
    for (NSString * key in orignDataDic.allKeys) {
        SimpleChartsDataModel * dataModel = [[SimpleChartsDataModel alloc] init];
        dataModel.time = [key integerValue];
        dataModel.data = [orignDataDic[key] floatValue];
        dataModel.normal = dataModel.data < 100;
        [dataSourceArr addObject:dataModel];
    }
    
    //排序
    for (int idx = 0; idx < dataSourceArr.count-1; idx++) {
        for (int idy = 0; idy < dataSourceArr.count-1-idx; idy++) {
            double time1 = ((SimpleChartsDataModel *)dataSourceArr[idy]).time;
            double time2 = ((SimpleChartsDataModel *)dataSourceArr[idy+1]).time;
            if (time1 > time2) {
                SimpleChartsDataModel * temp = dataSourceArr[idy];
                dataSourceArr[idy] = dataSourceArr[idy+1];
                dataSourceArr[idy+1] = temp;
            }
        }
    }
    return dataSourceArr;
}

#pragma mark ----------饼状图(环状图)----------
- (void)showPieView{
	SimpleChartPieView * pieview = [[SimpleChartPieView alloc] initWithFrame:CGRectMake(10*KScale, 100*KScale, Kwidth-20*KScale, Kwidth-20*KScale)];
    NSArray * values = @[@(10),@(20),@(40),@(0)];
    NSArray * names = @[@"测试1",@"测试2",@"测试3",@"测试4"];
    NSArray * colors = @[UIColor.redColor,UIColor.orangeColor,UIColor.cyanColor,UIColor.yellowColor];
    [pieview updateWithValues:values names:names colors:colors];
    [self.view addSubview:pieview];
}

#pragma mark ----------画虚线----------
- (void)showDashesLine{
    UIView * dashesLine = [DashesLine dashesLineFrom:CGPointMake(100, 300) to:CGPointMake(100-50, 300) withColor:UIColor.purpleColor andWidth:2];
    [self.view addSubview:dashesLine];
}

#pragma mark ----------圆环视图----------
- (void)showCycleViews{
    CircleView *topCycle = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    topCycle.center = self.view.center;
    topCycle.value = 0.26;
    [topCycle setLineWidth:30.f];
    [topCycle setBackColor:[UIColor sy_colorWithString:@"#5D96FF"]];
    [topCycle setLineColor:[UIColor orangeColor]];
    [self.view addSubview:topCycle];
}

- (void)showDrawSomething{
    DrawTestView * testView = [[DrawTestView alloc] initWithFrame:CGRectMake(20, SafeAreaTopHeight+20, Kwidth-40, Kheight-SafeAreaTopHeight-SafeAreaBottomHeight-40)];
    testView.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:testView];
}

#pragma mark ----------导航栏----------
- (void)showPushNavigationVCButtons{
    UIButton * nextBtn = [YYHelper gradientButtonWithFram:CGRectMake(25*KScale, SafeAreaTopHeight+30*KScale, Kwidth-50*KScale, 45*KScale)];
    [nextBtn setTitle:@"透明导航栏" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(pushLucencyNavigationBarVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    UIButton * thirdBtn = [YYHelper gradientButtonWithFram:CGRectMake(25*KScale, nextBtn.bottom+30*KScale, Kwidth-50*KScale, 45*KScale)];
    [thirdBtn setTitle:@"动态导航栏" forState:UIControlStateNormal];
    [thirdBtn addTarget:self action:@selector(pushDynamicNavigationBarVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdBtn];
}

//Push透明导航栏VC
- (void)pushLucencyNavigationBarVC{
    NextController * nextVC = [[NextController alloc] init];
    //订制导航栏样式：默认+透明+状态、标题、返回按钮栏白色
    nextVC.configurations = YPNavigationBarConfigurationsDefault|YPNavigationBarBackgroundStyleTransparent|YPNavigationBarStyleBlack;
    [self.navigationController pushViewController:nextVC animated:YES];
}

//Push动态导航栏VC
- (void)pushDynamicNavigationBarVC{
    DynamicNaviController * nextVC = [[DynamicNaviController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark ----------日期字符串与日期转换----------
- (void)dateStringTransform{
    NSString * dateStr = @"2018-04-18 09:50:33";
    NSDate * thedate = [YYHelper dateFromString:dateStr withFormate:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"日期字串：%@",dateStr);
    NSLog(@"获得日期：%@",thedate);
    NSDate * current = [NSDate date];
    NSString * currentStr = [YYHelper stringFromDate:current withFormate:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"当前日期：%@",current);
    NSLog(@"获得字串：%@",currentStr);
}

//演示按钮角标
- (void)showButtonBadge{
    UIButton * badgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    badgeBtn.frame = CGRectMake(50*KScale, 80*KScale, 100*KScale, 50*KScale);
    badgeBtn.backgroundColor = [UIColor grayColor];
    [badgeBtn setTitle:@"角标Button" forState:UIControlStateNormal];
    [badgeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [badgeBtn setBadgeValue:@"100"];
    [badgeBtn.badge setTextColor:[UIColor blueColor]];
    [self.view addSubview:badgeBtn];
}

//渐变色视图
- (YYGradientAlphaView *)jbsView{
    UIColor * leftColor = [UIColor greenColor];
    UIColor * rightColor = [UIColor blueColor];
    YYGradientAlphaView * newView = [[YYGradientAlphaView alloc] initWithFrame:CGRectMake(0, 40, Kwidth, 100) leftColor:leftColor rightColor:rightColor];
    return newView;
}

//渐变色图片
- (UIImage *)jbsImage{
    UIColor * leftColor = [UIColor orangeColor];
    UIColor * rightColor = [UIColor redColor];
    UIImage * newImage = [YYGradientAlphaView gradientImgFromColors:@[leftColor,rightColor] withFrame:CGRectMake(0, 40, Kwidth, 100)];
    return newImage;
}

//图片添加文字
- (UIImage *)jbsImageWithStr:(NSString *)text{
    UIImage * newImg = [self jbsImage];
    UIImage * textImg = [YYGradientAlphaView addText:@"字符" toImage:newImg];
    return textImg;
}

//YYBlock演示
- (void)testBlockDefine{
    self.block = ^{
        NSLog(@"YYBlock  --Test");
    };
    self.block();
    
    YYBlockBlock testBlock1 = ^(YYBlock ablock){
        DBLog(@"YYBlockBlock --Test");
    };
    testBlock1(self.block);
}

//倒计时事件
- (void)countDownTestAction:(UIButton *)sender{
    __weak typeof(sender) weakBtn = sender;
    [YYHelper countDownTime:60 prepare:^{
        [weakBtn setEnabled:NO];
        [weakBtn setTitle:@"60" forState:UIControlStateNormal];
    } counting:^(NSInteger remain) {
        [weakBtn setTitle:[NSString stringWithFormat:@"%@秒",@(remain)] forState:UIControlStateNormal];
    } finished:^(BOOL ended) {
        [weakBtn setTitle:@"倒计时完成" forState:UIControlStateNormal];
        [weakBtn setEnabled:YES];
    }];
}

//测试获取时间戳，时间戳与字符串相互转化
- (void)timestampTest{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString * timestamp = [NSString stringWithFormat:@"%llu", recordTime];
    NSString * timesTamp1 = [NSString stringWithFormat:@"%ld", [YYHelper getNowTimestamp]];
    NSString * timesTamp2 = [YYHelper timestampSwitchTime:recordTime/1000];
    DBLog(@"系统参数中的时间戳获取结果：%@",timestamp);
    DBLog(@"公共类获取的时间戳获取结果：%@",timesTamp1);
    DBLog(@"当前时间戳转换为字符串结果：%@",timesTamp2);
}

//演示获取字符串高度
- (void)showGetStringSize{
    NSString * testString = @"jkwekbd23efwrgwrf";
    CGFloat textWidth = Kwidth-40*KScale;
    CGSize textSize = [YYHelper getSizeForString:testString withBoundingSize:CGSizeMake(textWidth, 1000) andFontSize:14*KScale];
    UILabel * testLbl = [[UILabel alloc] initWithFrame:CGRectMake(20*KScale, 40*KScale, textSize.width, textSize.height)];
    testLbl.backgroundColor = [UIColor grayColor];
    testLbl.font = [UIFont systemFontOfSize:14*KScale];
    testLbl.numberOfLines = 0;
    testLbl.text = testString;
    [self.view addSubview:testLbl];
}

//演示多视图排列
- (void)showTestArrangeView{
    NSMutableArray * labelsArr = [NSMutableArray array];
    NSArray * titlesArr = @[@"hfhinwe",@"qef",@"elkvmvne",
                            @"dfg",@"vrbgerb",@"hzhesdbhiu",
                            @"dhvisbviop",@"w",@"edver",
                            @"vewrb",@"vwerg",@"vwervb"];
    for (NSString * title in titlesArr) {
        UILabel * testLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50*KScale, 20*KScale)];
        testLbl.font = [UIFont systemFontOfSize:14*KScale];
        testLbl.textColor = [UIColor sy_colorWithString:@"#333333"];
        testLbl.textAlignment = NSTextAlignmentCenter;
        testLbl.text = title;
        //testLbl.width = [testLbl getCurrentTextWidth]+14*KScale;
        [testLbl showBorderWithColor:[UIColor orangeColor] width:0.5 cornerRadius:3];
        [labelsArr addObject:testLbl];
    }
    YYArrangeView * arrangeView = [YYArrangeView arrangeViewWithFrame:CGRectMake(0, 40, Kwidth, 100*KScale) andViewsArr:labelsArr];
    arrangeView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:arrangeView];
}

//演示折线图
- (void)showTestLineGraph{
    NSMutableArray * valuesArr = @[@[@(11),@(15),@(19),@(23),@(17),@(30)],
                                   @[@(33),@(36),@(46),@(52),@(26),@(40)],
                                   @[@(66),@(80),@(75),@(63),@(88),@(72)]].mutableCopy;
    NSMutableArray * colorsArr = @[[UIColor redColor],
                                   [UIColor blueColor],
                                   [UIColor orangeColor]].mutableCopy;
    NSMutableArray * xtitlesArr = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"].mutableCopy;
    
    YYLineGraphView * linegraphView = [[YYLineGraphView alloc] initWithFrame:CGRectMake(0, 64, Kwidth, 200)];
    linegraphView.showHorizonLines = YES;
    linegraphView.showVerticalLines = YES;
    linegraphView.showHorizonTitle = YES;
    linegraphView.showVerticalTitle = YES;
    linegraphView.xTitlesArr = xtitlesArr;
    linegraphView.valuesArr = valuesArr;
    linegraphView.colorsArr = colorsArr;
    [linegraphView reloadData];
    [self.view addSubview:linegraphView];
}

//测试EasyStore
- (void)readEasyStore{
    UILabel * lbl1 = [self.view subviewWithTag:101];
    if (!lbl1) {
        lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(12*KScale, 64, Kwidth-24*KScale, 20*KScale)];
        lbl1.tag = 101;
        lbl1.backgroundColor = [UIColor grayColor];
        lbl1.text = @"";
        [self.view addSubview:lbl1];
    }
    
    
    UILabel * lbl2 = [self.view subviewWithTag:102];
    if (!lbl2) {
        lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(12*KScale, lbl1.bottom+20, Kwidth-24*KScale, 20*KScale)];
        lbl2.tag = 102;
        lbl2.backgroundColor = [UIColor grayColor];
        lbl2.text = @"";
        [self.view addSubview:lbl2];
    }
    
    UILabel * lbl3 = [self.view subviewWithTag:103];
    if (!lbl3) {
        lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(12*KScale, lbl2.bottom+20, Kwidth-24*KScale, 20*KScale)];
        lbl3.tag = 103;
        lbl3.backgroundColor = [UIColor grayColor];
        lbl3.text = @"";
        [self.view addSubview:lbl3];
    }
    
    //NSData存储
    NSData * storedData = [[YYEasyStore sharedInstance] readDataForKey:@"TEST_NSData"];
    if (storedData) {
        NSString * testStr = [[NSString alloc] initWithData:storedData encoding:NSUTF8StringEncoding];
        lbl1.text = [NSString stringWithFormat:@"读取到存储的数据：%@",testStr];
    } else {
        lbl1.text = @"未读取到存储的数据！";
    }
    
    //NSString存储
    NSString * testStr = [[YYEasyStore sharedInstance] readStringForKey:@"TEST_NSString"];
    if (testStr) {
        lbl2.text = [NSString stringWithFormat:@"读取到存储的字串：%@",testStr];
    } else {
        lbl2.text = @"未读取到存储的字符串！";
    }
    
    //NSArray存储
    NSArray * testArr = [[YYEasyStore sharedInstance] readStringArrForKey:@"TEST_NSArray"];
    if (testArr.count >= 1) {
        NSMutableString * baseStr = [NSMutableString string];
        for (NSString * str in testArr) {
            [baseStr appendString:str];
            [baseStr appendString:@"-"];
        }
        [baseStr deleteCharactersInRange:NSMakeRange(baseStr.length-1, 1)];
        lbl3.text = [NSString stringWithFormat:@"读取到数组：%@",baseStr];
    } else {
        lbl3.text = @"未读取到存储的数组！";
    }
}

- (void)writeEasyStore{
    //NSData存储
    NSData * testData = [@"NSData测试字符串" dataUsingEncoding:NSUTF8StringEncoding];
    [[YYEasyStore sharedInstance] storeData:testData forKey:@"TEST_NSData"];
    //NSString存储
    [[YYEasyStore sharedInstance] storeString:@"123456788" forKey:@"TEST_NSString"];
    //NSArray存储
    NSArray * newtestArr = @[@"123",@"456",@"789"];
    [[YYEasyStore sharedInstance] storeArray:newtestArr forKey:@"TEST_NSArray"];
    
    [self readEasyStore];
}

//清空存储数据
- (void)clearEasyStore{
    [[YYEasyStore sharedInstance] clearAllData];
    [[YYEasyStore sharedInstance] clearAllString];
    [[YYEasyStore sharedInstance] clearAllStringArr];
    
    [self readEasyStore];
}

//显示UIlabel与CATextLayer区别
- (void)showCATestLayer{
    //UIlabel
    UILabel * textLbl = [[UILabel alloc] initWithFrame:CGRectMake(12*KScale, SafeAreaTopHeight+20*KScale, Kwidth-24*KScale, 40*KScale)];
    textLbl.font = [UIFont systemFontOfSize:14];
    textLbl.textColor = UIColor.cyanColor;
    textLbl.backgroundColor = UIColor.orangeColor;
    textLbl.textAlignment = NSTextAlignmentCenter;
    textLbl.text = @"这是一个UILabel";
    [self.view addSubview:textLbl];
    
    //CATextLayer
    CATextLayer * textLayer = [YYHelper getTextLayerWithFrame:CGRectMake(12*KScale, SafeAreaTopHeight+80*KScale, Kwidth-24*KScale, 30*KScale) title:@"这是一个TextLayer这是一个TextLayer这是一个TextLayer这是一个TextLayer这是一个TextLayer这是一个TextLayer" textColor:UIColor.greenColor font:[UIFont systemFontOfSize:14] aligment:NSTextAlignmentCenter];
    textLayer.backgroundColor = UIColor.orangeColor.CGColor;
    [self.view.layer addSublayer:textLayer];
}

//显示AttributeString
- (void)showAttributeStringLabel{
    NSMutableAttributedString * baseStr = [[NSMutableAttributedString alloc] initWithString:@""];
    [baseStr appendString:@"测试1" withFont:[UIFont systemFontOfSize:12] textColor:UIColor.orangeColor];
    [baseStr appendString:@"测试2" withFont:[UIFont systemFontOfSize:15] textColor:UIColor.redColor];
    [baseStr appendString:@"测试3" withFont:nil textColor:nil];
    UILabel * testLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, SafeAreaTopHeight+20, Kwidth-40, 20)];
    testLbl.textAlignment = NSTextAlignmentCenter;
    testLbl.attributedText = baseStr;
    [self.view addSubview:testLbl];
}

//显示镂空文字
- (void)showPiercedText{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(12, SafeAreaTopHeight+100, Kwidth-24, 50)];
    bgView.backgroundColor = UIColor.redColor;
    [self.view addSubview:bgView];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"lakeside_sunset" ofType:@"png"];
    UIImageView * bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bgView.width, bgView.height)];
    bgImgView.image = [UIImage imageWithContentsOfFile:imagePath];
    [bgView addSubview:bgImgView];
    
    PiercedLabel * pierLbl = [[PiercedLabel alloc] initWithFrame:CGRectMake(10, 10, bgView.width-20, bgView.height-20)];
    pierLbl.text = @"镂空文字测试";
    pierLbl.textAlignment = NSTextAlignmentCenter;
    pierLbl.font = [UIFont boldSystemFontOfSize:30];
    pierLbl.backgroundColor = UIColor.grayColor;
    [bgView addSubview:pierLbl];
    
    //显示参考效果
    [self showContrastLabel];
}

- (void)showContrastLabel{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(12, SafeAreaTopHeight+160, Kwidth-24, 50)];
    bgView.backgroundColor = UIColor.redColor;
    [self.view addSubview:bgView];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"lakeside_sunset" ofType:@"png"];
    UIImageView * bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bgView.width, bgView.height)];
    bgImgView.image = [UIImage imageWithContentsOfFile:imagePath];
    [bgView addSubview:bgImgView];
    
    UILabel * pierLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, bgView.width-20, bgView.height-20)];
    pierLbl.text = @"镂空文字测试";
    pierLbl.textAlignment = NSTextAlignmentCenter;
    pierLbl.font = [UIFont boldSystemFontOfSize:30];
    pierLbl.backgroundColor = UIColor.grayColor;
    [bgView addSubview:pierLbl];
}

//刷新数据
- (void)refreshTableViewData{
    [self.dataSourceArr removeAllObjects];
    [self.tableView reloadData];
    
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

//加载更多
- (void)loadMoreTableViewData{
    NSInteger lastInteger = 0;
    if (self.dataSourceArr.count > 0) {
        lastInteger = [[self.dataSourceArr lastObject] integerValue];
    }
    
    for (int idx = 1; idx < 9; idx++) {
        [self.dataSourceArr addObject:@(lastInteger+idx)];
    }
    
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark --------UITableView代理--------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (BigImageCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BigImageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCellReuseId" forIndexPath:indexPath];
    if (indexPath.row == 16) {
        [cell loadBigImage];
        cell.textLabel.text = @"";
    } else {
        [cell removeBigImage];
        cell.textLabel.text = [NSString stringWithFormat:@"测试 --%@",self.dataSourceArr[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 16 ? 80*KScale : 50*KScale;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------UISCrollViewDelegate----------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSIndexPath * indexpath = [NSIndexPath indexPathForRow:16 inSection:0];
    BigImageCell * imgCell = [self.tableView cellForRowAtIndexPath:indexpath];
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:indexpath];
    CGRect rectInSuperview = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    CGFloat top = rectInSuperview.origin.y;
    DBLog(@"TableViewTop:%.f  Bottom:%.f  CellTop:%.f",self.tableView.top,self.tableView.bottom,top);
    if (top > self.tableView.top && top < self.tableView.bottom) {
        [imgCell updateImgWithTop:top];
    }
}

#pragma mark ----------JTCalendar日历----------
- (void)setupCalendarView{
    JTCalendarMenuView * menuView = [[JTCalendarMenuView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight+10*KScale, Kwidth, 50*KScale)];
    [self.view addSubview:menuView];
    JTHorizontalCalendarView * contentView = [[JTHorizontalCalendarView alloc] initWithFrame:CGRectMake(0, menuView.bottom, Kwidth, 400*KScale)];
    [self.view addSubview:contentView];
    _calendarManager = [[JTCalendarManager alloc] init];
    _calendarManager.delegate = self;
    _calendarManager.menuView = menuView;
    _calendarManager.contentView = contentView;
    _calendarManager.date = [NSDate date];
}

#pragma mark ----------JTCalendar代理----------
- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(UIView<JTCalendarDay> *)dayView{
    JTCalendarDayView * adayView = (JTCalendarDayView *)dayView;
    adayView.hidden = NO;
    
    // Test if the dayView is from another month than the page
    // Use only in month mode for indicate the day of the previous or next month
    if([adayView isFromAnotherMonth]){
        adayView.hidden = YES;
    }
    // Today
    else if([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        adayView.circleView.hidden = NO;
        adayView.circleView.backgroundColor = [UIColor blueColor];
        adayView.dotView.backgroundColor = [UIColor whiteColor];
        adayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Selected date
    else if(_dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        adayView.circleView.hidden = NO;
        adayView.circleView.backgroundColor = [UIColor redColor];
        adayView.dotView.backgroundColor = [UIColor whiteColor];
        adayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Another day of the current month
    else{
        adayView.circleView.hidden = YES;
        adayView.dotView.backgroundColor = [UIColor redColor];
        adayView.textLabel.textColor = [UIColor blackColor];
    }
    
    // Your method to test if a date have an event for example
    adayView.dotView.hidden = NO;
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(UIView<JTCalendarDay> *)dayView{
    // Use to indicate the selected date
    JTCalendarDayView * adayView = (JTCalendarDayView *)dayView;
    _dateSelected = adayView.date;
    
    // Animation for the circleView
    adayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:adayView
                      duration:.3
                       options:0
                    animations:^{
                        adayView.circleView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
    
    // Load the previous or next page if touch a day from another month
    JTHorizontalCalendarView * contentView = (JTHorizontalCalendarView *)_calendarManager.contentView;
    if(![_calendarManager.dateHelper date:contentView.date isTheSameMonthThan:adayView.date]){
        if([contentView.date compare:dayView.date] == NSOrderedAscending){
            [contentView loadNextPageWithAnimation];
        }
        else{
            [contentView loadPreviousPageWithAnimation];
        }
    }
}

- (UIView<JTCalendarDay> *)calendarBuildDayView:(JTCalendarManager *)calendar{
    JTCalendarDayView *view = [JTCalendarDayView new];
    view.textLabel.font = [UIFont systemFontOfSize:13];
    view.textLabel.textColor = [UIColor blackColor];
    return view;
}

@end
