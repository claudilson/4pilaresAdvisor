//+---------------------------------------------------------------------+
//|                                                4PilaresAdvisor.mq5  |
//|                              Copyright 2021, Gustavo de Souza Lima  |
//|                                               https://www.mql5.com  |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2021, Gustavo de Souza Lima"
#property link      "https://www.mql5.com"
#property version   "1.4.0"
#property description "      "
#property description "Um Indicador para auxiliar quem opera baseado nos 4 Pilares do Willy sem Stop Loss."
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots 2
#property indicator_color1 Blue
#property indicator_color2 Red
#property indicator_type1 DRAW_LINE
#property indicator_type2 DRAW_LINE
#property indicator_width1  2
#property indicator_width2  2
#property indicator_label1  "Linha Movel 1"
#property indicator_label2  "Linha Movel 2"
#include <Arrays\ArrayString.mqh>

string IndicatorName="4PilaresAdvisor";

#include "Estilos.mqh"
#include "PainelConfiguracao.mqh"
#include "MediasMoveis.mqh"
#include "DisplayPares.mqh"


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

int OnInit()
  {
      //--- indicator buffers mapping
      ChartSetInteger(0,CHART_FOREGROUND,false);
      //---
      
      TimeCurrent(Tempo);
      
      // carrega variaveis dinamicas
      PegaVariaveisDinamicas();
      // chama Orientacao de Compra ou Venda ou Neutra
      ChamaOrientacao();
      
      // calcula Topo e Fundo Historicos
      CalculaTopoFundo(MesesHistoricos);
      CalculaPrecoMedio(MesesHistoricos);
      
      // BOTAO ESCONDER DISPLAY
      if(ObjectFind(0, "EsconderDisplayButton")>=0) ObjectDelete(0, "EsconderDisplayButton");   
      ObjectCreate(0,"EsconderDisplayButton", OBJ_BUTTON,0,0,0);
      ObjectSetString(0, "EsconderDisplayButton", OBJPROP_TEXT,"-");
      ObjectSetInteger(0,"EsconderDisplayButton",OBJPROP_FONTSIZE,7);
      ObjectSetInteger(0, "EsconderDisplayButton", OBJPROP_XSIZE,20);
      ObjectSetInteger(0, "EsconderDisplayButton", OBJPROP_YSIZE,10);
      ObjectSetInteger(0, "EsconderDisplayButton", OBJPROP_XDISTANCE,110);
      ObjectSetInteger(0, "EsconderDisplayButton", OBJPROP_YDISTANCE,3);
      ObjectSetInteger(0,"EsconderDisplayButton", OBJPROP_BGCOLOR,C'57,83,108');
      ObjectSetInteger(0,"EsconderDisplayButton", OBJPROP_COLOR,clrSnow); 
      ObjectSetInteger(0,"EsconderDisplayButton",OBJPROP_BORDER_COLOR,C'57,83,108');
      
      // Cria as linhas de topo, mediana, fundo e preco medio
      CriaLinhasHistoricas();
      // carrega parte visual do Display do arquivo Estilos
      CriaDisplay();
      
      
      ChartRedraw();

//+------------------------------------------------------------------+  
// Inicio Linhas Moveis OnInit  
//+------------------------------------------------------------------+
   IndicatorSetString(INDICATOR_SHORTNAME,IndicatorName);

   //OnInitInitialization();
   //if(!OnInitPreChecksPass()){
   //   return(INIT_FAILED);
   //}   

   InitialiseHandles();
   InitialiseBuffers();
//+------------------------------------------------------------------+  
// Fim Linhas Moveis OnInit  
//+------------------------------------------------------------------+
                       
   return(INIT_SUCCEEDED);
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
   account status; // instacia variavel status com tipo personalizado account
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
   NiveldeMargem = status.marginLevel;
   
   
//+------------------------------------------------------------------+
//| Chama Novamente Funcoes                 |
//+------------------------------------------------------------------+
         
      PegaVariaveisDinamicas(); // pega dinamicamente
      DistanciaMediana = (PrecoBid - Mediana)*100000;
      MovimentacaoParHoje = PontosHoje*100000;
           
//+------------------------------------------------------------------+
//| Mostra se o par esta aberto no momento                 |
//+------------------------------------------------------------------+    

   
   string ParesAbertosMomento[];
   string ParesSemDuplicados[];
   string ParOperado;
   PosicoesAbertasNoPar = 0;
   LotesUsadosNoPar = 0.0;
   
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
            LotesUsadosNoPar += PositionGetDouble(POSITION_VOLUME); // lotes operados no momento no par   
         }
         ParesAbertosMomento[i] = PositionGetSymbol(i);
              
       }

