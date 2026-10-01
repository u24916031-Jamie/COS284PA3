#include <stdio.h>
#include <stdint.h>

typedef struct {
    int id;
    double rating;
    int pages;
} Book;

extern int64_t total_pages(const Book* books, int64_t n);

int main(void) {
    Book library[3] = {
        { .id = 1, .rating = 4.5, .pages = 320 },
        { .id = 2, .rating = 3.8, .pages = 180 },
        { .id = 3, .rating = 4.9, .pages = 512 }
    };

    int64_t total = total_pages(library, 3);
    printf("Total Pages: %ld\n", total); // Output: 1012

    return 0;
}