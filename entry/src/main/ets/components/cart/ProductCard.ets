import { Product } from '../../data/ProductModel'
import { insertItemToCart } from '../../viewmodel/CartViewModel'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct ProductCard {
  @Prop product: Product
  @Consume cartQuantityAmount: number
  @Consume cartProductList: Product[]
  isBuyingOptionsEnable: boolean = false

  build() {
    Column() {
      Image(this.product.image).width(80)
      Text(this.product.title)
        .width('85%')
        .fontColor('#007183')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontSize(11)
        .margin({ top: 7 })

      Row() {
        Rating({ rating: this.product.rating, indicator: false })
          .stars(5)
          .stepSize(0.5)
          .height(15)

        Text(this.product.totalRate)
          .fontColor('#007183')
          .fontSize(11)
          .padding({ left: 5 })

      }.width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({ top: 7 })
      .alignItems(VerticalAlign.Center)

      Text(this.product.price)
        .fontColor('#a83111')
        .margin({ top: 3 })
        .fontSize(12)

      if (!this.isBuyingOptionsEnable) {
        Button() {
          Row() {
            Text('Add to cart')
              .fontSize(12)
              .fontColor(Color.Black)
          }
          .alignItems(VerticalAlign.Center)
        }
        .backgroundColor('#fed813')
        .fontColor(Color.Black)
        .width('70%')
        .height(32)
        .type(ButtonType.Normal)
        .borderRadius(28)
        .margin({ top: 7 })
        .onClick(() => {
          this.cartQuantityAmount = this.cartQuantityAmount + 1
          this.cartProductList = [...insertItemToCart(this.product, this.cartProductList)]
        })
      } else {

        Button() {
          Row() {
            Text('See all buying options')
              .textAlign(TextAlign.Center).fontSize(11)
              .fontColor(Color.Black)
          }.alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center)
          .width('80%')

        }
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .width('90%')
        .height(46)
        .border({ width: 0.5, color: Color.Black })
        .type(ButtonType.Normal)
        .borderRadius(28)
        .margin({ top: 7 })
        .onClick(() => {
          promptAction.openToast({
            message: 'Clicked See all buying options'
          });
        })
      }

    }
    .margin({ top: 5 })
    .width(130)
    .height(210)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Start)
  }
}