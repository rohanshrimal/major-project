function test()
{
    var idSelector = function() { return this.id; };
    var select = $(":checkbox:checked").map(idSelector).get() ;
    var notselect = $(":checkbox:not(:checked)").map(idSelector).get() ;
    if (select.length<1) {alert("choose atleast one workspace");}
 // alert("selected: " + select  + "\nnotselecte " + notselect);
 return select;
}
function delet(r)
{
var x=document.getElementById(r);
x.remove();
}
	function add(p) {
		var sty=document.createElement('div');
		sty.innerHTML=p;
		sty.id=p;
		sty.className="chip";
		sty.style.marginRight="10px";
		document.getElementById("label").appendChild(sty);

	}

function test1(check,over,cover,name) {
	var chkbox = document.getElementById(check);
        chkbox.checked = !chkbox.checked;
         if (chkbox.checked==true) {
        var abc=document.getElementById(over);
        var xx=document.getElementById(cover);
        abc.classList.remove("overlay");	
        xx.classList.add("pattern-1");
        add(name);
        }
        else{
        	var abc=document.getElementById(over);
        var xx=document.getElementById(cover);
        abc.classList.add("overlay");	
        xx.classList.remove("pattern-1");
        delet(name);
        }
    }
function myfunct1(id1) {
    document.getElementById("dropdownMenu1").innerHTML = document.getElementById(id1).innerHTML;
}
function myfunct2(id2) {
    document.getElementById("dropdownMenu2").innerHTML = document.getElementById(id2).innerHTML;
}
function myfunct3(id) {
    document.getElementById("dropdownMenu3").innerHTML = document.getElementById(id).innerHTML;
}
function myfunct4(id) {
    document.getElementById("dropdownMenu4").innerHTML = document.getElementById(id).innerHTML;
}
