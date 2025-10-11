#include <gmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Fast doubling algorithm for Fibonacci using GMP
void fib_fast_doubling(mpz_t n, mpz_t Fn, mpz_t Fn1) {
  if (mpz_cmp_ui(n, 0) == 0) {
    mpz_set_ui(Fn, 0);
    mpz_set_ui(Fn1, 1);
    return;
  }

  mpz_t a, b, c, d, t, n2;
  mpz_inits(a, b, c, d, t, n2, NULL);
  mpz_fdiv_q_2exp(n2, n, 1); // n2 = n >> 1

  fib_fast_doubling(n2, a, b);

  // c = a * (2*b - a)
  mpz_mul_ui(t, b, 2);
  mpz_sub(t, t, a);
  mpz_mul(c, a, t);

  // d = a^2 + b^2
  mpz_mul(d, a, a);
  mpz_addmul(d, b, b);

  if (mpz_odd_p(n)) {
    mpz_set(Fn, d);
    mpz_add(Fn1, c, d);
  } else {
    mpz_set(Fn, c);
    mpz_set(Fn1, d);
  }

  mpz_clears(a, b, c, d, t, n2, NULL);
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <n>\n", argv[0]);
    return 1;
  }

  mpz_t n, Fn, Fn1;
  mpz_inits(n, Fn, Fn1, NULL);

  mpz_set_str(n, argv[1], 10); // accepts very large integers

  clock_t start = clock();
  fib_fast_doubling(n, Fn, Fn1);
  clock_t end = clock();

  double elapsed = (double)(end - start) / CLOCKS_PER_SEC;

  gmp_printf("Fibonacci Number %Zd: %Zd\n", n, Fn);
  printf("Calculation time: %.6f seconds\n", elapsed);

  mpz_clears(n, Fn, Fn1, NULL);
  return 0;
}