//+------------------------------------------------------------------+
//| Mostra a Media de Pontos Movimentados pelo Par no Dia            |
//+------------------------------------------------------------------+
   // Media de Pontos que a Moeda Faz por Dia
   int PeriodoHistorico = DiasMovMedia;
   double MovDiario = CalculaMediaPrecoDia(PeriodoHistorico);
   MediaMovDiario = MovDiario*100000;

   double MovNoMomento = iHigh(Symbol(),PERIOD_D1,0)-iLow(Symbol(),PERIOD_D1,0);
   if(!MovNoMomento==0)
     {
      PorcMovNoMomento = (MovNoMomento/MovDiario)*100;
     }
   else
     {
      PorcMovNoMomento =0.0;
     }

//+------------------------------------------------------------------+
//| Se a moeda operada for JPY                                       |
//+------------------------------------------------------------------+ 
   if(StringFind(Symbol(), "JPY") >= 0)
     {
      DistanciaMediana = (PrecoBid - Mediana)*1000;
      MovimentacaoParHoje = PontosHoje*1000;
      MediaMovDiario = MovDiario*1000;
     }
       
//+------------------------------------------------------------------+
//| Mostra a Diversificação de Pares Diferentes Operados             |
//+------------------------------------------------------------------+    
   CArrayString array; //uso de biblioteca à parte para poder ordenar array de strings 
   string ParesDiferentes[];

   for(int i=0;i<PositionsTotal();i++)
   {
      PositionGetTicket(i);
      array.Add(PositionGetString(POSITION_SYMBOL));    
   }
   array.Sort();
   int n = array.Total();
   int j = 0;
   ArrayResize(ParesDiferentes,n);  
   
   for(int i=0;i<n-1;i++)
   {
      if(array[i] != array[i+1])
      {
         ParesDiferentes[j++] = array[i]; 
      }
   }

   ArrayResize(ParesDiferentes,j);
   DiversificacaoPares = ArraySize(ParesDiferentes);
   
   // Funcao que chama variaveis constantemente alimentadas
   EscreveInformacoesDinamicas(
   LotesUsadosTotal,
   lotsAvailable,
   PosicoesAbertasNoPar,
   DiversificacaoPares,
   LotesUsadosNoPar,
   TextoMediana,
   DistanciaMediana,
   MediaMovDiario,
   MovimentacaoParHoje,
   PorcMovNoMomento,
   SwapCompra,
   SwapVenda,
   SpreadAtual,
   OrientacaoFundoOuTopo,
   Orientacao,
   CorQuadroOrientacao,
   TextoLoteDisponivel,
   maxLots
   );


//+------------------------------------------------------------------+  
// Inicio Linhas Moveis Oncalculate  
//+------------------------------------------------------------------+

if(HabilitarLinhasMoveis) // SE ESTIVER HABILITADO
  {
   PlotIndexSetInteger(0, PLOT_DRAW_TYPE, DRAW_LINE); // MOSTRAR AS LINHAS
   PlotIndexSetInteger(1, PLOT_DRAW_TYPE, DRAW_LINE);
      
   if(rates_total<=MASlowPeriod || MASlowPeriod<=0)
      return(0);
   
   if(rates_total<=MAFastPeriod || MAFastPeriod<=0)
      return(0);
      
   if(MAFastPeriod>MASlowPeriod)
      return(0);
   
   bool IsNewCandle=CheckIfNewCandle();
   int i,pos,upTo;

   pos=0;
   if(prev_calculated==0 || IsNewCandle)
      upTo=BarsToScan-1;
   else
      upTo=0;

   if(IsStopped()) return(0);
   if(CopyBuffer(BufferMAFastHandle,0,-MAFastShift,upTo+1,BufferMAFast)<=0 ||
      CopyBuffer(BufferMASlowHandle,0,-MASlowShift,upTo+1,BufferMASlow)<=0
   ){
      Print("Failed to create the Indicator! Error ",GetLastErrorText(GetLastError())," - ",GetLastError());
      //return(0);
   }

   for(i=pos; i<=upTo && !IsStopped(); i++){
      Open[i]=iOpen(Symbol(),PERIOD_CURRENT,i);
      Low[i]=iLow(Symbol(),PERIOD_CURRENT,i);
      High[i]=iHigh(Symbol(),PERIOD_CURRENT,i);
      Close[i]=iClose(Symbol(),PERIOD_CURRENT,i);
      Time[i]=iTime(Symbol(),PERIOD_CURRENT,i);
   }  
  
   if(IsNewCandle || prev_calculated==0){
      if(EnableDrawArrows) DrawArrows();
   }
   
   if(EnableDrawArrows)
      DrawArrow(0);

   if(EnableNotify)
   {
      // chama Orientacao de Compra ou Venda ou Neutra
      string OrientacaoNotificacao = ChamaOrientacao();
      NotifyHit(OrientacaoNotificacao);
   }
      
}
else
  {
   PlotIndexSetInteger(0, PLOT_DRAW_TYPE, DRAW_NONE); // ESCONDER AS LINHAS
   PlotIndexSetInteger(1, PLOT_DRAW_TYPE, DRAW_NONE);
   CleanChart();
  }
