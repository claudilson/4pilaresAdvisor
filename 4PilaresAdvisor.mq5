//+---------------------------------------------------------------------+
//|                                                4PilaresAdvisor.mq5  |
//|                              Copyright 2021, Gustavo de Souza Lima  |
//|                                               https://www.mql5.com  |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2021, Gustavo de Souza Lima"
#property link      "https://www.mql5.com"
#property version   "1.3.4"
#property indicator_chart_window
#property description "      "
#property description "Um Indicador para auxiliar quem opera baseado nos 4 Pilares do Willy sem Stop Loss."
#include "PainelConfiguracao.mqh"
#include "Estilos.mqh";

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

int OnInit()
  {
      //--- indicator buffers mapping
      ChartSetInteger(0,CHART_FOREGROUND,false);
      //---
      
      TimeCurrent(Time);
      
      // carrega variaveis dinamicas
      PegaVariaveisDinamicas();
      // chama Orientacao de Compra ou Venda ou Neutra
      ChamaOrientacao();
      
      // calcula Topo e Fundo Historicos
      CalculoTopoFundo();
      
      // BOTAO ESCONDER DISPLAY
      if(ObjectFind(0, "EsconderDisplay")>=0) ObjectDelete(0, "EsconderDisplay");   
      ObjectCreate(0,"EsconderDisplay", OBJ_BUTTON,0,0,0);
      ObjectSetString(0, "EsconderDisplay", OBJPROP_TEXT,"-");
      ObjectSetInteger(0,"EsconderDisplay",OBJPROP_FONTSIZE,7);
      ObjectSetInteger(0, "EsconderDisplay", OBJPROP_XSIZE,20);
      ObjectSetInteger(0, "EsconderDisplay", OBJPROP_YSIZE,10);
      ObjectSetInteger(0, "EsconderDisplay", OBJPROP_XDISTANCE,125);
      ObjectSetInteger(0, "EsconderDisplay", OBJPROP_YDISTANCE,3);
      ObjectSetInteger(0,"EsconderDisplay", OBJPROP_BGCOLOR,C'57,83,108');
      ObjectSetInteger(0,"EsconderDisplay", OBJPROP_COLOR,clrSnow); 
      ObjectSetInteger(0,"EsconderDisplay",OBJPROP_BORDER_COLOR,C'57,83,108');

      // carrega parte visual do Display do arquivo Estilos
      ChamaVisualDisplay();

      ChartRedraw();                   
   return(INIT_SUCCEEDED);
  }


void OnDeinit(const int reason)
  {
//---
   ObjectsDeleteAll(0,0);
   ChartRedraw();
  }


//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   account status;
   getStats(status);
 
   //double timesBiggerThanHundredDollarBalance = MathFloor(getMoney(status) / LoteProporcional);
   //double maxLots = NormalizeDouble(timesBiggerThanHundredDollarBalance * LoteProporcional/10000, 2);

   double timesBiggerThanHundredDollarBalance = MathFloor(getMoney(status) / LoteProporcional);
   maxLots = NormalizeDouble(timesBiggerThanHundredDollarBalance * 0.01, 2);
   
   /*
   string marginWarn = status.marginLevel>minMarginLevel ?
    "Seu nível de margem está SAUDÁVEL (acima do min. " + minMarginLevel +"%): " + NormalizeDouble(status.marginLevel, 2) + "%" :
    "Seu nível de margem NÃO ESTÁ SAUDÁVEL (abaixo do min. " + minMarginLevel +"%): " + NormalizeDouble(status.marginLevel, 2) + "%" ;
    */
    
   string availableLotsWarn = status.lots>maxLots ? 
   "Você está utilizando mais lots do que sua conta suporta!\n"
   : "Saldo Disponível ("+ DoubleToString(status.money,2) + " " + status.currency +") \n";
   LotesUsadosTotal = status.lots;
   lotsAvailable = maxLots - LotesUsadosTotal;
   
   
