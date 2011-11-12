package facecom.api.model.results {
	import facecom.api.model.core.User;
	/**
	 * @author medec
	 */
	public class StatusResult extends Result {
		
		public var user_statuses : Vector.<User> = new Vector.<User>();

		public function StatusResult(data: Object) {
			super(data);
			Result.arrayToVector(data['user_statuses'], user_statuses, User);
		}

	}
}
