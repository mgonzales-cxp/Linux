chrome.app.runtime.onLaunched.addListener(function() {
	var launch_height = 450;
	var launch_width = 350;
	chrome.app.window.create("chat.html",{
		frame: "none",
		id: "cxp_chat",
		innerBounds: {
			left: screen.width - launch_width,
			top: screen.height - launch_height - 500,
			width: launch_width,
			height: launch_height
		}
	});
});