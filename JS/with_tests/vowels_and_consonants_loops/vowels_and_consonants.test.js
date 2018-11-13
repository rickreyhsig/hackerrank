const vowelsAndConsonants = require('./vowels_and_consonants');

test('pass string to get letter', () => {
  //expect(vowelsAndConsonants('adfgt')).toBe('A');
  expect(vowelsAndConsonants('javascriptloops')).toEqual(
    [ 'a', 'a', 'i', 'o', 'o', 'j', 'v', 's', 'c', 'r', 'p', 't', 'l', 'p', 's' ]);

});
