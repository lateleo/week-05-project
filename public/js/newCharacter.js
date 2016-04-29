window.addEventListener("load", setupPage);


function setupPage() {
  var raceSelect = document.getElementById("raceSelect");
  var baseClassSelect = document.getElementById("baseClassSelect");
  var aRadios = document.getElementsByClassName("aRadio");
  raceSelect.addEventListener("change", function(){
    showHide(this, "racials");
  });
  baseClassSelect.addEventListener("change", function(){
    showHide(this, "abilities");
  });
  for (i = 0; i < aRadios.length; i++) {
    aRadios[i].addEventListener("change", disableEnableRadios);
  }
}

function showHide(selector, tableType) {
  var tables = document.getElementsByClassName(tableType);
  for (i = 0; i < tables.length; i++) {
    if (tables[i].id == selector.value + tableType) {
      tables[i].classList.remove("hidden")
    } else {
      tables[i].classList.add("hidden")
    }
  }
}

function disableEnableRadios() {
  if (this.classList.contains("aFirst")) {
    var oppositeRadios = document.getElementsByClassName("aSecond");
  } else {
    var oppositeRadios = document.getElementsByClassName("aFirst");
  }
  for (i = 0; i < oppositeRadios.length; i++) {
    if (oppositeRadios[i].classList[2] == this.classList[2]) {
      oppositeRadios[i].disabled = true;
    } else {
      oppositeRadios[i].disabled = false;
    }
  }
}
