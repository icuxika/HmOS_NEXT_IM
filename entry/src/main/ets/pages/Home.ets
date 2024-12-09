import { FriendNode } from '../components/contact/ContactComponents';
import { ConversationNode } from '../components/conversation/ConversationComponents';
import { Conversation, MockConversations } from '../models/Conversation';
import { Friend, FriendGroupByFirstLetter, MockFriendGroupByFirstLetters } from '../models/Friend';
import { RefreshContainer, TabHead } from '../components/common/CommonComponents';
import { componentUtils, router, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Styles
function globalBgColor() {
  .backgroundColor("#f3f3f3")
}

@Entry
@Component
struct Home {
  @State currentIndex: number = 0

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource) {
    Column() {
      Image(selectedImg)
        .size({ width: 24, height: 24 })
        .fillColor(this.currentIndex === targetIndex ? '#1d6bf5' : '#6B6B6B')
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1d6bf5' : '#6B6B6B')
    }
    .width('100%')
    .height(48)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          ConversationTab()
        }
        .tabBar(this.tabBuilder("消息", 0, $r("app.media.conversation")))

        TabContent() {
          ContactTab()
        }
        .tabBar(this.tabBuilder("联系人", 1, $r("app.media.friend")))

        TabContent() {
          AccountTab()
        }
        .tabBar(this.tabBuilder("我的", 2, $r("app.media.home")))
      }
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }.width("100%")
    .expandSafeArea([SafeAreaType.SYSTEM]).zIndex(999).globalBgColor()
  }
}

/**
 * Tab-消息
 */
@Component
struct ConversationTab {
  @Builder
  componentBuilder() {
    Scroll() {
      Column() {
        Row() {
          TextInput({ placeholder: "搜索" })
            .margin({ left: 16, right: 16 })
            .backgroundColor(Color.White)
            .focusable(false)
            .onClick(() => {
              router.pushUrl({ url: 'pages/SearchPage' })
                .then(() => {
                  console.info('Succeeded in jumping to the second page.')
                }).catch((err: BusinessError) => {
                console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
              })
            })
        }
        .height(96)
        .width("100%")
        .justifyContent(FlexAlign.Center)

        List() {
          ForEach(MockConversations, (conversation: Conversation) => {
            ListItem() {
              ConversationNode({
                name: conversation.name,
                time: conversation.time,
                message: conversation.message,
                unreadCount: conversation.unreadCount
              })
            }
          })
        }
        .width("100%")
        .height("100%")
        .alignListItem(ListItemAlign.Center)
        .scrollBar(BarState.Off)
        .nestedScroll({
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        })
      }
    }.scrollBar(BarState.Off)
  }

  build() {
    Column() {
      TabHead()
      RefreshContainer({
        customBuilderParam: this.componentBuilder
      }).layoutWeight(1)
    }.height("100%")
  }
}

/**
 * Tab-联系人
 */
