package facecom.api.model.core.attributes {
	import facecom.api.model.core.attributes.Attribute;

	/**
	 * @author medec
	 */
	public class Lips extends Attribute {
		
		// sealed/parted/kissing
		public static const SEALED:String = 'sealed';
		public static const PARTED:String = 'parted';
		public static const KISSING:String = 'kissing';
		
		public function Lips(data : Object) {
			super(data);
		}
	}
}
