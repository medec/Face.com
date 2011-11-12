package facecom.api.proxy {
	import facecom.api.facecom;
	
	import facecom.api.FaceAPI;
	/**
	 * @author medec
	 */
	 
	use namespace facecom;
	public class AccountProxy extends Proxy {
		public function AccountProxy(clientAPI : FaceAPI) {
			super(clientAPI);
		}
		
		public function limits():void {
			clientAPI.accountLimits();
		}
	}
}
