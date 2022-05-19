#include <stdlib.h>

int main ()
{
    char fileNameTemp[MAX] = "temp_name_XXXXXX";
    int fd = mkstemp(fileNameTemp);     // generate a unique filename from the template
    FILE *fp = fdopen(fd);
    fprintf(fp, "Hello world!\n");
    fclose(fp);
}
