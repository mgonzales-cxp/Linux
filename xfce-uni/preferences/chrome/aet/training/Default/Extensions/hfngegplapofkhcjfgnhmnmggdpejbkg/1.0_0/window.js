window.oncontextmenu = function(){return false;}
window.onload = function() {
	var close = document.getElementById('close');
	close.onclick = function() {
		chrome.app.window.current().close();
	}

	var mini = document.getElementById('mini');
	mini.onclick = function() {
		chrome.app.window.current().minimize();
	}
}