package facecom.api.model.core.attributes {

	/**
	 * @author medec
	 */
	public class Glasses extends Attribute {
		
		//male/female
		public static const MALE:String = 'male'; 
		public static const FEMALE:String = 'female'; 
		
		public function Glasses(data : Object) {
			super(data);
		}
	}
}
