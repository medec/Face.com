package facecom.api.model.results {
	import facecom.api.model.core.RemoveTag;
	/**
	 * @author medec
	 */
	public class TagsRemoveResult extends Result {
		public var saved_tags : Vector.<RemoveTag>;
		public var message : String;

		public function TagsRemoveResult(data:Object) {
			super(data);
			
			Result.arrayToVector(data['saved_tags'], saved_tags, RemoveTag);
			
			message = data['message'];
		}
	}
}
