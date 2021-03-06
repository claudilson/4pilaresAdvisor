bool CriaDisplay(){
//+------------------------------------------------------------------+
//| Quadros e Background do Display                 |
//+------------------------------------------------------------------+ 
   int LarguraMolduraTraz = 148;
   int LarguraMolduraFrente = 144;
   color BackgroudColor = C'36,46,65';
   color BackgroundColorMoldura = C'25,56,95';


   // *** Background
   if(ObjectFind(0, "Rectangle")>=0) ObjectDelete(0, "Rectangle");
   ObjectCreate(0, "Rectangle", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, LarguraBackgroud);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, 240);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_BGCOLOR, BackgroudColor);

   // BOTAO ESCONDER DISPLAY
   if(ObjectFind(0, "EsconderDisplayBtn")>=0) ObjectDelete(0, "EsconderDisplayBtn");   
   ObjectCreate(0,"EsconderDisplayBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "EsconderDisplayBtn", OBJPROP_TEXT,"-");
   ObjectSetString(0,"EsconderDisplayBtn",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XSIZE,20);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YSIZE,10);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,40);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YDISTANCE,3);
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_BORDER_COLOR,C'57,83,108');

   // BOTAO CRIAR DISPLAY PARES CUSTOM
   if(ObjectFind(0, "DisplayParesCustomBtn")>=0) ObjectDelete(0, "DisplayParesCustomBtn");   
   ObjectCreate(0, "DisplayParesCustomBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayParesCustomBtn", OBJPROP_TEXT,"P.Edit");
   ObjectSetString(0, "DisplayParesCustomBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayParesCustomBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_XSIZE,38);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_XDISTANCE,66);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_YDISTANCE,2);
   ObjectSetInteger(0,"DisplayParesCustomBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"DisplayParesCustomBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"DisplayParesCustomBtn",OBJPROP_BORDER_COLOR,C'57,83,108');
 
   // BOTAO CRIAR DISPLAY PARES
   if(ObjectFind(0, "DisplayParesBtn")>=0) ObjectDelete(0, "DisplayParesBtn");   
   ObjectCreate(0,"DisplayParesBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayParesBtn", OBJPROP_TEXT,"Painel");
   ObjectSetString(0, "DisplayParesBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayParesBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XSIZE,40);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,108);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_YDISTANCE,2);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "DisplayParesBtn",OBJPROP_BORDER_COLOR,C'57,83,108');
   
   // BOTAO FORÇA PARES
   if(ObjectFind(0, "DisplayForcaMoedaBtn")>=0) ObjectDelete(0, "DisplayForcaMoedaBtn");   
   ObjectCreate(0,"DisplayForcaMoedaBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayForcaMoedaBtn", OBJPROP_TEXT,"+");
   ObjectSetString(0, "DisplayForcaMoedaBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayForcaMoedaBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_XSIZE,12);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_YSIZE,11);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_XDISTANCE,LarguraBackgroud);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_YDISTANCE,2);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_BGCOLOR,clrFireBrick);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "DisplayForcaMoedaBtn",OBJPROP_BORDER_COLOR,clrMaroon); 
   
   // *** Moldura 1 Traz
   if(ObjectFind(0, "Moldura1Traz")>=0) ObjectDelete(0, "Moldura1Traz");
   ObjectCreate(0, "Moldura1Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE, 31);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YDISTANCE,29);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura1Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BACK, false);
   
   // *** Moldura 1 Frente
   if(ObjectFind(0, "Moldura1Frente")>=0) ObjectDelete(0, "Moldura1Frente");
   ObjectCreate(0, "Moldura1Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, 27);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_YDISTANCE,31);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BACK, false);
   
   // *** Moldura 2 Traz
   if(ObjectFind(0, "Moldura2Traz")>=0) ObjectDelete(0, "Moldura2Traz");
   ObjectCreate(0, "Moldura2Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, 46);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_YDISTANCE,61);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura2Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 2 Frente
   if(ObjectFind(0, "Moldura2Frente")>=0) ObjectDelete(0, "Moldura2Frente");
   ObjectCreate(0, "Moldura2Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, 42);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,63);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BACK, false);  
   
   // *** Moldura 3 Traz
   if(ObjectFind(0, "Moldura3Traz")>=0) ObjectDelete(0, "Moldura3Traz");
   ObjectCreate(0, "Moldura3Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, 45);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,108);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura3Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 3 Frente
   if(ObjectFind(0, "Moldura3Frente")>=0) ObjectDelete(0, "Moldura3Frente");
   ObjectCreate(0, "Moldura3Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, 41);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,110);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BACK, false); 
   
   // *** Moldura 4 Traz
   if(ObjectFind(0, "Moldura4Traz")>=0) ObjectDelete(0, "Moldura4Traz");
   ObjectCreate(0, "Moldura4Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, 58);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,154);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura4Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 4 Frente
   if(ObjectFind(0, "Moldura4Frente")>=0) ObjectDelete(0, "Moldura4Frente");
   ObjectCreate(0, "Moldura4Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, 54);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,156);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BACK, false); 
   
   // *** Quadro Orientacao
   if(ObjectFind(0, "QuadroOrientacao")>=0) ObjectDelete(0, "QuadroOrientacao");
   ObjectCreate(0, "QuadroOrientacao", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, LarguraMolduraTraz-1);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, 25);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_XDISTANCE,3);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,213);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_BACK, false);


//+------------------------------------------------------------------+
//| Dados Apresentados no Display                 |
//+------------------------------------------------------------------+ 
   
   // Nome do Ativo Operado
   if(ObjectFind(0, "DisplayAtivoOperado")>=0) ObjectDelete(0, "DisplayAtivoOperado");
   ObjectCreate(0,"DisplayAtivoOperado",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DisplayAtivoOperado",OBJPROP_FONT, "Arial Black");
   ObjectSetString(0,"DisplayAtivoOperado",OBJPROP_TEXT,DisplayAtivoOperado);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_YDISTANCE,14);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DisplayAtivoOperado", OBJPROP_BACK, false);
   
   // Lote em Uso
   if(ObjectFind(0, "LoteUso")>=0) ObjectDelete(0, "LoteUso");
   ObjectCreate(0,"LoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteUso",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LoteUso",OBJPROP_TEXT,"Lote em Uso:");
   ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,30);
   ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteUso",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteUso", OBJPROP_BACK, false);
   
   // Valor Lote em Uso
   if(ObjectFind(0, "ValorLoteUso")>=0) ObjectDelete(0, "ValorLoteUso");
   ObjectCreate(0,"ValorLoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteUso",OBJPROP_FONT, "Arial");         
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,30);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteUso", OBJPROP_BACK, false);
   
   // Lote Disponivel
   if(ObjectFind(0, "LoteDisponivel")>=0) ObjectDelete(0, "LoteDisponivel");
   ObjectCreate(0,"LoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,44);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteDisponivel", OBJPROP_BACK, false);

   // Valor Lote Disponivel         
   if(ObjectFind(0, "ValorLoteDisponivel")>=0) ObjectDelete(0, "ValorLoteDisponivel");
   ObjectCreate(0,"ValorLoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,87);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,44);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteDisponivel", OBJPROP_BACK, false);

   // Diversificacao Pares Diferentes Operados
   if(ObjectFind(0, "DiversificacaoPares")>=0) ObjectDelete(0, "DiversificacaoPares");
   ObjectCreate(0,"DiversificacaoPares",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DiversificacaoPares",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"DiversificacaoPares",OBJPROP_TEXT,"Diversificação:");
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_YDISTANCE,63);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DiversificacaoPares", OBJPROP_BACK, false);
   
   // Valor Diversificacao Pares Diferentes Operados
   if(ObjectFind(0, "ValorDiversificacaoPares")>=0) ObjectDelete(0, "ValorDiversificacaoPares");
   ObjectCreate(0,"ValorDiversificacaoPares",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDiversificacaoPares",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,82);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_YDISTANCE,63);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDiversificacaoPares", OBJPROP_BACK, false);
  
   // Operações nesse Par
   if(ObjectFind(0, "QtdPosicaoAberta")>=0) ObjectDelete(0, "QtdPosicaoAberta");
   ObjectCreate(0,"QtdPosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"QtdPosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"QtdPosicaoAberta",OBJPROP_TEXT,"Operações nesse Par:");
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_YDISTANCE,77);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "QtdPosicaoAberta", OBJPROP_BACK, false);
   
   // Valor Quantidade de Posicoes Abertas nesse Par
   if(ObjectFind(0, "ValorQtdPosicaoAberta")>=0) ObjectDelete(0, "ValorQtdPosicaoAberta");
   ObjectCreate(0,"ValorQtdPosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorQtdPosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,120);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_YDISTANCE,77);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorQtdPosicaoAberta", OBJPROP_BACK, false);         
   
   // Lotes Operados nesse Par
   if(ObjectFind(0, "LotesOperadosNoPar")>=0) ObjectDelete(0, "LotesOperadosNoPar");
   ObjectCreate(0,"LotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_TEXT,"Lotes nesse Par:");
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,90);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LotesOperadosNoPar", OBJPROP_BACK, false);
   
   // Valor Lotes Operados nesse Par
   if(ObjectFind(0, "ValorLotesOperadosNoPar")>=0) ObjectDelete(0, "ValorLotesOperadosNoPar");
   ObjectCreate(0,"ValorLotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,90);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorLotesOperadosNoPar", OBJPROP_BACK, false);         
  
   // Distancia da Mediana
   if(ObjectFind(0, "DistanciaMediana")>=0) ObjectDelete(0, "DistanciaMediana");
   ObjectCreate(0,"DistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,110);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DistanciaMediana", OBJPROP_BACK, false);
   
   // Valor Distancia Mediana
   if(ObjectFind(0, "ValorDistanciaMediana")>=0) ObjectDelete(0, "ValorDistanciaMediana");
   ObjectCreate(0,"ValorDistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,PosicaoDistanciaMediana);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,110);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDistanciaMediana", OBJPROP_BACK, false);                  

   // Movimentacao do Par
   if(ObjectFind(0, "MovimentacaoParHoje")>=0) ObjectDelete(0, "MovimentacaoParHoje");
   ObjectCreate(0,"MovimentacaoParHoje",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"MovimentacaoParHoje",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_YDISTANCE,123);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "MovimentacaoParHoje", OBJPROP_BACK, false);
   
   // Valor Movimentacao do Par
   if(ObjectFind(0, "ValorMovimentacaoParHoje")>=0) ObjectDelete(0, "ValorMovimentacaoParHoje");
   ObjectCreate(0,"ValorMovimentacaoParHoje",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorMovimentacaoParHoje",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,65);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_YDISTANCE,123);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorMovimentacaoParHoje", OBJPROP_BACK, false);

   // Media Pontos Diario
   if(ObjectFind(0, "MediaMovDiario")>=0) ObjectDelete(0, "MediaMovDiario");
   ObjectCreate(0,"MediaMovDiario",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"MediaMovDiario",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"MediaMovDiario",OBJPROP_TEXT,"Mov. Média:");
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_YDISTANCE,136);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "MediaMovDiario", OBJPROP_BACK, false);
   
   // Valor Media Pontos Diario
   if(ObjectFind(0, "ValorMediaMovDiario")>=0) ObjectDelete(0, "ValorMediaMovDiario");
   ObjectCreate(0,"ValorMediaMovDiario",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorMediaMovDiario",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,65);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_YDISTANCE,136);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorMediaMovDiario", OBJPROP_BACK, false);
         
   // Swap Compra
   if(ObjectFind(0, "SwapCompra")>=0) ObjectDelete(0, "SwapCompra");
   ObjectCreate(0,"SwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapCompra",OBJPROP_TEXT,"Swap Compra:");
   ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,156);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapCompra", OBJPROP_BACK, false);
   
   // Valor Swap Compra
   if(ObjectFind(0, "ValorSwapCompra")>=0) ObjectDelete(0, "ValorSwapCompra");
   ObjectCreate(0,"ValorSwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,156);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapCompra", OBJPROP_BACK, false);
   
   // Swap Venda
   if(ObjectFind(0, "SwapVenda")>=0) ObjectDelete(0, "SwapVenda");
   ObjectCreate(0,"SwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapVenda",OBJPROP_TEXT,"Swap Venda:");
   ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,169);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapVenda", OBJPROP_BACK, false);
   
   // Valor Swap Venda
   if(ObjectFind(0, "ValorSwapVenda")>=0) ObjectDelete(0, "ValorSwapVenda");
   ObjectCreate(0,"ValorSwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,169);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapVenda", OBJPROP_BACK, false);
   
   // Spread
   if(ObjectFind(0, "Spread")>=0) ObjectDelete(0, "Spread");
   ObjectCreate(0,"Spread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"Spread",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"Spread",OBJPROP_TEXT,"Spread:");
   ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,182);
   ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"Spread",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "Spread", OBJPROP_BACK, false);
   
   // Valor Spread     
   if(ObjectFind(0, "ValorSpread")>=0) ObjectDelete(0, "ValorSpread");
   ObjectCreate(0,"ValorSpread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSpread",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,182);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSpread", OBJPROP_BACK, false);

   // Nivel de Margem
   if(ObjectFind(0, "NiveldeMargem")>=0) ObjectDelete(0, "NiveldeMargem");
   ObjectCreate(0,"NiveldeMargem",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"NiveldeMargem",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"NiveldeMargem",OBJPROP_TEXT,"Nivel de Margem:");
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_YDISTANCE,195);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "NiveldeMargem", OBJPROP_BACK, false);
   
   // Valor Nivel de Margem     
   if(ObjectFind(0, "ValorNiveldeMargem")>=0) ObjectDelete(0, "ValorNiveldeMargem");
   ObjectCreate(0,"ValorNiveldeMargem",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorNiveldeMargem",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,91);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_YDISTANCE,195);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorNiveldeMargem", OBJPROP_BACK, false);
   
   // Topo ou Fundo
   if(ObjectFind(0, "OrientacaoTopoFundo")>=0) ObjectDelete(0, "OrientacaoTopoFundo");
   ObjectCreate(0,"OrientacaoTopoFundo",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"OrientacaoTopoFundo",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft+2);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,218);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoTopoFundo", OBJPROP_BACK, false);
   
   // Orientacao Compra, Vende ou Aguarda
   if(ObjectFind(0, "OrientacaoCompraVenda")>=0) ObjectDelete(0, "OrientacaoCompraVenda");  
   ObjectCreate(0,"OrientacaoCompraVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2);
   ObjectSetString(0,"OrientacaoCompraVenda",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,217);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoCompraVenda", OBJPROP_BACK, false);
    
   
   

//+------------------------------------------------------------------+
//| Tamanho para redimensionar o Display                 |
//+------------------------------------------------------------------+ 
   int Item1DistanciaEsquerdaTam2 = 0;
   if(TamanhoDisplay == 2)
     {
     int AumentoQuadroAltura = 20;
     int AumentoQuadroLargura = 37;
     int FonteAumento = 2;
     Item1DistanciaEsquerdaTam2 = 0;
     int Item2DistanciaDireitaTam2 = 27;
     int FonteDistanciaY = 3;
     
     
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_FONTSIZE,FonteBase1+FonteAumento-1);
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,8+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_YDISTANCE,13);
            
      ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,27+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,27+FonteDistanciaY);
      
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,41+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,PosicaoDistanciaMediana+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,41+FonteDistanciaY); 
      
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_YDISTANCE,63+FonteDistanciaY);

      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,81+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_YDISTANCE,63+FonteDistanciaY);

      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_YDISTANCE,78+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,120+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_YDISTANCE,78+FonteDistanciaY); 
      
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,92+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,92+FonteDistanciaY);

      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,116+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,81+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,116+FonteDistanciaY);
      
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_YDISTANCE,131+FonteDistanciaY);

      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,50+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_YDISTANCE,131+FonteDistanciaY);

      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_YDISTANCE,147+FonteDistanciaY);

      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,50+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_YDISTANCE,147+FonteDistanciaY);

      ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,171+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,171+FonteDistanciaY);
      
      ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,187+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,187+FonteDistanciaY);
      
      ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,202+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,202+FonteDistanciaY);

      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_YDISTANCE,218+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,82+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_YDISTANCE,218+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,10+FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,222+AumentoQuadroAltura+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,220+AumentoQuadroAltura+FonteDistanciaY);                    
   
      ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, 145+AumentoQuadroLargura);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, 239+AumentoQuadroAltura);           
      ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 13);
      //botao
      ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,LarguraBackgroud+AumentoQuadroLargura);
      ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,LarguraBackgroud+AumentoQuadroLargura+22); 
                
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE, 35);
      ObjectSetInteger(0, "Moldura1Traz",OBJPROP_YDISTANCE,28);           
      
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, 11+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_YDISTANCE,30);           
      
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, 30+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura2Traz",OBJPROP_YDISTANCE,64);
      
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, 26+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,66);           
      
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, 35+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,115);
        
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, 31+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,117);           
                  
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, 49+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,171);
      
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, 45+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,173);
   
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, 9+AumentoQuadroAltura);
      ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,241);
      
     }
    else if(TamanhoDisplay == 3)
     {
      
     }
    else if(TamanhoDisplay == 4)
     {
      
     }
     

