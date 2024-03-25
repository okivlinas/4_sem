var array = [
    { id: 1, name: 'Vasya', group: 10 },
    { id: 2, name: 'Ivan', group: 11 },
    { id: 3, name: 'Masha', group: 12 },
    { id: 4, name: 'Petya', group: 10 },
    { id: 5, name: 'Kira', group: 11 },
];
for (var i = 0; i < array.length; i++) {
    console.log(array[i].group);
}
console.log(array);
var car = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';
//task3
var car1 = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';
var car2 = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';
var arrayCars = [{
        cars: [car1, car2]
    }];
var mark01 = {
    subject: '_DataBase',
    mark: 10,
    done: true
};
var mark02 = {
    subject: '_MathProg',
    mark: 6,
    done: true
};
var mark03 = {
    subject: '_TRPI',
    mark: 9,
    done: true
};
var student01 = {
    id: 1,
    name: 'Oleg',
    group: 4,
    marks: [mark01, mark02, mark03]
};
var student02 = {
    id: 2,
    name: 'Masha',
    group: 4,
    marks: [mark02, mark03]
};
var student03 = {
    id: 1,
    name: 'Dasha',
    group: 9,
    marks: [mark01]
};
