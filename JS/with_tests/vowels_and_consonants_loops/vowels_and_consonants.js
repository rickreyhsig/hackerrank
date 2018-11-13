function vowelsAndConsonants(str) {
  let vowels = [];
  let consonants = [];

  for (var i = 0; i < str.length; i++) {
    if ( /[aeiouAEIOU]/.test(str.charAt(i)) ) {
      vowels.push(str.charAt(i));
    } else {
      consonants.push(str.charAt(i));
    }
  }
  let all = vowels.concat(consonants);
  for (var i = 0; i < all.length; i++) {
    console.log(all[i]);
  }
  return all;
}

module.exports = vowelsAndConsonants;
