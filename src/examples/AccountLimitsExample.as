package examples {
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;

	import flash.display.Sprite;
	import flash.events.IOErrorEvent;


	/**
	 * @author medec
	 */
	public class AccountLimitsExample extends Sprite {
		private var faceAPI : FaceAPI;

		public function AccountLimitsExample() {
			init();
		}

		private function init() : void {
			faceAPI = new FaceAPI('228f62cbac5d536b33318268c6f3bb7d', '848436c04c57ea431965f0a7a76557de');
			
			faceAPI.addEventListener(IOErrorEvent.IO_ERROR, faceAPIIOError);
			faceAPI.addEventListener(FaceAPIEvent.ACCOUNT_LIMITS, accountLimitsHandler);
			
			//faceAPI.faces.status('all@testnamespace', 'testnamespace');
			faceAPI.account.limits();
			
		}

		private function accountLimitsHandler(event : FaceAPIEvent) : void {
			trace('limits: ' + event.data);
		}

		private function faceAPIIOError(event : IOErrorEvent) : void {
			trace('error', event);
		}
	}
}
