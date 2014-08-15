//
//  DQAnimalLeopardinho.m
//  criacaoAnimal
//
//  Created by Leonardo de Sousa Mendes on 14/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "DQAnimalLeopardinho.h"

@implementation DQAnimalLeopardinho

-(id)initAnimalNome:(NSString *)nome sprite:(NSString *)imagemAnimal raioVisao:(float)rVisao{
    if ([super initAnimalNome:nome sprite:imagemAnimal raioVisao:500]) {
        [self.spriteAnimal setScale:0.9f];
        
        self.distanciaAndar=100;
        self.tempoAndar=2;
        [self setPersonalidade:Agressivo];
    }
    return self;
}
@end