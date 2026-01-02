import ProductCategoryObject from '../../data/ProductCategoryModel';
import { initCategoryData } from '../../viewmodel/ProductViewModel';
import ProductCategory from './ProductCategory';

@Component
export default struct ProductCategoryComponent {
  @State productCategoryObject: Array<ProductCategoryObject> = initCategoryData();

  build() {
    Column() {
      List({ space: 3 }) {
        ForEach(
          this.productCategoryObject,
          (productCategoryObject: ProductCategoryObject) => {
            ProductCategory({ category: productCategoryObject })
          },
          (productCategoryObject: ProductCategoryObject) => productCategoryObject.title)
      }
      .scrollBar(BarState.Off)
      .alignListItem(ListItemAlign.Center)
      .height('32%')
      .width('100%')
      .backgroundColor(Color.White)
      .listDirection(Axis.Horizontal)
      .margin({ bottom: 10 })

      Line()
        .width('100%')
        .height(2)
        .backgroundColor('#f2f4f3')
    }
    .backgroundColor(Color.White)
    .width('100%')

  }
}