/*
 * Modify and return the array so that all even elements are doubled and all odd elements are tripled.
 *
 * Parameter(s):
 * nums: An array of numbers.
 */

/*function modifyArray(nums) {
    nums.forEach(function (num, index) {
        nums[index] = (num % 2 == 0) ? (num = num * 2) : (num = num * 3);
    });
    return nums;
}*/

/*function modifyArray(nums) {
    nums.forEach((num, index) => nums[index] = (num % 2 == 0) ? (num = num * 2) : (num = num * 3));
    return nums;
}*/

function modifyArray(nums) {
    return nums.map(n => n = (n % 2 == 0) ? n * 2 : n * 3);
}

// modifyArray([1,2,3,4,5])
