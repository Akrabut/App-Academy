const MessageMixer = {};

MessageMixer.countCharacter = (inputString, inputCharacter) => {
  let count = 0;
  const string = inputString.toLowerCase();
  const character = inputCharacter.toLowerCase();
  for (let i = 0; i < string.length; i++) {
    if (string[i] === character) {
      count++;
    }
  }
  return count;
};

MessageMixer.capitalizeFirstCharacterOfWords = (string) => {
  const arr = string.split(' ');
  for (let i = 0; i < arr.length; i++) {
    const word = arr[i];
    arr[i] = word[0].toUpperCase() + word.substring(1);
  }
  return arr.join(' ');
};


MessageMixer.reverseWord = (word) => word.split('').reverse().join('');

MessageMixer.reverseAllWords = (sentence) => {
  const words = sentence.split(' ');
  for (let i = 0; i < words.length; i++) {
    words[i] = MessageMixer.reverseWord(words[i]);
  }
  return words.join(' ');
};


MessageMixer.replaceFirstOccurence = (string, toBeReplaced, replaceWith) => string.replace(toBeReplaced, replaceWith);


MessageMixer.replaceAllOccurrences = (string, toBeReplaced, replaceWith) => string.split(toBeReplaced).join(replaceWith);

MessageMixer.encode = (string) => {
  const replacementObject = {
    a: '@',
    s: '$',
    i: '!',
    o: '0',
  };
  for (const key in replacementObject) {
    string = MessageMixer.replaceAllOccurrences(string, key, replacementObject[key]);
  }
  return string;
};

MessageMixer.palindrome = (str) => `${str}  ${MessageMixer.reverseWord(str)}`;

MessageMixer.pigLatin = (sentence, char) => sentence.split(' ').join(`${char} `);

module.exports = MessageMixer;
