var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
// Хранилище всего имеющегося товара
var products = {
    shoes: {
        boots: [
            { id: 1, size: 41, color: "Red", price: 120, discount: 10 },
            { id: 2, size: 42, color: "Blue", price: 110, discount: 15 },
            { id: 3, size: 43, color: "Black", price: 130, discount: 11 },
        ],
        sneakers: [
            { id: 4, size: 41, color: "Black", price: 140, discount: 12 },
            { id: 5, size: 42, color: "Red", price: 115, discount: 13 },
            { id: 6, size: 43, color: "Blue", price: 145, discount: 15 },
        ],
        sandals: [
            { id: 7, size: 41, color: "Blue", price: 125, discount: 20 },
            { id: 8, size: 42, color: "Black", price: 105, discount: 16 },
            { id: 9, size: 43, color: "Red", price: 135, discount: 17 },
        ],
    },
};
// Итератор для объекта products
var ProductsIterator = /** @class */ (function () {
    function ProductsIterator() {
        this.currentCategory = "boots";
        this.currentIndex = 0;
    }
    ProductsIterator.prototype.next = function () {
        var currentShoes = products.shoes[this.currentCategory];
        var currentItem = currentShoes[this.currentIndex++];
        if (!currentItem) {
            var categories = Object.keys(products.shoes);
            var currentCategoryIndex = categories.indexOf(this.currentCategory);
            if (currentCategoryIndex < categories.length - 1) {
                this.currentCategory = categories[currentCategoryIndex + 1];
                this.currentIndex = 0;
                return this.next();
            }
            else {
                return undefined;
            }
        }
        return currentItem;
    };
    return ProductsIterator;
}());
// Пример использования итератора
var iterator = new ProductsIterator();
var currentItem = iterator.next();
while (currentItem) {
    console.log(currentItem);
    currentItem = iterator.next();
}
// Функция для фильтрации обуви
function customFilter(shoes, more, less, size, color) {
    return Object.values(shoes).flatMap(function (category) {
        return category.filter(function (item) {
            return (item.size === size || size === undefined) &&
                (item.color === color || color === undefined) &&
                (item.price >= more || more === undefined) &&
                (item.price <= less || less === undefined);
        });
    });
}
// Пример фильтрации обуви
var filteredShoes = customFilter(products.shoes, 125, 140, 41);
console.log(filteredShoes);
// 4. Оптимизация создания нового товара
var OptimizedShoe = /** @class */ (function (_super) {
    __extends(OptimizedShoe, _super);
    function OptimizedShoe(id, size, color, price, discount) {
        return _super.call(this, id, size, color, price, discount) || this;
    }
    return OptimizedShoe;
}(Shoe));
var optimizedProducts = {
    shoes: {
        boots: [
            new OptimizedShoe(1, 41, "Red", 120, 10),
            new OptimizedShoe(2, 42, "Blue", 110, 15),
            new OptimizedShoe(3, 43, "Black", 130, 11),
        ],
        sneakers: [
            new OptimizedShoe(4, 41, "Black", 140, 12),
            new OptimizedShoe(5, 42, "Red", 115, 13),
            new OptimizedShoe(6, 43, "Blue", 145, 15),
        ],
        sandals: [
            new OptimizedShoe(7, 41, "Blue", 125, 20),
            new OptimizedShoe(8, 42, "Black", 105, 16),
            new OptimizedShoe(9, 43, "Red", 135, 17),
        ],
    },
};
// 5. Добавление свойств "скидка" и "конечная стоимость"
var newShoe = {
    id: 10,
    size: 44,
    color: "Green",
    price: 150,
    discount: 10,
    get getPrice() {
        return this.price * (1 - (this.discount || 0) / 100);
    },
};
console.log(newShoe.getPrice); // Output: 135
