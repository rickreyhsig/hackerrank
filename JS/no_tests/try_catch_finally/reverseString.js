function reverseString(s) {
    let r = ''
    try {
        r = s.split("").reverse().join("");
    }
    catch(err) {
        /*console.log(err.toString());
        console.log(err.name);
        console.log(err.stack);*/
        console.log(err.message);
    }
    finally {
        if (r === "") {
            console.log(s)
        } else {
            console.log(r);
        }
    }
}
