@Component
export struct StatCard {
  @Prop label: string = ''
  @Prop value: string = ''
  @Prop accentColor: string = '#4CAF50'
  @Prop isDarkMode: boolean = false

  build() {
    Column() {
      Text(this.label)
        .fontSize(13)
        .fontColor(this.isDarkMode ? '#AAAAAA' : '#999999')
      Text(this.value)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.isDarkMode ? '#E0E0E0' : '#333333')
        .margin({ top: 6 })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor(this.isDarkMode ? '#16213E' : '#FFFFFF')
    .borderRadius(12)
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Center)
    .shadow({ radius: 4, color: this.isDarkMode ? '#05000000' : '#0d000000', offsetX: 0, offsetY: 2 })
    .border({ width: { left: 4 }, color: { left: this.accentColor }, radius: 12 })
  }
}
