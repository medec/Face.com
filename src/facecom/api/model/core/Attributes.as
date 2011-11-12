package facecom.api.model.core {
	/**
	 * @author medec
	 */
	public class Attributes {
		public var glasses : Attribute;
		public var smiling : Attribute;
		public var face : Attribute;
		public var gender : Attribute;
		public var mood : Attribute;
		public var lips : Attribute;

		public function Attributes(data : Object) {
			if (data['glasses']) {
				glasses = new Attribute(data['glasses']);
			}
			if (data['smiling']) {
				smiling = new Attribute(data['smiling']);
			}
			if (data['face']) {
				face = new Attribute(data['face']);
			}
			if (data['gender']) {
				gender = new Attribute(data['gender']);
			}
			if (data['mood']) {
				mood = new Attribute(data['mood']);
			}
			if (data['lips']) {
				lips = new Attribute(data['lips']);
			}
		}
	}
}
