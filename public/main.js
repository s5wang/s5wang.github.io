// de-obfuscation
for (const element of document.getElementsByClassName("obfuscate")) {
  element.innerText = atob(element.innerText);
  if (element.tagName.toLowerCase() === "a") {
    element.href = atob(element.attributes.href.value);
  }
}
