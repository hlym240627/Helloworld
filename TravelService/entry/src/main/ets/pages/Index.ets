interface BannerItem {
  id: string
  title: string
  image: Resource
}

interface TripItem {
  id: string
  title: string
  date: string
  destination: string
  status: string
}

interface AttractionItem {
  id: string
  name: string
  location: string
  rating: string
  price: string
  tag: string
}

interface MenuItem {
  id: string
  title: string
}

@Component
struct HomePage {
  @State bannerIndex: number = 0
  @State banners: BannerItem[] = [
    { id: '1', title: '三亚阳光海滩', image: $r('app.media.icon') },
    { id: '2', title: '丽江古城风光', image: $r('app.media.icon') },
    { id: '3', title: '张家界奇峰异石', image: $r('app.media.icon') }
  ]
  @State hotDestinations: string[] = ['三亚', '丽江', '成都', '杭州', '北京', '厦门']

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Swiper() {
          ForEach(this.banners, (item: BannerItem) => {
            Column() {
              Image(item.image)
                .width('100%')
                .height(180)
                .borderRadius(8)
              Text(item.title)
                .fontSize(16)
                .fontColor(Color.White)
                .margin({ top: -40 })
                .padding({ left: 12 })
            }
          }, (item: BannerItem) => item.id)
        }
        .autoPlay(true)
        .interval(3000)
        .height(180)
        .borderRadius(8)
        .onChange((index: number) => {
          this.bannerIndex = index
        })

