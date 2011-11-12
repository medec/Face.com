package facecom.api.model.core {
	import facecom.api.model.results.Result;
	/**
	 * @author medec
	 */
	public class Photo {
		
		public var url:String;
		public var pid:String;
		public var width:uint;
		public var height:uint;
		
		public var tags : Vector.<Tag> = new Vector.<Tag>();

		public function Photo(data : Object) {
			url = data['url'];
			pid = data['pid'];
			width = data['width'];
			height = data['height'];
			
			Result.arrayToVector(data['tags'], tags, Tag);
		}
		
	}
}
