package facecom.api.model.results {
	import facecom.api.model.core.User;
	/**
	 * @author medec
	 */
	public class TrainResult extends Result {
		
		public var unchanged : Vector.<User> = new Vector.<User>();
		public var created : Vector.<User> = new Vector.<User>();

		public function TrainResult(data : Object) {
			super(data);
			
			Result.arrayToVector(data['unchanged'], unchanged, User);
			Result.arrayToVector(data['created'], unchanged, User);
		}
		
	}
}
