package facecom.api.events {
	import facecom.api.model.results.FacesStatusResult;
	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class FaceStatusEvent extends Event {
		
		public static const STATUS : String = 'status';
		public var data : FacesStatusResult;
		
		public function FaceStatusEvent(type : String, data:FacesStatusResult, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}
