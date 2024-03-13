/////////
//1_types
const str: string = 'Hello';
const isFetching: boolean = true;
const isLoading: boolean = false;
const int: number = 42;
const float: number = 4.2;
const num: number = 3e10;
const message: string = "Hello, TypeScript";
const numberArray: number[] = [1, 1, 2, 3, 5, 8, 13];
const numberArray2: Array<number> = [1, 1, 2, 3, 5, 8, 13];

//Typle
const contact : [string, number] = ['Oleg', 12345678];

//Any
let variable: any = 42;
//...
variable = 'NewString'
variable = []

//====
function sayMyName(name: string): void {
    console.log(name)
}
sayMyName('Oleg')

//Never
function trowError(message: string): never{
    throw new Error(message)
}

function infinite():never{
    while(true){

    }
}

//Type
type Login = string
const login: Login = 'admin'
//const login2: Login = 2

type ID = string | number
const id1: ID = 1234
const id2: ID = '1234'
//const id2: ID = true

type SomeType = string | null | undefined