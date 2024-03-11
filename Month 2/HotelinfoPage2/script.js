const validator = require("validator");

let fname = document.getElementById("fname");
let lname = document.getElementById("lname");
let form = document.getElementById("form");
let phonenumber = document.getElementById("phonenumber");
let email = document.getElementById("email");
let input14 = document.getElementById("input14");
let lastnameerror = document.getElementsByClassName("lname-error")[0];
let input117 = document.getElementsByClassName('input-117');

form.addEventListener('submit', (e) => {
    e.preventDefault();
    console.log("prevented submission");
    validateInputs();
})

function validateInputs() {

    // validating first name
    if (fname.value === '') {
        document.getElementById('validation1').classList.remove('valid1');
        document.getElementById('validation1').classList.add('validation1');
    }
    else {
        document.getElementById('validation1').classList.add('valid1');
        document.getElementById('validation1').classList.remove('validation1');

    }

    // validating last name
    if (lname.value === '') {
        lastnameerror.style.display = 'block';
    }
    else
        lastnameerror.style.display = 'none';

    // validating email
    if (validator.isEmail(email.value)) {
        input117.style.display = 'none';
    }
    else
        input117.style.display = 'block';
}