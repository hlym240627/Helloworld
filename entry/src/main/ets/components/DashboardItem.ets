@Component
export struct DashboardItem {
  @Prop title: string = ''
  @Prop status: string = ''
  @Prop time: string = ''
  @Prop isDarkMode: boolean = false

  private getStatusColor(status: string): string {
    if (status === '紧急') {
      return '#F44336'
    }
    if (status === '进行中') {
      return '#FF9800'
    }
    if (status === '已完成') {
      return '#4CAF50'
    }
    return '#2196F3'
  }

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(14)
          .fontColor(this.isDarkMode ? '#E0E0E0' : '#333333')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(this.time)
          .fontSize(12)
          .fontColor(this.isDarkMode ? '#777777' : '#BBBBBB')
          .margin({ top: 4 })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Text(this.status)
        .fontSize(12)
        .fontColor('#FFFFFF')
        .backgroundColor(this.getStatusColor(this.status))
        .borderRadius(10)
        .padding({ left: 10, right: 10, top: 4, bottom: 4 })
    }
    .width('100%')
    .padding(14)
    .backgroundColor(this.isDarkMode ? '#16213E' : '#FFFFFF')
    .borderRadius(10)
    .alignItems(VerticalAlign.Center)
  }
}
