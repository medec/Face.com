package facecom.api.proxy {
	import facecom.api.FaceAPI;
	import facecom.api.events.FaceAPIEvent;
	import facecom.api.facecom;
	import facecom.api.model.results.AccountLimitsResult;

	import ru.inspirit.net.MultipartURLLoader;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	/**
	 * @author medec
	 */
	 
	use namespace facecom;
	public class AccountProxy extends Proxy {
		public function AccountProxy(clientAPI : FaceAPI) {
			super(clientAPI);
		}
		
		public function limits():void {
			var ml : MultipartURLLoader = clientAPI.createLoader();
			ml.addEventListener(Event.COMPLETE, accountLimitsCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, clientAPI.faceIOErrorHandler);

			ml.load(FaceAPI.API_DOMAIN + 'account/limits.json');
		}

		private function accountLimitsCompleteHandler(event : Event) : void {
			var result : AccountLimitsResult = new AccountLimitsResult(clientAPI.getResultDataToObject(event.currentTarget as MultipartURLLoader));
			trace('result: ' + (result));
			
			clientAPI.dispatchEvent(new FaceAPIEvent(FaceAPIEvent.ACCOUNT_LIMITS, result));
		}
	}
}
