import { promptAction } from '@kit.ArkUI'

@Component
export default struct EmptyCartBodyAfterSignin {
  build() {
    Column() {
      Row() {

        Image($r('app.media.empty_cart')).width('35%')

        Column() {
          Text('Your Cart is empty').fontColor(Color.Black)
            .fontSize(18).fontWeight(FontWeight.Bold)
            .margin({ top: 10 })
          Text('Good stuff goes in here').fontColor(Color.Black)
            .fontSize(15).margin({ top: 5 }).fontColor('#55595b')
          Text('Pick up where you left off').fontColor('#3e678f')
            .fontSize(15).margin({ top: 10 })
        }.width('50%')
        .alignItems(HorizontalAlign.Start)
      }.width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      Column() {

        Text('Free fast delivery. No order minimum. Exclusive savings. Start your 30-day free trial of FastDelivery.')
          .fontColor(Color.Black).fontWeight(FontWeight.Bold)
          .width('73%').padding({ top: 5, left: 10 })

        Button() {
          Row() {
            Text('Join FastDelivery').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center)
        }
        .border({ width: 1, color: '#a4a4a6' })
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .width('65%')
        .height(50)
        .type(ButtonType.Normal)
        .borderRadius(28)
        .margin({ top: 15 })
        .onClick(() => {
          promptAction.openToast({
            message: 'Clicked Join FastDelivery'
          });
        })
      }
      .padding({ bottom: 10 })
      .justifyContent(FlexAlign.Center)
      .margin({ top: 15 })
      .backgroundColor(Color.White)
      .border({ width: 1, color: '#dedfdf' })
      .borderRadius(10)
      .width('88%')
      .height(190)

    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 8, bottom: 11 })
    .width('100%')

  }
}