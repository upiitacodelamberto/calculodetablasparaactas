#include <stdio.h>
#include "Grupo.h"
extern int NDD[];         //Numero de Discentes x grupo
extern float* calif[];        //Calififcaciones de los discentes x grupo
extern float* tarea[];        //Califs d tareas de los discentes x grupo
extern float* part[];     //Participacion de los discentes x grupo

void set_Grupos(int N, Grupo** G){
  for(int i=0; i<N; ++i){
    G[i] = new Grupo();
    G[i]->numDD = NDD[i];     //fijando el numero de discentes por grupo
    G[i]->D = new Discente*[NDD[i]];
    for(int j=0; j<NDD[i]; ++j){
      *(G[i]->D + j) = new Discente();
      G[i]->D[j]->numDL = j;    //El numero de lista de cada discente empezamos desde 0
      G[i]->D[j]->calDEX = calif[i][j];
    }
  }
}

void show_Grupos(int N, Grupo** G){
  int i, j;
  printf("NdL\tExam\tTareas(15)\tPart(15)\tExam(70)\tFParcial\n");
  for(i=0; i<N; ++i){
    for(j=0; j<G[i]->numDD; ++j){
      printf("%i\t%.1f\t%.1f\t\t%.1f\t\t%.1f\t\t%.1f\n",  \
              j+1, G[i]->D[j]->calDEX, tarea[i][j], part[i][j],  \
              .7*(G[i]->D[j]->calDEX), tarea[i][j]+part[i][j]+ \
              .7*(G[i]->D[j]->calDEX));
    }
    printf("\n%d\n",i);
  }
  printf("\n%d\n",i);
}
