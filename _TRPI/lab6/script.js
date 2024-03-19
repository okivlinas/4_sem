var array = [
    { id: 1, name: 'Vasya', group: 10 },
    { id: 2, name: 'Ivan', group: 11 },
    { id: 3, name: 'Masha', group: 12 },
    { id: 4, name: 'Petya', group: 10 },
    { id: 5, name: 'Kira', group: 11 },
];
var uniqueGroups = [];
array.forEach(function (person) {
    uniqueGroups.push(person.group);
});
uniqueGroups.forEach(function (group) {
    console.log(group);
});
//array.sort((a, b) => a.group - b.group);
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
var myGroup = {
    students: [student01, student02, student03],
    studentsFilter: function (group) {
        var filteredStudents = [];
        for (var _i = 0, _a = this.students; _i < _a.length; _i++) {
            var student = _a[_i];
            if (student.group == group) {
                filteredStudents.push(student);
            }
        }
        return filteredStudents;
    },
    marksFilter: function (mark) {
        var filteredStudents = [];
        for (var _i = 0, _a = this.students; _i < _a.length; _i++) {
            var student = _a[_i];
            for (var _b = 0, _c = student.marks; _b < _c.length; _b++) {
                var mark_ = _c[_b];
                if (mark_.mark == mark) {
                    filteredStudents.push(student);
                }
            }
        }
        return filteredStudents;
    },
    deleteStudent: function (id) {
        this.students = this.students.filter(function (student) { return student.id !== id; });
    },
    mark: 1,
    group: 1
};
console.log(myGroup.studentsFilter(5));
console.log(myGroup.marksFilter(10));
myGroup.deleteStudent(2);
for (var _i = 0, _a = myGroup.students; _i < _a.length; _i++) {
    var a = _a[_i];
    console.log(a);
}
