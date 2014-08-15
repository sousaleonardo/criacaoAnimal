//
//  DQAnimalToupeira.m
//  criacaoAnimal
//
//  Created by LEONARDO DE SOUSA MENDES on 15/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "DQAnimalToupeira.h"

@implementation DQAnimalToupeira

-(id)initToupeira{
    if (self=[super initAnimalNome:@"Toupeira" sprite:@"parada1" raioVisao:60]) {
        self.dirCaminhada='E';
        self.distanciaAndar=60;
        self.tempoAndar=2;
        self.nAcoesVez=3;
        
        [self setPersonalidade:Docil];
        [self.spriteAnimal setScale:0.9f];
        [self listarAcoes];
    }
    return self;
}

-(void)parar{
    NSLog(@"parou");
    [self pararAnimacao];
    
    [self iniciarAnimacao:@"parada"];
    [self animarAnimal];

}
@end
