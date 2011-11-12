package facecom.api.events {
	import facecom.api.model.results.FacesRecognizeResult;

	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class AccountEvent extends Event {
		
		public static const RECOGNIZE: String = 'result';
		public var data : FacesRecognizeResult;

		public function AccountEvent(type : String, data : FacesRecognizeResult, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}
