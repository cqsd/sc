// gets saved under /gh
// the dork
// site:github.com intext:"@optimizely" -intitle:Repositories -intitle:Following -intitle:Starred -intitle:Followers

// the "parser"
var titles = document.getElementsByClassName('ellip');
// e.g. kwalker3690 (Kelly Wallach) · GitHub
var matches = [];

for (let t of titles) {
  var match = t.innerText.match(/(?<username>^[^ ]+) \(/);
  if (match) {
    let username = match.groups.username;
    matches = matches.concat([username]);
    let r = new XMLHttpRequest();
    let data = btoa(username);
    r.addEventListener("load", e => console.log(e));
    r.open("GET", "http://localhost:9753/gh/" + data);
    r.send();
  }
}

console.log(matches.join(' '));
