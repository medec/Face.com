package facecom.api.model.core {
	import facecom.api.model.core.attributes.Face;
	import facecom.api.model.core.attributes.Gender;
	import facecom.api.model.core.attributes.Glasses;
	import facecom.api.model.core.attributes.Lips;
	import facecom.api.model.core.attributes.Mood;
	import facecom.api.model.core.attributes.Smiling;
	/**
	 * @author medec
	 */
	public class Attributes {
		public var glasses : Glasses;
		public var smiling : Smiling;
		public var face : Face;
		public var gender : Gender;
		public var mood : Mood;
		public var lips : Lips;

		public function Attributes(data : Object) {
			if (data['glasses']) {
				glasses = new Glasses(data['glasses']);
			}
			if (data['smiling']) {
				smiling = new Smiling(data['smiling']);
			}
			if (data['face']) {
				face = new Face(data['face']);
			}
			if (data['gender']) {
				gender = new Gender(data['gender']);
			}
			if (data['mood']) {
				mood = new Mood(data['mood']);
			}
			if (data['lips']) {
				lips = new Lips(data['lips']);
			}
		}
	}
}
