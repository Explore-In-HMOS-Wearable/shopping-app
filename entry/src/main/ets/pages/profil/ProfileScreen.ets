import ProfileWithoutSignIn from './withoutSignin/ProfileScreenWithoutSignIn'
import ProfileWithSignIn from './withSignin/ProfileScreenWithSignIn'

@Component
export default struct ProfileScreen {
  @Consume userName: string

  build() {
    Column() {
      if (this.userName === '') {
        ProfileWithoutSignIn()
      } else {
        ProfileWithSignIn({ userName: this.userName })
      }
    }
    .width('100%')
    .height('100%')
  }
}