        Column({ space: 8 }) {
          Text('热门目的地')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
            ForEach(this.hotDestinations, (city: string, index: number) => {
              Text(city)
                .fontSize(14)
                .fontColor('#333333')
                .padding({ left: 16, right: 16, top: 8, bottom: 8 })
                .backgroundColor('#F5F5F5')
                .borderRadius(20)
                .margin({ right: 8, bottom: 8 })
            }, (city: string, index: number) => `${city}-${index}`)
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16 })

        Column({ space: 8 }) {
          Text('推荐路线')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Column({ space: 8 }) {
            Row() {
              Column({ space: 4 }) {
                Text('三亚5日游')
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                Text('阳光海滩·热带雨林·海鲜美食')
                  .fontSize(12)
                  .fontColor('#999999')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text('¥2999起')
                .fontSize(14)
                .fontColor('#FF6B35')
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)

            Row() {
              Column({ space: 4 }) {
                Text('丽江4日游')
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                Text('古城漫步·玉龙雪山·纳西风情')
                  .fontSize(12)
                  .fontColor('#999999')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text('¥2599起')
                .fontSize(14)
                .fontColor('#FF6B35')
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)

            Row() {
              Column({ space: 4 }) {
                Text('成都3日游')
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                Text('熊猫基地·宽窄巷子·火锅美食')
                  .fontSize(12)
                  .fontColor('#999999')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text('¥1899起')
                .fontSize(14)
                .fontColor('#FF6B35')
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
          }
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .padding({ top: 12, bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}

@Component
struct TripPage {
  @State trips: TripItem[] = [
    { id: '1', title: '三亚度假之旅', date: '2026-08-15 ~ 2026-08-19', destination: '三亚', status: '即将出发' },
    { id: '2', title: '丽江古城行', date: '2026-07-01 ~ 2026-07-04', destination: '丽江', status: '已完成' },
    { id: '3', title: '成都美食游', date: '2026-06-10 ~ 2026-06-12', destination: '成都', status: '已完成' }
  ]

  build() {
    Column() {
      Row() {
        Text('我的行程')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 8 })

      List({ space: 8 }) {
        ForEach(this.trips, (item: TripItem) => {
          ListItem() {
            Row() {
              Column({ space: 6 }) {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                Text(item.destination)
                  .fontSize(13)
                  .fontColor('#666666')
                Text(item.date)
                  .fontSize(12)
                  .fontColor('#999999')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text(item.status)
                .fontSize(12)
                .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                .borderRadius(12)
                .fontColor(item.status === '即将出发' ? '#007DFF' : '#999999')
                .backgroundColor(item.status === '即将出发' ? '#E6F0FF' : '#F5F5F5')
            }
            .width('100%')
            .padding(14)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
          }
        }, (item: TripItem) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}

@Component
struct AttractionPage {
  @State attractions: AttractionItem[] = [
    { id: '1', name: '亚龙湾', location: '三亚·亚龙湾度假区', rating: '4.8', price: '免费', tag: '海滩' },
    { id: '2', name: '玉龙雪山', location: '丽江·玉龙纳西族自治县', rating: '4.9', price: '¥240', tag: '雪山' },
    { id: '3', name: '宽窄巷子', location: '成都·青羊区', rating: '4.5', price: '免费', tag: '古镇' },
    { id: '4', name: '西湖', location: '杭州·西湖区', rating: '4.7', price: '免费', tag: '湖泊' },
    { id: '5', name: '故宫', location: '北京·东城区', rating: '4.9', price: '¥60', tag: '古迹' },
    { id: '6', name: '鼓浪屿', location: '厦门·思明区', rating: '4.6', price: '¥35', tag: '海岛' }
  ]

  build() {
    Column() {
      Row() {
        Text('热门景点')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 8 })

      List({ space: 8 }) {
        ForEach(this.attractions, (item: AttractionItem) => {
          ListItem() {
            Row() {
              Image($r('app.media.icon'))
                .width(80)
                .height(80)
                .borderRadius(8)

              Column({ space: 6 }) {
                Text(item.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                Text(item.location)
                  .fontSize(12)
                  .fontColor('#999999')

                Row({ space: 8 }) {
                  Text(item.tag)
                    .fontSize(11)
                    .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                    .borderRadius(10)
                    .fontColor('#007DFF')
                    .backgroundColor('#E6F0FF')

                  Text(item.rating)
                    .fontSize(12)
                    .fontColor('#FF9500')
                }

                Text(item.price)
                  .fontSize(14)
                  .fontColor('#FF6B35')
                  .fontWeight(FontWeight.Bold)
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .padding({ left: 12 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
          }
        }, (item: AttractionItem) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}

@Component
struct MinePage {
  @State userName: string = '旅行者'
  @State menuItems: MenuItem[] = [
    { id: '1', title: '我的订单' },
    { id: '2', title: '我的收藏' },
    { id: '3', title: '我的优惠券' },
    { id: '4', title: '常见问题' },
    { id: '5', title: '关于我们' }
  ]

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .width(56)
          .height(56)
          .borderRadius(28)

        Column({ space: 4 }) {
          Text(this.userName)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('探索世界，从这里开始')
            .fontSize(13)
            .fontColor('#999999')
        }
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 12 })
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#FFFFFF')
      .borderRadius({ bottomLeft: 12, bottomRight: 12 })

      List({ space: 1 }) {
        ForEach(this.menuItems, (item: MenuItem) => {
          ListItem() {
            Row() {
              Text(item.title)
                .fontSize(15)
                .fontColor('#333333')

              Text('>')
                .fontSize(14)
                .fontColor('#CCCCCC')
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 14, bottom: 14 })
            .justifyContent(FlexAlign.SpaceBetween)
            .backgroundColor('#FFFFFF')
          }
        }, (item: MenuItem) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .margin({ top: 12 })
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}

@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  @Builder
  TabBuilder(title: string, icon: Resource, index: number) {
    Column() {
      Image(icon)
        .width(24)
        .height(24)
        .fillColor(this.currentIndex === index ? '#007DFF' : '#999999')
      Text(title)
        .fontSize(10)
        .margin({ top: 2 })
        .fontColor(this.currentIndex === index ? '#007DFF' : '#999999')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBuilder('首页', $r('app.media.icon'), 0))

        TabContent() {
          TripPage()
        }
        .tabBar(this.TabBuilder('行程', $r('app.media.icon'), 1))

        TabContent() {
          AttractionPage()
        }
        .tabBar(this.TabBuilder('景点', $r('app.media.icon'), 2))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('我的', $r('app.media.icon'), 3))
      }
      .scrollable(false)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }
}
