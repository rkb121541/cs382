#include <stdio.h>

/*
   Your name and honor code
   State the sorting algorithm you chose in task 3
   State if you want to be considered for bonus points in task 3
*/

void copy_str(char* src, char* dst) {
    int index = 0;
loop:
    dst[index] = src[index];
    if (src[index] == 0) return;
    index++;
    goto loop;
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
    /* Your code here
       Do not cast the vectors directly, such as
       int* va = (int*)vec_a;
    */
//    return 0; // Please modify this line as needed
    int result = 0;
    int counter = 0;
loop:
    if (counter == length) return result;

    int first = *((int*)(vec_a + (counter * size_elem))); 
    int second = *((int*)(vec_b + (counter * size_elem))); 
    // printf("first: %d, second: %d\n", first, second);
    result += first * second;
    counter++;
    goto loop;
}

void sort_nib(int* arr, int length) {
    /* Your code here */
    int size = length * 8;
    char nibs[size];
    int counter = 0;

    int i = 0;
loop1:
    if (i >= length) goto sort;
    int j = 7;
loop2:
    if (j < 0) {
        i++;
        goto loop1;
    }
    // each nibs[counter] will store 4 bits (each hex digit is a 4 bit representation)
    // we have to go by each 4 bits which is why we do (4 * j)
    // 0xF is also 4 bits; we use that as a mask to extract only 4 bits at a time
    // we are extracting 4 bits at a time when we do (arr[i] >> (4 * j)) & 0xF
    // we are shifting it (4 * j) so that it aligns properly with 0xF when we mask it
    nibs[counter] = (arr[i] >> (4 * j)) & 0xF;
    counter++;
    j--;
    goto loop2;

    // for (int i = 0; i < length; i++) {
    //     for (int j = 7; j >= 0; j--) {
    //         
    //         nibs[counter] = (arr[i] >> (4 * j)) & 0xF;
    //         counter++;

            
    //     }
    // }

    // printf("before: ");
    // for (int i = 0; i < size; i++) {
    //     printf("%x", nibs[i]);
    // }
    // printf("\n");
    
sort:
    i = 0;
loop3:
    if (i >= size-1) goto lastpart;
    j = 0;
loop4:
    if (j >= size-i-1) {
        i++;
        goto loop3;
    }
    if (nibs[j] > nibs[j+1]) {
        char temp = nibs[j];
        nibs[j] = nibs[j+1];
        nibs[j+1] = temp;
    }
    j++;
    goto loop4;

    // bubble sort
    // for (int i = 0; i < (size) - 1; i++) {
    //     for (int j = 0; j < (size) - i - 1; j++) {
    //         if (nibs[j] > nibs[j+1]) {
    //             char temp = nibs[j];
    //             nibs[j] = nibs[j+1];
    //             nibs[j+1] = temp;
    //         }
    //     }
    // }

    // printf("after: ");
    // for (int i = 0; i < size; i++) {
    //     printf("%x", nibs[i]);
    // }
    // printf("\n");

lastpart:
    int index = 0;
    i = 0;
loop5:
    if (i >= length) return;
    arr[i] = 0;
    j = 7;
loop6:
    if (j < 0) {
        i++;
        goto loop5;
    }
    arr[i] |= (nibs[index] << (4 * j));
    index++;
    j--;
    goto loop6;

    // for (int i = 0; i < length; i++) {
    //     arr[i] = 0;
    //     for (int j = 7; j >= 0; j--) {

    //         arr[i] |= (nibs[index] << (4 * j));
    //         index++;

    //     }
    // }
    
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
