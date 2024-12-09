import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct Settings {
  build() {
    Column() {
      Row() {
        Image($r("app.media.return")).width(24).fillColor(Color.Black)
          .onClick(() => {
            try {
              router.back()
            } catch (err) {
              let code = (err as BusinessError).code;
              let message = (err as BusinessError).message;
              console.error(`无法返回登录页. Code is ${code}, message is ${message}`)
            }
          })
        Text("设置")
        Image($r("app.media.more")).width(24).fillColor(Color.Transparent)
      }
      .width("100%")
      .padding({ left: 16, right: 16, top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Row() {
          Text("账号管理")
          Blank()
          Image($r("app.media.to_right")).width(16).fillColor(Color.Gray)
        }.width("100%").height(48).padding({ left: 16, right: 16 })

        Divider()
        Row() {
          Text("手机号码")
          Blank()
          Image($r("app.media.to_right")).width(16).fillColor(Color.Gray)
        }.width("100%").height(48).padding({ left: 16, right: 16 })
      }.backgroundColor(Color.White).width("100%")

      Column() {
        Row() {
          Text("退出当前账号")
        }.width("100%").height(48).padding({ left: 16, right: 16 }).onClick(() => {
          router.replaceUrl({ url: 'pages/Index' })
            .then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
          })
        })
      }.backgroundColor(Color.White).margin({ top: 8 }).width("100%")
    }
    .height("100%")
    .backgroundColor("#f3f3f3")
    .expandSafeArea([SafeAreaType.SYSTEM])
    .zIndex(999)
  }
}