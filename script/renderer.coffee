# This file is required by the index.html file and will
# be executed in the renderer process for that window.
# All of the Node.js APIs are available in this process.
x = document.getElementsByTagName("BODY")[0]
x.style.backgroundColor = "yellow"

hello = () ->
  console.log "hello vscode!"
  x = document.getElementsByTagName("BODY")[0]
  x.style.backgroundColor = "white"
  x.style.backgroundColor = "green"

document.body.addEventListener('click', hello)