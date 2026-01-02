@Component
export default struct InformationItemComponent {
  img?: Resource
  info?: string

  build() {
    Row() {
      Image(this.img).width(80)
      Text(this.info).width('55%').fontColor('#353e3d').padding({ left: 20 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height(110)
    .backgroundColor(Color.White)
  }
}