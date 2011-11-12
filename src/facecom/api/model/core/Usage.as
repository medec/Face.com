package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class Usage {
		
		public var used:uint;
		public var remaining:String;
		public var limit:String;
		public var reset_time_text:String;
		public var reset_time:uint;
		
		public var namespace_used:uint;
		public var namespace_remaining:uint;
		public var namespace_limit : uint;

		public function Usage(data : Object) {
			used = data['used'];
			remaining = data['remaining'];
			limit = data['limit'];
			reset_time_text = data['reset_time_text'];
			reset_time = data['reset_time'];
			namespace_used = data['namespace_used'];
			namespace_remaining = data['namespace_remaining'];
			namespace_limit = data['namespace_limit'];
			
		}
		
	}
}
