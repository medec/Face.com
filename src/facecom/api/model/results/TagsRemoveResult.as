package facecom.api.model.results {
	import facecom.api.model.core.RemoveTag;
	/**
	 * @author medec
	 */
	public class TagsRemoveResult extends Result {
		public var saved_tags : Vector.<RemoveTag>;
		public var message : String;
	}
}
