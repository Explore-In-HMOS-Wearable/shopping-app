import DeliverToComponent from '../../../components/DeliverToComponent'
import SearchBar from '../../../components/SearchBar'
import { Product } from '../../../data/ProductModel'
import { initProductData } from '../../../viewmodel/ProductViewModel'
import CartItemComponent from '../../../components/cart/CartItemComponent'
import ShoppingButtonComponent from '../../../components/cart/ShoppingButtonComponent'
import EmptyCartBody from './EmptyCartBody'
import ProductGroupComponent from '../../../components/cart/ProductGroupComponent'
import AppMenuComponent from '../../../components/AppMenuComponent'

@Component
export default struct CartScreenWithoutSignin {
  products: Product[] = initProductData()
  @Consume cartProductList: Product[]

  build() {
    Column() {
      Scroll() {
        Column() {
          Column() {
            SearchBar({ isRedirected: false })
            AppMenuComponent({ isCartScreen: true })
            DeliverToComponent()
            if (this.cartProductList.length === 0) {
              EmptyCartBody()
            } else {
              List() {
                ForEach(
                  this.cartProductList,
                  (item: Product, index: number) => {
                    CartItemComponent({ product: item })
                  },
                  (item: Product, index: number) => JSON.stringify(item))
              }
              .height('auto')
              .width('100%')
              .listDirection(Axis.Vertical)
              .scrollBar(BarState.Off)
              .alignListItem(ListItemAlign.Center)
            }
            ProductGroupComponent({
              product: this.products[0],
              title: 'New international customers purchased',
              isBuyingOptionsEnable: false
            })
            ProductGroupComponent({
              product: this.products[1],
              title: 'International top sellers',
              isBuyingOptionsEnable: true
            })

          }.width('100%').alignItems(HorizontalAlign.Center)


          ShoppingButtonComponent()

        }

      }.width('100%').align(Alignment.Top)

    }.width('100%').backgroundColor('#e9edee')

  }
}