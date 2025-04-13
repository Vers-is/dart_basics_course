void main() {
  // containsTwice();
  // bothStartWithZero();
  // largestSumArray();
  // middleTwo();
  // combineArrays();
  // swapFirstLast();
  // middleThree();
  // largestOfThree();
  // firstTwo();
}

// Write a program to check if a given array of integers contains 3 twice, or 5 twice.

bool containsTwice(List<int> nums) {
  int count3 = 0;
  int count5 = 0;

  for (var n = 0; n < nums.length; n++) {
    if (n == 3) count3++;
    if (n == 5) count5++;
  }

  return count3 == 2 || count5 == 2;
}

// Write a program to check if two given arrays of integers have 0 as their first element.
bool bothStartWithZero(List<int> a, List<int> b) {
  if (a.isEmpty || b.isEmpty) return false;
  return a[0] == 0 && b[0] == 0;
}

// Write a program to compute the sum of the values of two given array of integers
// and each length 2. Find the array which has the largest sum and return the first array
// if the sum of two given arrays are equal.
List<int> largestSumArray(List<int> a, List<int> b) {
  int sumA = a[0] + a[1];
  int sumB = b[0] + b[1];
  if (sumA > sumB) return a;
  if (sumB > sumA) return b;
  return a;
}

// Write a program to create an array of length 2 containing the middle two elements
// from a given array of integers and even length 2 or more.

List<int> middleTwo(List<int> nums) {
  List<int> middle = [0, 0];
  int index1 = nums.length ~/ 2 - 1;
  int index2 = nums.length ~/ 2;
  middle[0] = nums[index1];
  middle[1] = nums[index2];
  return middle;
}
// Write a program to test if an array of length four containing all their elements
// from two given array (each length two) of integers,.

List<int> combineArrays(List<int> a, List<int> b) {
  if (a.length == 2 && b.length == 2) {
    List<int> combined = a + b;
    return combined;
  }
  return [];
}

// Write a program to swap the first and last elements of a given array of integers.
// Return the modified array (length will be at least 1).

List<int> swapFirstLast(List<int> nums) {
  int first = nums[0];
  int last = nums[nums.length - 1];
  nums[0] = last;
  nums[nums.length - 1] = first;
  return nums;
}

// Write a program to create a new array of length 3 containing the elements from
// the middle of a given array of integers and length will be at least 3.

List<int> middleThree(List<int> nums) {
  List<int> middle = [0, 0, 0];
  int index1 = nums.length ~/ 2 - 1;
  int index2 = nums.length ~/ 2;
  int index3 = nums.length ~/ 2 + 1;
  middle[0] = nums[index1];
  middle[1] = nums[index2];
  middle[2] = nums[index3];
  return middle;
}

// Write a program to find the largest value from the first, last, and middle values
// in a given array of integers and length will be at least 1.

int largestOfThree(List<int> nums) {
  int first = nums[0];
  int last = nums[nums.length - 1];
  int middle = 0;
  if (nums.length % 2 == 0) {
    middle = nums[nums.length ~/ 2 - 1];
  }
  if (first > last && first > middle) {
    return first;
  } else if (last > first && last > middle) {
    return last;
  } else {
    return middle;
  }
}

// Write a program to create a new array, taking first two elements from a given array of integers.
// If the length of the given array is less than 2 use the single element of the given array.
List<int> firstTwo(List<int> nums) {
  List<int> newList = [];
  if (nums.length >= 2) {
    newList.add(nums[0]);
    newList.add(nums[1]);
  } else if (nums.length == 1) {
    newList.add(nums[0]);
  }
  return newList;
}
