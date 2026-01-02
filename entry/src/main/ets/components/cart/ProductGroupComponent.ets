import { Movie } from '../../data/MovieModel'
import { Product } from '../../data/ProductModel'
import { initMovieData } from '../../viewmodel/ProductViewModel'
import PreOrderProductCard from './PreOrderProductCard'
import ProductCard from './ProductCard'

@Component
export default struct ProductGroupComponent {
  @Prop title: string
  @Prop product: Product
  movies: Movie[] = initMovieData()
  @Prop isBuyingOptionsEnable: boolean

  build() {
    Column() {
      Text(this.title)
        .padding({ top: 15 })
        .fontWeight(FontWeight.Bold)
        .width('90%')
        .fontSize(17)
        .fontColor(Color.Black)

      Row() {
        ProductCard({ product: this.product, isBuyingOptionsEnable: this.isBuyingOptionsEnable })
        PreOrderProductCard({ movie: this.movies[0] })
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')

    }
    .width('100%')
    .height(300)
    .backgroundColor(Color.White)
    .margin({ left: 20, right: 20, top: 25 })
  }
}