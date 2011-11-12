package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class UID {
		public var uid : String;
		public var confidence : uint;

		public function UID(data:Object) {
			uid = data['uid'];
			confidence = data['confidence'];
		}
	}
}
