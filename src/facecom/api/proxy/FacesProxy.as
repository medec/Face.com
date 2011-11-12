package facecom.api.proxy {
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;
	import facecom.api.facecom;
	import facecom.api.model.results.FacesRecognizeResult;
	import facecom.api.model.results.FacesStatusResult;

	import ru.inspirit.net.MultipartURLLoader;

	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;
	/**
	 * @author medec
	 */
	 
	use namespace facecom;
	 
	public class FacesProxy extends Proxy {
		public function FacesProxy(clientAPI : FaceAPI) {
			super(clientAPI);
		}
		
		public function recognize(photoURLs:Array = null, photo : BitmapData = null, uids:Array = null, names:String = '', detector:String = 'Aggressive', attributes:String = 'all') : void {
			
			
			var ml : MultipartURLLoader = clientAPI.createLoader();

			ml.addEventListener(Event.COMPLETE, recognizeCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, clientAPI.faceIOErrorHandler);
			if(photoURLs) {
				ml.addVariable('urls', photoURLs.join(','));
			}
			else if(photo) {
				var photoFile : ByteArray = clientAPI.jpgEncoder.encode(photo);
				ml.addFile(photoFile, 'screenshot.jpg');
			}
			
			ml.addVariable('uids', uids.join(','));
			ml.addVariable('namespace', names);
			ml.addVariable('detector', detector);
			ml.addVariable('attributes', attributes);

			ml.load(FaceAPI.API_DOMAIN + 'faces/recognize.json');
		}

		private function recognizeCompleteHandler(event : Event) : void {
			var result : FacesRecognizeResult = new FacesRecognizeResult(clientAPI.getResultDataToObject(event.currentTarget as MultipartURLLoader));
			
			clientAPI.dispatchEvent(new FaceAPIEvent(FaceAPIEvent.FACES_RECOGNIZE, result));
		}
		
		public function status(uid:String, names:String):void {
			var ml : MultipartURLLoader = clientAPI.createLoader();
			ml.addEventListener(Event.COMPLETE, tagStatusCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, clientAPI.faceIOErrorHandler);

			//ml.addVariable('uids', 'all@' + names);
			ml.addVariable('uids', uid);
			ml.addVariable('namespace', names);

			ml.load(FaceAPI.API_DOMAIN + 'faces/status.json');
			
		}

		private function tagStatusCompleteHandler(event : Event) : void {
			var result : FacesStatusResult = new FacesStatusResult(clientAPI.getResultDataToObject(event.currentTarget as MultipartURLLoader));

			clientAPI.dispatchEvent(new FaceAPIEvent(FaceAPIEvent.FACES_STATUS, result));
		}
	}
}
