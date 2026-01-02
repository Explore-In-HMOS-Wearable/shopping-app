import { getParams } from '../common/RouterUtils';
import { Product } from '../data/ProductModel';
import { NavigationService } from '../service/NavigationService';
import SignInScreen from './signin/SignInScreen';
import SignInPasswordScreen from './signin/SignInPasswordScreen';
import { ProductListPage } from './productlist/ProductListPage';
import HomeScreen from './home/HomeScreen';
import CartScreen from './cart/CartScreen';
import MenuScreen from './menu/MenuScreen';

@Entry
@Component
struct Index {
  @Provide cartQuantityAmount: number = 0
  @Provide cartProductList: Product[] = []
  @Provide userName: string = ''
  navigationService: NavigationService = NavigationService.getInstance();

  onPageShow(): void {
    let params = getParams('Index')![0] as string
    if (params !== undefined) {
      this.userName = params
    }
  }

  @Builder
  routeMap(name: string) {
    NavDestination() {
      if (name === 'Index') {
        Index()
      } else if (name === 'SignInPasswordScreen') {
        SignInPasswordScreen()
      } else if (name === 'SignInScreen') {
        SignInScreen()
      } else if (name === 'ProductListPage') {
        ProductListPage()
      } else if (name === 'CartScreen') {
        CartScreen()
      } else if (name === 'MenuScreen') {
        MenuScreen()
      }
    }
    .onBackPressed(name === 'Index' ? () => true : () => false)
    .hideTitleBar(true)
  }

  build() {
    Navigation(this.navigationService.pageInfos) {
      HomeScreen()
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.routeMap)
    .ignoreLayoutSafeArea()
    .hideTitleBar(true)
    .width('100%')
    .height('100%')
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