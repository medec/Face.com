package facecom.api.model.results {
	/**
	 * @author medec
	 */
	public class Result {
		public var status:String;
		public var error_code:uint;
		public var error_message : String;

		public function Result(data:Object) {
			status = data['status'];
			error_code = data['error_code'];
			error_message = data['error_message'];
		}

		
		public static function arrayToVector(from : Array, to:*, type:Class) : void {
			if(!from) return;
					
			var tmp_l : uint = from.length;

			for (var i : int = 0; i < tmp_l; i++) {
				to.push(new (type)(from[i]));
			}
		}
	}
}
