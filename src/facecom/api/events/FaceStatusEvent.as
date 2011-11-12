package facecom.api.events {
	import facecom.api.model.results.StatusResult;
	import flash.events.Event;

	/**
	 * @author medec
	 */
	public class FaceStatusEvent extends Event {
		
		public static const STATUS : String = 'status';
		public var data : StatusResult;
		
		public function FaceStatusEvent(type : String, data:StatusResult, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}