//+------------------------------------------------------------------+  
// Fim Linhas Moveis Oncalculate  
//+------------------------------------------------------------------+


   if(EsconderDisplayButtonPares==true)
      {
         InserePares();
      }
   
   return(rates_total);   
  }
  
//+------------------------------------------------------------------+  
// Fim Oncalculate  
//+------------------------------------------------------------------+



void OnDeinit(const int reason)
  {
//---
   ObjectsDeleteAll(0,0);
   CleanChart();
   ChartRedraw();
  }


void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  { 
   // calcula Topo e Fundo Historicos
   CalculaTopoFundo(MesesHistoricos);
   CalculaPrecoMedio(MesesHistoricos);
   // evento de click no botao
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      // esconder o display
      if(sparam=="EsconderDisplayButton")
        {
         EsconderOuMostraDisplay();
        }
      else if(sparam=="DisplayParesButton")
        {
         EsconderOuMostraDisplayPares();
        }
      //evento que identifica se foi clicado nos Pares do DiplayPares
      for (int i = 1; i < ObjectsTotal(0, 0, OBJ_EDIT); i++) {
         if(i<11 || (i>43 && i<66) || (i>110 && i<119))
           {
            string objectName = ObjectName(0, i, 0, OBJ_EDIT);
            string objectTexto = ObjectGetString(0, objectName, OBJPROP_TEXT);

            if(objectName == sparam )
              {
               //int IndicadorID = ChartIndicatorGet(0,0,IndicatorName);
               //long Chart_id1 = ChartOpen(objectTexto+".a",0);
               ChartSetSymbolPeriod(0, objectTexto+".a", _Period); //Abre na mesma janela              
               //ChartIndicatorAdd(Chart_id1,0,IndicadorID);
               //ChartApplyTemplate(chart_id[i],"template.tpl");
              }
           }

      } 
        
     }
   //Macete pra resolver erro de alguns ativos com historico grande que o
   //iClose demora pra carregar, eu recarrego o grafico mudando o timeframe
   if(MovimentacaoParHoje==DistanciaMediana)
      {
      ChartSetSymbolPeriod(0,NULL,PERIOD_M30); 
      }
   
  }

// Variaveis

