// de-obfuscation
console.log("hi")
for (const element of document.getElementsByClassName("obfuscate")) {
  if (element.tagName === "a") {
    element.href = atob(element.href);
  }
  element.innerText = atob(element.innerText);
}