//+------------------------------------------------------------------+
//| Chama Novamente Funcoes                 |
//+------------------------------------------------------------------+
         
      PegaVariaveisDinamicas(); // pega dinamicamente
      DistanciaMediana = (PrecoBid - Mediana)*100000;
      MovimentacaoPar = PontosHoje*100000;
      CalculoTopoFundo();
      
      // chama Orientacao de Compra ou Venda ou Neutra
      ChamaOrientacao();
      // Se a moeda operada for JPY      
      if(StringFind(Symbol(), "JPY") >= 0)
        {
         IsJPY = true;
         DistanciaMediana = (PrecoBid - MargemAteOndeOperar)*1000;
         Mediana = NormalizeDouble(Mediana,3);
         MovimentacaoPar = PontosHoje*1000;
         
         //MediaUltimosAnos = NormalizeDouble(CalculaMediaUltimosAnos(),3);
        }
      
   

         
      
//+------------------------------------------------------------------+
//| Mostra se o par esta aberto no momento                 |
//+------------------------------------------------------------------+    

   int PosicoesAbertasNoPar = 0;
   string ParesAbertosMomento[];
   string ParesSemDuplicados[];
   string ParOperado;   
   
   for(int i=PositionsTotal()-1; i>=0; i--)
      {
         ParOperado = PositionGetSymbol(i);
         ArrayResize(ParesAbertosMomento,PositionsTotal());
         ArrayResize(ParesSemDuplicados,PositionsTotal());
         PositionProfit = PositionGetDouble(POSITION_PROFIT);
           
         ChamaAlertaLucro(Symbol());                 

         if(ChartSymbol(0)==ParOperado)
         {
            PosicoesAbertasNoPar += 1; // Quantidade do par operado no momento
            LotesUsadosNoPar = PositionGetDouble(POSITION_VOLUME); // lotes operados no momento no par   
         }
         ParesAbertosMomento[i] = PositionGetSymbol(i);
              
       }

      // Funcao que chama variaveis constantemente alimentadas
      ChamaInformacoesDinamicas(
      LotesUsadosTotal,
      lotsAvailable,
      LotesUsadosNoPar,
      TextoMediana,
      DistanciaMediana,
      MovimentacaoPar,
      SwapCompra,
      SwapVenda,
      SpreadAtual,
      OrientacaoFundoOuTopo,
      Orientacao,
      CorQuadroOrientacao,
      TextoLoteDisponivel,
      maxLots
      );


   //TotalProfit();
   
   return(rates_total);   
  }
//+------------------------------------------------------------------+

void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  { 
   // esconder o display
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam=="EsconderDisplay")
        {
        if(EsconderDisplay==false){
         EsconderDisplay = true;
         EscondeOuMostra();        
        }
        else
          {
           EsconderDisplay = false;
           EscondeOuMostra();
          }
        }
     }
   //Macete pra resolver erro de alguns ativos com historico grande que o
   //iClose demora pra carregar, eu recarrego o grafico mudando o timeframe
   if(MovimentacaoPar==DistanciaMediana)
      {
      ChartSetSymbolPeriod(0,NULL,PERIOD_M30); 
      }

  }

// Variaveis

int QtdeMesesHistoricos = DadosHistoricos;
color CorQuadroOrientacao;
int FonteBase1 = 8;
int FonteBase2 = 9;
int FontePaddingLeft = 7;
int PosicaoDistanciaMediana = 87;
string TextoMediana;
double Topo;
double Fundo;
double Mediana;
double MargemAteOndeOperar;
int MenorCandle, MaiorCandle;
double ArrayPrecosHistoricos[120];
double DistanciaMediana;
double PontosHoje;
string Orientacao;
bool IsJPY;
double MediaUltimosAnos;
string OrientacaoFundoOuTopo;
string TextoLoteDisponivel;
static datetime TimerAguardar;
int AlertaLucro = 0;
double PositionProfit = 0.0;
bool EsconderDisplay = false;
MqlDateTime Time;
double LotesUsadosNoPar;
double lotsAvailable;
double maxLots;
double LotesUsadosTotal;      
static ENUM_TIMEFRAMES TimeFrameCopy;
// Variaveis Dinamicas
double PrecoAsk;
double PrecoBid;
double SwapVenda;
double SwapCompra;
int SpreadAtual;
double MovimentacaoPar;
double FechamentoDiaAnteriorPar;


