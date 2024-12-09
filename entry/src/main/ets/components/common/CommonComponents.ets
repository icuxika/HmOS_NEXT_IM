@Component
struct TabHead {
  build() {
    Row() {
      Text("消息").fontSize(24).fontWeight(FontWeight.Normal)
      Blank()
      Image($r("app.media.plus")).width(24).fillColor(Color.Black)
    }
    .padding({ left: 16, right: 16, top: 16 })
    .width("100%")
  }
}


@Component
struct RefreshContainer {
  @State isStopSwiperSlide: boolean = false;

  @Builder
  customBuilder() {
  }

  @BuilderParam customBuilderParam: () => void = this.customBuilder
  @BuilderParam customChangeThisBuilderParam: () => void = this.customBuilder

  build() {
    Refresh({ refreshing: $$this.isStopSwiperSlide }) {
      this.customBuilderParam()
      this.customChangeThisBuilderParam()
    }
    .onRefreshing(() => {
      setTimeout(() => {
        this.isStopSwiperSlide = false
      }, 2000)
    })
    .backgroundColor("#f3f3f3")
    .refreshOffset(64)
    .pullToRefresh(true)
    .width('100%')
    .height('100%')
  }
}

export {
  TabHead, RefreshContainer
}