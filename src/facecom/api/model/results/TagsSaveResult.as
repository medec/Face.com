package facecom.api.model.results {
	import facecom.api.model.core.SavedTag;
	/**
	 * @author medec
	 */
	public class TagsSaveResult extends Result {
		public var saved_tags:Vector.<SavedTag> = new Vector.<SavedTag>();
		
		public var message : String;

		public function TagsSaveResult(data : Object) {
			super(data);
			
			Result.arrayToVector(data['saved_tags'], saved_tags, SavedTag);
			
			message = data['message'];
		}
	}
}
