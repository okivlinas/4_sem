//#1_types
var str = 'Hello';
var isFetching = true;
var isLoading = false;
var int = 42;
var float = 4.2;
var num = 3e10;
var message = "Hello, TypeScript";
var numberArray = [1, 1, 2, 3, 5, 8, 13];
var numberArray2 = [1, 1, 2, 3, 5, 8, 13];
//Typle
var contact = ['Oleg', 12345678];
//Any
var variable = 42;
//...
variable = 'NewString';
variable = [];
//====
function sayMyName(name) {
    console.log(name);
}
sayMyName('Oleg');
//Never
function trowError(message) {
    throw new Error(message);
}
function infinite() {
    while (true) {
    }
}
var login = 'admin';
var id1 = 1234;
var id2 = '1234';
//const id2: ID = true
