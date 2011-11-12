package example {
	import facecom.api.events.FaceStatusEvent;
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceEvent;
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
			faceAPI = new FaceAPI('YOUR_API_KEY', 'YOUR_SECRET_CODE', 'YOUR_DEFAULT_NAMESPACE');
			faceAPI.addEventListener(IOErrorEvent.IO_ERROR, faceAPIIOError);
			faceAPI.addEventListener(FaceStatusEvent.STATUS, faceStatusHandler);
			
			faceAPI.faces.status('all@testnamespace', 'testnamespace');
		}

		private function faceStatusHandler(event : FaceStatusEvent) : void {
			trace(event.data);
		}

		private function faceAPIIOError(event : IOErrorEvent) : void {
			trace('error', event);
		}
	}
}
