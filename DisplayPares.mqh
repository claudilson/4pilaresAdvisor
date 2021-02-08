
bool InserePares()
{
   string ParesPrincipais1[10] = {"AUDCAD","AUDCHF","AUDJPY","AUDNZD","AUDUSD","CADCHF",
"CADJPY","CHFJPY","EURAUD","EURCAD"};

   string ParesPrincipais2[10] = {"EURCHF","EURGBP","EURJPY","EURNZD","EURUSD","GBPAUD",
"GBPCAD","GBPCHF","GBPJPY","GBPNZD"};

   string ParesPrincipais3[8] = {"GBPUSD","NZDCAD","NZDCHF","NZDJPY","NZDUSD","USDCAD",
"USDCHF","USDJPY"};
   
   // INSERINDO PARES NAS COLUNAS
   DadosAtivo ativo;
   
   
   //Print("- DistMediana: ",ativo.DistMediana,"- MovHoje: ",ativo.MovHoje,"- MovMedia: ",ativo.MovMedia);
   string labelPares;
   color corFundoNegativoPares = clrBrown;
   color corFundoPositivoPares = clrGreen;
   color corTextoPares = clrSnow;
   double PontosAteMedianaPares = PontosAteMediana;
   //PRIMEIRO BLOCO
   for(int i=0;i<10;i++)
   {
      for(int j=0;j<5;j++)
      {
         //coluna1
         if(j<1)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,ParesPrincipais1[i],10);         
         }
         //coluna2
         else if(j<2)
         {
            PegarDadosPares(ativo, ParesPrincipais1[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarCorFundo(labelPares,ativo.OrientacaoColor,corTextoPares);
            MudarItensDisplayPares(labelPares,ativo.Orientacao,9); 
         }
         //coluna3
         else if(j<3)
         {
            PegarDadosPares(ativo, ParesPrincipais1[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.DistMediana,0),9); 
         }
         //coluna4
         else if(j<4)
         {
            PegarDadosPares(ativo, ParesPrincipais1[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            
            if(ativo.MovHoje<0)
               {
                  MudarCorFundo(labelPares,corFundoNegativoPares,corTextoPares);
                  ativo.MovHoje = ativo.MovHoje*-1;
                  ativo.PorcentMov = ativo.PorcentMov*-1;
               }
               else if(ativo.MovHoje>0)
               {
                  MudarCorFundo(labelPares,corFundoPositivoPares,corTextoPares);
               }
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovHoje,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
         }
         //coluna5
         else if(j<5)
         {
            PegarDadosPares(ativo, ParesPrincipais1[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovDiaria,0),9); 
         }         
      }
      //SEGUNDO BLOCO
      for(int k=0;k<5;k++)
      {
         //coluna1
         if(k<1)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,ParesPrincipais2[i],10);      
         }
         //coluna2
         else if(k<2)
         {
            PegarDadosPares(ativo, ParesPrincipais2[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarCorFundo(labelPares,ativo.OrientacaoColor,corTextoPares);
            MudarItensDisplayPares(labelPares,ativo.Orientacao,9); 
         }
         //coluna3
         else if(k<3)
         {
            PegarDadosPares(ativo, ParesPrincipais2[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.DistMediana,0),9); 
         }
         //coluna4
         else if(k<4)
         {
            PegarDadosPares(ativo, ParesPrincipais2[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
             
            if(ativo.MovHoje<0)
               {
                  MudarCorFundo(labelPares,corFundoNegativoPares,corTextoPares);
                  ativo.MovHoje = ativo.MovHoje*-1;
                  ativo.PorcentMov = ativo.PorcentMov*-1;
               }
               else if(ativo.MovHoje>0)
               {
                  MudarCorFundo(labelPares,corFundoPositivoPares,corTextoPares);
               }
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovHoje,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
         }
         //coluna5
         else if(k<5)
         {
            PegarDadosPares(ativo, ParesPrincipais2[i], MesesHistoricos, PontosAteMedianaPares);
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovDiaria,0),9); 
         }
      }
      //TERCEIRO BLOCO
      for(int l=0;l<5;l++)
      {
         //desconsidera os 2 ultimas linhas vazias
         if(i<8)
         {
            //coluna1
            if(l<1)
            {
               labelPares = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i+1);
               MudarItensDisplayPares(labelPares,ParesPrincipais3[i],10);  
            }
            //coluna2
            else if(l<2)
            {
               PegarDadosPares(ativo, ParesPrincipais3[i], MesesHistoricos, PontosAteMedianaPares);
               labelPares = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i+1);
               MudarCorFundo(labelPares,ativo.OrientacaoColor,corTextoPares);
               MudarItensDisplayPares(labelPares,ativo.Orientacao,9);  
            }
            //coluna3
            else if(l<3)
            {
               PegarDadosPares(ativo, ParesPrincipais3[i], MesesHistoricos, PontosAteMedianaPares);
               labelPares = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i+1);
               MudarItensDisplayPares(labelPares,DoubleToString(ativo.DistMediana,0),9); 
            }
            //coluna4
            else if(l<4)
            {
               PegarDadosPares(ativo, ParesPrincipais3[i], MesesHistoricos, PontosAteMedianaPares);
               labelPares = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i+1);

            if(ativo.MovHoje<0)
               {
                  MudarCorFundo(labelPares,corFundoNegativoPares,corTextoPares);
                  ativo.MovHoje = ativo.MovHoje*-1;
                  ativo.PorcentMov = ativo.PorcentMov*-1;
               }
               else if(ativo.MovHoje>0)
               {
                  MudarCorFundo(labelPares,corFundoPositivoPares,corTextoPares);
               }
            MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovHoje,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
            } 
            //coluna5
            else if(l<5)
            {
               PegarDadosPares(ativo, ParesPrincipais3[i], MesesHistoricos, PontosAteMedianaPares);
               labelPares = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i+1);
               MudarItensDisplayPares(labelPares,DoubleToString(ativo.MovDiaria,0),9); 
            } 
         }
      }

   }


   ChartRedraw();
   return(true);
}

