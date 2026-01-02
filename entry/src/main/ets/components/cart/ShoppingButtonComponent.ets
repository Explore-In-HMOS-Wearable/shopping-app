import { promptAction } from '@kit.ArkUI';

@Component
export default struct ShoppingButtonComponent {
  build() {
    Row() {
      Button() {
        Row() {
          Text('Continue shopping').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor('#fed813')
      .fontColor(Color.Black)
      .width('91%')
      .height(53)
      .type(ButtonType.Normal)
      .borderRadius(28)
      .onClick(() => {
        promptAction.openToast({
          message: 'Clicked Continue shopping'
        });
      })
    }
    .width('100%')
    .height(70)
    .margin({ top: '8%' })
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
  }
}