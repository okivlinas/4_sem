//task1
type Person = {
    id: number,
    name: string,
    group: number
}
const array: Person[] = [
    {id: 1, name: 'Vasya', group: 10},
    {id: 2, name: 'Ivan', group: 11},
    {id: 3, name: 'Masha', group: 12},
    {id: 4, name: 'Petya', group: 10},
    {id: 5, name: 'Kira', group: 11},
]
for(let i = 0; i < array.length; i++){
    console.log(array[i].group)
}
console.log(array);
//task2
type CarsType = {
    manufacturer?: string;
    model?: string;
}

let car: CarsType = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';

//task3
const car1: CarsType = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';

const car2: CarsType = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';

type ArrayCarsType = {
    cars: CarsType[];
}

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];

//task4
type MarkFilterType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10;
type DoneType = boolean;
type GroupFilterType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12;

type MarkType = {
    subject: string,
    mark: MarkFilterType,
    done: DoneType,
}
const mark01: MarkType = {
    subject: '_DataBase',
    mark: 10,
    done: true
}
const mark02: MarkType = {
    subject: '_MathProg',
    mark: 6,
    done: true
}
const mark03: MarkType = {
    subject: '_TRPI',
    mark: 9,
    done: true
}

type StudentType = {
    id: number,
    name: string,
    group: GroupFilterType,
    marks: Array<MarkType>,
}
const student01: StudentType  = {
    id: 1,
    name: 'Oleg',
    group: 4,
    marks: [mark01, mark02, mark03]
}
const student02: StudentType  = {
    id: 2,
    name: 'Masha',
    group: 4,
    marks: [mark02, mark03]
}
const student03: StudentType  = {
    id: 1,
    name: 'Dasha',
    group: 9,
    marks: [mark01]
}
type GroupType = {
    students: StudentType[]
    studentsFilter:(group: MarkFilterType) => Array<StudentType>
    marksFilter: (mark: GroupFilterType) => Array<StudentType>
    deleteStudent: (id: number) => void
    mark: MarkFilterType
    group:GroupFilterType
}

const myGroup: GroupType = {
    students: [student01, student02, student03],
    studentsFilter(group: GroupFilterType): Array<StudentType>
    {
        const filteredStudents: Array<StudentType> = [];
        for(let i=0;i<this.students.length;i++){
            if(this.group[i] == group) {
                filteredStudents.push(this.students[i]);
            }
        }
        return filteredStudents;
    },
    marksFilter(mark: MarkFilterType): Array<StudentType>
    {
        const filteredStudents: Array<StudentType> = [];
        for(let i=0;i<this.students.length;i++){
            for(let j=0;j<this.students.marks.length;j++){
                if(this.students.marks[i] == mark) {
                    filteredStudents.push(this.students[i]);
                }
            }
        }
        return filteredStudents;
    },
    deleteStudent(id:number):void{
        this.students = this.students.filter((student) => student.id !== id)
    },
    mark: 1,
    group: 1
}
console.log(myGroup.studentsFilter(5));
console.log(myGroup.marksFilter(10));
myGroup.deleteStudent(2);

for(let a of myGroup.students)
{
    console.log(a);
}