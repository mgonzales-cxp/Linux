var urlRegex = /^https?:\/\/cvty-web[0-9]\.callproxe\.com\/cti\/agents\/call\.html/;

var found_call_history_id = 0;

chrome.runtime.onConnect.addListener(function(port) {
	if(port.name == "%4zFSD2L8BZ8*sxdJI82dkdAtOJ%3zTWyldXMlXApJRW6uKNgf4RpfFZXpGfPuXs!EB^xg8@2L4VKHNjQueryDAYhqUq%92N7CXml#0Bz") {
		port.onMessage.addListener(function(obj) {
			if(obj.data == undefined) {
				found_call_history_id = obj;
				return false;
			}
			obj.data.call_history_id = found_call_history_id;
			var url = "https://micro.cxpxe.net/drxscrape/save";
			$.ajax({
			type: "GET",
				url: url,
				data: obj.data,
				dataType: "text",
				success: function(data) {
				}
			});
			chrome.tabs.getAllInWindow(null, function(tabs){
				for(var i in tabs) {
					if(tabs[i].url.match(urlRegex)) {
						var content_port = chrome.tabs.connect(tabs[i].id,{name: "%4zFSD2L8BZ8*sxdJI82dkdAtOJ%3zTWyldXMlXApJRW6uKNgf4RpfFZXpGfPuXs!EB^xg8@2L4VKHN$DAYhqUq%92N7CXml#0Bz"});
						content_port.postMessage({ json: obj.data});
					}
				}
			});
		});
	}
});

