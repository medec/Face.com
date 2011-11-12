package facecom.api.model.results {
	import facecom.api.model.core.Photo;
	import facecom.api.model.core.Usage;
	/**
	 * @author medec
	 */
	public class FacesDetectResult extends Result {
		
		public var photos:Vector.<Photo> = new Vector.<Photo>();
		
		public var usage : Usage;

		public function FacesDetectResult(data : Object) {
			
			super(data);

			Result.arrayToVector(data['photos'], photos, Photo);
		
			usage = new Usage(data['usage']);
		}
	}
}
