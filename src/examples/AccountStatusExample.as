package examples {
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;

	import flash.display.Sprite;
	import flash.events.IOErrorEvent;


	/**
	 * @author medec
	 */
	public class AccountStatusExample extends Sprite {
		private var faceAPI : FaceAPI;
		public function AccountStatusExample() {
			init();
		}

		private function init() : void {
			faceAPI = new FaceAPI('228f62cbac5d536b33318268c6f3bb7d', '848436c04c57ea431965f0a7a76557de');
			
			faceAPI.addEventListener(IOErrorEvent.IO_ERROR, faceAPIIOError);
			faceAPI.addEventListener(FaceAPIEvent.FACES_STATUS, faceStatusHandler);
			
			faceAPI.faces.status('all@testnamespace', 'testnamespace');
		}

		private function faceStatusHandler(event : FaceAPIEvent) : void {
			trace('status: ' + event.data);
		}

		private function faceAPIIOError(event : IOErrorEvent) : void {
			trace('error', event);
		}
	}
}
