function show(tid,bid)
{
	var x=document.getElementById(tid);
	var y=document.getElementById(bid);
	if (y.innerHTML=='Read more') {
			x.classList.remove("limittext");
	y.innerHTML='show less';

	}
	else{
		x.classList.add("limittext");
		y.innerHTML='Read more';
	}

}