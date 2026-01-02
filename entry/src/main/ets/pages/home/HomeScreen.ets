import { CustomCategoryComponent } from '../../components/home/CustomCategoryComponent';
import DeliverToComponent from '../../components/DeliverToComponent';
import SearchBar from '../../components/SearchBar';
import { CategoryItemObject } from '../../data/CategoryItemModel';
import {
  initBagCategoryData,
  initExploreCategoryData,
  initMainCategoryData,
  initPetCategoryData,
  initVacationCategoryData
} from '../../viewmodel/HomeViewModel';
import { routePageNoParams } from '../../common/RouterUtils';
import { ArcScrollBar } from '@ohos.arkui.ArcScrollBar';
import { TopProductListItemComponent } from '../../components/home/TopProductListItemComponent';
import { Product } from '../../data/ProductModel';
import AppMenuComponent from '../../components/AppMenuComponent';

@Component
export default struct HomeScreen {
  private listScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller()
  @State mainCategories: Array<CategoryItemObject> = initMainCategoryData();
  @State categoriesExplore: Array<CategoryItemObject> = initExploreCategoryData();
  @State categoriesVacation: Array<CategoryItemObject> = initVacationCategoryData();
  @State categoriesPet: Array<CategoryItemObject> = initPetCategoryData();

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          SearchBar({ isRedirected: false })
          AppMenuComponent()
          DeliverToComponent()
          Row() {
            List({ scroller: this.listScroller }) {
              ForEach(
                this.mainCategories,
                (item: CategoryItemObject, index: number) => {
                  this.Category(item)
                },
                (item: CategoryItemObject, index: number) => JSON.stringify(item))
            }
            .width('100%')
            .height(150)
            .listDirection(Axis.Horizontal)
            .scrollBar(BarState.Off)
          }

          CustomCategoryComponent({
            images: [],
            title: 'Up to 30% discount on bags',
            subtitle: 'See More'
          })

          Text('Top picks for Turkey')
            .margin({ top: 15, bottom: 10 })
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
            .padding({ left: 15 })
          Column() {
            TopProductListItemComponent({
              productItem: new Product( 1, $r('app.media.sweat'),
                'Fruit of the Loom Herren Set-in-Sweat Sweatshirt Pullover', '253', '1000', 3)
            })
            TopProductListItemComponent({
              productItem: new Product(2, $r('app.media.shoes_top'), 'Vans Herren Authentic Sneaker', '500', '1000', 3)
            })
            TopProductListItemComponent({
              productItem: new Product(3, $r('app.media.wallet1'), 'RFID Blocking Card Holder Wallet', '123', '1000', 3)
            })
          }

          Divider().strokeWidth(1).color('#ffd9d9d9')

          CustomCategoryComponent({
            images: this.categoriesVacation,
            title: 'Vacation Getaway',
            subtitle: 'See More'
          })
            .margin({ top: 25 })
          CustomCategoryComponent({
            images: this.categoriesPet,
            title: 'Gift for your friends',
            subtitle: 'See More'
          })
          CustomCategoryComponent({
            images: this.categoriesExplore,
            title: 'Explore Departments',
            subtitle: 'All Departments'
          })
        }
        .width('100%')
        .margin({ bottom: 50 })
      }
      .width('100%')
      .scrollBar(BarState.Off)

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
    }
    .width('100%')
    .height('100%')

  }

  @Builder
  Category(item: CategoryItemObject) {
    Column() {
      Text(item.categoryName)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Start)
        .width(100)
        .margin({ top: 10, bottom: 10 })
        .padding({ left: 10 })
      Image(item.iconUrl)
        .width(100)
        .height(100)
        .borderRadius({ bottomLeft: 5, bottomRight: 5 })
    }.margin(5)
    .backgroundColor(Color.White)
    .borderRadius(5)
    .onClick(() => {
      routePageNoParams('ProductListPage')
    })
  }
}