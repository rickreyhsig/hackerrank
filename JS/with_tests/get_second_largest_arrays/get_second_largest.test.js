const getSecondLargest = require('./get_second_largest');

test('pass string to get letter', () => {
  expect(getSecondLargest([2,3,6,6,5])).toBe(5);
  expect(getSecondLargest([1,2,3,4,5,6,7,8,9,10])).toBe(9);

});
