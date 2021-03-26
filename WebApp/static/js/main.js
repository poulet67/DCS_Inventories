function GetJSONObj(yourUrl){
    var Httpreq = new XMLHttpRequest(); // a new request
    Httpreq.open("GET",yourUrl,false);
    Httpreq.send(null);
    return Httpreq.responseText;          
}

function displayInventories(){

    var mainContainer = document.getElementById("Window1");
    var json_obj = JSON.parse(Get("/outside_inventory"));

    for (var i = 0; i < json_obj.length; i++) {

        var div = document.createElement("div");  
        div.innerHTML = 'Name: ' + data[i].Airbase;
        mainContainer.appendChild(div);
    }

}