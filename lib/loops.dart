import 'dart:io';

void main() {
  print('1. Square of numbers from 10 to 20');
  square();
  print('------------------\n');

  print('2. Sum of numbers from 1 to n');
  sum();
  print('------------------\n');

  print('3. Deposit amount after N years');
  deposit();
  print('------------------\n');

  print('4. Numbers from 20 to 50 divisible by 3 but not by 5');
  divisibleBy3Not5();
  print('------------------\n');

  print('5. Sum of numbers from 1 to 50 divisible by 5 or 7');
  sum5and7();
  print('------------------\n');

  print('6. Two-digit numbers divisible by 4 but not by 6');
  twoDigits();
  print('------------------\n');

  print('7. Sum of numbers from 100 to 200 that are multiples of 17');
  sum17from100to200();
  print('------------------\n');

  print('8. Sum of squares of numbers from 1 to N');
  sumOfSquares();
  print('------------------\n');
}

// 1. Write a program that prints the squares of numbers from 10 to 20.

void square() {
  for (int i = 10; i <= 20; i++) {
    print(i * i);
  }
}

// 2. Write a program that calculates the sum of numbers from 1 to *n*. The value of *n* is entered from the keyboard.

void sum() {
  stdout.write('Enter number: ');
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  print('The sum is: $sum');
}

// 3. A deposit of *S* rubles is placed in a savings bank at a 3% interest rate. What will be the amount of the deposit after *N* years? (The data is entered from the keyboard.)
void deposit() {
  stdout.write('Enter deposit: ');
  int s = int.tryParse(stdin.readLineSync()!) ?? 0;
  stdout.write('Enter years: ');
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;
  double final_sum = s.toDouble();
  for (int i = 1; i <= n; i++) {
    final_sum += final_sum * 0.03;
  }
  int final_sum_int = final_sum.toInt();
  print('The final amount is: $final_sum_int');
}

// 4. Given natural numbers from 20 to 50, print those that are divisible by 3 but not divisible by 5.
void divisibleBy3Not5() {
  for (int i = 20; i <= 50; i++) {
    if (i % 3 == 0 && i % 5 != 0) {
      print(i);
    }
  }
}

// 5. Given natural numbers from 1 to 50, find the sum of those that are divisible by 5 or 7.
void sum5and7() {
  int sum = 0;
  for (int i = 1; i <= 50; i++) {
    if (i % 7 == 0 || i % 5 == 0) {
      sum += i;
    }
  }
  print(sum);
}
// 6. Print the two-digit numbers that are divisible by 4 but not divisible by 6.

void twoDigits() {
  for (int i = 10; i <= 99; i++) {
    if (i % 4 == 0 && i % 6 != 0) {
      print(i);
    }
  }
}

// 7. Find the sum of numbers from 100 to 200 that are multiples of 17.

void sum17from100to200() {
  int sum = 0;
  for (int i = 100; i <= 200; i++) {
    if (i % 17 == 0) {
      sum += i;
    }
  }
  print(sum);
}

// 8. Write a program that calculates the sum of the squares of numbers from 1 to a given integer *N*.

void sumOfSquares() {
  stdout.write('Enter number: ');
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += (i * i);
  }
  print('The sum of squares is: $sum');
}
