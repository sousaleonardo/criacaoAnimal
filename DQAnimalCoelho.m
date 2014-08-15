//
//  DQAnimalCoelho.m
//  criacaoAnimal
//
//  Created by LEONARDO DE SOUSA MENDES on 15/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "DQAnimalCoelho.h"

@implementation DQAnimalCoelho

-(id)initCoelho{
    if (self=[super initAnimalNome:@"Coelho" sprite:@"parado1" raioVisao:50]) {
        self.dirCaminhada='E';
        self.distanciaAndar=50;
        self.tempoAndar=2;
        self.nAcoesVez=5;
        
        [self setZPosition:-50.0f];
        [self setPersonalidade:Docil];
        [self.spriteAnimal setScale:0.9f];
        [self listarAcoes];
    }
    return self;
}

-(void)parar{
    [self pararAnimacao];
    
    [self iniciarAnimacao:@"parado"];
    [self animarAnimal];
}

-(void)animarAnimal{
    
    if ([self.acaoAtual isEqualToString:@"andar"]) {
        
        [self.spriteAnimal runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao
                                                                                    timePerFrame:0.2f
                                                                                          resize:NO
                                                                                         restore:YES]] withKey:@"animandoAnimal"];
    }else{
        [self.spriteAnimal runAction:[SKAction animateWithTextures:framesAnimacao
                                                      timePerFrame:0.2f
                                                            resize:NO
                                                           restore:YES] withKey:@"animandoAnimal"];
    }
}

-(void)andar{
    SKAction *andar;
    
    if (self.dirCaminhada=='D') {
        andar=[SKAction moveByX:self.distanciaAndar y:0 duration:self.tempoAndar];
        
        self.spriteAnimal.xScale = fabs(self.spriteAnimal.xScale)*-1;
    }else if (self.dirCaminhada=='E'){
        andar=[SKAction moveByX:(self.distanciaAndar * -1) y:0 duration:self.tempoAndar];
        
        self.spriteAnimal.xScale = fabs(self.spriteAnimal.xScale)*1;
    }
    
    if (andar) {
        self.acaoAtual=@"andar";
        
        [self iniciarAnimacao:@"correndo"];
        [self animarAnimal];
        [self runAction:andar completion:^{
            [self pararAnimacao];
        }];
    }
    
}
-(void)atacar{
    [self iniciarAnimacao:@"parado"];
    [self runAction:[SKAction performSelector:@selector(animarAnimal) onTarget:self]completion:^{
        [self pararAnimacao];
    }];
}

-(void)realizarAcao{
    if (![self.spriteAnimal hasActions]) {
        if ([self.acoes count]>0) {
            [self performSelector:[self seletorProxAcao]];
            [self.acoes removeObjectAtIndex:0];
        }else{
            [self rastrearAreaBackground:self.scene];
        }
    }
}
@end
