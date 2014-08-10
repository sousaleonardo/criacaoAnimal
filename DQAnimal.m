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
        
        [self addChild:self.spriteAnimal];
        
        [self iniciarAnimacao:@"andando"];
    }
    return self;
}

-(void)definirDirAndarDireira{
    //variavel SKAction- define a direcao do movimento
    SKAction *andarEsquerda =[[SKAction alloc]init];
    
    self.dirCaminhada='D';
    
    andarEsquerda =[SKAction moveByX:90 y:0 duration:1.0];
    
    //Leonardo 13/06/2014 - alterado para dar xScale na propriedade spriteNode
    self.spriteAnimal.xScale = fabs(self.spriteAnimal.xScale)*-1;
    
    [self andar:andarEsquerda];
}

-(void)definirDirAndarEsquerda{
    //variavel SKAction- define a direcao do movimento
    SKAction *andarEsquerda =[[SKAction alloc]init];
    
    self.dirCaminhada='E';
    
    andarEsquerda =[SKAction moveByX:-90 y:0 duration:1.0];
    
    //Leonardo 13/06/2014 - alterado para dar xScale na propriedade spriteNode
    self.spriteAnimal.xScale = fabs(self.spriteAnimal.xScale)*-1;
    
    [self andar:andarEsquerda];
}

-(void)andar:(SKAction*)andar{
    
    [self runAction:[SKAction repeatAction:andar count:3]];
}

-(void)atacar{
    
}

-(void)rastrearArea{
    
}

-(SEL)seletorProxAcao{
    return NSSelectorFromString([self.acoes firstObject]);
}

-(void)animarAnimal{
    [self.spriteAnimal runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:framesAnimacao
                                                                              timePerFrame:0.3f
                                                                                    resize:NO
                                                                                   restore:YES]] withKey:@"animandoAndando"];
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
