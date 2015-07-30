//
//  ViewController.m
//  BounceBall
//
//  Created by Nguyen Minh Khue on 7/30/15.
//  Copyright (c) 2015 Nguyen Minh Khue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle;
    CGFloat ballRadius;
    CGFloat maxWidth;
    CGFloat maxHeight;
    CGFloat toadoX,toadoY;
    CGFloat chieu;
    CGFloat chieuX,chieuY;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawBG];
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(bounceBall)
                                           userInfo:nil
                                            repeats:true];
}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Football32.png"]];
    ballRadius = 32.0;
    chieu=1;
    chieuX=1;
    chieuY=1;
    toadoX =mainViewSize.width * 0.5;
    toadoY =mainViewSize.height - ballRadius * 3;
    
    ball.center = CGPointMake(toadoX, toadoY);
    maxWidth = mainViewSize.width - ballRadius;
    maxHeight = mainViewSize.height - ballRadius;
    [self.view addSubview:ball];
}

- (void)drawBG{
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:background];
    
}

-(void) bounceBall{
    CGFloat deltaAngle=0.1;
    CGFloat deltaBall = 0.1;
    toadoX = ball.center.x + chieuX * ballRadius * deltaBall;
    toadoY = ball.center.y - chieuY * ballRadius * deltaBall;
    
    angle += chieuX * deltaAngle;
    
    
    if (toadoX>maxWidth)
    {
        chieuX = -chieuX;
        deltaAngle=-deltaAngle;
        angle += chieuX * deltaAngle;
    }
    else if (toadoX<ballRadius)
    {
        chieuX = -chieuX;
        deltaAngle=-deltaAngle;
        angle += chieuX * deltaAngle;
    }
    else if (toadoY<ballRadius)
    {
        chieuY = -chieuY;
        deltaAngle=-deltaAngle;
        angle += chieuY * deltaAngle;
    }
    else if (toadoY>maxHeight)
    {
        chieuY = -chieuY;
        deltaAngle=-deltaAngle;
        angle += chieuY * deltaAngle;
    }
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(toadoX,
                              toadoY);
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}


@end
