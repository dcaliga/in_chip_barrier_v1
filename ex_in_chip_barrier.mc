#include <libmap.h>

void subr (int64_t In[], int64_t Out[], int Line_Length, int Num_Lines, int64_t *tm, int mapnum) {

    OBM_BANK_A (AL, int64_t, MAX_OBM_SIZE)
    OBM_BANK_C (CL, int64_t, MAX_OBM_SIZE)

    Stream_64 SIn, SOut;
    int  nval;
    int64_t t0,t1;

    nval = Num_Lines * Line_Length;

    read_timer (&t0);


    buffered_dma_cpu (CM2OBM, PATH_0, AL, MAP_OBM_stripe (1,"A"), In, 1, nval*8);


    #pragma src parallel sections
    {
        #pragma src section
        {
        int64_t v0,v1;
        int j,ix,n_sample,n_line;

        for (j=0; j<nval; j++) {
            cg_count_ceil_32(1, 0, j==0, Line_Length-1, &n_sample);
            cg_accum_add_32 (1, n_sample==0, -1, j==0, &n_line);
            ix = n_line*Line_Length + Line_Length - n_sample -1;

            v0 = AL[ix];
 printf ("j %i nsamp %i nline %i ix %i v0 %lli\n",j,n_sample,n_line,ix,v0);

            put_stream_64 (&SOut, v0, 1);
            }
        }
        #pragma src section
        {
        streamed_dma_cpu_64 (&SOut, STREAM_TO_PORT, Out, nval*8);
        }
    }

    read_timer (&t1);
    *tm = t1 - t0;
}
