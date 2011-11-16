package facecom.api {
	import facecom.api.proxy.TagsProxy;
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

		private var _faces : FacesProxy;
		private var _account : AccountProxy;
		private var _tags:TagsProxy;
		
		public function FaceAPI(apiKey : String, apiSecret : String = '') {
			this.apiKey = apiKey;
			this.apiSecret = apiSecret;

			_faces = new FacesProxy(this);
			_account = new AccountProxy(this);
			_tags = new TagsProxy(this);

			jpgEncoder = new JPGEncoder(40);
		}

		public function get faces() : FacesProxy {
			return _faces;
		}

		public function get account() : AccountProxy {
			return _account;
		}

		public function get tags() : TagsProxy {
			return _tags;
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

		facecom function faceIOErrorHandler(event : IOErrorEvent) : void {
			dispatchEvent(event);
		}

	}
}
