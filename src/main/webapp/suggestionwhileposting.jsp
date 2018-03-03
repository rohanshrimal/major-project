<html>
    <head>
        
<script>
function getXmlHttpRequestObject()
{
var xmlHttpReq;

if(window.XMLHttpRequest){
    request=new window.XMLHttpRequest();
}
else if(window.ActiveXObject){
    request=new window.ActiveXObject();
}
else{
    request=null;
}
return request;
}

function one()
{   
    var que=document.getElementById("askque").value;
    request=getXmlHttpRequestObject();
    request.onreadystatechange=showResponse;
    request.open("post","PostSuggestions",true);
    request.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    
    var data="que="+que;
    request.send(data);
}
function showResponse()
{
    if(request.readyState===4 && request.status===200){
        document.getElementById("data").innerHTML=request.responseText;
    }
}
</script>
      
        
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
         <input type="text" onchange="one()" id="askque"/>
         <div id="data"></div>
    </body>
</html>