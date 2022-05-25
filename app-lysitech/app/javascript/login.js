const msg = document.getElementById('notice')

msg.addEventListener('mouseover', (el) => {
  msg.style.visibility = "hidden"
  msg.innerText= ""

});