bool CreateLabel(string objName,int x_dist, int y_dist, int largura, int altura, int LarguraBackgroud)
{
   if( ObjectFind(0,objName)>=0 ) ObjectDelete(0,objName);
   ObjectCreate(0,objName,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,LarguraBackgroud+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_YDISTANCE,y_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   ObjectSetInteger(0,objName,OBJPROP_YSIZE,altura);
   ObjectSetString(0,objName,OBJPROP_TEXT,"-");
   ObjectSetString(0,objName,OBJPROP_FONT,"Consolas Bold");
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,clrDarkSlateGray);
   ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,clrSnow);
   ObjectSetInteger(0,objName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,objName,OBJPROP_READONLY,true);
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);  
   ObjectSetInteger(0,objName,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   
   return(true);
}
   

bool CriarDisplayPares()
{

   int numLinhas = 11;
   int numColunas = 5;
   int altura = 21;
   int largura = 55;
   
   // CRIAR COLUNAS E LINHAS
   int label2Espacamento = (numColunas*largura)+LarguraBackgroud;
   int label3espacamento = label2Espacamento+(numColunas*largura);
   string objName;
   int x,y;
   int xPadding = 5;
   
   // localizacao canto direito superior
   if(LocalizacaoDisplay == 4)
   {
      xPadding = -45;
   }
   // tamanho maior do display
   if(TamanhoDisplay == 2)
   {
      xPadding = 30;
      if(LocalizacaoDisplay == 4)
      {
         xPadding = -75;
      } 
   }
   
   for(int i=0;i<numLinhas;i++)
   {  
      //SEGUNDO BLOCO
      for(int j=0;j<numColunas;j++)
      {
         objName = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i);
         x = xPadding + j*largura;
         y = 15 + i*altura;
         CreateLabel(objName,x,y,largura,altura,LarguraBackgroud);       
      }
      //SEGUNDO BLOCO
      for(int k=0;k<numColunas;k++)
      {
         objName = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i);
         x = xPadding + k*largura;
         y = 15 + i*altura;
         CreateLabel(objName,x,y,largura,altura,label2Espacamento);        
      }
      //TERCEIRO BLOCO
      for(int l=0;l<numColunas;l++)
      {
         if(i<9)
         {
            objName = "label3_c"+IntegerToString(l)+"_l"+IntegerToString(i);
            x = xPadding + l*largura;
            y = 15 + i*altura;
            CreateLabel(objName,x,y,largura,altura,label3espacamento);        
         }
      }
   }

   
   // INSERINDO TITULO
   string labelTitulo;
   string tituloPares[5] = {"ATIVO","AÇÃO","MEDIANA","HOJE","DIÁRIA"};
   for(int i=1;i<numColunas;i++)
     {
      for(int j=0;j<numColunas;j++)
        {
         labelTitulo = "label"+IntegerToString(i)+"_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j]);
        }
     }   


   InserePares();
   

   //Print(SymbolInfoDouble("EURAUD.a",SYMBOL_BID));

   ChartRedraw();
   return(true);
}


