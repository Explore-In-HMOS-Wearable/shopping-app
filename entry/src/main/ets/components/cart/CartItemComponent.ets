import { Product } from '../../data/ProductModel'
import { insertItemToCart, removeItemFromCart } from '../../viewmodel/CartViewModel'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct CartItemComponent {
  @Prop product: Product
  @Consume cartProductList: Product[]
  @Consume cartQuantityAmount: number

  build() {

    Column() {
      Column() {
        Image(this.product.image)
          .width(100)
          .margin({ left: 22 })
        Column() {
          Text(this.product.title)
            .width('63%')
            .fontSize(14)
            .fontColor(Color.Black)
            .margin({ top: 8 })
          Text('7K+ bought in past month')
            .width('50%')
            .fontSize(13)
            .fontColor(Color.Black)
            .margin({ top: 8 })
          Text(this.product.price)
            .fontWeight(FontWeight.Bold)
            .fontSize(14)
            .fontColor(Color.Black)
            .margin({ top: 8 })
          Text('FREE International Returns')
            .fontColor('#30727e')
            .fontSize(14)
            .margin({ top: 8 })
          Text('In Stock')
            .fontColor('#1e651f')
            .fontSize(14)
            .margin({ top: 8 })
        }
        .margin({ left: 22 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Column() {
          Row() {
            Image($r('app.media.delete'))
              .width(16)
              .margin({ left: 10 })
              .onClick(() => {
                this.cartProductList = [...removeItemFromCart(this.product, this.cartProductList)]
                this.cartQuantityAmount = this.cartQuantityAmount - 1
              })

            Text(`${this.product.quantity}`)
              .fontColor(Color.Black)
              .fontWeight(FontWeight.Bold)

            Image($r('app.media.increase'))
              .width(15)
              .margin({ right: 10 })
              .onClick(() => {
                this.product.quantity = (this.product.quantity || 0) + 1;
                this.cartQuantityAmount = this.cartQuantityAmount + 1
                this.cartProductList = [...insertItemToCart(this.product, this.cartProductList)]
              })
          }
          .alignItems(VerticalAlign.Center)
          .justifyContent(FlexAlign.SpaceBetween)
          .width(120)
          .height(34)
          .backgroundColor(Color.White)
          .border({ width: 2, color: '#f9d51f' })
          .borderWidth(3)
          .borderRadius(20)

        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 15, bottom: 15 })

        Row() {
          Button() {
            Row() {
              Text('Delete')
                .textAlign(TextAlign.Center)
                .fontSize(11)
                .fontColor(Color.Black)
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .width('100%')
          }
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .width('37%')
          .height(35)
          .border({ width: 1, color: '#858988' })
          .type(ButtonType.Normal)
          .borderRadius(28)
          .margin({ left: 7 })
          .onClick(() => {
            this.cartProductList = [...removeItemFromCart(this.product, this.cartProductList)]
            this.cartQuantityAmount = this.cartQuantityAmount - 1
          })

          Button() {
            Row() {
              Text('Save for later')
                .textAlign(TextAlign.Center).fontSize(11)
                .fontColor(Color.Black)
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .width('100%')
          }
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .width('55%')
          .height(35)
          .border({ width: 1, color: '#858988' })
          .type(ButtonType.Normal)
          .borderRadius(28)
          .margin({ left: 7 })
          .onClick(() => {
            promptAction
              .openToast({
                message: 'Clicked Save for later'
              })
              .catch(() => {
                // TODO: Implement error handling.
              });
          })

        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .justifyContent(FlexAlign.Start)
        .margin({ right: 25 })
      }
      .width('100%')
      .margin({ top: 10 })
      .justifyContent(FlexAlign.SpaceBetween)

      Button() {
        Row() {
          Text('Compare with similar items')
            .textAlign(TextAlign.Center).fontSize(11)
            .fontColor(Color.Black)
        }
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .width('100%')

      }
      .backgroundColor(Color.White)
      .fontColor(Color.Black)
      .width('47%')
      .height(35)
      .border({ width: 1, color: '#858988' })
      .type(ButtonType.Normal)
      .borderRadius(28)
      .margin({ top: 10, left: 12 })
      .onClick(() => {
        try {
          promptAction.openToast({
            message: 'Clicked Compare with similar items'
          });
        } catch (error) {
          // TODO: Implement error handling.
        }
      })
    }
    .width('93%')
    .margin({ top: 20 })
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#f6fafb')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)

  }
}