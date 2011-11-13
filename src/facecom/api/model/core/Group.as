package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class Group {
		public var uid : String;
		public var gid : uint;
		public var tids : Vector.<String> = new Vector.<String>();

		public function Group(data : Object) {
			uid = data['uid'];
			gid = data['gid'];


			var from:Array = data['tids'];			

			if (data['tids']) {
				var tmp_l : uint = from.length;

				for (var i : int = 0; i < tmp_l; i++) {
					tids.push(String(from[i]));
				}
			}
		}
	}
}
