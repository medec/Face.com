package facecom.api.model.results {
	import facecom.api.model.core.Photo;
	/**
	 * @author medec
	 */
	public class TagsGetResult extends Result {
		public var photos : Vector.<Photo>;

		public function TagsGetResult(data:Object) {
			super(data);
			
			Result.arrayToVector(data['photos'], photos, Photo);
		}
	}
}
