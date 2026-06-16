const input = document.getElementById('year');

  input.addEventListener('input', function () {
    const value = input.value;
    if(value > 2070 || value < 1990)
    document.getElementById("yearError").style.display = 'flex';
else{
    document.getElementById("yearError").style.display = 'none';
}
    // You can call your function here
  });