#include <stdio.h>

int main() {
    // Declare a file pointer variable
    FILE *fp;

    // Open the file "my_file.txt" in write mode ("w")
    // If the file doesn't exist, it will be created.
    // If it exists, its content will be overwritten.
    fp = fopen("my_file.txt", "w");

    // Check if the file was opened successfully
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Write "Hello World" to the file using fprintf
    fprintf(fp, "Hello World\n");

    // Close the file to flush any buffered data
    fclose(fp);

    // Now, open the file again in read mode ("r")
    fp = fopen("my_file.txt", "r");

    // Check if the file was opened successfully for reading
    if (fp == NULL) {
        printf("Error opening file for reading!\n");
        return 1;
    }

    // Declare a character array to store the read content
    char buffer[255];

    // Read the content of the file into the buffer using fgets
    fgets(buffer, sizeof(buffer), fp);

    // Print the read content
    printf("Read from file: %s", buffer);

    // Close the file again
    fclose(fp);

    return 0;
}
