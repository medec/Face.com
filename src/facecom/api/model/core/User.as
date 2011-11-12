package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class User {
		
		public var uid:String;
		public var training_set_size:uint;
		public var last_trained : uint;
		public var training_in_progress : Boolean;

		public function User(data:Object) {
			uid = data['uid'];
			training_set_size = data['training_set_size'];
			last_trained = data['last_trained'];
			training_in_progress = data['training_in_progress'];
		}
	}
}
