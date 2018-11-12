const getLetter = require('./get_letter');

test('pass string to get letter', () => {
  expect(getLetter('adfgt')).toBe('A');
  expect(getLetter('beauty')).toBe('B');
  expect(getLetter('car')).toBe('B');
  expect(getLetter('kaio')).toBe('C');
  expect(getLetter('ricardo')).toBe('D');
});