int LarguraBackgroud = 153;
color CorQuadroOrientacao;
int FonteBase1 = 8;
int FonteBase2 = 9;
int FontePaddingLeft = 7;
int PosicaoDistanciaMediana = 88;
string TextoMediana;
double Topo;
double Fundo;
double Mediana;
double PrecoMedio;
int MenorCandle, MaiorCandle;
double ArrayPrecosHistoricos[120];
double DistanciaMediana;
double PontosHoje;
string Orientacao;
double MediaMovDiario;
string OrientacaoFundoOuTopo;
string TextoLoteDisponivel;
static datetime TimerAguardar;
int AlertaLucro = 0;
double PositionProfit = 0.0;
bool EsconderDisplayButton = false;
bool EsconderDisplayButtonPares = false;
MqlDateTime Tempo;
int PosicoesAbertasNoPar;
double LotesUsadosNoPar;
double lotsAvailable;
int DiversificacaoPares;
double maxLots;
double LotesUsadosTotal;      
static ENUM_TIMEFRAMES TimeFrameCopy;
// Variaveis Dinamicas
double PrecoAsk;
double PrecoBid;
double SwapVenda;
double SwapCompra;
int SpreadAtual;
double NiveldeMargem;
double MovimentacaoParHoje;
double PorcMovNoMomento;
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
string ChamaOrientacao(){
   Mediana = CalculaTopoFundo(MesesHistoricos);
   double MargemAteOndeOperar;
   double OrientacaoJPY = 1;
   if(StringFind(Symbol(), "JPY") >= 0)
   {
      OrientacaoJPY = 100;
   }
   //Print("preco: ",PrecoBid," Mediana:",Mediana);   
   if(PrecoBid>Mediana)  
     {
     
      TextoMediana = "Acima Mediana:";
      MargemAteOndeOperar = (Mediana + PontosAteMediana);
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
      MargemAteOndeOperar = Mediana - PontosAteMediana*OrientacaoJPY;
      //MargemAteOndeOperar = MargemAteOndeOperar*-1;
      Print("preco: ",PrecoBid," - Mediana:",Mediana," - margen operar: ",MargemAteOndeOperar," - Pontos",PontosAteMediana); 
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
   return(Orientacao);  
}

//+------------------------------------------------------------------+
//| Calculo Topo e Fundo                                             |
//+------------------------------------------------------------------+
//struct historicoAtivo {
//   double Topo;
//   double Fundo;
//   double Mediana;
//   double PrecoMedio;
//};
//
//historicoAtivo PegarHistorico(historicoAtivo &ativo, int Meses)
//{
//      double SomaPrecoMedio = 0.0;
//      int TempSoma = 0;
//      
//      // Array com os preços dos ultimos anos
//      for(int i=0;i<Meses;i++)
//      {
//         TempSoma = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
//         ArrayPrecosHistoricos[i] = TempSoma;
//         SomaPrecoMedio += TempSoma;
//      }
//      
//      MenorCandle = ArrayMinimum(ArrayPrecosHistoricos,0,Meses);
//      MaiorCandle = ArrayMaximum(ArrayPrecosHistoricos,0,Meses);
//     
//      ativo.Topo = ArrayPrecosHistoricos[MaiorCandle];
//      ativo.Fundo= ArrayPrecosHistoricos[MenorCandle];
//        
//      Mediana = (Topo + Fundo) / 2;
//                         
//      ativo.Mediana = NormalizeDouble(Mediana,5);
//      ativo.PrecoMedio = SomaPrecoMedio/Meses; 
//     
//   return ativo;
//}


 
double CalculaTopoFundo(int Meses){           
      // Array com os preços dos ultimos anos
      for(int i=0;i<Meses;i++)
      {
         ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
      }
      
      MenorCandle = ArrayMinimum(ArrayPrecosHistoricos,0,Meses);
      MaiorCandle = ArrayMaximum(ArrayPrecosHistoricos,0,Meses);
     
      Topo = ArrayPrecosHistoricos[MaiorCandle];
      Fundo= ArrayPrecosHistoricos[MenorCandle];
        
      Mediana = (Topo + Fundo) / 2;

return(Mediana);
}

bool CalculaPrecoMedio(int Meses){           
      // Array com os preços dos ultimos anos
      double SomaPrecoMedio = 0.0;
      for(int i=0;i<Meses;i++)
      {
         SomaPrecoMedio += NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
      }
      
      PrecoMedio = SomaPrecoMedio/Meses;

return(true);
}

double CalculaMediaPrecoDia(int iPeriodo)
{ 
   double pontos = 0.0;
   for(int i=0;i<iPeriodo;i++)
     {
      pontos += iHigh(Symbol(),PERIOD_D1,i)-iLow(Symbol(),PERIOD_D1,i);
     }
   
   return pontos/iPeriodo;
}

double CalculaMovParMomento(int iPeriodo)
{ 

   double MovParMomento = iHigh(Symbol(),PERIOD_D1,0)-iLow(Symbol(),PERIOD_D1,0);
   
   return MovParMomento;
}

bool EsconderOuMostraDisplay(){

   if(EsconderDisplayButton==false)
      {
           EsconderDisplayButton = true;
           ObjectsDeleteAll(0,0,OBJ_TEXT);
           ObjectsDeleteAll(0,0,OBJ_RECTANGLE_LABEL);
           ObjectsDeleteAll(0,0,OBJ_LABEL);
           ChartRedraw();
      }
      else
      {
         CriaDisplay();
         
         // Informacoes que sao constantemente alimentadas
         EscreveInformacoesDinamicas(
         LotesUsadosTotal,
         lotsAvailable,
         PosicoesAbertasNoPar,
         DiversificacaoPares,
         LotesUsadosNoPar,
         TextoMediana,
         DistanciaMediana,
         MediaMovDiario,
         MovimentacaoParHoje,
         PorcMovNoMomento,
         SwapCompra,
         SwapVenda,
         SpreadAtual,
         OrientacaoFundoOuTopo,
         Orientacao,
         CorQuadroOrientacao,
         TextoLoteDisponivel,
         maxLots
         );
         EsconderDisplayButton = false;
      }
             
   return(true);
}


bool EsconderOuMostraDisplayPares(){

   if(EsconderDisplayButtonPares==false)
      {
         CriarDisplayPares();
         EsconderDisplayButtonPares = true; 
      }
   else
     {
      EsconderDisplayButtonPares = false;
      ObjectsDeleteAll(0,0,OBJ_EDIT);
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
   return stats.balance;
}


// Saber a moeda base operada
//Print(SymbolInfoString(_Symbol,SYMBOL_CURRENCY_BASE));

// funcao seta variasveis dinamicas
bool  EscreveInformacoesDinamicas(
   double lotes,
   double lotsAvailable,
   double PosicoesAbertasNoPar,
   int DiversificacaoPares,
   double LotesUsadosNoPar,
   string TextoMediana,
   double DistanciaMediana,
   double MediaMovDiario,
   double MovimentacaoParHoje,
   double PorcMovNoMomento,
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

      // CORES MOV. PONTOS
      string SubidaQueda;
      if(MovimentacaoParHoje<0)
        {
         SubidaQueda = "Queda ";
         MovimentacaoParHoje = MovimentacaoParHoje*-1;
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrSalmon);
        }
      else
        {
         SubidaQueda = "Subida ";
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrLimeGreen);
        }
   
      // Valor Lote em Uso DINÂMICO
      ObjectSetString(0,"ValorLoteUso",OBJPROP_TEXT,DoubleToString(lotes,2));
   
      // Valor Lote Disponivel DINÂMICO
      ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_TEXT,DoubleToString(lotsAvailable,2));

      // Valor Diversificacao Pares Diferentes Operados DINÂMICO
      ObjectSetString(0,"ValorDiversificacaoPares",OBJPROP_TEXT,DiversificacaoPares+" Pares");
   
      // Valor Quantidade de Posicoes Abertas nesse Par DINÂMICO
      ObjectSetString(0,"ValorQtdPosicaoAberta",OBJPROP_TEXT,DoubleToString(PosicoesAbertasNoPar,0));
   
      // Valor Lotes Operados nesse Par DINÂMICO
      ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_TEXT,DoubleToString(LotesUsadosNoPar,2));
   
      // Valor Distancia Mediana DINÂMICO
      ObjectSetString(0,"DistanciaMediana",OBJPROP_TEXT,TextoMediana);
      ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_TEXT,DoubleToString(DistanciaMediana,0) + " Pts");
      
      // Valor Movimentacao Par DINÂMICO
      ObjectSetString(0,"MovimentacaoParHoje",OBJPROP_TEXT,"Mov. Hoje:");
      ObjectSetString(0,"ValorMovimentacaoParHoje",OBJPROP_TEXT,SubidaQueda + DoubleToString(MovimentacaoParHoje,0) + " Pts");        

      // Valor Media Pontos Por Dia Par DINÂMICO
      ObjectSetString(0,"ValorMediaMovDiario",OBJPROP_TEXT,DoubleToString(MediaMovDiario,0) + " Pts("+DoubleToString(PorcMovNoMomento,1)+"%)"); 
      
      // Valor Swap Compra DINÂMICO
      ObjectSetString(0,"ValorSwapCompra",OBJPROP_TEXT,DoubleToString(SwapCompra,2));
     
      // Valor Swap Venda DINÂMICO
      ObjectSetString(0,"ValorSwapVenda",OBJPROP_TEXT,DoubleToString(SwapVenda,2));
   
      // Valor Spread DINÂMICO
      ObjectSetString(0,"ValorSpread",OBJPROP_TEXT,SpreadAtual);

      // Valor Nível de Margem DINÂMICO
      ObjectSetString(0,"ValorNiveldeMargem",OBJPROP_TEXT,DoubleToString(NiveldeMargem,2)+"%");   

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
              

