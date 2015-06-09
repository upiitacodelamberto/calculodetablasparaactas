#include <stdio.h>
#include "Grupo.h"

int main(){
  Grupo** G = new Grupo*[NdGs];
  set_Grupos(NdGs, G);
  show_Grupos(NdGs, G);
  return 0;
}
