import { display, router, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  build() {
    Column() {
      TextInput({ placeholder: '请输入用户名' }).margin({ top: 20 })
        .onSubmit((EnterKeyType) => {
          console.info(EnterKeyType + '输入法回车键的类型值')
        })
      TextInput({ placeholder: '请输入密码' }).type(InputType.Password).margin({ top: 20 })
        .onSubmit((EnterKeyType) => {
          console.info(EnterKeyType + '输入法回车键的类型值')
        })
      Button('登录').width(150).margin({ top: 20 })
        .onClick(() => {
          router.replaceUrl({ url: 'pages/Home' })
            .then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
          })
        })
    }.height("100%").padding(24).justifyContent(FlexAlign.Center)
  }
}