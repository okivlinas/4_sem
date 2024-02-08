var form = document.querySelector('form');
var famInput = document.getElementById('Fam');
var namInput = document.getElementById('Nam');
var emInput = document.getElementById('Mail');
var telInput = document.getElementById('Tel');

form.addEventListener('submit', function(event) {
  var famValue = famInput.value.trim();
  // Проверка на длину имени
  if (famValue.length > 20) {
    alert("Фамилия не должна содержать более 20 символов.");
    event.preventDefault();
    return;
  }
  // Проверка на допустимые символы
  var famRegex = /^[a-zA-Zа-яА-Я]+$/;
  if (!famRegex.test(famValue)) {
    alert("Фамилия должно содержать только символы русского и английского алфавита.");
    event.preventDefault();
    return;
  }
  var namValue = namInput.value.trim();
  // Проверка на длину имени
  if (namValue.length > 20) {
    alert("Имя не должно содержать более 20 символов.");
    event.preventDefault();
    return;
  }
  // Проверка на допустимые символы
  var namRegex = /^[a-zA-Zа-яА-Я]+$/;
  if (!namRegex.test(namValue)) {
    alert("Имя должно содержать только символы русского и английского алфавита.");
    event.preventDefault();
    return;
  }
});