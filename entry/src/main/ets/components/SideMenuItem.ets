@Component
export struct SideMenuItem {
  @Prop title: string = ''
  @Prop icon: Resource = $r('app.media.startIcon')
  @Prop isActive: boolean = false
  @Prop isExpanded: boolean = true
  @Prop isDarkMode: boolean = false
  onMenuClick: () => void = () => {}

  build() {
    Row() {
      Image(this.icon)
        .width(20)
        .height(20)
        .fillColor(this.isActive ? '#4CAF50' : (this.isDarkMode ? '#AAAAAA' : '#666666'))
        .margin({ right: this.isExpanded ? 12 : 0 })

      if (this.isExpanded) {
        Text(this.title)
          .fontSize(14)
          .fontColor(this.isActive ? '#4CAF50' : (this.isDarkMode ? '#AAAAAA' : '#666666'))
          .fontWeight(this.isActive ? FontWeight.Medium : FontWeight.Normal)
      }
    }
    .width('100%')
    .height(44)
    .padding({ left: 16, right: 16 })
    .backgroundColor(this.isActive ? (this.isDarkMode ? '#1B3A2D' : '#E8F5E9') : (this.isDarkMode ? '#1A1A2E' : '#FFFFFF'))
    .borderRadius(8)
    .alignItems(VerticalAlign.Center)
    .justifyContent(this.isExpanded ? FlexAlign.Start : FlexAlign.Center)
    .onClick(() => {
      this.onMenuClick()
    })
  }
}
