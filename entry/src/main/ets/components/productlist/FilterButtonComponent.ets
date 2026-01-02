import { promptAction } from '@kit.ArkUI';

@Component
export default struct FilterButtonComponent {
  @Prop title: string = '';

  build() {
    Row() {
      Button() {
        Row() {
          Text(this.title).fontSize(12)
            .fontColor(this.title === 'Filters' ? '#0f6e7f' : Color.Black)
            .fontWeight(this.title === 'Filters' ? FontWeight.Bold : FontWeight.Normal)
        }
        .padding({ left: 10, right: 10 })
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .fontColor(Color.Black)
      .alignSelf(ItemAlign.Center)
      .height('75%')
      .margin({
        left: 7,
        right: 7,
        top: 4,
        bottom: 4
      })
      .type(ButtonType.Normal)
      .border({ width: 1, color: '#e3e1e3' })
      .borderRadius(5)
      .backgroundColor(Color.White)
      .onClick(() => {
        promptAction.openToast({
          message: `Clicked  ${this.title}`
        });
      })

      if (this.title === 'Filters') {
        Line({ width: 1 }).height('90%').backgroundColor('#f2f4f3').margin({ left: 4 })
      }

    }
  }
}