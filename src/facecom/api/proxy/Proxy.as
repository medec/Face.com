package facecom.api.proxy {
	import flash.events.EventDispatcher;
	import facecom.api.FaceAPI;
	/**
	 * @author medec
	 */
	public class Proxy extends EventDispatcher {
		protected var clientAPI : FaceAPI;

		public function Proxy(faceAPI:FaceAPI) {
			this.clientAPI = faceAPI;
		}
	}
}
