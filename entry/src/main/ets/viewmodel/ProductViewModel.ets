import { Constants } from '../common/Constants';
import { Movie } from '../data/MovieModel';
import { Product } from '../data/ProductModel';
import ProductCategoryObject from '../data/ProductCategoryModel';

export function initProductData(): Product[] {
  let productDataArray: Product[] = [];
  Constants.PRODUCT_DATA.forEach((item: Product) => {
    productDataArray.push(new Product(
      item.id, item.image, item.title, item.price, item.totalRate, item.rating,));
  })
  return productDataArray;
}

export function initProductListData(): Product[] {
  let productListDataArray: Product[] = [];
  Constants.PRODUCT_LIST_DATA.forEach((item: Product) => {
    productListDataArray.push(new Product(
      item.id, item.image, item.title, item.price, item.totalRate, item.rating));
  })
  return productListDataArray;
}

export function initMovieData(): Movie[] {
  let movieDataArray: Movie[] = [];
  Constants.MOVIE_DATA.forEach((item: Movie) => {
    movieDataArray.push(new Movie(
      item.id, item.image, item.filmMaker, item.videoQuality, item.title, item.price))
  })
  return movieDataArray;
}

export function initCategoryData(): ProductCategoryObject[] {
  let categoryDataArray: ProductCategoryObject[] = [];
  Constants.CATEGORY_LIST_DATA.forEach((item: ProductCategoryObject) => {
    categoryDataArray.push(new ProductCategoryObject(
      item.img, item.title))

  })
  return categoryDataArray;
}



