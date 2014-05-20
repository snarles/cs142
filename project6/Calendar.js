
dayNames = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
monthNames = ["January","February","March","April","May","June","July","August","September","November","December"];


function Calendar(str) {
	this.element = document.getElementById(str);
	this.day = new Date();
	this.day.setDate(1);
	this.month = this.day.getMonth();
	this.year = this.day.getFullYear();
}

function tableCreate(str) {
	var element = document.getElementById(str);
	element.setAttribute('class','calendar');
	var tbl0 = document.createElement('table');
	tbl0.setAttribute('class','calframe');
	
	var count = 36;
	for(var row = 0; row < 5; row++) {
	  var tbl0tr = tbl0.insertRow();
	  for (var col = 0; col < 7; col++) {
	    count--;
	    var tbl0td = tbl0tr.insertCell();
	    tbl0td.innerHTML = count.toString();
	  }
	}
	
	var tbl0tr = tbl0.insertRow();
	for (var col = 0; col < 7; col++) {
	  var tbl0td = tbl0tr.insertCell();
	  tbl0td.setAttribute('class','day');
	  tbl0td.innerHTML = dayNames[6-col];
	}
	
	var tblm = tbl0.insertRow();
	tblm.setAttribute('class','calmenu');
	var tblml = document.createElement('td');
	tblml.innerHTML = "&lt;";
	tblml.setAttribute('class','button leftbutton');
	var tblmh = document.createElement('td');
	tblmh.setAttribute('class','monthname');
	tblmh.setAttribute('colspan','5');
	tblmh.innerHTML = "February";
	var tblmr = document.createElement('td');
	tblmr.innerHTML = "&gt;";
	tblmr.setAttribute('class','button rightbutton');
	tblm.appendChild(tblml);
	tblm.appendChild(tblmh);
	tblm.appendChild(tblmr);

	element.appendChild(tbl0);
	
}

Calendar.prototype.offset = function() {
  return this.day.getDay();
}

Calendar.prototype.ndays = function() {
  var temp = new Date();
  temp.setYear(this.year);
  temp.setMonth(this.month+1);
  temp.setDate(0);
  return temp.getDate();
}


Calendar.prototype.incrementMonth = function() {
  if (this.month == 12) {
    this.month = 1;
    this.year = this.year + 1;
  }
  else {
    this.month = this.month+1;
  }
  this.day.setMonth(this.month);
  this.day.setFullYear(this.year);
}

infoel = document.getElementById("info");
infoel.innerHTML = "TEST";
cal1 = new Calendar("div1");



infoel.innerHTML = cal1.ndays() ;


tableCreate("cal1");
tableCreate("cal2");