import { Movie } from '../../data/MovieModel'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct PreOrderProductCard {
  @Prop movie: Movie

  build() {
    Column() {
      Image(this.movie.image).width(80)

      Text(this.movie.title)
        .width('85%')
        .fontColor('#007183')
        .fontSize(11)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .margin({ top: 7 })

      Text(this.movie.filmMaker)
        .width('85%')
        .fontColor(Color.Black)
        .fontSize(10)
        .margin({ top: 2 })

      Text(this.movie.videoQuality)
        .width('85%')
        .fontColor('#56595a')
        .fontSize(10)
        .margin({ top: 2 })


      Text(this.movie.price).fontColor('#a83111')
        .margin({ top: 3 })

        .fontSize(12)

      Text('This title will be released on January 15, 2025.')
        .width('85%')
        .fontColor('#007183')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontSize(9)
        .margin({ top: 2 })

      Button() {
        Row() {
          Text('Pre-order').fontSize(12).fontColor(Color.Black)
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor('#fed813')
      .fontColor(Color.Black)
      .width('70%')
      .height(32)
      .type(ButtonType.Normal)
      .borderRadius(28)
      .margin({ top: 7 })
      .onClick(() => {
        promptAction
          .openToast({
            message: 'Clicked Pre-order'
          })
          .catch(() => {
            // TODO: Implement error handling.
          });
      })

    }
    .margin({ top: 5 })
    .width(130)
    .height(210)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Start)
  }
}