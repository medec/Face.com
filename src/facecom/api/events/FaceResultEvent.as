package facecom.api.events {
	import facecom.api.model.results.FacesRecognizeResult;
	import facecom.api.model.results.FacesStatusResult;
	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class FaceResultEvent extends Event {
		
		public static const RECOGNIZE: String = 'result';
		public var data : FacesRecognizeResult;

		public function FaceResultEvent(type : String, data : FacesRecognizeResult, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}
