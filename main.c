#include <libmap.h>

void subr (int64_t In[], int64_t Out[], int Line_Length, int Num_Lines, int64_t *tm, int mapnum) ;


int main (int argc, char *argv[]) {

    FILE *res_map, *res_cpu;
    int64_t *In, *Out;
    int64_t tm;
    int mapnum = 0;
    int i, j, k;
    int nval, Num_Lines, Line_Length;

    if ((res_map = fopen ("res_map", "w")) == NULL) {
        fprintf (stderr, "failed to open file 'res_map'\n");
        exit (1);
        }

    if ((res_cpu = fopen ("res_cpu", "w")) == NULL) {
        fprintf (stderr, "failed to open file 'res_cpu'\n");
        exit (1);
        }

    Num_Lines = 128;
    Line_Length = 1024;
    Num_Lines = 8;
    Line_Length = 16;
    nval = Num_Lines * Line_Length;

    In  = malloc (nval * sizeof (int64_t));
    Out = malloc (nval * sizeof (int64_t));

    i = 0;
    for (k=0; k<Num_Lines; k++)  {
    //for (j=0; j<Line_Length; j++)  {
    for (j=Line_Length-1; j>=0; j--)  {
        In[i] = i;
        fprintf (res_cpu, "%lld\n", (int64_t)(j+k*Line_Length));
        i++;
    }
    }

    if (map_allocate (1)) {
       fprintf (stdout, "Map allocation failed.\n");
       exit (1);
       }

    /* call compute */
    subr (In, Out, Line_Length, Num_Lines, &tm, mapnum);

    printf ("%lld clocks\n", tm);


    for (i=0; i < nval; i++) {
        fprintf (res_map, "%lld\n", Out[i]);
        }

    if (map_free (1)) {
        printf ("Map deallocation failed. \n");
        exit (1);
        }

}

      
