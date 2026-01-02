import { routePageNoParams } from '../common/RouterUtils';
import { Product } from '../data/ProductModel';
import { totalQuantity } from '../viewmodel/CartViewModel';

interface MenuItem {
  icon: Resource;
  label: string;
  badgeCount?: number | undefined;
  onClick: () => void;
}

@Component
export default struct AppMenuComponent {
  @Consume cartProductList: Product[];
  @Prop isCartScreen: boolean = false;

  @Builder
  MenuItem(item: MenuItem) {
    Row() {
      Badge({
        count: item.badgeCount ?? 0,
        style: {},
        position: BadgePosition.RightTop
      }) {
        Image(item.icon)
          .width(20)
          .margin({ left: 10 })
      }

      Text(item.label)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .padding({ left: 8 })

    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .height(52)
    .onClick(item.onClick)
  }

  build() {
    Column() {
      Row() {
        this.MenuItem({
          icon: $r('app.media.menu'),
          label: 'Menu',
          onClick: () => {
            if (!this.isCartScreen) {
              routePageNoParams('MenuScreen')
            }
          }
        })
        this.MenuItem({
          icon: $r('app.media.cart'),
          label: 'Cart',
          badgeCount: totalQuantity(this.cartProductList),
          onClick: () => {
            if (!this.isCartScreen) {
              routePageNoParams('CartScreen')
            }
          }
        })

      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffa64c')
      .width('100%')

      Line()
        .height(1)
        .width('100%')
        .backgroundColor(Color.Black)
    }
    .width('100%')
  }
}