// funcao que pega as variaveis dinamicas
bool PegaVariaveisDinamicas(){
   PrecoAsk = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   PrecoBid = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   SwapVenda = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_SHORT);
   SwapCompra = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_LONG);
   SpreadAtual = SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   PontosHoje = PrecoBid - iClose(_Symbol,PERIOD_D1,1); // Fechamento Dia Anterior

   return(true);
}

// Orientação de compra ou venda e SWAP
bool ChamaOrientacao(){    
   if(PrecoBid>Mediana)  
     {
      TextoMediana = "Acima Mediana:";
      MargemAteOndeOperar = Mediana + PontosAteMediana;
         if(PrecoBid>MargemAteOndeOperar)
         {
            Orientacao="VENDA";           
            OrientacaoFundoOuTopo = "Topo:";
            CorQuadroOrientacao = clrCrimson;
         }
         else if(PrecoBid<MargemAteOndeOperar)
         {   
            Orientacao="NEUTRO";
            OrientacaoFundoOuTopo = " ";
            CorQuadroOrientacao = clrBlack;
         } 
     }
   else if(PrecoBid<Mediana)
     {
      TextoMediana = "Abaixo Mediana:";
      MargemAteOndeOperar = Mediana - PontosAteMediana;
      DistanciaMediana = DistanciaMediana * -1;
         if(PrecoBid<MargemAteOndeOperar)
         {
            Orientacao="COMPRA";        
            OrientacaoFundoOuTopo = "Fundo:";
            CorQuadroOrientacao = clrMediumBlue;
         }
         else if(PrecoBid>MargemAteOndeOperar)
         {   
            Orientacao="NEUTRO";
            OrientacaoFundoOuTopo = " ";
            CorQuadroOrientacao = clrBlack;
         }     
     }
   return(true);  
   }

enum CalculusBaseType { 
   CapitalLiquido=0, //Capital Líquido
   Balanca=1 //Saldo
};

double CalculaMediaUltimosAnos(int iBar=0) // ultimos anos
{
   double sum = 0.0;
   int count = DadosHistoricos+1;
   for(int iEnd = iBar+count; iBar < iEnd; ++iBar) sum += iClose(NULL,PERIOD_MN1,iBar);
   
   return sum/QtdeMesesHistoricos;
}

bool EscondeOuMostra(){

   if(EsconderDisplay==false)
      {
         ChamaVisualDisplay();
         
         // Informacoes que sao constantemente alimentadas
         ChamaInformacoesDinamicas(
         LotesUsadosTotal,
         lotsAvailable,
         LotesUsadosNoPar,
         TextoMediana,
         DistanciaMediana,
         MovimentacaoPar,
         SwapCompra,
         SwapVenda,
         SpreadAtual,
         OrientacaoFundoOuTopo,
         Orientacao,
         CorQuadroOrientacao,
         TextoLoteDisponivel,
         maxLots
         );  
      }
      else
        {
        ObjectsDeleteAll(0,0,OBJ_TEXT);
        ObjectsDeleteAll(0,0,OBJ_RECTANGLE_LABEL);
        ObjectsDeleteAll(0,0,OBJ_LABEL);
        }
   ChartRedraw();        
   return(true);
}

