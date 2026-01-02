import { CategoryItemObject } from '../../data/CategoryItemModel'

@Component
export struct CustomCategoryComponent {
  @Prop images: Array<CategoryItemObject>
  @Prop title: string
  @Prop subtitle: string

  @Builder
  gridItemBuilder(item: CategoryItemObject) {
    GridItem() {
      Column() {
        Image(item.iconUrl)
          .width('100%')
          .height(100)
          .borderRadius(5)
          .objectFit(ImageFit.Cover)
          .backgroundColor('#33ff007e')
        Text(item.categoryName)
          .fontColor(Color.Black)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .maxLines(1)
          .margin({ top: 4 })
      }
      .width('100%')
      .height('auto')
      .padding(4)
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.Start)
    }.width('100%')
  }

  build() {
    Column() {
      Text(this.title)
        .margin({ top: 15 })
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
        .fontSize(14)
        .padding({ left: 15 })
      Grid() {
        ForEach(
          this.images, 
          (item: CategoryItemObject, index: number) => {
            this.gridItemBuilder(item)
          },
          (item: CategoryItemObject, index: number) => JSON.stringify(item)
        )
      }
      .enableScrollInteraction(false)
      .columnsTemplate('1fr 1fr')
      .width('100%')
      .padding(10)
      .rowsGap(2)

      Text(this.subtitle)
        .margin({ top: 5, bottom: 5 })
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontSize(16)
        .padding({ left: 15 })
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
      Divider().strokeWidth(1).color('#ffd9d9d9')
    }
    .width('100%')
  }
}