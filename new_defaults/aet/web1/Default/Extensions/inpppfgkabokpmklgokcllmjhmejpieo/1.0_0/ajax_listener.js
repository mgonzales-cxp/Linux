function injectScript(source) {

    var elem = document.createElement("script");
    elem.type = "text/javascript";
    elem.innerHTML = source;
    document.documentElement.appendChild(elem);
	
}
injectScript(
"("+(function() {
	Ajax.Responders.register({
		onComplete: function(data) {
			if ( data.url === "/api/agents/loadCall.xml" || true) {
				// var call_history_id = $(data.responseXML).find('call_history_id').text();
				call_history_id = 1;
				window.postMessage({ type: "FROM_PAGE", call_history_id: call_history_id }, "*");
			}
		}
	});
}).toString()+")()");