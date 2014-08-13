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
        
        DQAnimal *animal=[[DQAnimal alloc]initAnimalNome:@"Leopardinho" sprite:@"andando1" raioVisao:50.0f];
        
        [animal setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        
        [self addChild:animal];
        
        [animal animarAnimal];
    }
    return self;
}
-(void)update:(NSTimeInterval)currentTime{
    NSLog(@"%i",arc4random()%2);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self sortear];
}

-(void)sortear{
    NSMutableArray *arraySorteio=[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:70.0],[NSNumber numberWithFloat:30.0],nil];
    
    float valorSorteador=arc4random()%100;
    
    arraySorteio=[self ordenarValores:arraySorteio];
    
    for (NSNumber *valor in arraySorteio) {
        
    }
}
-(NSMutableArray*)ordenarValores:(NSMutableArray*)array{
    
    NSSortDescriptor *crescente = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [array sortUsingDescriptors:[NSArray arrayWithObject:crescente]];
    
    return array;
}


@end
