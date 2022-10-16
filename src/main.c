#include <stdio.h>
#include "math_lib.h"

int main()
{
    double value1 = add(3.1, 2.5);
    double value2 = sub(10.2, 5.3);

    printf("value1 = %lf\n", value1);
    printf("value2 = %lf\n", value2);
    return 0;
}
