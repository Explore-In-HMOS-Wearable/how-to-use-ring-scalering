import { ArcButton, ArcButtonOptions, ArcButtonStyleMode, ColorMetrics } from '@kit.ArkUI';
import { ProgressViewModel } from '../viewmodel/ProgressViewModel';

@Component
export struct RingPage {
  private gradientColor: LinearGradient = new LinearGradient([{ color: Color.Yellow, offset: 0.5 },
    { color: Color.Orange, offset: 1.0 }])
  @State count: number = 300000
  textTimerController: TextTimerController = new TextTimerController()
  @State format: string = 'mm:ss'
  @State currCount : number = 0
  progressVm : ProgressViewModel = new ProgressViewModel()

  onBackPress(): boolean | void {
    this.textTimerController.reset()
    this.textTimerController.pause()
  }

  build() {
    Stack() {
      Progress({ value: 0, total: 300, type: ProgressType.Ring })
        .width('100%')
        .style({ strokeWidth: 12 })
        .color(this.gradientColor)
        .width('100%')
        .zIndex(3)
        .value(this.currCount)

      Text('Break')
        .fontSize(28)
        .fontWeight(FontWeight.Bolder)
        .zIndex(3)

      TextTimer({ isCountDown: true, count: this.count, controller: this.textTimerController })
        .format(this.format)
        .fontColor(Color.White)
        .fontSize(48)
        .onTimer((utc: number, elapsedTime: number) => {
          console.info('textTimer notCountDown utc is: ' + utc + ', elapsedTime: ' + elapsedTime)
          this.currCount = elapsedTime
        })
        .onAppear(()=>{
          this.textTimerController.start()
        })
        .fontWeight(FontWeight.Bolder)
        .offset({x: 0, y: -60})
        .zIndex(3)

      ArcButton({
        options: new ArcButtonOptions({
          label: 'EXIT',
          styleMode: ArcButtonStyleMode.CUSTOM,
          backgroundColor: ColorMetrics.resourceColor(Color.Orange),
          onClick: () => {
            this.progressVm.navigateToPage('ProgressList')
          }
        })
      })
        .offset({x: 0, y: 68})
        .zIndex(3)
    }
  }
}