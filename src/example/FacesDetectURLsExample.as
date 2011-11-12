package example {
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;

	import flash.display.Sprite;
	import flash.events.IOErrorEvent;

	/**
	 * @author medec
	 */
	public class FacesDetectURLsExample extends Sprite {
		private var faceAPI : FaceAPI;

		public function FacesDetectURLsExample() {
			init();
		}

		private function init() : void {
			faceAPI = new FaceAPI('228f62cbac5d536b33318268c6f3bb7d', '848436c04c57ea431965f0a7a76557de');

			faceAPI.addEventListener(IOErrorEvent.IO_ERROR, faceAPIIOError);
			faceAPI.addEventListener(FaceAPIEvent.FACES_RECOGNIZE, faceRecognizeHandler);

			testSendPhotoURLs();
		}

		private function testSendPhotoURLs() : void {
			faceAPI.faces.detect(['http://users.telenet.be/move/supporters.jpg'], null);
		}

		private function faceRecognizeHandler(event : FaceAPIEvent) : void {
			trace('detect: ' + event.data);
		}

		private function faceAPIIOError(event : IOErrorEvent) : void {
			trace('error', event);
		}
	}
}
