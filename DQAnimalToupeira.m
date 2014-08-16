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
        self.distanciaAndar=40;
        self.tempoAndar=2;
        self.nAcoesVez=3;
        
        [self setPersonalidade:Docil];
        [self.spriteAnimal setScale:0.9f];
        [self listarAcoes];
    }
    return self;
}

-(void)parar{
    [self removeAllActions];
    self.acaoAtual=@"parada";
    [self pararAnimacao];
    [self iniciarAnimacao:@"parada"];
    [self animarAnimal];
    
}
-(void)animarAnimal{
    
    if ([self.acaoAtual isEqualToString:@"andar"] || [self.acaoAtual isEqualToString:@"buraco"]) {
        
        [self.spriteAnimal runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao
                                                                                    timePerFrame:0.2f
                                                                                          resize:NO
                                                                                         restore:YES]] withKey:@"animandoAnimal"];
    }else if ([self.acaoAtual isEqualToString:@"parada"]){
        [self.spriteAnimal runAction:[SKAction repeatAction:[SKAction animateWithTextures:framesAnimacao timePerFrame:0.2 resize:NO restore:YES] count:4]withKey:@"animandoAnimal"];
        
        
    }else{
        [self.spriteAnimal runAction:[SKAction animateWithTextures:framesAnimacao
                                                      timePerFrame:0.2f
                                                            resize:NO
                                                           restore:YES] withKey:@"animandoAnimal"];
    }
}
-(void)atacar{
    self.acaoAtual=@"atacar";
    
    [self iniciarAnimacao:@"atacando"];
    [self runAction:[SKAction performSelector:@selector(animarAnimal) onTarget:self]completion:^{
        [self pararAnimacao];
    }];
}

-(void)fugir{
    //Remove as açoes do animal
    [self removeAllActions];
    
    //limpa a lista de acoes do anima
    [self.acoes removeAllObjects];
    
    [self pararAnimacao];
    
    self.acaoAtual=@"cavando";
    [self iniciarAnimacao:@"cavando"];
    
    [self animarAnimal];
    
    //Chama o metodo para animar o icone de pulo apos X segundos
    [self performSelector:@selector(animarToupeiraEscondida) withObject:nil afterDelay:1.4];

}
-(void)animarToupeiraEscondida{
        NSLog(@"acabou de terminar acao");
    self.acaoAtual=@"buraco";
    [self iniciarAnimacao:@"buraco"];
    [self animarAnimal];
}



-(void)realizarAcao{
    if ((![self.acaoAtual isEqualToString:@"buraco"]) && (![self.acaoAtual isEqualToString:@"cavando"])) {
        if (![self.spriteAnimal hasActions]) {
            if ([self.acoes count]>0) {
                [self performSelector:[self seletorProxAcao]];
                [self.acoes removeObjectAtIndex:0];
            }else{
                [self rastrearAreaBackground:self.scene];
            }
        }
    }
}

-(void)rastrearAreaBackground:(SKNode*)background{
    for (SKNode *node in background.children) {
        if (![node.name isEqualToString:self.name]) {
            if (self.raioVisao > [DQUteis calcularDistanciaPontos:self.position  ponto2:node.position]) {
                //Encontrou um jogador no raio de visao
                if ([node.name isEqualToString:@"jogador"]) {
                    //Verifica a pesonalidade do animal
                    if ([self personalidade]==Agressivo ) {
                        //DECISAO DE ATACAR LEVANDO EM CONSIDERAÇÃO A PERSONALIDADE
                        
                        //Sorteia se ataca ou se anda
                        if ([DQUteis sortearChanceSim:80]) {
                            [self.acoes insertObject:@"atacar" atIndex:0];
                        }else{
                            //Sorteou p nao atacar
                            [self.acoes insertObject:@"fugir" atIndex:0];
                        }
                    }else{
                        //Nao é agressivo
                        [self.acoes insertObject:@"fugir" atIndex:0];
                    }
                }else{
                    //Jogador nao esta no raio de visao
                    [self listarAcoes];
                }
            }
        }
    }
    
    if (([self.acoes count]==0)&& (![self.acaoAtual isEqualToString:@"buraco"])) {
        [self listarAcoes];
    }
}

-(void)pararAnimacao{
    [self removeActionForKey:@"andando"];
    [self.spriteAnimal removeActionForKey:@"animandoAnimal"];
}

-(void)acaoAoColidirComJogador:(SKNode*)jogador{
    //Define para qual direcao irá fugir
    
    //Iniciar animacao fugindo
    
    //Chama faz "correr"
    
    
}
@end
