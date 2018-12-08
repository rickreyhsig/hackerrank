function rotate(elem) {
    btn1 = document.getElementById("btn1");
    btn2 = document.getElementById("btn2");
    btn3 = document.getElementById("btn3");
    btn4 = document.getElementById("btn4");
    //btn5 = document.getElementById("btn5");
    btn6 = document.getElementById("btn6");
    btn7 = document.getElementById("btn7");
    btn8 = document.getElementById("btn8");
    btn9 = document.getElementById("btn9");

    vals = [0, btn1.innerHTML, btn2.innerHTML, btn3.innerHTML,
           btn4.innerHTML, btn5.innerHTML, btn6.innerHTML,
           btn7.innerHTML, btn8.innerHTML, btn9.innerHTML];

    btn1.innerHTML = vals[4];
    btn2.innerHTML = vals[1];
    btn3.innerHTML = vals[2];

    btn4.innerHTML = vals[7];
    //btn5.innerHTML = btn5.innerHTML;
    btn6.innerHTML = vals[3];

    btn7.innerHTML = vals[8];
    btn8.innerHTML = vals[9];
    btn9.innerHTML = vals[6];
    return;
}
