import Filter from '../../data/FilterModel';
import { initFilterData } from '../../viewmodel/HomeViewModel';
import FilterButtonComponent from './FilterButtonComponent';

@Component
export default struct TabFilterComponent {
  @State filters: Array<Filter> = initFilterData();

  build() {
    Column() {
      List({ space: 3 }) {
        ForEach(
          this.filters,
          (filter: Filter) => {
            FilterButtonComponent({ title: filter.name })
          },
          (filter: Filter) => filter.id)
      }
      .scrollBar(BarState.Off)
      .alignListItem(ListItemAlign.Center)
      .height('20%')
      .width('100%')
      .backgroundColor(Color.White)
      .listDirection(Axis.Horizontal)

      Line()
        .width('100%')
        .height(2)
        .backgroundColor('#f2f4f3')
    }
    .width('100%')

  }
}