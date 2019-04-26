//
//  Show3DController.m
//  CategorysDemo
//
//  Created by eyoung on 2018/8/6.
//  Copyright © 2018年 eyoung. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import "Show3DController.h"

@interface Show3DController ()

@end

@implementation Show3DController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Show3D";
    self.view.backgroundColor = UIColor.whiteColor;
    
    // �初始化一个场景
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/file.dae"];
    
    // 取出场景中根结点的第一个结点（目录根结点也就一个子结点，就是我们素材中的Menchi）
    SCNNode *node = scene.rootNode.childNodes.firstObject;
    
    // 绕 y轴 一直旋转
    SCNAction *action = [SCNAction repeatActionForever:[SCNAction rotateByX:0 y:0 z:1 duration:1]];
    [node runAction:action];
    // 素材放大5倍（由于我们素材的尺寸太小了）
    node.transform = SCNMatrix4MakeScale(0.007, 0.007, 0.007);
    
    // �创建一个摄像机并放入场景中
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [scene.rootNode addChildNode:cameraNode];
    
    // �摆放摄像机位置
    cameraNode.position = SCNVector3Make(0, 0, 100);
    
    // 创建�灯光并放入场景中
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 0, 500);
    [scene.rootNode addChildNode:lightNode];
    
    // create and add an ambient light to the scene
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    [scene.rootNode addChildNode:ambientLightNode];
    
    // 创建一个用来展示场景的SCNView
    SCNView *scnView = [[SCNView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scnView];
    
    // 设置场景
    scnView.scene = scene;
    // 设置背景
    scnView.backgroundColor = [UIColor blackColor];
    // 允许控制摄像机位置
    scnView.allowsCameraControl = YES;
    // 显示数据控制台
    scnView.showsStatistics = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
