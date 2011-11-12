package facecom.api {
	import facecom.api.events.FaceStatusEvent;
	import facecom.api.model.core.Tag;
	import facecom.api.model.results.FacesRecognizeResult;
	import facecom.api.model.results.FacesStatusResult;
	import facecom.api.model.results.FacesTrainResult;
	import facecom.api.model.results.TagsSaveResult;
	import facecom.api.proxy.AccountProxy;
	import facecom.api.proxy.FacesProxy;

	import ru.inspirit.net.MultipartURLLoader;

	import com.adobe.images.JPGEncoder;
	import com.adobe.serialization.json.JSONDecoder;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;


	[Event(name="facesDetect", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="facesRecognize", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="facesGroup", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="facesTrain", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="facesStatus", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="tagsGet", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="tagsSave", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="facesRemove", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="accountUsers", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="accountLimits", type="facecom.api.events.FaceAPIEvent")]
	[Event(name="accountNamespaces", type="facecom.api.events.FaceAPIEvent")]
	
	use namespace facecom;
	/**
	 * @author medec
	 */
	public class FaceAPI extends EventDispatcher {
		public static const API_DOMAIN : String = 'http://api.face.com/';
		facecom var apiKey : String;
		facecom var apiSecret : String;
		facecom var jpgEncoder : JPGEncoder;

		private var debugTime : int;
		private var _recognizeResult : FacesRecognizeResult;
		private var _statusResult : FacesStatusResult;
		private var saveUid : String;
		
		private var _faces : FacesProxy;
		private var _account : AccountProxy;
				
		private var names : Object;

		public function FaceAPI(apiKey : String, apiSecret : String = '') {
			this.apiKey = apiKey;
			this.apiSecret = apiSecret;

			_faces = new FacesProxy(this);

			jpgEncoder = new JPGEncoder(40);
		}

		facecom function createLoader() : MultipartURLLoader {
			var ml : MultipartURLLoader = new MultipartURLLoader();
			ml.addVariable('api_key', apiKey);
			ml.addVariable('api_secret', apiSecret ? apiSecret : '');

			return ml;
		}
		
		facecom function getResultDataToObject(loader:MultipartURLLoader):Object {
			return new JSONDecoder(loader.loader.data, true).getValue();
		}

		public function saveTag(userName : String, tag : Tag) : void {
			var ml : MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagSaveCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);

			ml.addVariable('tids', tag.tid);

			saveUid = userName + '@' + names;
			ml.addVariable('uid', saveUid);

			ml.load(FaceAPI.API_DOMAIN + 'tags/save.json');
		}

		private function tagSaveCompleteHandler(event : Event) : void {
			var result : TagsSaveResult = new TagsSaveResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			trace('result: ' + (result));

			var ml : MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagTrainCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);

			ml.addVariable('namespace', names);

			ml.addVariable('uids', saveUid);

			ml.load(FaceAPI.API_DOMAIN + 'faces/train.json');

			// dispatchEvent(new FaceEvent(FaceEvent.FACE_SAVE));
		}

		private function tagTrainCompleteHandler(event : Event) : void {
			var result : FacesTrainResult = new FacesTrainResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());
			trace('result: ' + (result));

			// FIXME: dispatchEvent(new FaceAPIEvent(FaceAPIEvent.FACE_SAVE));
		}

		facecom function facesStatus(uid:String = '', names:String = '') : void {
			var ml : MultipartURLLoader = createLoader();
			ml.addEventListener(Event.COMPLETE, tagStatusCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, faceIOErrorHandler);

			//ml.addVariable('uids', 'all@' + names);
			ml.addVariable('uids', uid);
			ml.addVariable('namespace', names);

			ml.load(FaceAPI.API_DOMAIN + 'faces/status.json');
		}

		private function tagStatusCompleteHandler(event : Event) : void {
			var result : FacesStatusResult = new FacesStatusResult(new JSONDecoder((event.currentTarget as MultipartURLLoader).loader.data, true).getValue());

			this._statusResult = result;

			dispatchEvent(new FaceStatusEvent(FaceStatusEvent.STATUS, result));
		}

		public function get statusResult() : FacesStatusResult {
			return _statusResult;
		}

		public function get faces() : FacesProxy {
			return _faces;
		}

		public function get account() : AccountProxy {
			return _account;
		}

		public function faceIOErrorHandler(event : IOErrorEvent) : void {
			dispatchEvent(event);
		}
	}
}
