package example {
	import flash.display.Bitmap;
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;

	import flash.display.Sprite;
	import flash.events.IOErrorEvent;


	/**
	 * @author medec
	 */
	public class FacesGroupBitmapDataExample extends Sprite {
		private var faceAPI : FaceAPI;
		
		[Embed(source="../assets/01.jpg")]
		private var examplePhotoClass : Class;

		public function FacesGroupBitmapDataExample() {
			init();
		}

		private function init() : void {
			faceAPI = new FaceAPI('228f62cbac5d536b33318268c6f3bb7d', '848436c04c57ea431965f0a7a76557de');
			
			faceAPI.addEventListener(IOErrorEvent.IO_ERROR, faceAPIIOError);
			faceAPI.addEventListener(FaceAPIEvent.FACES_GROUP, facesGroupHandler);
			
			
			testSendPhotoBitmapData();			
		}

		private function testSendPhotoBitmapData() : void {
			var exampleBitmap:Bitmap = new examplePhotoClass() as Bitmap;
			
			faceAPI.faces.group(null, exampleBitmap.bitmapData, ['all@testnamespace'], 'testnamespace');
		}

		private function facesGroupHandler(event : FaceAPIEvent) : void {
			trace('group: ' + event.data);
		}

		private function faceAPIIOError(event : IOErrorEvent) : void {
			trace('error', event);
		}
	}
}
