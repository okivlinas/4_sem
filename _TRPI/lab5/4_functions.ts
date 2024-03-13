function add(a:number, b:number):number {
    return a + b
}

function toUpperCase(str:string):string{
    return str.trim().toUpperCase()
}
interface MyPosition{
    x: number | undefined
    y: number | undefined
}

interface MyPositionWithDefault extends MyPosition {
    default: string
}

function position(): MyPosition
function position(a: number): MyPositionWithDefault
function position(a: number, b: number): MyPosition

function position(a?: number, b?: number){
    if(!a && !b) {
        return{x:undefined, y:undefined}
    }
    if (a && !b) {
        return {x:a, y:undefined, default: a.toString()}
    }
    return {x:a, y: b}
}

console.log('Empty', position())
console.log('One param', position(42))
console.log('Two params', position(10, 15))

const abc = {
    contact: {
        width:20,
        height:30
    },
    nums: [1, 2, 3]
}

type ABC = {
    contact: {
        width: number;
        height: number;
    };
    nums: number[];
};

interface ABC1 {
    contact: {
        width: number;
        height: number;
    };
    nums: number[];
}

const nums1: ABC[] = [{contact:{width: 20, height: 30}, nums:[1, 2, 3]}];

const nums2: ABC = {contact:{width: 20, height: 30}, nums:[1, 2, 3]};