import { curves, router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import { inputMethod } from '@kit.IMEKit'
import { EmojiData } from '../models/EmojiData'
import { buffer } from '@kit.ArkTS'

@Entry
@Component
struct Chat {
  @State paneHeight: number = 128
  @State showEmojiPane: boolean = false
  @State showFunctionalPane: boolean = false
  totalOffset: number = 0
  emojiDataList: EmojiData[] = []

  aboutToAppear(): void {
    getContext(this).resourceManager.getRawFileContent("emoji_data.json").then(jsonData => {
      let data: EmojiData[] = JSON.parse(buffer.from(jsonData.buffer).toString());
      data.forEach(i => {
        this.emojiDataList.push(i)
      })
    }).catch((error: Error) => {
      console.info(error.message)
    });
  }

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(16)
      .fontColor("#0c5af7")
      .width('100%')
      .padding(4)
  }

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
        Text("名称")
        Image($r("app.media.more")).width(24).fillColor(Color.Black)
      }
      .width("100%")
      .padding({ left: 16, right: 16, top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
      .expandSafeArea([SafeAreaType.KEYBOARD, SafeAreaType.SYSTEM])
      .zIndex(999)
      .backgroundColor("#f3f3f3")

      Scroll() {
        Column() {
          LeftMessageNode()
          RightMessageNode()
          LeftMessageNode()
          LeftMessageNode()
          LeftMessageNode()
          RightMessageNode()
          RightMessageNode()
          LeftMessageNode()
        }.width("100%").alignItems(HorizontalAlign.Start).padding({ left: 8, right: 8 })
      }.backgroundColor("#f3f3f3").align(Alignment.TopStart).layoutWeight(1).scrollBar(BarState.Off)

      Column() {
        Row() {
          Image($r("app.media.more")).width(24).fillColor(Color.Black)
          TextArea().layoutWeight(1).margin({ left: 8, right: 8 }).onFocus(() => {
          })
          Image($r("app.media.more")).width(24).fillColor(Color.Black).onClick(() => {
            this.showFunctionalPane = false
            this.showEmojiPane = !this.showEmojiPane
            inputMethod.getController().stopInputSession()
          })
          Image($r("app.media.more")).width(24).fillColor(Color.Black).onClick(() => {
            this.showEmojiPane = false
            this.showFunctionalPane = !this.showFunctionalPane
            inputMethod.getController().stopInputSession()
          })
        }
        .width("100%")
        .padding({
          left: 16,
          right: 16,
          top: 8,
          bottom: 8
        })
        .justifyContent(FlexAlign.SpaceBetween)

        if (this.showEmojiPane) {
          Tabs({ barPosition: BarPosition.End }) {
            TabContent() {
              Column() {
                List({ space: 8 }) {
                  ForEach(this.emojiDataList, (emojiData: EmojiData) => {
                    ListItemGroup({ header: this.itemHead(emojiData.category) }) {
                      if (emojiData.emojiList) {
                        ForEach(emojiData.emojiList, (emojiPath: string) => {
                          ListItem() {
                            Image($rawfile(emojiPath)).width(32).height(32)
                          }.padding({ bottom: 4 })
                        })
                      }
                    }
                  })
                }
                .lanes(7)
                .width("100%")
                .height("100%")
                .padding({
                  left: 24,
                  right: 24,
                  top: 8,
                  bottom: 8
                })
                .alignListItem(ListItemAlign.Center)
                .onReachStart(() => {
                  this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
                    this.paneHeight = 144
                  })
                })
                .onDidScroll((scrollOffset, scrollState) => {
                  if (scrollState == ScrollState.Scroll || scrollState == ScrollState.Fling) {
                    this.totalOffset += scrollOffset
                  } else if (scrollState == ScrollState.Idle) {
                    if (this.totalOffset > 80) {
                      this.getUIContext()?.animateTo({ curve: curves.springMotion() }, () => {
                        this.paneHeight = 256
                      })
                    }
                    this.totalOffset = 0
                  }
                })
              }.height(this.paneHeight)
            }.tabBar("默认")

            TabContent() {
            }.tabBar("收藏")
          }.height(this.paneHeight + 32).barHeight(32)
        }
        if (this.showFunctionalPane) {
          List({ space: 8 }) {
            FunctionNode()
            FunctionNode()
            FunctionNode()
            FunctionNode()
            FunctionNode()
            FunctionNode()
            FunctionNode()
            FunctionNode()
          }
          .lanes(4)
          .width("100%")
          .height("auto")
          .padding({
            left: 48,
            right: 48,
            top: 8,
            bottom: 8
          })
          .alignListItem(ListItemAlign.Center)
        }
      }
    }
    .width("100%")
    .expandSafeArea([SafeAreaType.SYSTEM])
    .zIndex(999)
    .backgroundColor("#f3f3f3")
  }
}

@Component
struct LeftMessageNode {
  build() {
    Row() {
      Image($r("app.media.startIcon")).width(32).height(32)
      Column() {
        Text("名称").fontColor(Color.Black).fontSize(16).fontWeight(FontWeight.Normal)
        Row() {
          Text("消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左消息左123")
        }.backgroundColor(Color.White).padding(10).borderRadius(8)
      }.width("80%").margin({ left: 16 }).alignItems(HorizontalAlign.Start)
    }.width("100%").alignItems(VerticalAlign.Top).margin({ top: 16 })
  }
}

@Component
struct RightMessageNode {
  build() {
    Row() {
      Column() {
        Text("名称").fontColor(Color.Black).fontSize(16).fontWeight(FontWeight.Normal)
        Row() {
          Text("消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右消息右1234")
        }.backgroundColor(Color.White).padding(10).borderRadius(8)
      }.width("80%").margin({ right: 16 }).alignItems(HorizontalAlign.End)

      Image($r("app.media.startIcon")).width(32).height(32)
    }.width("100%").alignItems(VerticalAlign.Top).justifyContent(FlexAlign.End).margin({ top: 16 })
  }
}

@Component
struct FunctionNode {
  build() {
    ListItem() {
      Image($r("app.media.startIcon")).width(48).height(48)
    }
  }
}