#include <stdio.h>
#include <stdint.h>

typedef struct {
    int id;
    double rating;
    int pages;
} Book;

extern int64_t total_pages(const Book* books, int64_t n);
extern double average_rating(const Book* books, int64_t n);
extern int64_t count_above(const Book* books, int64_t n, double threshold);
extern Book* best_book(const Book* books, int64_t n);
extern double weighted_rating(const Book* books, int64_t n);

int main(void) {
    Book library[3] = {
        { .id = 1, .rating = 4.5, .pages = 1000 },
        { .id = 2, .rating = 3.8, .pages = 180 },
        { .id = 3, .rating = 4.9, .pages = 500000 }
    };

    int64_t total = total_pages(library, 3);
    printf("Total Pages: %ld\n", total); // Output: 1012
	double avg = average_rating(library, 3);
	printf("Average Rating: %lf\n", avg);
	int64_t count = count_above(library, 3, 3.0);
	printf("Above  Rating: %ld\n", count);
	Book* best = best_book(library, 3);
	printf("Best  ID: %d\n", best->id);
	double weighted = weighted_rating(library, 3);
	printf("Weighted Rating: %lf\n", weighted);
    return 0;
}