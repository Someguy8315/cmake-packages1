#include <stdio.h>
#include "math_lib.h"
#include "division.h"
#include "multiplication.h"

int main()
{
    double value1 = add(3.1, 2.5);
    double value2 = sub(10.2, 5.3);
    double value3 = divide(2.0, 4.0);
    double value4 = multiply(5.0, 5.0);

    printf("value1 = %lf\n", value1);
    printf("value2 = %lf\n", value2);
    printf("value3 = %lf\n", value3);
    printf("value4 = %lf\n", value4);
    return 0;
}
