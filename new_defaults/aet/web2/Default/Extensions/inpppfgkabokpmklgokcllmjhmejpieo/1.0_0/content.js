jQuery( document ).ready(function(){

	var port = chrome.runtime.connect({name: "%4zFSD2L8BZ8*sxdJI82dkdAtOJ%3zTWyldXMlXApJRW6uKNgf4RpfFZXpGfPuXs!EB^xg8@2L4VKHNjQueryDAYhqUq%92N7CXml#0Bz"});

	var urlRegex = /^https?:\/\/cvty-web[0-9]\.callproxe\.com\/cti\/agents\/call\.html/;
	
	var windowRegex = /^https?:\/\/cvty-web[0-9]\.callproxe\.com\.com/;

	jQuery(document).on('click','a[title="Continue"]',function(){
		var post = {};
		jQuery('form').find('input[type=text]').each(function(){
			post[this.name] = this.value;
		});
		jQuery('form').find('input[type=password]').each(function(){
			post[this.name] = this.value;
		});
		jQuery('form').find('input[type=hidden]').each(function(){
			post[this.name] = this.value;
		});
		jQuery('form').find('textarea').each(function(){
			post[this.name] = this.value;
		});
		jQuery('form').find('select').each(function(){
			var selected = this.selectedIndex;
			var options = this.options;
			post[this.name] = options[selected].value;
		});
		jQuery('form').find('input[type=checkbox]').each(function(){
			if(this.checked)
				post[this.name] = this.value;
		});
		jQuery('form').find('input[type=radio]').each(function(){
			if(this.checked)
				post[this.name] = this.value;
		});
		port.postMessage({data: post});
	});

	if(jQuery('#confirmationNumber').length == 1) {
		var post = {};
		post.confirmationNumber = jQuery('#confirmationNumber + td span').html();
		post.selectedPlan = jQuery('#confirmation_0 + td').html();
		post.monthlyPremium = jQuery('#confirmation_1 + td').html();
		post.applicationDate = jQuery('#confirmation_2 + td span').html();
		post.contractPlanSegmentID = jQuery('#confirmation_7 + td').html();
		port.postMessage({data: post});
	}
	
	if(window.location.href.match(urlRegex)) {
	
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
					if ( data.url === "/api/agents/loadCall.json") {
						var call_history_id = JSON.parse(data.transport.response).call_history_id
						window.postMessage({ type: "FROM_PAGE", call_history_id: call_history_id }, "*");
					}
				}
			});
		}).toString()+")()");
	
	
		window.addEventListener("message", function(event) {
			if (event.source != window) {
				return;
			}

			if (event.data.type && (event.data.type == "FROM_PAGE")) {
				port.postMessage(event.data.call_history_id);
			}
		}, false);
		
	}
	
	chrome.extension.onConnect.addListener(function(port) {
		port.onMessage.addListener(function(msg) {
			if(msg.json.confirmationNumber != undefined) {
				jQuery('input[name="cl_cust-10070"]').val(msg.json.confirmationNumber).blur();
			}
			if(msg.json.selectedPlan != undefined) {
				jQuery('input[name="cl_cust-10071"]').val(msg.json.selectedPlan).blur();
			}
			if(msg.json.applicationDate != undefined) {
				jQuery('input[name="cl_cust-10072"]').val(msg.json.applicationDate).blur();
			}
			if(msg.json.contractPlanSegmentID != undefined) {
				jQuery('input[name="cl_cust-10076"]').val(msg.json.contractPlanSegmentID).blur();
			}
			if(msg.json.ApplicantFirstName != undefined) {
				jQuery('input[name="cl_cust-10073"]').val(msg.json.ApplicantFirstName).blur();
			}
			if(msg.json.ApplicantLastName != undefined) {
				jQuery('input[name="cl_cust-10074"]').val(msg.json.ApplicantLastName).blur();
			}
			if(msg.json.ApplicantHICN != undefined) {
				jQuery('input[name="cl_cust-10075"]').val(msg.json.ApplicantHICN).blur();
			}
		});
	});

});