<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Discussion Forum</title>
		
		<script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
        
        <style>
        	img.resize {
  				max-width:15%;
  				max-height:15%;
  				float: right;
			}
			
			.card img {
    			width: auto;
    			height: auto;
			}

			b, strong {
    			font-weight: bold;
			}

			.ans{
		  		font-family: "roboto";
		  		font-size: 21px;
		  		font-weight: 300;
		  		word-wrap: break-word;
			}

			pre{
				font-size: 90%;
			}

			.ql-container.ql-snow {
    			border: 0px solid #ccc;
			}

			.ql-snow .ql-editor img {
    			max-width: 35%;
    			max-height: 35%;
			}
			
        </style>
</head>
<body>
	
	<div id="toolbarque" style="display: none"></div>
    <div id="editorque" style="display: none"></div>
         
	<script>
         var quillAnswers=[];
         
         var configque = {
             "theme": "snow",
             "modules": {
             "toolbar": false
  			} 
		 };
  
         var configForShow = {
                    "theme": "snow",
                    "modules": {
                    "toolbar": false
        			} 
         };
         
         var quillque=new Quill('#editorque',configque);
         var quillShowAns;
         
         function instantiateEditor(i)
         {
            ans=quillAnswers[i];
            quillShowAns=new Quill('#ansEditor'+i,configForShow);
            quillShowAns.setContents(ans);
            quillShowAns.enable(false);  
            document.getElementsByClassName("ansImg")[i].innerHTML="";
            document.getElementsByClassName("read")[i].innerHTML="";
         }
	</script>
  
<center><h1>Class Question</h1></center>
<hr>
<c:forEach var="question" items="${questionList}" begin="0" varStatus="queLoop">
	<b>
	<a href="">${question.userModel.uname}</a> Posted Question In <a href="">${question.domain.dname}</a> on ${question.timestamp}
	With Tags :
	<c:forEach var="tag" items="${question.tags}">
		<a href="">| ${tag.kname} </a>
	</c:forEach>
	</b>
	<h1>${question.que}</h1>
	
	<a href="" id="answerer${queLoop.index}" style="color: #0099cc;"></a> answered<br>
	<div style="width:1000px;"><span class="ansImg" ></span><div class="ans" style="margin-bottom: 1px" id="ansEditor${queLoop.index}"></div></div>	    
    <a class="read" href="#no" style="color: #0099cc;" onclick="instantiateEditor('${queLoop.index}')">Read more</a><br>               
                                
	<c:if test="${fn:length(question.mostUpvotedAnswer) == 0}">
		<script>
			document.getElementById("answerer${queLoop.index}").innerHTML="No One";
			quillAnswers.push({"ops":[{"insert":""}]});
			document.getElementsByClassName("read")[${queLoop.index}].innerHTML="";
		</script>
	</c:if>
	
	<c:if test="${fn:length(question.mostUpvotedAnswer) gt 0}">
		<c:forEach var="answer" items="${question.mostUpvotedAnswer}">
			<script>
				document.getElementById("answerer${queLoop.index}").innerHTML='${answer.userModel.uname}';
				quillAnswers.push(${answer.answer});									
	        	window.delta=${answer.answer};
	        	var content="";
	        	var imgObj,count=0,count1=0;
	        
	        	for(var i=0;i<delta.ops.length;i++)
				{
					var del=delta.ops[i];
						
					if(typeof del.insert!=='object' && count1==1)
					{
						count1=0;
						content=content+del.insert.substr(1,del.insert.length);
						continue;
					}
				
					if(typeof del.insert !== 'object')
					{
						content=content+del.insert;
					}						
					else if(count==0)
					{
						count++;
						imgObj=del.insert;
						count1=1;
					}
				}
								
				if(imgObj!== undefined)
				{
					var opsarr={"ops":[{"insert":""}]};
					opsarr.ops[0].insert=imgObj;
					quillque.setContents(opsarr);
					var imgarea=document.getElementsByClassName("ansImg")[${queLoop.index}];
					imgarea.innerHTML=quillque.root.innerHTML;
					var imgTag=imgarea.getElementsByTagName('p')[0].childNodes[0];
					imgTag.setAttribute("class","resize");
					imgObj=undefined;							
				}                                               
	        
				var c=document.getElementsByClassName("ans");
	                                 
	        	if(content.length>500)
	        	{
	          		c[${queLoop.index}].innerText=content.substr(0,500)+"...";
	        	}
	                               
	        	else
	       	 	{
	          		c[${queLoop.index}].innerText=content;
	          		instantiateEditor(${queLoop.index});
	        	}	        
			</script>
		</c:forEach>
	</c:if>	
	
	<hr>
</c:forEach>
</body>
</html>