package facecom.api.model.core {
	import facecom.api.model.results.Result;

	import flash.geom.Point;
	/**
	 * @author medec
	 */
	public class Tag {
		
		public var tid:String;
		public var recognizable:Boolean;
		public var threshold:uint;
		public var uids:Vector.<UID> = new Vector.<UID>();
		
		public var gid:*; 
		public var label:String;
		public var confirmed:Boolean;
		
		public var manual:Boolean;
		public var tagger_id:*;
		
		public var width:uint;
		public var height:uint;
		
		public var center:Point;
		public var eye_left:Point;
		public var eye_right:Point;
		public var mouth_left:Point;
		public var mouth_center:Point;
		public var mouth_right:Point;
		public var nose:Point;
				
		public var ear_left:*;
		public var ear_right:*;
		
		public var chin:*;
		
		public var yaw:Number;
		public var roll:Number;
		public var pitch:Number;
		public var attributes : Attributes;

		public function Tag(data:Object) {
			tid = data['tid'];
			recognizable = data['recognizable'];
			threshold = data['threshold'];
			
			Result.arrayToVector(data['uids'], uids, UID);
			
			gid = data['gid'];
			label = data['label'];
			confirmed = data['confirmed'];
			manual = data['manual'];
			tagger_id = data['tagger_id'];
			width = data['width'];
			height = data['height'];
			
			center = new Point(data['center']['x'], data['center']['y']);
			eye_left = new Point(data['eye_left']['x'], data['eye_left']['y']);
			eye_right = new Point(data['eye_right']['x'], data['eye_right']['y']);
			//mouth_left = new Point(data['mouth_left']['x'], data['mouth_left']['y']);
			mouth_center = new Point(data['mouth_center']['x'], data['mouth_center']['y']);
			//mouth_right = new Point(data['mouth_right']['x'], data['mouth_right']['y']);
			nose = new Point(data['nose']['x'], data['nose']['y']);
			
			ear_left = data['ear_left'];
			ear_right = data['ear_right'];
			chin = data['chin'];
			
			yaw = data['yaw'];
			roll = data['roll'];
			pitch = data['pitch'];
			
			attributes = new Attributes(data['attributes']);
		}
	}
}
