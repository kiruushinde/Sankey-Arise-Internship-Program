console.log("hello meow 😺");

let form = document.getElementById("form");
let fname = document.getElementById("fname");
let lname = document.getElementById("lname");
let phone = document.getElementById("phone");
let cardnumber = document.getElementById("cardnumber");
let cvc = document.getElementById("cvc");
let expdate = document.getElementById("exptdate");
let text4 = document.getElementById('validatename');
let text6 = document.getElementById('validatelname');
let text10 = document.getElementById('validatecard');
let text12 = document.getElementById('validatecvc');
let text13 = document.getElementById('validatedate');


form.addEventListener("submit", (e) => {
    e.preventDefault();

    console.log(fname, lname, phone, cardnumber);
    console.log("prevented submit");

    validateInputs();
})

function validateInputs() {
    // validate first name
    if (fname.value === '') {
        text4.style.display = 'block';
    }
    else {
        text4.style.display = 'none';
    }

    // validate last name
    if (lname.value === '') {
        text6.style.display = 'block';
    }
    else {
        text6.style.display = 'none';
    }

    // validate card number
    if (cardnumber.value.length != 16) {
        text10.style.display = 'block';
    }
    else {
        text10.style.display = 'none';
    }

    // validate cvc
    if (cvc.value.length != 3) {
        text12.style.display = 'block';
    }
    else {
        text12.style.display = 'none';
    }

    // validate exp date
    let date = expdate.value;
    if (date.indexOf('/') != 2 && date.length != 4) {
        text13.style.display = 'block';
    }
    else {
        text13.style.display = 'none';
    }
}