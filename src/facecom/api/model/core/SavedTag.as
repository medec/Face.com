package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class SavedTag {
		public var tid : String;
		public var detected_tid : String;

		public function SavedTag(data:Object) {
			tid = data['tid'];
			detected_tid = data['detected_tid'];
		}
	}
}
