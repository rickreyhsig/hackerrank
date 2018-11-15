function getSecondLargest(nums) {
    // Complete the function
    nums.sort(function(a, b){return a-b});
    //console.log(nums);
    let uniq = []
    for (let i=0; i<nums.length; i++){
      if (!uniq.includes(nums[i])) uniq.push(nums[i])
    }
    console.log(uniq);
    return uniq[uniq.length-2]
}

module.exports = getSecondLargest;
