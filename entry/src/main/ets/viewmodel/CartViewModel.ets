import { Product } from '../data/ProductModel';

export function insertItemToCart(product: Product, productList: Product[]): Product[] {
  let tempProductList: Product[] = [...productList]
  let existingProduct = tempProductList.find(item => item.id === product.id);

  if (existingProduct) {
    existingProduct.quantity = (existingProduct.quantity || 0) + 1;
  } else {
    let updatedProduct: Product = product
    updatedProduct.quantity = (updatedProduct.quantity || 0) + 1;
    productList = [...productList, updatedProduct];
  }
  return productList;
}

export function removeItemFromCart(product: Product, productList: Product[]): Product[] {
  let tempProductList: Product[] = [...productList]
  let existingProduct = tempProductList.find(item => item.id === product.id);
  if (existingProduct) {
    if (existingProduct.quantity > 1) {
      existingProduct.quantity = (existingProduct.quantity || 0) - 1;
    } else {
      existingProduct.quantity = 0;
      let index = tempProductList.findIndex(item => item.id === product.id);
      tempProductList.splice(index, 1)
    }
  }
  return tempProductList
}


export function totalQuantity(productList: Array<Product>): number {
  let total: number = 0;
  productList.forEach((product: Product) => {
    total += product.quantity || 0;
  });
  return total;
}