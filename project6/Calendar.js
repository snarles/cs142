
dayNames = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
monthNames = ["January","February","March","April","May","June","July","August","September","November","December"];
holidayMonths = [0,1,6,11];
holidayDays = [1,14,9,25];

function Calendar(str) {
	this.element = document.getElementById(str);
	this.day = new Date();
	this.day.setDate(1);
	this.month = this.day.getMonth();
	this.year = this.day.getFullYear();
	var tbl0 = document.createElement('table');
	tbl0.setAttribute('class','calframe');
	
	var count = 43;
	this.dayEntries = [];
	for(var row = 0; row < 6; row++) {
	  var tbl0tr = tbl0.insertRow();
	  for (var col = 0; col < 7; col++) {
	    count--;
	    var tbl0td = tbl0tr.insertCell();
	    this.dayEntries.push(tbl0td);
	    tbl0td.innerHTML = count.toString();
	  }
	}
	this.dayEntries = this.dayEntries.reverse();
	
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
	this.monthname = tblmh;
	var tblmr = document.createElement('td');
	tblmr.innerHTML = "&gt;";
	tblmr.setAttribute('class','button rightbutton');
	tblm.appendChild(tblml);
	tblm.appendChild(tblmh);
	tblm.appendChild(tblmr);
	this.tbl = tbl0;
	this.holidays = [];
	this.update();
}

Calendar.prototype.render = function() {
	this.element.setAttribute('class','calendar');
	this.element.appendChild(this.tbl);
}

Calendar.prototype.update = function() {
    this.monthname.innerHTML = monthNames[this.month] + " " + this.year;
    this.holidays=[];
    for (var ii = 0; ii < holidayMonths.length; ii++) {
      if (holidayMonths[ii]==this.month) {
        this.holidays.push(holidayDays[ii]);
      }
    }
    var count = 0;
    var step1 = this.offset();
    while (count < step1) {
      this.dayEntries[count].innerHTML = "0";
      this.dayEntries[count].setAttribute('class','blank');
      count++;
    }
    var step2 = this.ndays();
    var daycount = 0;
    while (daycount < step2) {
      daycount++;
      this.dayEntries[count].innerHTML = daycount;
      this.dayEntries[count].setAttribute('class','');
      if (this.holidays.indexOf(daycount) > -1) {
	    this.dayEntries[count].setAttribute('class','special');
      }
      count++;
    }
    while (count < 42) {
      this.dayEntries[count].innerHTML = "0";
      this.dayEntries[count].setAttribute('class','blank');
      count++;
    }    
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
  this.day.setDate(1);
  this.update();
}

Calendar.prototype.decrementMonth = function() {
  if (this.month == 0) {
    this.month = 11;
    this.year = this.year - 1;
  }
  else {
    this.month = this.month-1;
  }
  this.day.setMonth(this.month);
  this.day.setFullYear(this.year);
  this.day.setDate(1);
  this.update();
}

infoel = document.getElementById("info");
infoel.innerHTML = "TEST";
cal1 = new Calendar("cal1");
cal1.decrementMonth();
cal1.decrementMonth();

cal1.render();

infoel.innerHTML = cal1.offset() ;



tableCreate("cal2");