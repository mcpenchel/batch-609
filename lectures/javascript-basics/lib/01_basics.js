// 1) Basic Types and Casting

15;      // number
34.2;    // number

"Hello"; // string

true;  // boolean
false; // boolean

(14).toString(); // returns "14"
Number.parseInt("14"); // returns 14

// 2) Variables

const firstName = "Matheus";
// We can't re-assign a constant! So if I try this:
// firstName = "Luca"
// The code will break.

// When we're talking about Objects or Arrays,
// we usually declare them as constants. Because we can still push to a constant ;)

let lastName = "Penchel";
// We can re-assign the regular good old variable. So if I try this:
// lastName = "Severo";
// The code will work as it should /O/

// 3) Naming Conventions

let thisIsAGoodVariableName;
let this_is_a_bad_variable_name;

// 4) Arrays

const blackSabbath = [ "Ozzy Osbourne", "Tony Iommi", "Gerard Butler", "Bill Ward" ];

// reading
blackSabbath[0]

// updating
blackSabbath[0] = "Dio"

// pushing
blackSabbath.push("Kelly Key")

// removing X elements starting at index Y
// blackSabbath.slice(index, howManyElements)
blackSabbath.slice(0, 1) // this removes 1 element at index 0, so the first

blackSabbath.forEach((rockStar) => {
  console.log(rockStar);
})

// 5) Control Flow

const age = 17;

// if without else or else if
if (age >= 80) {
  console.log("You shouldn't vote anymore!")
}

// if and else
if (age >= 18) {
  console.log("You can vote");
} else {
  console.log("You can't vote");
}

// if, else if and else
if (age >= 80) {
  console.log("You can vote, but you shouldn't");
} else if (age >= 18) {
  console.log("You can vote");
} else {
  console.log("You can't vote");
}

// 7) Objects

const ozzyOsbourne = {
  name: "Ozzy Osbourne",
  age: 66,
  musicalStyle: "Rock n' Roll"
}

// reading the value of a given property
ozzyOsbourne.name
ozzyOsbourne['name']

// re-assigning the value
ozzyOsbourne.name = "Ozzy 'The Prince of Darkness' Osbourne"

// creating a new property
ozzyOsbourne.dead = false

// 8) Functions

// old syntax

function squareOldSchool(x) {
  return x * x;
}

// new syntax

const squareNewSchool = (x) => {
  return x * x;
}

// 1-line syntax, the only one which has an IMPLICIT return

const squareOneLineSyntax = x => x * x;