<%-- 
    Document   : MyAnswersPage
    Created on : 22 Apr, 2017, 1:55:43 PM
    Author     : rohan
--%>
<%@page import="model.AnswerModel"%>
<%@page import="model.QuestionModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.QuestionAnswerModel"%>
<%
QuestionAnswerModel qam=(QuestionAnswerModel)session.getAttribute("myanswers");
ArrayList<QuestionModel> alqm=qam.getAlqm();
ArrayList<AnswerModel> alam=qam.getAlam();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="MDB Free/img/img1.png" />
        <title>Korero</title>
        
        <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
    </head>
    <body>
        <h1>My Answers</h1>
        <%if(alqm!=null && alam!=null){
        for(int i=0;i<alqm.size();i++){%>
        <%=alqm.get(i).getQue()%>
        
        <button onclick="show(<%=i%>)">Edit Answer</button>
        <form class="edittext">
        <div class="toolbarmyans"></div>
        <div class="editormyans"></div>
        <input type="button" class="updatebtn" value="update" style="display: none" onclick="setArg(<%=i%>)"/>
        </form>
        <br><hr><br>        
        <%}}%>
        
        
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
                "toolbar": false
               
  },
               "placeholder": 'Write your answer here...'
};

            var configwithtool = {
                "theme": "snow",
                "modules": {
                "toolbar": toolbarOptions
               
  },
               "placeholder": 'Write your answer here...'
};
            console.log(typeof toolbarOptions);
            var quill;
            //quill.enable(false);
      
      var TT;
      
       $('#submit').click(function(){
        
        window.delta=quill.getContents();
        
        $.ajax({
        url: "UpdateMyAnswer?ansindex=",
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            
	}
        });
        
      });
      
      
      
      
    function setArg(i){
        window.delta=quill.getContents();
         $.ajax({
        url: "UpdateMyAnswer?ansindex="+i,
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            location.reload();
            
	}
        });
        
//        
//        window.delta=quill.getContents();
//        TT=JSON.stringify(delta);
////        var index=$(this).parent().attr('id');
////        console.log("index"+index);
//        var arg="UpdateMyAnswer?ansindex="+i+"&json="+TT;
//        var element=document.getElementsByClassName("edittext");
//        element[i].setAttribute("action",arg);
//        console.log(arg);
}
           
         
            function edit(i)
            {
            quill=new Quill('#editor'+i,config);
            console.log(quill);
        }
        
            function update(i)
            {
            quill=new Quill('#editor'+i,configwithtool);
            console.log(quill);
        }
        
        </script>
        
        
         <script>
        var toolbarElements = document.querySelectorAll('.toolbarmyans');
        var editorElements = document.querySelectorAll('.editormyans');
        var formElements = document.querySelectorAll('.edittext');
        for (var i = 0; i < editorElements.length; i++)
        {
            toolbarElements[i].id = 'toolbar' + i;
            editorElements[i].id = 'editor' + i;
            formElements[i].id=i;
            
        }
        
        <%for(int i=0;i<alam.size();i++){%>
        edit(<%=i%>);
        quill.setContents(<%=alam.get(i).getAnswer()%>);
        quill.enable(false);
        <%}%>
        </script>
        
        <script>
            function show(i)
            {
                var btn=document.getElementsByClassName("updatebtn");
                 
        if(btn[i].style.display==="block")
        {
            btn[i].style.display="none";
            var id='toolbar'+i;
    
            var elems = document.getElementsByClassName("ql-toolbar ql-snow");
    for (var k = elems.length - 1; k >= 0; k--) {
        var parent = elems[k].parentNode;
        parent.removeChild(elems[k]);
    }
            
            edit(i);
            quill.enable(false);
        }
        else if(btn[i].style.display==="none")
        {
            btn[i].style.display="block";
            update(i);
            var id='editor'+i;
            document.getElementById(id).className = "editormyans ql-container ql-snow";
        }
    }
        </script>
    </body>
</html>
