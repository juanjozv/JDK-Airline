var Proxy = Proxy || {};

Proxy.getCiudades = function(callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=ciudadListAll";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send();
};

/*Proxy.getPromo = function(callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=vueloListPromo";
	AJAX_req.open("GET", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send();
};*/



Proxy.vueloSearch = function(origen, destino, callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=vueloListSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send("origen=" + origen + "&destino=" + destino);
};

Proxy.viajeSearch = function(origen, destino, fecha, cantAsientOcup, callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=viajeListSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send("origen=" + origen + "&destino=" + destino + "&fecha=" + fecha + "&cantAsientOcup=" + cantAsientOcup);
};

Proxy.getViajes = function(callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=viajeListAll";
	AJAX_req.open("GET", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send();
};