//+------------------------------------------------------------------+
//| Localização Painel                 |
//+------------------------------------------------------------------+
// Canto Esquerdo Superior  
if(LocalizacaoDisplay == 2)
  {         
         // botao lado esquerdo
         ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         //lado direito com tamanho maior
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_CORNER,CORNER_LEFT_UPPER); 
         if(TamanhoDisplay == 2)
           {
            ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,140);
            ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,162); 
           }
         
         ObjectSetInteger(0,"Rectangle",OBJPROP_CORNER,CORNER_LEFT_UPPER);        
         ObjectSetInteger(0,"Moldura1Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura1Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
              
         ObjectSetInteger(0,"Moldura2Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura2Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura3Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura3Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura4Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura4Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_CORNER,CORNER_LEFT_UPPER);   
  }
// Canto Direito Superior     
      if(LocalizacaoDisplay == 4)
       {
       int Item1e2DistanciaDireita = 141;
       int Item2DistanciaDireita = 4;
       int PaddinBtnRight = 21;
       int EspacamentoTamanho2 = 0;
          //modificacoes canto direito com tamanho maior
          if(TamanhoDisplay == 2)
            {
             LarguraMolduraTraz = LarguraMolduraTraz+31;
             LarguraMolduraFrente = LarguraMolduraFrente+31;
             Item1e2DistanciaDireita = Item1e2DistanciaDireita+32;
             Item2DistanciaDireita = Item2DistanciaDireita+19;
             PaddinBtnRight = 22;
             EspacamentoTamanho2 = 35;
            }
         ObjectSetInteger(0,"Rectangle",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, LarguraBackgroud+EspacamentoTamanho2);
         
         // botao lado direito
         ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,PaddinBtnRight);
         // botao mostrar pares principais
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,PaddinBtnRight+22);
         ObjectSetString(0, "DisplayParesBtn", OBJPROP_TEXT,"<");
         
         ObjectSetInteger(0,"Moldura1Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura1Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
              
         ObjectSetInteger(0,"Moldura2Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura2Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"Moldura3Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura3Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"Moldura4Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura4Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);        
                        
         // textos ancoragem
         ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"MediaMovDiario",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"NiveldeMargem",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         // ajuste textos
         ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,8+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,64+Item2DistanciaDireita);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,57+Item2DistanciaDireita);
         ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,25+Item2DistanciaDireita);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,50+Item2DistanciaDireita);
         ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+54+Item2DistanciaDireita);         
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+51+Item2DistanciaDireita);
         ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+79+Item2DistanciaDireita);
         ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+80+Item2DistanciaDireita);    
         ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,63+Item2DistanciaDireita);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,68+Item2DistanciaDireita);
         ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,92+Item2DistanciaDireita);
         ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+46+Item2DistanciaDireita);         
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,80+Item1DistanciaEsquerdaTam2+Item2DistanciaDireita+PaddinBtnRight);

       }
