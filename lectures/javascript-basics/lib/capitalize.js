const capitalizer = (name) => {
  const firstChar        = name[0].toUpperCase();
  const otherCharacters  = name.substring(1).toLowerCase();

  return `${firstChar}${otherCharacters}`;
}

const fullNameCapitalizer = (fullName) => {
  const allNames = fullName.split(" ");

  let beautifulFullName = ""

  allNames.forEach((name) => {
    beautifulFullName += name[0].toUpperCase();
    beautifulFullName += name.substring(1).toLowerCase();

    beautifulFullName += " "

    // or, beautifulFullName += capitalizer(name) // :D
  })

  return beautifulFullName;
}

console.log(capitalizer("luca"));


console.log(fullNameCapitalizer("matheus"));
console.log(fullNameCapitalizer("matheus penchel"));