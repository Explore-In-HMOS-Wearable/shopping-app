import { routePageNoParams } from '../../../common/RouterUtils'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct EmptyCartBody {
  build() {
    Column() {
      Image($r('app.media.empty_cart')).width('60%')
      Text('Your Cart is empty').fontColor(Color.Black)
        .fontSize(18).fontWeight(FontWeight.Bold)
        .margin({ top: 10 })
      Text('Zip. Zilch. Nada.').fontColor(Color.Black)
        .fontSize(18).margin({ top: 5 }).fontColor('#55595b')
      Text('Shop today\'s deals').fontColor('#1b798a')
        .fontSize(18).margin({ top: 10 })

      Button() {
        Row() {
          Text('Sign in to your account').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor('#fed813')
      .fontColor(Color.Black)
      .width('91%')
      .height(53)
      .type(ButtonType.Normal)
      .borderRadius(28)
      .margin({ top: 30, bottom: 13 })
      .onClick(() => {
        routePageNoParams('SignInScreen')
      })

      Button() {
        Row() {
          Text('Sign up now').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor(Color.White)
      .border({ width: 1, color: Color.Black })
      .fontColor(Color.Black)
      .width('91%')
      .height(53)
      .type(ButtonType.Normal)
      .borderRadius(28)
      .onClick(() => {
        promptAction.openToast({
          message: 'Clicked Sign Up Now'
        });
      })

    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 8, bottom: 11 })
    .width('100%')

  }
}