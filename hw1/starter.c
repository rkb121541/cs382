#include <stdio.h>

/*
   Your name and honor code
   State the sorting algorithm you chose in task 3
   State if you want to be considered for bonus points in task 3
*/

void copy_str(char* src, char* dst) {
    /* Your code here */
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
    /* Your code here
       Do not cast the vectors directly, such as
       int* va = (int*)vec_a;
    */
   return 0; // Please modify this line as needed
}

void sort_nib(int* arr, int length) {
    /* Your code here */
}


int main(int argc, char** argv) {

    /**
     * Task 1
     */

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    copy_str(str1,str2);
    puts(str1);
    puts(str2);

    /**
     * Task 2
     */

    int vec_a[3] = {12, 34, 10};
    int vec_b[3] = {10, 20, 30};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));
    
    printf("%d\n",dot);

    /**
     * Task 3
     */

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    sort_nib(arr, 3);
    for(int i = 0; i<3; i++) {
        printf("0x%08x ", arr[i]);
    }
    puts(" ");

    return 0;
}
