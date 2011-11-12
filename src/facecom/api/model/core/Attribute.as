package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class Attribute {
		
		public var value:String;
		public var confidence : uint;

		public function Attribute(data : Object) {
			value = data['value'];
			confidence = data['confidence'];
		}
	}
}
