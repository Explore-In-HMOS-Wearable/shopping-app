import DeliverToComponent from '../../../components/DeliverToComponent'
import SearchBar from '../../../components/SearchBar'
import { Product } from '../../../data/ProductModel'
import { initProductData } from '../../../viewmodel/ProductViewModel'
import CartItemComponent from '../../../components/cart/CartItemComponent'
import ShoppingButtonComponent from '../../../components/cart/ShoppingButtonComponent'
import ProductGroupComponent from '../../../components/cart/ProductGroupComponent'
import EmptyCartBodyAfterSignin from './EmptyCartBodyAfterSignIn'
import AppMenuComponent from '../../../components/AppMenuComponent'

@Component
export default struct CartScreenAfterSignin {
  products: Product[] = initProductData()
  @Consume cartProductList: Product[]

  build() {
    Column() {
      Scroll() {
        Column() {
          Column() {
            SearchBar({ isRedirected: false })
            AppMenuComponent({ isCartScreen: false })
            DeliverToComponent()
            if (this.cartProductList.length === 0) {
              EmptyCartBodyAfterSignin()
            } else {
              List() {
                ForEach(this.cartProductList,
                  (item: Product, index: number) => {
                    CartItemComponent({ product: item })
                  }, (item: Product, index: number) => JSON.stringify(item))
              }
              .height('auto')
              .width('100%')
              .listDirection(Axis.Vertical)
              .scrollBar(BarState.Off)
              .alignListItem(ListItemAlign.Center)

            }

            ProductGroupComponent({
              product: this.products[1],
              title: 'International top sellers',
              isBuyingOptionsEnable: false
            })

          }.width('100%')

          ShoppingButtonComponent()

        }
      }.width('100%').height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#e9edee')
    .justifyContent(FlexAlign.SpaceBetween)

  }
}