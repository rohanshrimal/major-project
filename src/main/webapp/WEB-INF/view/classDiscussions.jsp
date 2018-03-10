<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		
		<script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
        <script type="text/javascript">
        var configForShow = 
        {
            "theme": "snow",
            "modules": {
            "toolbar": false
				}  
		};
        
        function time_ago(time) {

    		  switch (typeof time) {
    		    case 'number':
    		      break;
    		    case 'string':
    		      time = +new Date(time);
    		      break;
    		    case 'object':
    		      if (time.constructor === Date) time = time.getTime();
    		      break;
    		    default:
    		      time = +new Date();
    		  }
    		  var time_formats = [
    		    [60, 'seconds', 1], // 60
    		    [120, '1 minute ago', '1 minute from now'], // 60*2
    		    [3600, 'minutes', 60], // 60*60, 60
    		    [7200, '1 hour ago', '1 hour from now'], // 60*60*2
    		    [86400, 'hours', 3600], // 60*60*24, 60*60
    		    [172800, 'Yesterday', 'Tomorrow'], // 60*60*24*2
    		    [604800, 'days', 86400], // 60*60*24*7, 60*60*24
    		  ];
    		  var seconds = (+new Date() - time) / 1000,
    		    token = 'ago',
    		    list_choice = 1;

    		  if (seconds == 0) {
    		    return 'Just now'
    		  }
    		  if (seconds < 0) {
    		    seconds = Math.abs(seconds);
    		    token = 'from now';
    		    list_choice = 2;
    		  }
    		  var i = 0,
    		    format;
    		  while (format = time_formats[i++])
    		    if (seconds < format[0]) {
    		      if (typeof format[2] == 'string')
    		        return format[list_choice];
    		      else
    		        return Math.floor(seconds / format[2]) + ' ' + format[1] + ' ' + token;
    		    }
    		  return new Date(time).toDateString();
    		}

        </script>
</head>
<body>
<h1>Class Discussions</h1>
<hr>
<h2>Start New Discussion here...</h2>
<form:form action="saveDiscussion" modelAttribute="ClassDiscussionModel" method="POST" onsubmit="collectdata()">

<label>Title</label><br>
<form:input path="title"/><br><br>

<label>Content</label>
<form:hidden path="content" id="contentid"/><br><br>
<div id="toolbar"></div>
<div id="editor"></div><br>

<input type="submit" value="POST"/>

</form:form>
<hr>
<c:forEach var="discussion" items="${discussionsList}" begin="0" varStatus="loop">

<h2>${discussion.title} by ${discussion.creatorId }</h2> <span id="timestamp${loop.index}"></span>
<div id="disEditor${loop.index}"></div><br>

<script>
var quillShow=new Quill('#disEditor${loop.index}',configForShow);
quillShow.setContents( ${discussion.content} );
quillShow.enable(false);
document.getElementById('timestamp${loop.index}').innerHTML=time_ago(new Date(${discussion.timeStamp}));
</script>
<hr> 
</c:forEach>

 <script>
            var toolbarOptions =[
                ['bold','italic','underline','strike'], 
                ['blockquote','code-block'],
                [{'header' : [1,2,3,4,5,6,false] }],
                [{'list': 'ordered'},{'list': 'bullet'}],
                [{'script': 'sub'},{'script': 'super'}],
                [{'indent': '-1'},{'indent': '+1'}],
                [{'direction': 'rtl'}],
                [{'size': ['small',false,'large','huge']}],
                ['link','image','video','formula'],
                [{'align': []}]
            ];
            
            var config = {
                "theme": "snow",
                "modules": {
                "toolbar": toolbarOptions
  				},
                "placeholder": 'Write your post here...'
			};
           
           	var quill=new Quill('#editor',config);
           	
           	function collectdata()
           	{
           		document.getElementById("contentid").value=JSON.stringify(quill.getContents());
           	}
           	
          
             
</script>
</body>
</html>