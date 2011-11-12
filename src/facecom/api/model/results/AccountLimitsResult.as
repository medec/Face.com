package facecom.api.model.results {
	import facecom.api.model.core.Usage;
	/**
	 * @author medec
	 */
	public class AccountLimitsResult extends Result {
		
		public var usage:Usage;

		public function AccountLimitsResult(data : Object) {
			super(data);
			
			usage = new Usage(data['usage']);
		}
	}
}