bool MudarItensDisplayPares(string labelTitulo,string tituloPares,int fonte)
{
   ObjectSetString(0,labelTitulo,OBJPROP_TEXT,tituloPares);
   ObjectSetInteger(0,labelTitulo,OBJPROP_FONTSIZE,fonte);

return(true);
}


bool MudarTituloDisplayPares(string labelPares,string tituloPares)
{
   ObjectSetString(0,labelPares,OBJPROP_TEXT,tituloPares);
   ObjectSetInteger(0,labelPares,OBJPROP_FONTSIZE,8);
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,clrDarkSlateGray);

return(true);
}


bool MudarCorFundo(string labelPares,color corFundo,color corTexto)
{
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,corFundo);

return(true);
}


struct DadosAtivo {
   double DistMediana;
   double MovHoje;
   double MovDiaria;
   double PorcentMov;
   string Orientacao;
   color OrientacaoColor;
};


DadosAtivo PegarDadosPares(DadosAtivo &ativo, string Par, int Meses,double PontosAteMedianaPares){     
      //Se a moeda operada for JPY 
      int MultiplicadorPontos = 100000;
      double MedianaPares;
      double ArrayPrecosPares[];
      string ParName = Par+".a";
      ArrayResize(ArrayPrecosPares,Meses);
      double OrientacaoJPY = 1;

      if(StringFind(ParName, "JPY") >= 0)
        {
         MultiplicadorPontos = 1000;
         OrientacaoJPY = 10;
        }
      
      for(int i=0;i<Meses;i++)
      {
         ArrayPrecosPares[i] = iClose(ParName,PERIOD_MN1,i);
      }
      
      int MenorCandlePares = ArrayMinimum(ArrayPrecosPares,0,Meses);
      int MaiorCandlePares = ArrayMaximum(ArrayPrecosPares,0,Meses);
        
      MedianaPares = (ArrayPrecosPares[MaiorCandlePares] + ArrayPrecosPares[MenorCandlePares]) / 2;
      
      double PrecoBidPares = SymbolInfoDouble(ParName,SYMBOL_BID);
      ativo.DistMediana = PrecoBidPares - MedianaPares;
      ativo.MovHoje = PrecoBidPares - iClose(ParName,PERIOD_D1,1); // Fechamento Dia Anterior
      
      double pontosPar = 0.0;
      for(int i=0;i<DiasMovMedia;i++)
        {
         pontosPar += iHigh(ParName,PERIOD_D1,i)-iLow(ParName,PERIOD_D1,i);
        }
      
      ativo.MovDiaria = pontosPar/DiasMovMedia;
      
      // se nao for carregado e ficar com valor zero
      if(!ativo.MovDiaria==0)
        {
         ativo.PorcentMov = (ativo.MovHoje/ativo.MovDiaria)*100;
        }
      else
        {
         ativo.PorcentMov =0.0;
        }
        
      // ORIENTACAO      
      double MargemAteOndeOperarPares;    
      if(PrecoBidPares>MedianaPares)  
        {
        //Print("preco: ",PrecoBidPares," Mediana:",MedianaPares);
         MargemAteOndeOperarPares = (MedianaPares + PontosAteMediana)/OrientacaoJPY;
            if(PrecoBidPares>MargemAteOndeOperarPares)
            {
               ativo.Orientacao="VENDA";          
               ativo.OrientacaoColor = clrCrimson;
            }
            else if(PrecoBidPares<MargemAteOndeOperarPares)
            {   
               ativo.Orientacao="NEUTRO";
               ativo.OrientacaoColor = clrBlack;
            } 
        }
      else if(PrecoBidPares<MedianaPares)
        {
         MargemAteOndeOperarPares = (MedianaPares - PontosAteMediana)/OrientacaoJPY;         
         //Print(Par," preco: ",PrecoBidPares," MargenOperar:",MargemAteOndeOperarPares);
            if(PrecoBidPares<MargemAteOndeOperarPares)
            {
               ativo.Orientacao="COMPRA";        
               ativo.OrientacaoColor = clrMediumBlue;
            }
            else if(PrecoBidPares>MargemAteOndeOperarPares)
            {   
               ativo.Orientacao="NEUTRO";
               ativo.OrientacaoColor = clrBlack;
            }     
        }
      
      ativo.DistMediana = ativo.DistMediana*MultiplicadorPontos;
      ativo.MovHoje = ativo.MovHoje*MultiplicadorPontos;
      ativo.MovDiaria = ativo.MovDiaria*MultiplicadorPontos;
      
   return(ativo);
}