@Component
struct ContactTab {
  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(16)
      .fontColor("#0c5af7")
      .backgroundColor(Color.White)
      .width('100%')
      .padding(4)
  }

  @Builder
  componentBuilder() {
    Scroll() {
      Column() {
        Row() {
          TextInput({ placeholder: "搜索" })
            .margin({ left: 16, right: 16 })
            .backgroundColor(Color.White)
            .focusable(false)
            .onClick(() => {
              router.pushUrl({ url: 'pages/SearchPage' })
                .then(() => {
                  console.info('Succeeded in jumping to the second page.')
                }).catch((err: BusinessError) => {
                console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
              })
            })
        }
        .height(96)
        .width("100%")
        .justifyContent(FlexAlign.Center)

        Column() {
          Row() {
            Text("可能想认识的人").fontSize(12)
              .fontColor(Color.Gray)
            Image($r("app.media.to_right")).width(12).fillColor(Color.Gray)
          }
          .width("100%")

          Row() {
            Image($r("app.media.startIcon")).width(48).height(48)
            Column() {
              Text("Glavo").fontColor(Color.Black).fontSize(16)
              Blank()
              Text("你和TA来自相同群").fontColor(Color.Gray).fontSize(12)
            }.height(40).margin({ left: 8 }).alignItems(HorizontalAlign.Start)

            Blank()
            Button("添加", { type: ButtonType.Normal }).height(24).fontColor(Color.Black).globalBgColor()
            Image($r("app.media.x")).width(12).fillColor(Color.Gray).margin({ left: 16 })
          }.width("100%").margin({ top: 8 })
        }
        .backgroundColor(Color.White)
        .width("100%")
        .margin({ top: 8 })
        .padding({
          left: 16,
          right: 16,
          top: 16,
          bottom: 16
        })

        Column() {
          Row() {
            Text("新朋友")
            Blank()
            Image($r("app.media.to_right")).width(16).fillColor(Color.Gray)
          }.width("100%").height(48).padding({ left: 16, right: 16 })

          Divider()
          Row() {
            Text("新通知")
            Blank()
            Image($r("app.media.to_right")).width(16).fillColor(Color.Gray)
          }.width("100%").height(48).padding({ left: 16, right: 16 })
        }.backgroundColor(Color.White).margin({ top: 8 }).width("100%")

        Tabs() {
          TabContent() {
            Column() {
              List() {
                ForEach(MockFriendGroupByFirstLetters, (friendGroupByFirstLetter: FriendGroupByFirstLetter) => {
                  ListItemGroup({ header: this.itemHead(friendGroupByFirstLetter.title) }) {
                    if (friendGroupByFirstLetter.friends) {
                      ForEach(friendGroupByFirstLetter.friends, (friend: Friend) => {
                        ListItem() {
                          FriendNode({ name: friend.name })
                        }
                      })
                    }
                  }
                })
              }
              .width("100%")
              .height("100%")
              .sticky(StickyStyle.Header)
              .nestedScroll({
                scrollForward: NestedScrollMode.PARENT_FIRST,
                scrollBackward: NestedScrollMode.SELF_FIRST
              })
            }
            .backgroundColor(Color.White)
          }.tabBar("好友")

          TabContent() {
            Text("分组")
          }.tabBar("分组")

          TabContent() {
            Text("群聊")
          }.tabBar("群聊")

          TabContent() {
            Text("设备")
          }.tabBar("设备")
        }
      }
    }.scrollBar(BarState.Off)
  }

  build() {
    Column() {
      TabHead()
      RefreshContainer({
        customChangeThisBuilderParam: (): void => {
          this.componentBuilder()
        }
      }).layoutWeight(1)
    }.height("100%")
  }
}

/**
 * Tab-我的
 */
@Component
struct AccountTab {
  build() {
    Column() {
      Row() {
        Image($r("app.media.more")).width(24).fillColor(Color.Black).onClick(() => {
          let info = componentUtils.getRectangleById("head")
          console.log("!!!!!!!!!!!", info.size.height + "")
        })
        Image($r("app.media.more")).width(24).fillColor(Color.Black).onClick(() => {
          router.pushUrl({ url: 'pages/Settings' })
            .then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
          })
        })
      }
      .id("head")
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 16, right: 16, top: 8 })

      Scroll() {
        Column() {
          Row() {
            Image($r("app.media.startIcon")).width(96).height(96)
            Column() {
              Text("名称")
              Text("签名")
            }.margin({ left: 16 })
          }.width("100%").padding({ left: 24, top: 24, bottom: 8 })

          List({ space: 16 }) {
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
            AccountFunctionNode()
          }
          .width("100%")
          .height("100%")
          .padding(16)
          .lanes(2)
          .scrollBar(BarState.Off)
          .alignListItem(ListItemAlign.Center)
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
        }
      }.scrollBar(BarState.Off).layoutWeight(1)
    }.height("100%")
  }
}

@Component
struct AccountFunctionNode {
  build() {
    Column() {
      Image($r("app.media.startIcon")).width(24).height(24)
      Text("标题").margin({ top: 16 })
      Text("描述").margin({ top: 8 })
    }
    .width("calc(100% - 16vp)")
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }
}