ChartRedraw();
return(true);
}


bool CriaLinhasHistoricas(){
//+------------------------------------------------------------------+
//| Linhas desenhadas no grafico                                     |
//+------------------------------------------------------------------+ 
     
   // Linha do Topo
   if(ObjectFind(0, "LinhaTopoHistorico")>=0) ObjectDelete(0, "LinhaTopoHistorico");
   ObjectCreate(0,"LinhaTopoHistorico",OBJ_HLINE,0,0,Topo);
   ObjectSetInteger(0,"LinhaTopoHistorico",OBJPROP_COLOR,clrDodgerBlue);         
   // Linha da Mediana
   if(ObjectFind(0, "LinhaMediana")>=0) ObjectDelete(0, "LinhaMediana");
   ObjectCreate(0,"LinhaMediana",OBJ_HLINE,0,0,Mediana);         
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_COLOR,clrGold);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_STYLE,STYLE_DASH);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_WIDTH,2);
   // Linha do Fundo
   if(ObjectFind(0, "LinhaFundoHistorico")>=0) ObjectDelete(0, "LinhaFundoHistorico");
   ObjectCreate(0,"LinhaFundoHistorico",OBJ_HLINE,0,0,Fundo);         
   ObjectSetInteger(0,"LinhaFundoHistorico",OBJPROP_COLOR,clrSalmon);
   // Linha do Preço Médio Ultimos anos
   if(ObjectFind(0, "LinhaPrecoMedioAnos")>=0) ObjectDelete(0, "LinhaPrecoMedioAnos");
   ObjectCreate(0,"LinhaPrecoMedioAnos",OBJ_HLINE,0,0,PrecoMedio);         
   ObjectSetInteger(0,"LinhaPrecoMedioAnos",OBJPROP_COLOR,clrDarkTurquoise);
   
   //Texto das linhas
   //Topo Historico Label
   if(ObjectFind(0, "TopoLabel")>=0) ObjectDelete(0, "TopoLabel");
   ObjectCreate(0,"TopoLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),Topo);
   ObjectSetString(0, "TopoLabel", OBJPROP_TEXT, "Topo "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"TopoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"TopoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"TopoLabel",OBJPROP_COLOR,clrDodgerBlue);
   //Mediana Label
   if(ObjectFind(0, "MedianaLabel")>=0) ObjectDelete(0, "MedianaLabel");
   ObjectCreate(0,"MedianaLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+7) + "." + IntegerToString(Tempo.day),Mediana);
   ObjectSetString(0, "MedianaLabel", OBJPROP_TEXT, "Mediana");
   ObjectSetString(0,"MedianaLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_COLOR,clrGold);
   //Fundo Historico Label
   if(ObjectFind(0, "FundoLabel")>=0) ObjectDelete(0, "FundoLabel");
   ObjectCreate(0,"FundoLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),Fundo);
   ObjectSetString(0, "FundoLabel", OBJPROP_TEXT, "Fundo "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"FundoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"FundoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"FundoLabel",OBJPROP_COLOR,clrSalmon);
   //Preco atual Label
   if(ObjectFind(0, "PrecoMedioAnosLabel")>=0) ObjectDelete(0, "PrecoMedioAnosLabel");
   ObjectCreate(0,"PrecoMedioAnosLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),PrecoMedio);
   ObjectSetString(0, "PrecoMedioAnosLabel", OBJPROP_TEXT, "Preço "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"PrecoMedioAnosLabel",OBJPROP_FONTSIZE,8);
   ObjectSetInteger(0,"PrecoMedioAnosLabel",OBJPROP_COLOR,clrDarkTurquoise);   

   // Esconde as Labels
   if(!titulo_TopoMedianaFundo)
     {
      ObjectSetString(0,"TopoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"MedianaLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"FundoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_TEXT," ");
     }

   // Esconde apenas Label Preço atual
   if(!mostrarPrecoMedio)
     {
      ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_TEXT," ");
      ObjectDelete(0, "LinhaPrecoMedioAnos");   
     }
   return(true);   
}