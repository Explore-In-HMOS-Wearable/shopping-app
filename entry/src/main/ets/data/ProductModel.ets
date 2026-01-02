export class Product {
  id: number;
  image: Resource;
  title: string | Resource;
  price: string;
  totalRate: string;
  rating: number;
  quantity: number;

  constructor(id: number, image: Resource, title: string | Resource, price: string, totalRate: string, rating: number
    , quantity: number = 0) {
    this.id = id;
    this.totalRate = totalRate;
    this.rating = rating;
    this.image = image;
    this.title = title;
    this.price = price;
    this.quantity = quantity;
  }
}

