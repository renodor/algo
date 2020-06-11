// return true if word is a palindrome, false if not


// using the reverse method
const palindrome = (word) => {
  const cleanedWord = word.replace(/\W/g, '').toLowerCase();
  const reversedWord = cleanedWord.split('').reverse().join('');
  return cleanedWord === reversedWord;
};


// using a for loop (optimized)
const loopPalindrome = (word) => {
  let result = true;
  const arr = word.replace(/\W/g, '').split('');
  for (let i = 0; i < word.length / 2; i++) {
    if (arr[i].toLowerCase() !== arr[arr.length - 1 - i].toLowerCase()) {
      result = false;
    }
  }
  return result;
};


