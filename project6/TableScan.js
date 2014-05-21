function sumColumnHandler(form) {
  var tableId = form.ti.value;
  var variableName = form.vn.value;
  var value = sumColumn(tableId,variableName);
  var s = "Column "+variableName+" in table "+tableId+" sums to "+value;
  var results = document.getElementById("results");
  results.innerHTML = s;  
}

function sumColumn(tableId, variableName) {
  var element = document.getElementById(tableId);
  var tr0 = element.rows;
  var vars = tr0[0].cells;
  var count = -1;
  for (var i = 0; i < vars.length; i++) {
    if (vars[i].innerHTML==variableName) {
      count = i;
    }
  }
  var sum=0;
  
  for (i = 1; i < tr0.length; i++ ) {
    var row = tr0[i].cells;
    if (row.length > count) {
      var summand = parseFloat(row[count].innerHTML);
      if (isNaN(summand)) {
        summand = 0;
      }
      sum = sum + summand;
    }
  }
  
  return sum;
}