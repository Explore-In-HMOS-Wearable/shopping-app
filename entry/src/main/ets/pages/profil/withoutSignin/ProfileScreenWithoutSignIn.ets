import { Constants } from '../../../common/Constants'
import { routePageNoParams } from '../../../common/RouterUtils'
import CustomToolBar from '../../../components/profile/CustomToolBar'
import Info from '../../../data/InfoModel'
import InformationItemComponent from './InformationItemComponent'
import { promptAction } from '@kit.ArkUI'

@Component
export default struct ProfileWithoutSignIn {
  build() {
    Column() {
      CustomToolBar()
      Row() {
        Text('Hello').fontSize(20).padding({ left: 20 })
        Blank()
        Image($r('app.media.usa')).width(30)
        Text('EN').fontSize(20).padding({ left: 10 })
      }
      .padding({ right: 20 })
      .justifyContent(FlexAlign.End)
      .width('100%').height(70)

      Text('Sign in for the best experience')
        .fontColor('#353e3d')
        .fontSize(25)
        .textAlign(TextAlign.Center)
        .padding({ left: 20, right: 20 })

      Button() {
        Row() {
          Text('Sign in').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor('#f3ce73')
      .width('88%')
      .height('7%')
      .type(ButtonType.Normal)
      .borderRadius(5)
      .border({ width: 1, color: '#7d6937' })
      .borderRadius(5)
      .margin({ top: 18 })
      .onClick(() => {
        routePageNoParams('SignInScreen')
      })

      Button() {
        Row() {
          Text('Create account').fontSize(18).fontColor('#3a4241').margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .backgroundColor('#eff0f4')
      .fontColor(Color.Black)
      .width('88%')
      .height('7%')
      .type(ButtonType.Normal)
      .border({ width: 1, color: '#8d9095' })
      .borderRadius(5)
      .margin({ top: 10, bottom: 20 })
      .onClick(() => {
        promptAction.openToast({
          message: 'Clicked Create Account'
        });
      })

      ForEach(
        Constants.INFO_LIST, 
        (info: Info, index: number) => {
          InformationItemComponent({ img: info.infoImg, info: info.info })
        },
        (info: Info, index: number) => JSON.stringify(info)
      )


    }
    .width('100%')
    .height('100%')
  }
}