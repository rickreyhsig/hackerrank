function clickZero() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'0';
}
function clickOne() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'1';
}
function clickClr() {
    res = document.getElementById("res");
    res.innerHTML = '';
}
function clickSum() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'+';
}
function clickSub() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'-';
}
function clickMul() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'*';
}
function clickDiv() {
    res = document.getElementById("res");
    res.innerHTML = res.innerHTML+'/';
}
function clickEql() {
    res = document.getElementById("res");
    expression = res.innerHTML;
    params = expression.split(/(\+|\-|\*|\/)/);
    var result = ''
    if(params[1] === "+")
        result = (parseInt(params[0], 2)+parseInt(params[2], 2)).toString(2)
    else if (params[1] === "-")
        result = (parseInt(params[0], 2)-parseInt(params[2], 2)).toString(2)
    else if (params[1] === "*")
        result = (parseInt(params[0], 2)*parseInt(params[2], 2)).toString(2)
    else if (params[1] === "/")
        result = (parseInt(params[0], 2)/parseInt(params[2], 2)).toString(2)
    res.innerHTML = result;
}
