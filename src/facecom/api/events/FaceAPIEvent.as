package facecom.api.events {
	import facecom.api.model.results.Result;
	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class FaceAPIEvent extends Event {
		
		public static const API_NOT_FOUND:String = 'apiNotFound';
		
		public static const FACES_DETECT:String = 'facesDetect';
		/**
		 * @return data RecognizeResult
		 */
		public static const FACES_RECOGNIZE:String = 'facesRecognize';
		public static const FACES_GROUP:String = 'facesGroup';
		public static const FACES_TRAIN:String = 'facesTrain';
		/**
		 * @return data StatusResult
		 */
		public static const FACES_STATUS : String = 'facesStatus';
		
		
		public static const TAGS_GET:String = 'tagsGet';
		public static const TAGS_SAVE:String = 'tagsSave';
		public static const TAGS_REMOVE : String = 'facesRemove';

		
		public static const ACCOUNT_USERS: String = 'accountUsers';
		/**
		 * @return data AccountLimitsResult
		 */
		public static const ACCOUNT_LIMITS : String = 'accountLimits';
		public static const ACCOUNT_NAMESPACES: String = 'accountNamespaces';

		public var data : Result;
		
		
		public function FaceAPIEvent(type : String, data:Result, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}
