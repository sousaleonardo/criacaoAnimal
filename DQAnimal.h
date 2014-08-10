//
//  DQAnimal.h
//  criacaoAnimal
//
//  Created by Leonardo de Sousa Mendes on 03/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DQIsca.h"

typedef NS_ENUM(NSInteger, Personalidade) {
    Docil = 0,
    Agressivo = 1,
};

@interface DQAnimal : SKNode

{
    NSMutableArray *framesAnimacao;
}

@property SKSpriteNode *spriteAnimal;
@property NSString *nomeAnimal;

@property float raioVisao;
@property char dirCaminhada;
@property Personalidade personalidade;

@property DQIsca *objetoAtracao;
@property NSMutableArray *acoes;


-(id)initAnimalNome:(NSString*)nome sprite:(NSString*)imagemAnimal raioVisao:(float)rVisao;
-(void)animarAnimal;
@end
