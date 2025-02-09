import { sanitizeUrl } from "https://cdn.jsdelivr.net/npm/@braintree/sanitize-url@7.1.1/+esm";

// de-obfuscation
for (const element of document.getElementsByClassName("obfuscate")) {
  element.innerText = atob(element.innerText);
  if (element.tagName.toLowerCase() === "a") {
    element.href = sanitizeUrl(atob(element.attributes.href.value));
  }
}
