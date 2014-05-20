
str="cal1"
element = document.getElementById("cal1");
element.innerHTML="LALA";

function tableCreate(str) {
	element = document.getElementById(str);
    element.innerHTML="LALA";
    var tblm = document.createElement('table');
}
//tableCreate("cal1");

function a {
	var tblm = document.createElement('table');
	tblm.setAttribute('class','calmenu');
	var tblml = document.createElement('td');
	tblml.innerHTML = "&lt;";
	tblml.setAttribute('class','button leftbutton');
	var tblmh = document.createElement('td');
	tblmh.innerHTML = "February";
	tblmh.setAttribute('class','monthname');
	var tblmr = document.createElement('td');
	tblmr.innerHTML = "&gt;";
	tblmr.setAttribute('class','button rightbutton');
	tblmr.appendChild(tblml);
	tblmr.appendChild(tblmh);
	tblmr.appendChild(tblmr);
	tblm.appendChild(tblmr);
	element.appendChild(tblm);
	var tbl = document.createElement('table');
	
}