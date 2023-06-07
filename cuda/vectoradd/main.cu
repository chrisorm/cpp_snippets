#include <iostream>
#include <cmath>

__global__ void add(int n, float* x, float* y, float* z){
    int index = threadIdx.x;
    int stride = blockDim.x;

    for(int i=index; i<n; i+= stride){
        z[i] = x[i] + y[i];
    }
}

int main(){
int N = 1 <<20;
float *x, *y, *z;


cudaMallocManaged(&x, N*sizeof(float));
cudaMallocManaged(&y, N*sizeof(float));
cudaMallocManaged(&z, N*sizeof(float));

for(int i=0; i<N;i++){
    x[i]=float(3.0);
    y[i]=float(2.0);
}

  char *prefetch = getenv("__PREFETCH");
  if (prefetch == NULL || strcmp(prefetch, "off") != 0) {
    int device = -1;
    cudaGetDevice(&device);
    cudaMemPrefetchAsync(x, N*sizeof(float), device, NULL);
    cudaMemPrefetchAsync(y, N*sizeof(float), device, NULL);
    cudaMemPrefetchAsync(z, N*sizeof(float), device, NULL);
  }
 


add<<<1, 256>>>(N, x,y,z);
cudaDeviceSynchronize();

std::cout<<z[3]<<std::endl;
cudaFree(x);
cudaFree(y);
cudaFree(z);




}