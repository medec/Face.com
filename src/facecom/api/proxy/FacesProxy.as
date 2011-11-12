package facecom.api.proxy {
	import facecom.api.facecom;
	
	import facecom.api.FaceAPI;
	/**
	 * @author medec
	 */
	 
	use namespace facecom;
	 
	public class FacesProxy extends Proxy {
		public function FacesProxy(clientAPI : FaceAPI) {
			super(clientAPI);
		}
		
		public function status(uid:String, names:String):void {
			clientAPI.facesStatus(uid, names);
		}
	}
}
