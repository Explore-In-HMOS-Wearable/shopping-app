import DeliverToComponent from '../../components/DeliverToComponent';
import ProductCategoryComponent from '../../components/productlist/ProductCategoryComponent';
import ProductListingItem from '../../components/productlist/ProductListingItem';
import SearchBar from '../../components/SearchBar';
import { Product } from '../../data/ProductModel';
import { initProductListData } from '../../viewmodel/ProductViewModel';
import TabFilterComponent from '../../components/productlist/TabFilterComponent';
import { ArcScrollBar } from '@kit.ArkUI';

@Component
export struct ProductListPage {
  private listScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller()
  products: Product[] = initProductListData()

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          SearchBar()
          DeliverToComponent()
          TabFilterComponent()
          ProductCategoryComponent()
          List({ space: 3, scroller: this.listScroller }) {
            ForEach(
              this.products,
              (product: Product) => {
                ProductListingItem({ product: product })
              },
              (product: Product) => product.id.toString())
          }
          .width('100%')
          .height('auto')
          .scrollBar(BarState.Off)
          .alignListItem(ListItemAlign.Center)
          .backgroundColor(Color.White)
          .listDirection(Axis.Horizontal)

          Blank('50').color(Color.White)
        }
        .width('100%')

      }
      .width('100%')
      .scrollBar(BarState.Off)

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
    }
    .width('100%')
    .height('100%')
  }
}