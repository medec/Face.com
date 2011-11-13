package facecom.api.model.results {
	import facecom.api.model.core.Group;
	import facecom.api.model.core.Photo;
	import facecom.api.model.core.Usage;
	/**
	 * @author medec
	 */
	public class FacesGroupResult extends Result {
		
		public var groups:Vector.<Group>;
		
		public var photos : Vector.<Photo>;
		public var usage : Usage;

		public function FacesGroupResult(data:Object) {
			super(data);
			
			Result.arrayToVector(data['groups'], groups, Group);
			Result.arrayToVector(data['photos'], photos, Photo);
			
			usage = new Usage(data['usage']);
		}
	}
}
