export class Movie {
  id: number;
  image: Resource;
  filmMaker: string;
  videoQuality: string;
  title: string | Resource;
  price: string;

  constructor(id: number, image: Resource, filmMaker: string, videoQuality: string,
    title: string | Resource, price: string) {
    this.id = id;
    this.image = image;
    this.filmMaker = filmMaker;
    this.videoQuality = videoQuality;
    this.title = title;
    this.price = price;
  }
}

