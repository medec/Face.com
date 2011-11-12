package facecom.api.model.results {
	import facecom.api.model.core.Photo;
	import facecom.api.model.core.Usage;
	/**
	 * @author medec
	 */
	public class DetectResult extends Result {
		
		public var photos:Vector.<Photo>;
		
		public var usage:Usage;
	}
}
