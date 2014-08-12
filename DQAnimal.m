//
//  DQAnimal.m
//  criacaoAnimal
//
//  Created by Leonardo de Sousa Mendes on 03/08/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "DQAnimal.h"

@implementation DQAnimal


-(id)initAnimalNome:(NSString*)nome sprite:(NSString*)imagemAnimal raioVisao:(float)rVisao{
    if (self =[super init]){
        self.spriteAnimal=[SKSpriteNode spriteNodeWithImageNamed:imagemAnimal];
        self.raioVisao=rVisao;
        self.nomeAnimal=nome;
        self.distanciaAndar=60;
        self.tempoAndar=2;
        
        
        [self addChild:self.spriteAnimal];
        [self.spriteAnimal setScale:0.9f];
        
        self.dirCaminhada='D';
        
        [self atacar];
    }
    return self;
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
        [self runAction:[SKAction sequence:@[andar,[SKAction performSelector:@selector(pararAnimacao) onTarget:self]]]];
        [self iniciarAnimacao:@"andando"];
    }
    
}

-(void)pararAnimacao{
    [self removeActionForKey:@"andando"];
    [self.spriteAnimal removeActionForKey:@"animandoAnimal"];
}

-(void)atacar{

    [self iniciarAnimacao:@"atacando"];
    [self pararAnimacao];
}

-(void)rastrearArea{
    
}

-(SEL)seletorProxAcao{
    return NSSelectorFromString([self.acoes firstObject]);
}

-(void)x{
    [self.spriteAnimal runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao
                                                                                timePerFrame:0.3f
                                                                                      resize:NO
                                                                                     restore:YES]] withKey:@"animandoAnimal"];
}

-(void)iniciarAnimacao:(NSString*)tipoAnimacao{
    SKTextureAtlas *pastaFrames= [SKTextureAtlas atlasNamed:self.nomeAnimal];
    
    framesAnimacao = [[NSMutableArray alloc]init];
    
    int nImagens=0;
    
    for (NSString *nomeTextura in [pastaFrames textureNames]) {
        if ([self string:nomeTextura contemPalavra:tipoAnimacao]) {
            nImagens++;
        }
    }
    
    NSString *textureName;
    
    for (int i=1; i <= nImagens; i++) {
        textureName = [NSString stringWithFormat:@"%@%d",tipoAnimacao, i];
        SKTexture *temp = [pastaFrames textureNamed:textureName];
        [framesAnimacao addObject:temp];
    }
}

-(BOOL)string:(NSString*)strTestar contemPalavra:(NSString*)palavraProcurada{
    if ([strTestar rangeOfString:palavraProcurada].location ==NSNotFound){
        return NO;
    } else {
        return YES;
    }
}
@end
