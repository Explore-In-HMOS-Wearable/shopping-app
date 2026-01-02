import { Product } from '../../data/ProductModel'
import { insertItemToCart } from '../../viewmodel/CartViewModel'

@Component
export default struct ProductListingItem {
  @Prop product: Product
  @Consume cartProductList: Product[]

  build() {
    Column() {

      // Info
      Stack() {
        Column() {
          Image(this.product.image)
            .objectFit(ImageFit.Contain)
            .width('100%')
            .height('100%')
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .height('40%')
        .width('100%')
        .backgroundColor('#f8f8f8')

        Image($r('app.media.btn'))
          .width(40)
          .margin({ left: 8, bottom: 8 })
      }
      .width('100%')
      .alignContent(Alignment.BottomStart)

      Text('Sponsored')
        .fontWeight(FontWeight.Bold)
        .fontColor('#8a8b8d')
        .fontSize(13)
        .margin({ left: 7, top: 7 })
      Text(this.product.title)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(3)
        .fontSize(15)
        .fontColor('#1e201f')
        .margin({ top: 10, left: 7 })
      //Rating
      Row() {
        Text(`${this.product.rating}`)
          .fontSize(13)
          .fontColor('#385b77')
        Rating({ rating: this.product.rating, indicator: false })
          .stars(5)
          .stepSize(0.5)
          .height(15)
        Text(`(${this.product.totalRate})`)
          .fontColor('#929493')
          .fontSize(13)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .margin({ top: 10, left: 7 })

      Text('1K+ bought in past month')
        .fontColor('#727677')
        .fontSize(13)
        .margin({ top: 2, left: 7 })

      Text(this.product.price)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, left: 7 })

      Text('Save 5% on 5 select item(s)')
        .fontColor('#9ea09f')
        .fontSize(13)
        .margin({ top: 5, left: 7 })

      Text('$12.34 delivery')
        .fontColor(Color.Black)
        .fontSize(13)
        .margin({ top: 7, left: 7 })

      Text('Ships to Turkey')
        .fontColor('#9ea09f')
        .fontSize(13)
        .margin({ top: 10, left: 7 })

      Button() {
        Row() {
          Text('Add to cart').fontSize(12).fontColor(Color.Black)
        }.alignItems(VerticalAlign.Center)
      }
      .alignSelf(ItemAlign.Center)
      .backgroundColor('#fed813')
      .fontColor(Color.Black)
      .width('95%')
      .height(35)
      .type(ButtonType.Normal)
      .borderRadius(28)
      .margin({ top: 15 })
      .onClick(() => {
        this.cartProductList = [...insertItemToCart(this.product, this.cartProductList)]
      })

    }
    .alignSelf(ItemAlign.Center)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White)
    .height(500)
    .width('90%')
    .margin({ top: 15 })
    .borderRadius(5)
    .border({ width: 2, color: '#F8F8F8' })
  }
}