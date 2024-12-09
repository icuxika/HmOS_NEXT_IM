import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct SearchPage {
  build() {
    Column() {
      Row() {
        TextInput({ placeholder: "搜索" }).backgroundColor(Color.White).layoutWeight(1).defaultFocus(true)
        Text("取消").fontColor(Color.Blue).onClick(() => {
          try {
            router.back()
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`无法返回登录页. Code is ${code}, message is ${message}`)
          }
        })
      }
    }
    .height("100%")
    .expandSafeArea([SafeAreaType.SYSTEM])
    .zIndex(999)
    .backgroundColor("#f3f3f3")
  }
}