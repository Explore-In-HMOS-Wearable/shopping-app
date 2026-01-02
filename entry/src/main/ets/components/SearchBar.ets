@Component
export default struct SearchBar {
  @State searchText: string = ''
  @Prop isRedirected: boolean = true
  @Prop redirectedFrom: string = 'Kitchen'

  build() {
    Row() {
      Row() {
        Image($r('app.media.search')).width(20)
        TextInput({
          placeholder: this.isRedirected ? this.redirectedFrom : 'Search..',
          text: this.searchText
        })
          .backgroundColor(Color.White)
          .width('80%')
          .height(50)
      }
      .padding({ left: 15, right: 15 })
      .backgroundColor(Color.White)
      .height(50)
      .width('70%')
      .border({ width: 2 })
      .borderRadius(10)
      .borderColor('#6d7f7e')
      .alignItems(VerticalAlign.Center)
    }
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.Center)
    .padding({ bottom: 10 })
    .width('100%')
    .height(100)
    .linearGradient({
      direction: GradientDirection.Left,
      repeating: true,
      colors: [
        ['#ff9b39', 0.0],
        ['#ff6201', 1.0]
      ]
    })
  }
}


