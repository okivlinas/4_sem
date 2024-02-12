function ValidForm(){
  const fam = document.getElementById('fam').value;
  const name = document.getElementById('name1').value;
  const email = document.getElementById('email').value;
  const tel = document.getElementById('tel').value;
  const com = document.getElementById('com').value;
  let select = document.getElementById('select');

  let nameRegex = /^[a-zA-Zа-яА-Я]{1,20}$/;
  let emailRegex =/^\w+([\.\w]+)*\w@\w((\.\w)*\w+)*\.\w{2,3}$/;
  let telRegex = /\(0\d{2}\)\d{3}-\d{2}-\d{2}/;
  let comRegex = /[a-zA-Zа-яА-Я0-9]{1,250}/;
  let famError = document.getElementById("famError");
  let nameError = document.getElementById("nameError");
  let emailError = document.getElementById('emailError');
  let telError = document.getElementById('telError');
  let comError = document.getElementById('comError');
  let selectError = document.getElementById('selectError');

  let errors =0;
  if(fam.length==0){
    errors++;
    famError.textContent = 'Поле не должно быть пустым!';
  }
  else if (!nameRegex.test(fam)) {
    errors++;
    famError.textContent = 'Поле Фамилия должно содержать только буквы и быть длиной от 1 до 20 символов.';
  }
  if(name.length==0){
    errors++;
    nameError.textContent = 'Поле не должно быть пустым!';
  }
  else if(!nameRegex.test(name)){
    errors++;
    nameError.textContent = 'Поле Имя должно содержать только буквы и быть длиной от 1 до 20 символов.';
  }
  if(email.length==0){
    errors++;
    emailError.textContent = 'Поле не должно быть пустым!';
  }
  else if(!emailRegex.test(email)){
    errors++;
    emailError.textContent='Недопустимый формат! Поле должно быть в формате example@example.com!';
  }
  if(tel.length==0)
  {
    errors++;
    telError.textContent = 'Поле не должно быть пустым!';
  }
  else if(!telRegex.test(tel)){
    errors++;
    telError.textContent='Недопустимый формат! Поле должно быть в формате(0xx)xxx-xx-xx!';
  }
  if(com.length==0){
    errors++;
    comError.textContent = 'Поле не должно быть пустым!';
  }
  else if(!comRegex.test(com)){
    errors++;
    comError.textContent='Поле не должно содержать более 250 символов!';
  }
  if(select.value === "Выберите вариант"){
    errors++;
    selectError.textContent='Вы не выбрали город!';
}

let city = document.getElementById("select").value;
let course3 = document.querySelector('input[name="course"][value="3"]').checked;
let bstu = document.getElementById("bstu").checked;

if (city !== "Минск" || !bstu) {
let confirmMessage = "Вы уверены в своих ответах?\n\nГород: " + city +  "\nУчусь в БГТУ: " + (bstu ? "Да" : "Нет") + "\nКурс: "+(course3 ? "3" : "другой курс") ;
let confirmed = confirm(confirmMessage);

  if (!confirmed) {
      return false;
  }
}

if(errors > 0){
  return false;
}

return true;
}