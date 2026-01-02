export class CategoryItemObject {
  categoryName: Resource | string;
  iconUrl: Resource | string;

  constructor(categoryName: Resource | string, iconUrl: Resource | string) {
    this.categoryName = categoryName;
    this.iconUrl = iconUrl;
  }
}