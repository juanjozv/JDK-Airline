var Proxy = Proxy || {};

Proxy.getCiudades = function (callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=ciudadListAll";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send();
};

Proxy.getPromo = function (callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=vueloListPromo";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send();//No se si esto debe cambiar
};



Proxy.vueloSearch = function (origen, destino, callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=vueloListSearch";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send("origen=" + origen + "&destino=" + destino);
};

Proxy.viajeSearch = function (origen, destino, fecha, cantAsientOcup, callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=viajeListSearch";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send("origen=" + origen + "&destino=" + destino + "&fecha=" + fecha + "&cantAsientOcup=" + cantAsientOcup);
};

Proxy.getViajes = function (callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=viajeListAll";
    AJAX_req.open("GET", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send();
};

Proxy.getAviones = function (callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=avionesListAll";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send();//No se si esto debe cambiar
};

Proxy.getVuelos = function (callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=vueloListAll";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send();
};

Proxy.getTiposAvion = function(callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=tiposAvionListAll";
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

Proxy.tipoAvionSearch = function(marca, callback) {
	var AJAX_req = new XMLHttpRequest();
	url = "/Aerolinea/AerolineaService?action=tiposAvionSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function() {
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200) {
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
			callback(object);
		}
	};
	AJAX_req.send("marca=" + marca);
};

Proxy.tipoAvionAdd = function (tipoAvion, callBack) {
    var jsonTipoAvion = JSON.stringify(tipoAvion, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=tipoAvionAdd";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
                callBack(0);
        }
    };
    AJAX_req.send("tipoAvion=" + jsonTipoAvion);
};

Proxy.UsuarioAdd = function (Usuario, callBack) {
    var jsonUsuario = JSON.stringify(Usuario, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=agregarUsuario";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var status = parseInt(AJAX_req.responseText);
            callBack(status);
        }
    };
    AJAX_req.send("usuario=" + jsonUsuario);
};

Proxy.addVuelo = function(vuelo,callBack){
    var jsonVuelo = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest(); 
    url="/Aerolinea/AerolineaService?action=vueloAdd";
    AJAX_req.open("POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            var status = parseInt(AJAX_req.responseText);
            callBack(status);
        } 
    };
    AJAX_req.send("vuelo=" + jsonVuelo); 
};

Proxy.modifyVuelo = function(vuelo,callBack){
    var jsonVuelo = JSON.stringify(vuelo,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest(); 
    url="/Aerolinea/AerolineaService?action=vueloModify";
    AJAX_req.open("POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            var status = parseInt(AJAX_req.responseText);
            callBack(status);
        } 
    };
    AJAX_req.send("vuelo=" + jsonVuelo); 
};

Proxy.ciudadAdd = function (ciudad, imagen, callBack) {
    var jsonCiudad = JSON.stringify(ciudad, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=ciudadAdd";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
                if (parseInt(AJAX_req.responseText)==0){
                Proxy.ciudadAddImagen(ciudad.codigo, imagen, callBack);
            }
            else{
                callBack(1);
            }
        }
    };
    AJAX_req.send("ciudad=" + jsonCiudad);
};

Proxy.ciudadAddImagen = function(codigo,imagen,callBack){
    var AJAX_req = new XMLHttpRequest();  
    url = "/Aerolinea/CiudadUpload";
    AJAX_req.open( "POST", url, true );
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack(0);
        }
    };
    var formdata = new FormData();
    formdata.append("codigo", codigo);
    formdata.append("imagen", imagen); 
    AJAX_req.send(formdata);    
};

Proxy.vueloCiudadSearch = function (ciudad, callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=vueloCiudadSearch";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send("ciudad=" + ciudad);
};

Proxy.usuarioLogin = function(user, callBack){
    jsonText = JSON.stringify(user, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AerolineaService?action=loginUsuarios";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse(jsonText, JsonUtils.revive);
            callBack(object);
        }
    };
    AJAX_req.send("user="+jsonText);   
};

Proxy.usuarioLogout = function(callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/Aerolinea/AerolineaService?action=logoutUsuarios";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack();
        }
    };
    AJAX_req.send();   
};

Proxy.obtenerViaje = function (codigo, callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=obtenerViaje";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send("codigo=" + codigo);
};

Proxy.obtenerAsientosOcupados = function (codViaje, callback) {
    var AJAX_req = new XMLHttpRequest();
    url = "/Aerolinea/AerolineaService?action=obtenerAsientosOcupados";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callback(object);
        }
    };
    AJAX_req.send("codViaje=" + codViaje);
};