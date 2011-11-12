package facecom.api {
	import facecom.api.model.core.Tag;
	import facecom.api.model.events.FaceEvent;
	import facecom.api.model.results.AccountLimitsResult;
	import facecom.api.model.results.RecognizeResult;
	import facecom.api.model.results.StatusResult;
	import facecom.api.model.results.TagsSaveResult;
	import facecom.api.model.results.TrainResult;

	import ru.inspirit.net.MultipartURLLoader;

	import com.adobe.images.JPGEncoder;
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;

	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;



	/**
	 * @author medec
	 */
	public class FaceAPI extends EventDispatcher {
		public static const API_DOMAIN : String = 'http://api.face.com/';
		
		private var apiKey : String;
		private var apiSecret : String;
		private var jpgEncoder : JPGEncoder;
		private var names : String;
		private var debugTime : int;
		private var _recognizeResult : RecognizeResult;
		private var _statusResult : StatusResult;
		private var saveUid : String;
		public function FaceAPI(apiKey:String, apiSecret:String = '', names:String='') {
			this.apiKey = apiKey;
			this.apiSecret = apiSecret;
			this.names = names;
			
			jpgEncoder = new JPGEncoder(40);
			
			accountLimits();
		}
		
		private function createLoader():MultipartURLLoader {
			var ml:MultipartURLLoader = new MultipartURLLoader();
			ml.addVariable('api_key', apiKey);
			ml.addVariable('api_secret',  apiSecret ? apiSecret : '');
			
			return ml;
		}
		
		public function recognize(photo:BitmapData):void {
			debugTime = getTimer();
			
			var photoFile:ByteArray = jpgEncoder.encode(photo);
			
			var ml:MultipartURLLoader = createLoader();
			
			ml.addEventListener(Event.COMPLETE, recognizeCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);
			ml.addFile(photoFile, 'screenshot.jpg');
			
			ml.addVariable('uids', 'all@'+names);
			ml.addVariable('namespace', names);
			ml.addVariable('detector', 'Aggressive');
			ml.addVariable('attributes', 'all');
						
			ml.load(API_DOMAIN + 'faces/recognize.json');
		}

		private function faceIOErrorHandler(event : IOErrorEvent) : void {
			trace('blad polaczenia');
		}

		private function recognizeCompleteHandler(event : Event) : void {
			trace('complete', (getTimer() - debugTime));
			trace((event.currentTarget as MultipartURLLoader).loader.data);
			var tmp:int = getTimer();
			
			var result:RecognizeResult = new RecognizeResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			
			if(result.photos[0].tags.length >= 1) {
				trace('wykryto twarz');
				_recognizeResult = result;
				dispatchEvent(new FaceEvent(FaceEvent.FACE_RECOGNIZE));
			}
			else {
				dispatchEvent(new FaceEvent(FaceEvent.FACE_NOT_FOUND));
			}
			
			
			//trace(result.photos[0].tags[0].uids[0].uid);
			//trace(result.photos[0].tags[0].uids[0].confidence);
		}
		
		public function accountLimits():void {
			debugTime = getTimer();
			
			var ml:MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, accountLimitsCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);
			
					
			ml.load(API_DOMAIN + 'account/limits.json');
			
		}

		private function accountLimitsCompleteHandler(event : Event) : void {
			var result:AccountLimitsResult = new AccountLimitsResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			
			trace(result);
		}

		public function get recognizeResult() : RecognizeResult {
			return _recognizeResult;
		}

		public function saveTag(userName : String, tag : Tag) : void {
			var ml:MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagSaveCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);
			
			ml.addVariable('tids', tag.tid);
			
			saveUid = userName + '@' + names;
			ml.addVariable('uid', saveUid);
			
			
			ml.load(FaceAPI.API_DOMAIN + 'tags/save.json');
		}

		private function tagSaveCompleteHandler(event : Event) : void {
			var result:TagsSaveResult = new TagsSaveResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			trace('result: ' + (result));
			
			var ml:MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagTrainCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);
			
			ml.addVariable('namespace', names);
			
			ml.addVariable('uids', saveUid);
			
			
			ml.load(FaceAPI.API_DOMAIN + 'faces/train.json');
			
			//dispatchEvent(new FaceEvent(FaceEvent.FACE_SAVE));
			
			
		}

		private function tagTrainCompleteHandler(event : Event) : void {
			var result:TrainResult = new TrainResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			trace('result: ' + (result));
			
			dispatchEvent(new FaceEvent(FaceEvent.FACE_SAVE));
		}

		public function status() : void {
			var ml:MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagStatusCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);
			
			ml.addVariable('uids', 'all@' + names);
			ml.addVariable('namespace', names);
			
			
			
			ml.load(FaceAPI.API_DOMAIN + 'faces/status.json');
			
		}

		private function tagStatusCompleteHandler(event : Event) : void {
			var result:StatusResult = new StatusResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			
			this._statusResult = result;
			
			dispatchEvent(new FaceEvent(FaceEvent.FACE_STATUS));
		}

		public function get statusResult() : StatusResult {
			return _statusResult;
		}
	}
}
