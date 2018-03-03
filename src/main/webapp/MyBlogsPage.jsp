<%-- 
    Document   : MyBlogsPage
    Created on : 23 Apr, 2017, 12:06:41 PM
    Author     : rohan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BlogModel"%>
<%@page import="model.AllBlogModel"%>
<%
AllBlogModel abm=(AllBlogModel)session.getAttribute("MyBlogs");
ArrayList<BlogModel> albm=abm.getAbm();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Blogs</title>
        
        <script src="https://cdn.quilljs.com/1.2.3/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.2.3/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://cdn.quilljs.com/1.1.3/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.1.3/quill.bubble.css" rel="stylesheet">
    </head>
    <body>
        <h1>MY BLOGS</h1>
        <button id="BlogBtn" onclick="showBlog()">Click Here To Write Blog..</button><br><br>
        <form id="blogform" style="display: none">
        Select Blog Domain<select name="cars" id="did">
    <option value="1">Computer science</option>
    <option value="2">Mechanical</option>
    <option value="3">Information Technology</option>
    <option value="4">Electrical</option>
    <option value="5">Electronics</option>
    <option value="6">Fire Tech</option>
    <option value="7">Chemical</option>
    <option value="8">Civil</option>
    <option value="9">Library</option>
    <option value="10">Sports</option>
    <option value="11">Placement Cell</option>
    <option value="12">Accounts</option>
    <option value="13">Admission Cell</option>
    <option value="14">Scholarship</option>
    <option value="15">Moonstone</option>
    <option value="17">Hostel</option>
    <option value="18">Transportation</option>
    <option value="19">Music Club</option>
    <option value="20">Dance Club</option>
    <option value="21">Literary Club</option>
    <option value="22">STIC</option>
    <option value="24">E-Cell</option>
    <option value="25">Canteen</option>
    <option value="26">Korero</option>
    <option value="27">Other</option>
        </select>&nbsp;&nbsp;&nbsp; 
        Blog Title<input type="text" id="blogtitle"/><br><br>
        <div id="blogtoolbar"></div>
        <div id="blogeditor"></div>
        <br>
        <input type="button" value="Post Blog" onclick="postBlog()"/>
        </form>
        
        
        <%
        if(abm!=null && abm.getAbm().size()>0){%>
        <hr><h1>Your Blogs Are...</h1>
        <%int i=0;
            for(BlogModel bm:abm.getAbm())
        {%>
        <%= "You posted on "+bm.getTimestamp()+" under domain "+bm.getDname()+"\n" %> &nbsp;&nbsp;&nbsp;<button onclick="show(<%=i%>)">Edit Blog </button>
        <h1 style="font-size: xx-large"><%=bm.getTitle()%></h1>
        <div class="myblogtool"></div>
        <div class="myblogeditor"></div>
        <input type="button" class="updateblog" value="update" style="display: none" onclick="setArg(<%=i%>)"/>
        <hr>
        <%i++;}
        }
        %>
        
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
               "placeholder": 'Write your blog here...'
};

            var configforshow = {
                "theme": "snow",
                "modules": {
                "toolbar": false
               
  },
               "placeholder": 'Write your blog here...'
};

            console.log(typeof toolbarOptions);
            var quill;
            quill=new Quill('#blogeditor',config);
            
            function instantiatequill()
            {
            var quill;
            quill=new Quill('#blogeditor',config);
            }
            function showBlog()
            {
            if(document.getElementById("blogform").style.display==="none")
            document.getElementById("blogform").style.display="block";
        
            else if(document.getElementById("blogform").style.display="block")
            document.getElementById("blogform").style.display="none";    
            //quill.enable(false);
            }
      
      var TT;
      
       function postBlog(){
        window.delta=quill.getContents();
        console.log(delta);
         $.ajax({
        url: "PostBlog?did="+document.getElementById("did").value+"&title="+document.getElementById("blogtitle").value,
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            location.reload();
            
	}
        });
        
    }
    
    function setArg(i){
        window.delta=quillForShow.getContents();
         $.ajax({
        url: "UpdateMyBlog?blogindex="+i,
        type: 'POST',
        dataType: 'json',
        
        data: JSON.stringify(delta),
        contentType: 'application/json',
        mimeType: 'application/json',
        success : function(data) {
            location.reload();
            
	}
        });
    }  
    
    var quillForShow;
    
     function edit(i)
            {
            quillForShow=new Quill('#editor'+i,configforshow);
            console.log(quill);
        }
        
         function update(i)
            {
            quillForShow=new Quill('#editor'+i,config);
            console.log(quill);
        }
        </script>
        
        <script>
        var toolbarElements = document.querySelectorAll('.myblogtool');
        var editorElements = document.querySelectorAll('.myblogeditor');

        for (var i = 0; i < editorElements.length; i++)
        {
            toolbarElements[i].id = 'toolbar' + i;
            editorElements[i].id = 'editor' + i;
        }
        
        <%for(int i=0;i<albm.size();i++){%>
        edit(<%=i%>);
        quillForShow.setContents(<%=albm.get(i).getBlogContent()%>);
        quillForShow.enable(false);
        <%}%>
        </script>
        
     <script>
            function show(i)
            {
                var btn=document.getElementsByClassName("updateblog");
                 
        if(btn[i].style.display==="block")
        {
            btn[i].style.display="none";
            var id='toolbar'+i;
    
            var elems = document.getElementsByClassName("ql-toolbar ql-snow");
    for (var k = elems.length - 1; k >= 0; k--) {
        var parent = elems[k].parentNode;
        parent.removeChild(elems[k]);
    }
            instantiatequill();
            edit(i);
            quillForShow.enable(false);
        }
        else if(btn[i].style.display==="none")
        {
            btn[i].style.display="block";
            update(i);
            var id='editor'+i;
            document.getElementById(id).className = "myblogeditor ql-container ql-snow";
        }
    }
        </script>   
        
    </body>
</html>
