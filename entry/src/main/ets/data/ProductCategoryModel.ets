export default class ProductCategoryObject {
  img: Resource;
  title: string;

  constructor(img: Resource, title: string) {
    this.img = img;
    this.title = title;
  }
}