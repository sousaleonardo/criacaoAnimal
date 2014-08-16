//
//  DQMyScene.m
//  criacaoAnimal
//
//  Created by Leonardo de Sousa Mendes on 03/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "DQMyScene.h"


@implementation DQMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        [self configuraPontos];
        
        self.animal=[[DQAnimalToupeira alloc]initToupeira];
        [self.animal setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [self addChild:self.animal];
    }
    return self;
}

-(void)update:(NSTimeInterval)currentTime{
    [self.animal realizarAcao];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    
}

-(void)configuraPontos{
    self.pontoUm=[SKSpriteNode spriteNodeWithColor:[UIColor purpleColor] size:CGSizeMake(100, 100)];
    self.pontoDois=[SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(100, 100)];
    
    [self.pontoUm setPosition:CGPointMake(CGRectGetMinX(self.frame), CGRectGetMidY(self.frame))];
    [self.pontoDois setPosition:CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame))];
    
    [self.pontoUm setName:@"jogador"];
    [self.pontoDois setName:@"jogador"];
    
    [self addChild:self.pontoUm];
    [self addChild:self.pontoDois];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.pontoDois setPosition:CGPointMake(self.pontoDois.position.x-100, self.pontoDois.position.y)];
    
    [self.animal fugir];
}

@end
