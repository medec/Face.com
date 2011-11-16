package facecom.api {
	import cmodule.aircall.CLibInit;

	import facecom.api.proxy.AccountProxy;
	import facecom.api.proxy.FacesProxy;
	import facecom.api.proxy.TagsProxy;

	import ru.inspirit.net.MultipartURLLoader;

	import com.adobe.serialization.json.JSONDecoder;

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;

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
		private var _faces : FacesProxy;
		private var _account : AccountProxy;
		private var _tags : TagsProxy;
		facecom var jpeglib : Object;
		private var jpeginit : CLibInit = new CLibInit();

		public function FaceAPI(apiKey : String, apiSecret : String = '') {
			this.apiKey = apiKey;
			this.apiSecret = apiSecret;

			_faces = new FacesProxy(this);
			_account = new AccountProxy(this);
			_tags = new TagsProxy(this);

			if (!jpeglib) {
				jpeglib = jpeginit.init();
			}
		}

		facecom function getJPEG(photo : BitmapData) : ByteArray {
			var photoFile : ByteArray = new ByteArray();
			photoFile.position = 0;

			var imgData : ByteArray = photo.getPixels(photo.rect);

			jpeglib.encode(imgData, photoFile, photo.width, photo.height, 40);
			
			photoFile.position = 0;

			return photoFile;
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

		facecom function getResultDataToObject(loader : MultipartURLLoader) : Object {
			return new JSONDecoder(loader.loader.data, true).getValue();
		}

		facecom function faceIOErrorHandler(event : IOErrorEvent) : void {
			dispatchEvent(event);
		}
	}
}
