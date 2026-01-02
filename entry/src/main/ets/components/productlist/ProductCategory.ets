import ProductCategoryObject from '../../data/ProductCategoryModel';
import { promptAction } from '@kit.ArkUI';

@Component
export default struct ProductCategory {
  @Prop category?: ProductCategoryObject;

  build() {

    Column() {
      Column() {
        Column() {
          Image(this.category?.img).height(30)
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height(45)
        .backgroundColor('#F8F8F8')
        .border({ width: 1, color: '#F8F8F8' })
        .borderRadius({ topLeft: 5, topRight: 5 })

        Text(this.category?.title)
          .fontColor(Color.Black)
          .fontSize(10)
          .margin({ top: 7 })
      }
      .height(100)
      .width(60)

    }
    .height('75%')
    .margin({
      left: 7,
      right: 7,
      top: 4,
      bottom: 4
    })
    .onClick(() => {
      promptAction.openToast({
        message: `Clicked ${this.category?.title}`
      });
    })
    .borderRadius(5)
    .backgroundColor(Color.White)

  }
}