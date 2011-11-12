package facecom.api.proxy {
	import facecom.api.events.FaceAPIEvent;
	import facecom.api.FaceAPI;
	import facecom.api.facecom;
	import facecom.api.model.results.TagsSaveResult;

	import ru.inspirit.net.MultipartURLLoader;

	import flash.events.Event;
	import flash.events.IOErrorEvent;

	use namespace facecom;
	/**
	 * @author medec
	 */
	public class TagsProxy extends Proxy {
		public function TagsProxy(faceAPI : FaceAPI) {
			super(faceAPI);
		}
		
		public function save(tids:Array, uid:String, label:String = null, tagger_id:String = null):void {
			var ml : MultipartURLLoader = clientAPI.createLoader();
			ml.addEventListener(Event.COMPLETE, tagSaveCompleteHandler);
			ml.addEventListener(IOErrorEvent.IO_ERROR, clientAPI.faceIOErrorHandler);

			ml.addVariable('tids', tids.join(','));
			ml.addVariable('uid', uid);
			
			if(label) {
				ml.addVariable('label', label);
			}
			if(tagger_id) {
				ml.addVariable('tagger_id', label);
			}
			

			ml.load(FaceAPI.API_DOMAIN + 'tags/save.json');
		
		}

		private function tagSaveCompleteHandler(event : Event) : void {
			var result : TagsSaveResult = new TagsSaveResult(clientAPI.getResultDataToObject(event.currentTarget as MultipartURLLoader));
			
			clientAPI.dispatchEvent(new FaceAPIEvent(FaceAPIEvent.TAGS_SAVE, result));
		}
	}
}
