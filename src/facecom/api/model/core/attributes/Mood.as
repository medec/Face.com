package facecom.api.model.core.attributes {
	import facecom.api.model.core.attributes.Attribute;

	/**
	 * @author medec
	 */
	public class Mood extends Attribute {
		
		// happy/sad/angry/surprised/neutral
		public static const HAPPY:String = 'happy';
		public static const SAD:String = 'sad';
		public static const ANGRY:String = 'angry';
		public static const SURPISED:String = 'surprised';
		public static const NEUTRAL:String = 'neutral';
		
		public function Mood(data : Object) {
			super(data);
		}
	}
}
