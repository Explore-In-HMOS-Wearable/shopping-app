import { routePageWithParams } from '../../common/RouterUtils';
import { ArcScrollBar } from '@ohos.arkui.ArcScrollBar';

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

@Component
export default struct SignInScreen {
  private scroller: Scroller = new Scroller();
  @State text: string = ''
  @State textError: string = ''

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          Text('Welcome')
            .padding(18)
            .fontSize(26)
            .width('100%')
            .textAlign(TextAlign.Start)
          Row() {
            Column() {
              Row() {
                Radio({ value: 'Radio1', group: 'radioGroup' })
                  .checked(false)
                  .radioStyle({
                    checkedBackgroundColor: Color.Orange
                  })
                  .height(20)
                  .width(20)
                  .onChange((isChecked: boolean) => {
                    console.info(`Radio1 status is ${isChecked}`)
                  })
                Text('Create account')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
              }

              Text('New to our app?')
                .margin({ left: 8 })
                .fontSize(16)
                .textAlign(TextAlign.Start)
            }

          }
          .width('90%')
          .padding(15)
          .borderWidth(0.5)
          .margin(6)
          .borderColor(Color.Grey)
          .backgroundColor($r('app.color.light_grey'))

          Column() {
            Row() {
              Radio({ value: 'Radio2', group: 'radioGroup' })
                .checked(true)
                .radioStyle({
                  checkedBackgroundColor: Color.Orange
                })
                .margin(6)
                .height(20)
                .width(20)
                .onChange((isChecked: boolean) => {
                  console.info(`Radio2 status is ${isChecked}`)
                })
              Column() {
                Text('Sign in')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                Text('Already a customer?')
                  .fontWeight(FontWeight.Medium)
                  .margin({ left: 3 })
                  .fontSize(16)
              }

            }
            .width('100%')
            .padding(15)

            Text('Email or phone number')
              .width('100%')
              .textAlign(TextAlign.Start)
              .padding({ left: 15 })
              .fontSize(16)
              .fontWeight(FontWeight.Bold)

            TextInput({ text: this.text })
              .border({ width: 0.5 })
              .padding(10)
              .margin(10)
              .lineHeight(15)
              .borderRadius(5)
              .fontColor(Color.Black)
              .backgroundColor(Color.White)
              .shadow(0.5)
              .showError(this.textError)
              .onChange((value: string) => {
                this.text = value
              })

            Button() {
              Row() {
                Text('Continue')
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
              if (emailRegex.test(this.text)) {
                this.textError = '';
                routePageWithParams(
                  'SignInPasswordScreen',
                  this.text
                )
              } else {
                this.textError = 'Please enter an correct email.';
                this.text = '';
              }
            })

            Text('By signing in you are agreeing to our terms listed in the Legal Information section and our Privacy Notice')
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .padding({ left: 15, right: 15 })
              .fontSize(16)
            Text('Need help?')
              .margin(10)
              .width('100%')
              .textAlign(TextAlign.Start)
              .padding({ left: 15 })
              .fontSize(16)
              .fontColor('#ff3c6a9f')
          }
          .width('90%')
          .borderWidth(0.5)
          .borderColor(Color.Grey)

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