@Component
struct FriendNode {
  @State name: string = "名称"

  build() {
    Row() {
      Image($r("app.media.startIcon")).width(48).height(48)
      Text(this.name)
        .fontColor(Color.Black)
        .fontSize(16)
        .fontWeight(FontWeight.Normal)
        .margin({ left: 8 })
    }.width("100%").padding(8)
  }
}

export {
  FriendNode
}