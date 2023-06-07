#include <cstdio>

__global__ void cuda_hello_world(){
    printf("Hello from my GPU\n");
}

int main(){
    cuda_hello_world<<<1,1>>>();
    cudaDeviceSynchronize();
    return 0;
}