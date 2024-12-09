import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import { EmojiData } from '../../models/EmojiData'
import { buffer } from '@kit.ArkTS'

@Component
struct ConversationNode {
  @State name: string = "名称"
  @State time: string = "19:11"
  @State message: string = "最近收到的消息"
  @State unreadCount: number = 99

  build() {
    Row() {
      Image($r("app.media.startIcon")).width(64).height(64)
      Column() {
        Row() {
          Text(this.name).fontColor(Color.Black).fontSize(20).fontWeight(FontWeight.Normal)
          Blank()
          Text(this.time).fontColor(Color.Gray).fontSize(16).fontWeight(FontWeight.Regular)
        }.justifyContent(FlexAlign.SpaceBetween).width("100%")

        Blank()

        Row() {
          Text(this.message).fontColor(Color.Gray).fontSize(16).fontWeight(FontWeight.Regular)
          Blank()
          Stack() {
            Circle().width(20).height(20).fill(Color.Gray)
            Text(this.unreadCount.toString()).fontColor(Color.White).fontSize(12).fontWeight(FontWeight.Regular)
          }.width(24).height(24).backgroundColor(Color.Transparent)
        }.justifyContent(FlexAlign.SpaceBetween).width("100%")
      }.height(48).padding({ left: 8, right: 8 }).layoutWeight(1)
    }.height(80).backgroundColor(Color.White).onClick(() => {
      router.pushUrl({ url: 'pages/Chat' })
        .then(() => {
          console.info('Succeeded in jumping to the second page.')
        }).catch((err: BusinessError) => {
        console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
      })
    })
  }
}

@Preview
@Component
struct MessageInputNode {
  controller: RichEditorController = new RichEditorController()

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .placeholder("请输入")
        .border({ width: 1 })
        .borderColor(Color.Red)
      Button("测试").onClick(() => {
        console.info(JSON.stringify(this.controller.getSpans()))
      })
    }
  }
}

export {
  ConversationNode, MessageInputNode
}