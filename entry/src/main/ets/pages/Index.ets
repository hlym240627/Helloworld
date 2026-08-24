import { StatCard } from '../components/StatCard'
import { SideMenuItem } from '../components/SideMenuItem'
import { DashboardItem } from '../components/DashboardItem'

interface MenuItem {
  id: string
  title: string
  icon: Resource
}

interface StatInfo {
  id: string
  label: string
  value: string
  color: string
}

interface DashboardInfo {
  id: string
  title: string
  status: string
  time: string
}

@Entry
@Component
struct Index {
  @State currentMenu: string = 'dashboard'
  @State currentTab: number = 0
  @State userName: string = 'Admin'
  @State isSidebarExpanded: boolean = true
  @State isDarkMode: boolean = false

  private menuItems: MenuItem[] = [
    { id: 'dashboard', title: '仪表盘', icon: $r('app.media.startIcon') },
    { id: 'users', title: '用户管理', icon: $r('app.media.startIcon') },
    { id: 'orders', title: '订单管理', icon: $r('app.media.startIcon') },
    { id: 'products', title: '商品管理', icon: $r('app.media.startIcon') },
    { id: 'settings', title: '系统设置', icon: $r('app.media.startIcon') }
  ]

  private stats: StatInfo[] = [
    { id: 'stat-1', label: '总用户数', value: '12,580', color: '#4CAF50' },
    { id: 'stat-2', label: '今日订单', value: '386', color: '#2196F3' },
    { id: 'stat-3', label: '总收入', value: '¥58,920', color: '#FF9800' },
    { id: 'stat-4', label: '待处理', value: '24', color: '#F44336' }
  ]

  private dashboardItems: DashboardInfo[] = [
    { id: 'dash-1', title: '新用户注册审核', status: '待处理', time: '10分钟前' },
    { id: 'dash-2', title: '订单 #1024 退款申请', status: '进行中', time: '30分钟前' },
    { id: 'dash-3', title: '商品库存不足预警', status: '紧急', time: '1小时前' },
    { id: 'dash-4', title: '系统更新通知', status: '已完成', time: '2小时前' },
    { id: 'dash-5', title: '客户反馈处理', status: '待处理', time: '3小时前' }
  ]

  build() {
    Column() {
      this.HeaderBuilder()
      Row() {
        this.SideBarBuilder()
        this.ContentBuilder()
      }
      .layoutWeight(1)
      this.BottomNavBuilder()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.isDarkMode ? '#1A1A2E' : '#F5F5F5')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.startIcon'))
        .width(32)
        .height(32)
        .borderRadius(16)
        .margin({ right: 12 })

      Text('后台管理系统')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')

      Blank()

      Text('欢迎, ' + this.userName)
        .fontSize(14)
        .fontColor('#E0E0E0')
        .margin({ right: 16 })

      Row() {
        Text(this.isDarkMode ? '🌙' : '☀️')
          .fontSize(20)
        Text(this.isDarkMode ? '夜间' : '日间')
          .fontSize(14)
          .fontColor('#E0E0E0')
          .margin({ left: 6 })
      }
      .width(80)
      .height(32)
      .borderRadius(16)
      .backgroundColor(this.isDarkMode ? '#4A4A6A' : '#555555')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .margin({ right: 16 })
      .onClick(() => {
        this.isDarkMode = !this.isDarkMode
      })

      Image($r('app.media.startIcon'))
        .width(32)
        .height(32)
        .borderRadius(16)
    }
    .width('100%')
    .height(56)
    .padding({ left: 20, right: 20 })
    .backgroundColor(this.isDarkMode ? '#16213E' : '#333333')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  SideBarBuilder() {
    Column() {
      Row() {
        Image($r('app.media.startIcon'))
          .width(20)
          .height(20)
          .margin({ right: this.isSidebarExpanded ? 12 : 0 })
        if (this.isSidebarExpanded) {
          Text('导航菜单')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.isDarkMode ? '#AAAAAA' : '#666666')
        }
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 16, bottom: 8 })
      .alignItems(VerticalAlign.Center)

      Divider().margin({ bottom: 8 })

      ForEach(this.menuItems, (item: MenuItem) => {
        SideMenuItem({
          title: item.title,
          icon: item.icon,
          isActive: this.currentMenu === item.id,
          isExpanded: this.isSidebarExpanded,
          isDarkMode: this.isDarkMode,
          onMenuClick: () => {
            this.currentMenu = item.id
          }
        })
      }, (item: MenuItem) => item.id)

      Blank()

      Row() {
        Image($r('app.media.startIcon'))
          .width(20)
          .height(20)
          .fillColor(this.isDarkMode ? '#CCCCCC' : '#999999')
          .rotate({ angle: this.isSidebarExpanded ? 0 : 180 })
          .onClick(() => {
            this.isSidebarExpanded = !this.isSidebarExpanded
          })
      }
      .width('100%')
      .height(48)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .width(this.isSidebarExpanded ? 220 : 64)
    .height('100%')
    .backgroundColor(this.isDarkMode ? '#1A1A2E' : '#FFFFFF')
    .shadow({ radius: 2, color: this.isDarkMode ? '#0a000000' : '#1a000000', offsetX: 2, offsetY: 0 })
  }

  @Builder
  ContentBuilder() {
    Column() {
      Row() {
        Text(this.menuItems.filter((item: MenuItem) => item.id === this.currentMenu)[0].title)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.isDarkMode ? '#E0E0E0' : '#333333')

        Blank()

        Text('2026年8月1日')
          .fontSize(14)
          .fontColor(this.isDarkMode ? '#888888' : '#999999')
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      Grid() {
        ForEach(this.stats, (stat: StatInfo) => {
          GridItem() {
            StatCard({
              label: stat.label,
              value: stat.value,
              accentColor: stat.color,
              isDarkMode: this.isDarkMode
            })
          }
        }, (stat: StatInfo) => stat.id)
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(12)
      .rowsGap(12)
      .width('100%')
      .height(180)
      .padding({ left: 20, right: 20 })

      Row() {
        Text('近期动态')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
           .fontColor(this.isDarkMode ? '#E0E0E0' : '#333333')
      }
      .width('100%')
      .padding({ left: 20, top: 16, bottom: 8 })

      List({ space: 8 }) {
        ForEach(this.dashboardItems, (item: DashboardInfo) => {
          ListItem() {
            DashboardItem({
              title: item.title,
              status: item.status,
              time: item.time,
              isDarkMode: this.isDarkMode
            })
          }
        }, (item: DashboardInfo) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 20, right: 20, bottom: 8 })
      .edgeEffect(EdgeEffect.Spring)
    }
    .layoutWeight(1)
    .height('100%')
    .backgroundColor(this.isDarkMode ? '#1A1A2E' : '#F5F5F5')
  }

  @Builder
  BottomNavBuilder() {
    Row() {
      ForEach(['首页', '数据', '消息', '我的'], (tab: string, index: number) => {
        Column() {
          Image($r('app.media.startIcon'))
            .width(24)
            .height(24)
            .fillColor(this.currentTab === index ? '#4CAF50' : '#999999')
          Text(tab)
            .fontSize(12)
            .fontColor(this.currentTab === index ? '#4CAF50' : '#999999')
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .height('100%')
        .onClick(() => {
          this.currentTab = index
        })
      }, (tab: string) => tab)
    }
    .width('100%')
    .height(56)
    .backgroundColor(this.isDarkMode ? '#16213E' : '#FFFFFF')
    .shadow({ radius: 8, color: '#1a000000', offsetX: 0, offsetY: -2 })
  }
}