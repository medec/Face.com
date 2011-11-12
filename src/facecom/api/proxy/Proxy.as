package facecom.api.proxy {
	import facecom.api.FaceAPI;
	/**
	 * @author medec
	 */
	public class Proxy {
		protected var clientAPI : FaceAPI;

		public function Proxy(faceAPI:FaceAPI) {
			this.clientAPI = faceAPI;
		}
	}
}
