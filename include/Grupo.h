#ifndef GRUPO_H
#define GRUPO_H
extern int NdGs;  //Numero de Grupos

class Discente;
class Grupo{
public:
  int numDD;      //Numero de Discentes
  Discente** D;    //Debe apuntar a numDD Discentes*
};//End class Grupo

class Discente{
public:
  int numDL;      //Numero de Lista
  float calDEX;   //Calificacion de Examen
};//End class Discente

void set_Grupos(int NdGs, Grupo** G);
void show_Grupos(int, Grupo**); 
#endif /* GRUPO_H */
