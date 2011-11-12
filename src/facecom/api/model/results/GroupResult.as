package facecom.api.model.results {
	import facecom.api.model.core.Group;
	import facecom.api.model.core.Photo;
	import facecom.api.model.core.Usage;
	/**
	 * @author medec
	 */
	public class GroupResult extends Result {
		
		public var groups:Vector.<Group>;
		
		public var photos : Vector.<Photo>;
		public var usage : Usage;
	}
}
