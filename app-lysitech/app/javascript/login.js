const msg = document.getElementById('notice')

msg.addEventListener('mouseover', () => {
  msg.style.visibility = "hidden"
  msg.innerText= ""

});