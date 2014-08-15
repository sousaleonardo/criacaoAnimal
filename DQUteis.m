//
//  DQUtils.m
//  Contador
//
//  Created by LEONARDO DE SOUSA MENDES on 11/08/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "DQUteis.h"

@implementation DQUteis : NSObject

+(BOOL)string:(NSString*)strTestar contemPalavra:(NSString*)palavraProcurada{
    if ([strTestar rangeOfString:palavraProcurada].location ==NSNotFound){
        return NO;
    } else {
        return YES;
    }
}

+(float)calcularDistanciaPontos:(CGPoint)primeiroPonto ponto2:(CGPoint)segundoPonto{
    return hypotf(segundoPonto.x - primeiroPonto.x, segundoPonto.y - primeiroPonto.y);
}
@end
