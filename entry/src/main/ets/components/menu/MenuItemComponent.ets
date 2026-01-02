@Component
export struct MenuItemComponent {
  @Prop title: string

  build() {
    Row() {
      Text(this.title).margin({ left: 10 })
    }
    .width('92%')
    .height(50)
    .margin(15)
    .borderColor(Color.Gray)
    .borderWidth(1)
    .borderRadius(5)
    .shadow(2)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}