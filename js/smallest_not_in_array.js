// Write a function:

// def solution(a)

// that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

// For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

// Given A = [1, 2, 3], the function should return 4.

// Given A = [−1, −3], the function should return 1.

// Write an efficient algorithm for the following assumptions:


const smallestNotInArray = (array) => {
  let result = null;
  array.sort().forEach((num, i, arr) => {
    if ((i < arr.length -1) && (num > 0) && (num !== arr[i + 1]) && (num + 1 !== arr[i + 1])) {
      result = num + 1;
    }
  });
  if (result === null) {
    if (array[array.length - 1] <= 0) {
      return 1;
    } else {
      return array[array.length - 1] + 1;
    }
  }
};