bool ChamaAlertaLucro(string NomePares){
   if(AlertaLucroEscolha !=0)
     {
      if(TimeCurrent() >= TimerAguardar && PositionProfit>=AlertaLucroEscolha)
      {
         Alert("Lucro no ",NomePares," de: $",DoubleToString(PositionProfit,2));
         TimerAguardar = TimeCurrent() + AlertaLucroTempoEscolha; // alertas em segundos
      }      
     }
   
   return(true);
}

bool CalculoTopoFundo(){

//+------------------------------------------------------------------+
//| Calculo Topo e Fundo                 |
//+------------------------------------------------------------------+ 
            
      // Array com os preços dos ultimos anos
      for(int i=QtdeMesesHistoricos-1; i>=0; i--){
         ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
      }
      
      MenorCandle = ArrayMinimum(ArrayPrecosHistoricos,0,QtdeMesesHistoricos);
      MaiorCandle = ArrayMaximum(ArrayPrecosHistoricos,0,QtdeMesesHistoricos);
     
      Topo = ArrayPrecosHistoricos[MaiorCandle];
      Fundo= ArrayPrecosHistoricos[MenorCandle];
        
      Mediana = (Topo + Fundo) / 2;
                         
      Mediana = NormalizeDouble(Mediana,5);

      // Media de Preço que a moeda ficou nos ultimos anos
      //MediaUltimosAnos = NormalizeDouble(CalculaMediaUltimosAnos(),5);

return(true);
}

struct account {
   double lots;
   double money;
   double balance;
   string currency;
   double marginLevel;
};



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
account getStats(account &stats) {

   double money= 0;
   double lots = 0;

   for(int i=0; i<PositionsTotal(); i++) {
      ulong ticket;
      if((ticket=PositionGetTicket(i))>0) {// if the position is selected
         double positionLosts = PositionGetDouble(POSITION_VOLUME);
         lots=lots+positionLosts;
     }
   }
   
   stats.balance = AccountInfoDouble(ACCOUNT_BALANCE);
   stats.money = AccountInfoDouble(ACCOUNT_EQUITY);
   stats.currency = AccountInfoString(ACCOUNT_CURRENCY);
   stats.lots= NormalizeDouble(lots, 2);
   stats.marginLevel = AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);
   
   return stats;
}
//+------------------------------------------------------------------+

double getMoney(account &stats) {
   //return calculusBaseType == 0 ? stats.balance : stats.money;
   return stats.balance;
}


// Saber a moeda base operada
//Print(SymbolInfoString(_Symbol,SYMBOL_CURRENCY_BASE));


//input CalculusBaseType calculusBaseType; // Base do calculos de lote:

//input int minMarginLevel = 1100; //Nível de Margem Mínima (Em %)

