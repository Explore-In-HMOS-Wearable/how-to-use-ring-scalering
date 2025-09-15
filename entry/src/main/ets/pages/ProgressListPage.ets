import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute, ComponentContent } from '@kit.ArkUI';
import { ProgressViewModel } from '../viewmodel/ProgressViewModel';

@Builder
function buildText() {
  Column() {
    Text('Select\nProgress')
      .fontSize(28)
      .fontWeight(FontWeight.Bolder)
      .fontColor(Color.White)
  }
  .margin(6)
}

@Component
export struct ProgressListPage {
  context: UIContext = this.getUIContext()
  header: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));
  progressVm : ProgressViewModel = new ProgressViewModel()

  progressTypes: string[] = [
  'ScaleRing',
  'Ring'
];

  build() {
    Stack() {
      ArcList({
        initialIndex: 0, header: this.header
      }) {
        ForEach(this.progressTypes, (item: string, index) => {
          ArcListItem() {
            Row({space: 20}) {
              Text(item)
                .fontSize(22)
                .fontColor('#ffeceaea')
                .fontWeight(FontWeight.Bold)
            }
            .padding({
              left: 26,
              bottom: 12,
              top: 12,
              right: 26,
            })
            .backgroundColor('#7ab06b3e')
            .width('100%')
            .height('100px')
            .borderRadius(48)
            .borderWidth(1)
            .borderColor('#ffeceaea')
          }
          .onClick(() => {
            if(item === 'ScaleRing') {
              this.progressVm.navigateToPage('ScaleRing')
            } else {
              this.progressVm.navigateToPage('Ring')
            }
          })
          .width('90%')
          .margin({ bottom: 10 })
        }, (item: string) => item);
      }
      .scrollBar(BarState.Off)
      .zIndex(2)
      .margin({top: 6})
      .padding({top:8, bottom: 8})
      .height('100%')
      .width('100%')
    }
  }
}