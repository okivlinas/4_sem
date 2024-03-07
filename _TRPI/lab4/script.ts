// Тип для представления одной пары обуви
type Shoe = {
    id: number;
    size: number;
    color: string;
    price: number;
    discount?: number; // Новое свойство "скидка"
};

// Тип для представления категории обуви
type ShoesCategory = {
    boots: Shoe[];
    sneakers: Shoe[];
    sandals: Shoe[];
};

// Тип для представления всего товара в магазине
type Products = {
    shoes: ShoesCategory;
};

// 1. Хранилище товаров
const products: Products = {
    shoes: {
        boots: [
            { id: 1, size: 41, color: "Red", price: 120 },
            { id: 2, size: 42, color: "Blue", price: 110 },
            { id: 3, size: 43, color: "Black", price: 130 }
        ],
        sneakers: [
            { id: 4, size: 41, color: "Black", price: 140 },
            { id: 5, size: 42, color: "Red", price: 115 },
            { id: 6, size: 43, color: "Blue", price: 145 }
        ],
        sandals: [
            { id: 7, size: 41, color: "Blue", price: 125 },
            { id: 8, size: 42, color: "Black", price: 105 },
            { id: 9, size: 43, color: "Red", price: 135 }
        ]
    }
};

// 2. Итератор для объекта products
function* productIterator(products: Products) {
    for (const category in products.shoes) {
        for (const shoe of products.shoes[category]) {
            yield shoe;
        }
    }
}

// 3. Функция фильтрации обуви
function customFilter(
    shoes: ShoesCategory,
    more?: number,
    less?: number,
    size?: number,
    color?: string
): Shoe[] {
    let result: Shoe[] = [];

    for (const category in shoes) {
        for (const item of shoes[category]) {
            if (
                (item.size === size || size === undefined) &&
                (item.color === color || color === undefined) &&
                (item.price >= more || more === undefined) &&
                (item.price <= less || less === undefined)
            ) {
                result = [...result, item];
            }
        }
    }

    return result;
}

// Пример использования фильтра
const filteredShoes = customFilter(products.shoes, 125, 140, 41);
console.log(filteredShoes);

// 4. Оптимизация создания нового товара
class OptimizedShoe implements Shoe {
    constructor(
        public id: number,
        public size: number,
        public color: string,
        public price: number,
        public discount: number
    ) {}
}

// Пример использования нового класса
const someShoe = new OptimizedShoe(1, 41, "Red", 120, 10);
console.log(someShoe);
