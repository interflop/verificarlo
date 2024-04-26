#include <math.h>
#include <stdio.h>

#ifndef REAL
#error "REAL must be defined"
#endif

int main() {
  REAL a = 0.1, b = 0.2, c = 0.3;
  REAL result = a * b + c;
  printf("%.17e\n", result);
  return 0;
}