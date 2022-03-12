import 'dart:io';
import 'dart:core';

//Function for factorials
int fact(int x) {
  if (x <= 1) {
    return 1;
  } else {
    int f = 0;
    return f = x * fact(x - 1);
  }
}

//Using factorials to solve P(n, r)
int perm1(int n, int r) {
  if (r == 0) {
    return 1;
  } else if (r == 1) {
    return n;
  } else if (r == n) {
    return fact(n);
  } else {
    int nTop = fact(n);
    int nBottom = fact(n - r);
    int total = 0;

    try {
      total = nTop ~/ nBottom;
      return total;
    } on IntegerDivisionByZeroException catch (e) {}
  }
}

//Using iteration to solve P(n, r)
int perm2(int n, int r) {
  if (r == 0) {
    return 1;
  } else if (r == 1) {
    return n;
  } else if (r == n) {
    return fact(n);
  } else {
    int total = n;

    for (int i = n - 1; i > n - r; i--) {
      total *= (i);
    }

    return total;
  }
}

void main(List<String> args) {
  if (args.length > 2 || args.length < 2) {
    stdout.write("Please supply two numbers, n and r.\n");
  } else {
    int n = int.parse(args[0]);
    int r = int.parse(args[1]);

    int result1 = perm1(n, r);
    int result2 = perm2(n, r);

    //Checking for NaN
    if (result1 == null) {
      stdout.write("P(${n}, ${r}) using factorials: nan\n");
    } else {
      stdout.write("P(${n}, ${r}) using factorials: ${result1}\n");
    }

    stdout.write("P(${n}, ${r}) using iteration: ${result2}\n");
  }
}
