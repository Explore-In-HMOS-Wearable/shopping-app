import { Product } from '../../data/ProductModel'

@Component
export struct TopProductListItemComponent {
  @Prop productItem: Product

  build() {
    Row() {
      Image(this.productItem.image)
        .width(98)
        .height(98)
        .objectFit(ImageFit.Cover)
        .backgroundColor($r('app.color.light_grey'))
        .margin(4)
        .borderRadius(5)

      Column() {
        Row() {
          Column() {
            Text(this.productItem.title)
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(2)
              .width('100%')
              .margin({ top: 8 })
              .fontColor(Color.Black)

            Column() {
              Text(`${this.productItem.price} TL`)
                .fontSize(14)
                .fontColor(Color.Black)
                .fontWeight(FontWeight.Medium)

              Text('List: ')
                .fontSize(10)
                .fontColor($r('app.color.grey'))
                .margin({ left: 8 })

              Text('000 TL')
                .fontSize(10)
                .fontColor($r('app.color.grey'))
                .decoration({
                  type: TextDecorationType.LineThrough
                })

            }
            .margin({ top: 8 })
            .width('100%')
          }
          .layoutWeight(0.8)
        }
        .width('100%')
      }
      .height('100%')
      .layoutWeight(1)
      .padding({ left: 4, right: 4 })
    }
    .padding(10)
    .width('100%')
    .height(120)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
  }
}