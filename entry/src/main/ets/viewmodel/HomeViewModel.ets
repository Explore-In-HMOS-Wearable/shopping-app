import { Constants } from '../common/Constants';
import { CategoryItemObject } from '../data/CategoryItemModel';
import Filter from '../data/FilterModel';

export function initMainCategoryData(): CategoryItemObject[] {
  let mainCategoriesArray: CategoryItemObject[] = [];
  Constants.MAIN_CATEGORIES.forEach((item: CategoryItemObject) => {
    mainCategoriesArray.push(new CategoryItemObject(
      item.categoryName,
      item.iconUrl
    ));
  })
  return mainCategoriesArray;
}

export function initExploreCategoryData(): CategoryItemObject[] {
  let exploreCategoriesArray: CategoryItemObject[] = [];
  Constants.CATEGORIES_EXPLORE.forEach((item: CategoryItemObject) => {
    exploreCategoriesArray.push(new CategoryItemObject(
      item.categoryName,
      item.iconUrl
    ));
  })
  return exploreCategoriesArray;
}

export function initBagCategoryData(): CategoryItemObject[] {
  let bagCategoryArray: CategoryItemObject[] = [];
  Constants.CATEGORIES_BAG.forEach((item: CategoryItemObject) => {
    bagCategoryArray.push(new CategoryItemObject(
      item.categoryName,
      item.iconUrl
    ));
  })
  return bagCategoryArray;
}

export function initVacationCategoryData(): CategoryItemObject[] {
  let vacationCategoryArray: CategoryItemObject[] = [];
  Constants.CATEGORIES_VACATION.forEach((item: CategoryItemObject) => {
    vacationCategoryArray.push(new CategoryItemObject(
      item.categoryName,
      item.iconUrl
    ));
  })
  return vacationCategoryArray;
}

export function initPetCategoryData(): CategoryItemObject[] {
  let petCategoryArray: CategoryItemObject[] = [];
  Constants.CATEGORY_PET.forEach((item: CategoryItemObject) => {
    petCategoryArray.push(new CategoryItemObject(
      item.categoryName,
      item.iconUrl
    ));
  })
  return petCategoryArray;
}

export function initFilterData(): Filter[] {
  let filterArray: Filter[] = [];
  Constants.FILTERS.forEach((item: Filter) => {
    filterArray.push(new Filter(
      item.name,
      item.id
    ));
  })
  return filterArray;
}
