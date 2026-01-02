@Component
export default struct DeliverToComponent {
  @State isVisible: boolean = false;
  @State rotationAngle: number = 0;

  build() {
    Column() {
      Row() {
        Image($r('app.media.location'))
          .width(20)
          .margin({ left: 10 })
        Text('Deliver to Turkey')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .padding({ left: 8 })
        Image($r('app.media.arrow_down'))
          .width(12)
          .margin({ left: 5, top: 3 })
          .rotate({ angle: this.rotationAngle })
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffa64c')
      .width('100%')
      .height(52)
      .onClick(() => {
        this.isVisible = !this.isVisible
        this.animateRotation();
      })

      Line()
        .height(1)
        .width('100%')
        .backgroundColor(Color.Black)

      if (this.isVisible) {
        Column() {
          Text('We\'re showing you items that ship to Turkey. To see items that ship to a different country, change your delivery address.')
            .width('90%')
            .fontSize(13)
          Row() {
            Button() {
              Row() {
                Text('Dismiss')
                  .fontSize(15)
                  .fontColor('#3a4241')
                  .margin({ left: 5, right: 2 })
              }.alignItems(VerticalAlign.Center)
            }
            .backgroundColor(Color.White)
            .width('35%')
            .height(40)
            .type(ButtonType.Normal)
            .borderRadius(5)
            .border({ width: 2, color: '#bdbfc2' })
            .borderRadius(7)
            .onClick(() => {
              this.isVisible = false;
            })

            Button() {
              Row() {
                Text('Change Address')
                  .fontSize(15)
                  .fontColor('#3a4241')
                  .margin({ left: 5, right: 12 })
              }.alignItems(VerticalAlign.Center)
            }
            .linearGradient({
              direction: GradientDirection.Bottom,
              repeating: true,
              colors: [
                ['#f7dea0', 0.0],
                ['#f0c34e', 1.0]
              ]
            })
            .width('35%')
            .height(40)
            .type(ButtonType.Normal)
            .borderRadius(5)
            .border({ width: 1, color: '#a58330' })
            .borderRadius(7)

          }
          .padding({ top: 13 })
          .width('100%')
          .justifyContent(FlexAlign.SpaceAround)
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height(135)
        .backgroundColor('#ffa64c')
      }
    }
    .width('100%')
  }

  private animateRotation(): void {
    const targetAngle = this.isVisible ? 180 : 0;
    const step = 10;
    const interval = setInterval(() => {
      if (this.isVisible && this.rotationAngle < targetAngle) {
        this.rotationAngle += step;
        if (this.rotationAngle >= targetAngle) {
          clearInterval(interval);
        }
      } else if (!this.isVisible && this.rotationAngle > targetAngle) {
        this.rotationAngle -= step;
        if (this.rotationAngle <= targetAngle) {
          clearInterval(interval);
        }
      }
    }, 8);
  }
}
