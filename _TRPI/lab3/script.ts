function createrNumber(numArr: number[]) : string 
{
    if(numArr.length != 10)
    {
        return "Error";
    }
 var phoneNumber;
 phoneNumber = String('(' + numArr[0] + numArr[1] + numArr[2] + ") " + numArr[3] + numArr[4] + numArr[5] + '-' + numArr[6] + numArr[7] + numArr[8] + numArr[9]); 
 return phoneNumber;
}

let num_arr: number[] = [0,1,2,3,4,5,6,7,8,9];

console.log("Номер телефона: " + createrNumber(num_arr));

class Challenge
{
    static solution(number:number) : number
    {
        if(number < 0){
            return 0;
        }
        else {
            let sum: number = 0;
            for(let i = 1; i <= number; i++){
                if(i%3==0 || i%5==0){
                    sum+=i;
                }
            }
            return sum;
        }
    }
}

console.log("Сумма делящихся на 3 или 5: "+ Challenge.solution(10));


function swappingArr(arr:number[], k:number) : number[] | null 
{
    if(k==0)return arr;
    if(arr.length == 0)return null;
    let arr1:number[] = [];
    for(let i = 0; i < k; i++){
        arr1[i]=arr[arr.length-(k-i)];
    }
    for(let i = 0; i <arr.length - k; i++){
        arr1[k+i] = arr[i];
    }
    return arr1;
}

console.log("Переделанный массив: " + swappingArr([1,2,3,4,5,6,7], 3));


function getMedian(arr1:number[], arr2:number[]) : number | null
{
    if(arr1.length == 0 && arr2.length == 0)
    {
        return null;
    }

    let concatTwoArr: number[] = [];
    for(let i = 0; i < arr1.length; i++)
    {
        concatTwoArr[i] = arr1[i];
    }

    let j: number = 0;
    for(let i = arr1.length; i < arr1.length + arr2.length; i++, j++)
    {
        concatTwoArr[i] = arr2[j];
    }

    concatTwoArr.sort();
    if(concatTwoArr.length % 2 == 0)
    {
        return (concatTwoArr[(concatTwoArr.length / 2)-1] + concatTwoArr[concatTwoArr.length / 2])/2;
    }
    else
    {
        return concatTwoArr[Math.floor(concatTwoArr.length / 2)];
    }
}

console.log("Медиана: " + getMedian([1,2], [3,4]));