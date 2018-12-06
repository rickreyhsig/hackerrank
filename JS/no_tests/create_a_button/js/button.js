function incrValue(elem) {
    var curval = parseInt(elem.innerHTML);
    console.log(curval+1);
    elem.innerHTML = curval+1
    return;
}