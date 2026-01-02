import { BusinessError } from '@kit.BasicServicesKit'
import { NavigationService } from '../service/NavigationService';

const navigationService = NavigationService.getInstance();

export function routePageNoParams(url: string) {
  try {
    navigationService.pageInfos.pushPath({ name: url })
  } catch (err) {
    console.info(` fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
  }
}

export function routePageWithParams(url: string, param: string) {
  try {
    navigationService.pageInfos.pushPath({ name: url, param: param })
  } catch (err) {
    console.info(` fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
  }
}

export function getParams(name: string) {
  try {
    return navigationService.pageInfos.getParamByName(name)
  } catch (err) {
    console.info(` fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
    return undefined
  }
}

export function routerBack() {
  navigationService.pageInfos.pop()
}

export function removeByName(name: string) {
  navigationService.pageInfos.removeByName(name)
}

export function clear() {
  navigationService.pageInfos.clear()
}