// funcao seta variasveis dinamicas
bool  ChamaInformacoesDinamicas(
   double lotes,
   double lotsAvailable,
   double LotesUsadosNoPar,
   string TextoMediana,
   double DistanciaMediana,
   double MovimentacaoPar,
   double SwapCompra,
   double SwapVenda,
   int SpreadAtual,
   string OrientacaoFundoOuTopo,
   string Orientacao,
   color CorQuadroOrientacao,
   string TextoLoteDisponivel,
   double maxLots 
 
)
   {
      // Variaveis do Display do Indicador
   
      // Valor Lote em Uso DINÂMICO
      ObjectSetString(0,"ValorLoteUso",OBJPROP_TEXT,DoubleToString(lotes,2));
   
      // Valor Lote Disponivel DINÂMICO
      ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_TEXT,DoubleToString(lotsAvailable,2));
   
      // Valor Operações nesse Par DINÂMICO
      ObjectSetString(0,"ValorPosicaoAberta",OBJPROP_TEXT,DoubleToString(lotsAvailable,0));
   
      // Valor Lotes Operados nesse Par DINÂMICO
      ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_TEXT,DoubleToString(LotesUsadosNoPar,2));
   
      // Valor Distancia Mediana DINÂMICO
      ObjectSetString(0,"DistanciaMediana",OBJPROP_TEXT,TextoMediana);
      ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_TEXT,DoubleToString(DistanciaMediana,0) + " Pts");
      
      // Valor Movimentacao Par DINÂMICO
      ObjectSetString(0,"ValorMovimentacaoPar",OBJPROP_TEXT,DoubleToString(MovimentacaoPar,0) + " Pts");    
      
      // Valor Swap Compra DINÂMICO
      ObjectSetString(0,"ValorSwapCompra",OBJPROP_TEXT,DoubleToString(SwapCompra,2));
     
      // Valor Swap Venda DINÂMICO
      ObjectSetString(0,"ValorSwapVenda",OBJPROP_TEXT,DoubleToString(SwapVenda,2));
   
      // Valor Spread DINÂMICO
      ObjectSetString(0,"ValorSpread",OBJPROP_TEXT,SpreadAtual);
   
      // Topo ou Fundo DINÂMICO
      ObjectSetString(0,"OrientacaoTopoFundo",OBJPROP_TEXT,OrientacaoFundoOuTopo);
      
      // Orientacao Compra, Vende ou Aguarda
      ObjectSetString(0,"OrientacaoCompraVenda",OBJPROP_TEXT,Orientacao);
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_BGCOLOR, CorQuadroOrientacao);
   
      // CORES SWAP e SPREAD
      if(lotsAvailable<0 && lotes>maxLots)
      {
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_COLOR,clrSalmon);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_COLOR,clrSalmon);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSalmon);
         TextoLoteDisponivel = "Ultrapassou:";
         lotsAvailable = lotsAvailable * -1;        
      }
      else
      {
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_COLOR,clrSnow);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_COLOR,clrLimeGreen);
         TextoLoteDisponivel = "Lote Disponível:";               
      }
      ObjectSetString(0,"LoteDisponivel",OBJPROP_TEXT,TextoLoteDisponivel);
      
      if(SwapCompra>0.0)
      {
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_COLOR,clrDodgerBlue);
      }
      else
      {
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_COLOR,clrSalmon);
      }
      
      if(SwapVenda>0.0)
      {
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_COLOR,clrDodgerBlue);
      }
      else
      {
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_COLOR,clrSalmon);
      }
      
      if(SpreadAtual>=50)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrSalmon);
      }
      else if(SpreadAtual<50 && SpreadAtual>30)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrDodgerBlue);
      }
      else if(SpreadAtual<=30)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrLimeGreen);
      }
            
      return(true);
   }


              
//      //availableLotsWarn  

   // Media Moveis e seu cruzamento 6 x 21
//   double MovingAverageArray1[],MovingAverageArray2[];
//   
//   int MovingAverageDefinition1 = iMA(_Symbol,_Period,6,0,MODE_EMA,PRICE_CLOSE);
//   int MovingAverageDefinition2 = iMA(_Symbol,_Period,21,0,MODE_EMA,PRICE_CLOSE);
//   
//   
//   ArraySetAsSeries(MovingAverageArray1,true);
//   ArraySetAsSeries(MovingAverageArray2,true);
//   
//   CopyBuffer(MovingAverageDefinition1,0,0,3,MovingAverageArray1);
//   CopyBuffer(MovingAverageDefinition2,0,0,3,MovingAverageArray2);
//
//   if((MovingAverageArray1[0]>MovingAverageArray2[0]) && (MovingAverageArray1[1]<MovingAverageArray2[1]))
//     {
//      Print(_Period," Compre");
//     }  
//
//   if((MovingAverageArray1[0]<MovingAverageArray2[0]) && (MovingAverageArray1[1]>MovingAverageArray2[1]))
//     {
//      Print("Venda");
//     } 


   
//Print(TerminalInfoInteger(TERMINAL_SCREEN_WIDTH));
//Print(TerminalInfoInteger(TERMINAL_SCREEN_DPI));