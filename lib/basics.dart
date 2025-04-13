void main() {
  // isInRange();
  // startsWithFixVariant();
  // findLargest();
  // inSameRange();
  // largerInRange();
  // sameLastDigit();
  // lastThreeUpper();
  // hasDoubleA();
}

//  Write a program that return true if either of two given integers is in the range 10..30 inclusive.

bool isInRange(int a, int b) {
  return (a >= 10 && a <= 30) || (b >= 10 && b <= 30);
}

// Write a program to check if a given string begins with "fix", except the 'f' can be any character or number.

bool startsWithFixVariant(String str) {
  if (str.length < 3) return false;
  return str[1] == 'i' && str[2] == 'x';
}

// Write a program to find the largest number among three given integers.

int findLargest(int a, int b, int c) {
  if (a >= b && a >= c) return a;
  if (b >= a && b >= c) return b;
  return c;
}

// Write a program that accept two integer values and test if they are both in the range 20..30 inclusive, or they are both in the range 30..40 inclusive.

bool inSameRange(int a, int b) {
  return ((a >= 20 && a <= 30) && (b >= 20 && b <= 30) ||
      (a >= 30 && a <= 40) && (b >= 30 && b <= 40));
}

// Write a program that accept two positive integer values and test whether the larger value is in the range 20..30 inclusive, or return 0 if neither is in that range.

int largerInRange(int a, int b) {
  if (a > b) {
    if (a >= 20 && a <= 30) {
      return a;
    }
  } else {
    if (b >= 20 && b <= 30) {
      return b;
    }
  }
  return 0;
}

// Write a program to test whether the last digit of the two given non-negative integer values are same or not.

bool sameLastDigit(int a, int b) {
  if (a % 10 == b % 10) {
    return true;
  } else {
    return false;
  }
}

// Write a program to convert the last three characters in upper case. If the string has less than 3 chars, lowercase whatever is there.

String lastThreeUpper(String str) {
  if (str.length < 3) {
    return str.toLowerCase();
  } else {
    String lastThree = str.substring(str.length - 3).toUpperCase();
    String rest = str.substring(0, str.length - 3);
    return rest + lastThree;
  }
}

// Write a program to check if the first instance of "a" in a given string is immediately followed by another "a".

bool hasDoubleA(String str) {
  int index = str.indexOf('a');
  if (index == -1 || index == str.length - 1) {
    return false;
  }
  return str[index + 1] == 'a';
}
