@Component
export default struct CustomToolBar {
  build() {
    Row() {
      Blank()
      Row() {
        Image($r('app.media.settings')).width(20).height(20).margin({ left: 12 })
        Image($r('app.media.notification')).width(18).height(18).margin({ left: 12 })
        Image($r('app.media.search')).width(18).height(18).margin({ left: 12 })
      }
      .width('30%')
      .height('50%')
      .margin({ right: 20 })
      .justifyContent(FlexAlign.End)
      .alignItems(VerticalAlign.Center)
    }
    .linearGradient({
      direction: GradientDirection.Left,
      repeating: true,
      colors: [
        ['#ff9b39', 0.0],
        ['#ff6201', 1.0]
      ]
    })
    .padding({ bottom: 5 })
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
    .height('10%')

  }
}


