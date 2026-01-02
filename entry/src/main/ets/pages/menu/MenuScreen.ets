import { routePageNoParams } from '../../common/RouterUtils';
import { MenuItemComponent } from '../../components/menu/MenuItemComponent';
import SearchBar from '../../components/SearchBar';
import { ArcScrollBar } from '@ohos.arkui.ArcScrollBar';

@Component
export default struct MenuScreen {
  private scroller: Scroller = new Scroller()
  @State selectedIndex: number = -1;
  @State categories: string[] = ['Home & Kitchen', 'Sport & Outdoor', 'Baby', 'Computers', 'Digital Music']

  @Builder
  CategoriesMenuBuilder() {
    Menu() {
      ForEach(
        this.categories,
        (category: string, index) => {
          MenuItem({ content: category })
            .onChange((selected: boolean) => {
              this.selectedIndex = index
            })
        },
        (category: string, index: number) => category
      )
    }
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          SearchBar({ isRedirected: false })
          Row() {
            Text(this.selectedIndex > 0 ? this.categories[this.selectedIndex] : 'Shop by Department')
              .margin({ left: 10 })
          }
          .bindMenu(this.CategoriesMenuBuilder, { hapticFeedbackMode: HapticFeedbackMode.ENABLED })
          .width('92%')
          .height(50)
          .margin(15)
          .borderColor(Color.Gray)
          .borderWidth(1)
          .borderRadius(5)
          .shadow(2)
          .justifyContent(FlexAlign.SpaceBetween)

          MenuItemComponent({ title: 'Sign In' })
            .onClick(() => {
              routePageNoParams('SignInScreen')
            })

          Row() {
            Image($r('app.media.info'))
              .width(15)
              .height(15)
              .margin({ left: 8 })
            Text('Looking for app settings? They\'ve moved to').margin({ left: 5 })
            Image($r('app.media.profile'))
              .width(15)
              .height(15)
              .margin({ left: 5 })
          }
          .width('100%')
          .margin({ top: 15 })

          Blank('100')
        }
        .width('90%')
        .alignItems(HorizontalAlign.Start)

      }
      .width('100%')
      .scrollBar(BarState.Off)

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
    }
    .width('100%')
    .height('100%')

  }

  @Builder
  category(item: string) {
    Text(item).margin(10)
  }
}