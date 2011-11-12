package facecom.api.events {
	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class FaceEvent extends Event {
		
		public static const FACE_NOT_FOUND:String = 'faceNotFound';
		public static const FACE_RECOGNIZE:String = 'faceRecognize';
		public static const FACE_SAVE:String = 'faceSave';
		public static const FACE_REMOVE : String = 'faceRemove';
		public static const FACE_STATUS : String = 'faceStatus';
		
		
		public function FaceEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
