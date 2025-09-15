import { NavigationService } from '../services/NavigationService';
import { ProgressListPage } from './ProgressListPage';
import { RingPage } from './RingPage';
import { ScaleRingPage } from './ScaleRingPage';

@Entry
@Component
struct Index {
	navigationService: NavigationService = NavigationService.getInstance();

	@Builder
	routeMap(name: string) {
		NavDestination() {
			if (name === 'ProgressList') {
				ProgressListPage()
			} else if (name === 'ScaleRing') {
				ScaleRingPage()
			} else if (name === 'Ring') {
				RingPage()
			}
		}
		.onBackPressed( ()=>true )
		.hideTitleBar(true)
	}

	build() {
		Navigation(this.navigationService.pageInfos) {
			ProgressListPage()
		}
		.mode(NavigationMode.Stack)
		.navDestination(this.routeMap)
		.ignoreLayoutSafeArea()
		.hideTitleBar(true)
		.width('100%')
		.height('100%')
	}
}
