import CartScreenAfterSignin from './afterSignin/CartScreenAfterSignIn'
import CartScreenWithoutSignin from './withoutSignin/CartScreenWithoutSignIn'

@Component
export default struct CartScreen {
  @Consume userName: string

  build() {
    Column() {
      if (this.userName === '') {
        CartScreenWithoutSignin()
      } else {
        CartScreenAfterSignin()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#e9edee')

  }
}