import CustomToolBar from '../../../components/profile/CustomToolBar'
import { promptAction } from '@kit.ArkUI';

@Component
export default struct ProfileWithSignIn {
  private listScroller: Scroller = new Scroller();
  @Prop userName: string = ''

  build() {
    Scroll() {
      Column() {
        CustomToolBar()

        Row() {
          Image($r('app.media.user_profile')).width(35).height(35).margin({ left: 20 })
          Text(`Hello, ${this.userName}`).fontSize(20).padding({ left: 10 })
          Image($r('app.media.arrow_down')).width(15).height(15).margin({ left: 10 })
          Blank()
          Image($r('app.media.usa')).width(30)
          Text('EN').fontSize(20).padding({ left: 10 })
        }
        .padding({ right: 20 })
        .justifyContent(FlexAlign.End)
        .width('100%')
        .height(70)

        Row() {
          Button('Your Orders')
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .width('45%')
            .fontSize(18)
            .height(53)
            .type(ButtonType.Normal)
            .borderRadius(50)
            .borderWidth(1)
            .borderColor(Color.Gray)
            .onClick(() => {
              promptAction.openToast({
                message: 'Clicked Your Orders'
              });
            })
          Button('Buy Again')
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .fontSize(18)
            .width('45%')
            .height(53)
            .type(ButtonType.Normal)
            .borderRadius(50)
            .borderWidth(1)
            .borderColor(Color.Gray)
            .onClick(() => {
              promptAction.openToast({
                message: 'Clicked Buy Again'
              });
            })
        }.justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')

        Row() {
          Button('Your Account')
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .width('45%')
            .fontSize(18)
            .height(53)
            .type(ButtonType.Normal)
            .borderRadius(50)
            .borderWidth(1)
            .borderColor(Color.Gray)
            .onClick(() => {
              promptAction.openToast({
                message: 'Clicked Your Account'
              });
            })
          Button('Your Lists')
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .fontSize(18)
            .width('45%')
            .height(53)
            .type(ButtonType.Normal)
            .borderRadius(50)
            .borderWidth(1)
            .borderColor(Color.Gray)
            .onClick(() => {
              promptAction.openToast({
                message: 'Clicked Your Lists'
              });
            })
        }.justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .margin({ top: 10, bottom: 10 })

        this.personInfoBuilder('Your Orders', 'No recent order found.', 'See all', 'See all orders')
        this.personInfoBuilder('Buy Again', 'See what orders are reordering on Buy Again', '', 'Visit Buy Again')
        this.personInfoBuilder('Your Lists', 'You haven\'t created any lists.', '', 'Create a List')

        this.personInfoListBuilder('Your Account', 'See all', ['Your orders', 'Your Payments', 'Your Subscriptions'])
        this.personInfoListBuilder('Gift Card Balance: $0.00', 'Manage', ['Redeem Gift Card', 'Reload Balance'])
        this.personInfoListBuilder('Need more help?', '', ['Visit customer service'])

      }
    }.scrollable(ScrollDirection.Vertical)
    .height('100%')
  }

  @Builder
  personInfoBuilder(title: string, desc: string, subtitle: string, btnName: string) {
    Column() {
      Row() {
        Text(title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(subtitle)
          .margin(10)
          .padding({ left: 15 })
          .fontSize(18)
          .fontColor('#ff3c6a9f')
      }
      .width('100%')
      .borderRadius(21)
      .padding({ left: 16, right: 16 })
      .height(40)
      .margin({ left: 5, right: 3 })

      Text(desc)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.Gray)
        .padding({ left: 20 })
        .fontSize(18)
        .width('100%')
        .textAlign(TextAlign.Start)
        .margin({ top: 15 })

      Button(btnName)
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .fontSize(18)
        .width('90%')
        .height(53)
        .margin(15)
        .type(ButtonType.Normal)
        .borderRadius(8)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .onClick(() => {
          promptAction.openToast({
            message: `Clicked ${btnName}`
          });
        })

      Divider().strokeWidth(5).color('#ffd9d9d9')
    }
  }

  @Builder
  personInfoListBuilder(title: string, subtitle: string, btnNames: string[]) {
    Column() {
      Row() {
        Text(title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(subtitle)
          .margin(10)
          .padding({ left: 15 })
          .fontSize(18)
          .fontColor('#ff3c6a9f')
      }
      .width('100%')
      .borderRadius(21)
      .padding({ left: 16, right: 16 })
      .height(40)
      .margin({ left: 5, right: 3 })

      List({ scroller: this.listScroller }) {
        ForEach(
          btnNames,
          (item: string, index: number) => {
            this.customButton(item)
          }, 
          (item: string, index: number) => JSON.stringify(item)
          )
      }
      .listDirection(Axis.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .alignListItem(ListItemAlign.Start)

      Divider().strokeWidth(5).color('#ffd9d9d9').margin({ top: 15, bottom: 15 })
    }
  }

  @Builder
  customButton(btnName: string) {
    Button(btnName)
      .backgroundColor(Color.White)
      .fontColor(Color.Black)
      .fontSize(18)
      .height(53)
      .margin({ left: 10, top: 15 })
      .type(ButtonType.Normal)
      .borderRadius(8)
      .borderWidth(1)
      .borderColor(Color.Gray)
      .onClick(() => {
        promptAction.openToast({
          message: `Clicked ${btnName}`
        });
      })
  }
}