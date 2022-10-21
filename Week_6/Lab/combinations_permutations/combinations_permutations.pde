//https://www.mathplanet.com/education/algebra-2/discrete-mathematics-and-probability/permutations-and-combinations

//equation
//P(n,r)

void setup() {
  int v1 = 10;
  int v2 = 4;
  int factorial1 = factorial(v1);
  int factorial2 = factorial(v1-v2);
  println(factorial1 / factorial2);
}

int factorial(int n) {
  if (n <= 0) {
    return 1;
  } else {
    return n*factorial(n-1);
  }
}
