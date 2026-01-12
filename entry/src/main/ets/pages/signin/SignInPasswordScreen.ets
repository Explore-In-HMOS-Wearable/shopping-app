import { clear, getParams, routePageWithParams, routerBack } from '../../common/RouterUtils';
import { ArcScrollBar } from '@ohos.arkui.ArcScrollBar';

const PASSWORD = 'test_password';

@Component
export default struct SignInPasswordScreen {
  private scroller: Scroller = new Scroller();
  @State email: string = 'example@exp.com'
  @State text: string = ''
  @State textError: string = ''

  aboutToAppear(): void {
    let params = getParams('SignInPasswordScreen')![0] as string
    if (params !== undefined) {
      this.email = params
    }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          Text('Sign in')
            .padding(18)
            .fontSize(26)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text(this.email)
            .padding({ left: 20 })
            .fontSize(16)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('Change')
            .margin(10)
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 20 })
            .fontSize(16)
            .fontColor('#ff3c6a9f')
            .onClick(() => {
              routerBack()
            })

          Text('Password')
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 20, top: 20 })
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          TextInput({ text: this.text })
            .border({ width: 0.5 })
            .padding(10)
            .margin(15)
            .lineHeight(15)
            .borderRadius(5)
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .shadow(0.5)
            .showError(this.textError)
            .onChange((value: string) => {
              this.text = value
            })

          Row() {
            Radio({ value: 'Radio1', group: 'radioGroup' })
              .checked(true)
              .radioStyle({
                checkedBackgroundColor: Color.Orange
              })
              .height(20)
              .width(20)
              .onChange((isChecked: boolean) => {
                console.info(`Radio1 status is ${isChecked}`)
              })
            Text('Show password')
              .margin({ left: 3 })
              .fontSize(16)
            Text('Forgot password?')
              .margin(10)
              .width('100%')
              .textAlign(TextAlign.Start)
              .padding({ left: 45 })
              .fontSize(16)
              .fontColor('#ff3c6a9f')
          }
          .width('90%')
          .padding(15)

          Button() {
            Row() {
              Text('Sign in')
                .fontSize(18)
                .fontColor('#3a4241')
                .margin({ left: 5, right: 12 })
            }.alignItems(VerticalAlign.Center)
          }
          .backgroundColor('#fed813')
          .fontColor(Color.Black)
          .width('91%')
          .height(53)
          .margin(10)
          .type(ButtonType.Normal)
          .borderRadius(8)
          .onClick(() => {
            if (PASSWORD === this.text) {
              routePageWithParams('Index', this.email.split('@')[0])
              clear()
              this.textError = '';
            } else {
              this.textError = 'Please try again.';
              this.text = '';
            }
          })

          Blank('100')

        }
        .width('100%')
        .shadow(2)
        .margin({ top: 60, bottom: 10 })
      }
      .width('100%')
      .scrollBar(BarState.Off)

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
    }
    .width('100%')
    .height('100%')

  }
}