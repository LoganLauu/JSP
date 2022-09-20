<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>
body {
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
 }
  div {
	padding: 10px;
	text-align:left;
	font-size:400%;
	font-family: 'Brush Script MT', cursive;
}
 
</style>

<body onload='changeimage(5);'>

<div>
<p>Welcome</p>
<p> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;To</p>
<p> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;XYZ Book Store</p>
</div>


<script type='text/javascript'>
var imageID=0;
function changeimage(every_seconds){
    //change the image
    if(!imageID){
        document.body.style.backgroundImage = "url('https://preview.pixlr.com/images/800wm/1151/2/1151119067.jpg')";
    	imageID++;
    }
    else{if(imageID==1){
        document.body.style.backgroundImage ="url('https://thumbs.dreamstime.com/b/back-to-school-concept-rocket-books-front-blurry-library-background-120197485.jpg')";
        imageID++;
    }else{if(imageID==2){
        document.body.style.backgroundImage = "url('https://thumbs.dreamstime.com/b/library-room-living-room-clean-design-d-rendering-blackground-73581183.jpg')";
        imageID=0;
        
    }}}
    //call same function again for x of seconds
    setTimeout("changeimage("+every_seconds+")",((every_seconds)*1000));
}
</script>
</body>

</html>