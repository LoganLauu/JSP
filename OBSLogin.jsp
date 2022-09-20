<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/htm l; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
  background-image:url("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0NDQ0NDRANDQ0NDQ0NDQ0NDQ8NDQ0NFREWFhURExMYHSggGBolGxUVITEhJSkrOi46Fx8zODMtNygtLisBCgoKDg0NDw8PFSsZFRktNzctKy0rKysrNzctLS03LS03LS0rKzctNy03NystNys3NzctLS0tLS0rNy0tLSstK//AABEIAKgBLAMBIgACEQEDEQH/xAAaAAADAQEBAQAAAAAAAAAAAAABAgMABAYF/8QAGhABAQEBAQEBAAAAAAAAAAAAAAECEhEDE//EABkBAQEBAQEBAAAAAAAAAAAAAAEAAgMEBv/EABsRAQEBAQEAAwAAAAAAAAAAAAARARICAyEx/9oADAMBAAIRAxEAPwASnzXPNHzp25fFOmVqXOjVQbgeh61BmD7N6PqY+hUbS+tQDN1TNUlQlPnSazVW6L61EG6eaPnSAyiC66Og6TlEQU/TSkGVrMZuqym9SlN61B1prS+haW0Q5umtJqtanqg1rot0W0vo3Dmmug9L63rLdP6FpQ1VDmhrSO9H3UN0RqhdB2nql9WYc3Vps/SEpvW8x1ymmj50h6M09XLny7MbUm3FnSudrkx1eshNmmmNwcqWl9L0HojPJ5RJKeCCM0ogIN8nmh6S9boQRX0ZUZs80hFs08RzTzRjMPQjescwbhpTSpdN0WYpaS0Lol0IYf0tpOg9Z3GswKW01qeqDGug6Jql6ES8rVPNP6o6YTaG1tVD6VRuI6pPW3SSnPLWYtK3RJW9bzy755VuS106wjvL2ctb8ZJpXOkK2dM7jPDrlNKhjasog4P6HoNWN8s74NNKZ057RztncY3y6vS2kmmtZjMG0toWltEZ3DdDNpetKIOXTnas05M1XNMEdM0b1DOlJUzuDqk6HVTtI5U6LdE9LdCHk10HRbSWqKK9FtS6a6EUHVT9HVTtXJzFc6U6c00bs8t5imtOf6aNrSH00uXXPKe9F6JvROms8uvny6JoOkey3beeXbPL0FylvDp8JY9D0Rxb+aOsO/WU9fNRjfDkzVsbDXzCZZjPC00NqeTM7g3wXVL02k6zHPfC+dnmnLNGm2dxjfDo9CozZppmOe+DWMMawRnkc1TOkDTRg5dOdKZ05c6VzpQcqaqdprU9KDlrS2ltJaoOVOi60ndFuzFye6bpG6DpcjlW6T1ot2ndnlrPKnQzaF0E2Y6Z5dF0l9NB2n9NGO3nyj9NJ9F+mkrtR2zyv2HaHQXTeY3mPZhQF25dCUth6FESdhbhSwBEny3Kg+M7iiNylvLqsS3GdxnfLlsBTUTrLG+W9GaLQEY3wvnSnTmzVJoRnhSgXpuiODyqZ2j6HSg4dU0Frn7H9DGeDaqd02tJ6qzGd8DdEui60ndNRcK3RLonRNaPK4Pdku09aJ0uWs8K3QdpXQdLlvPLomyb0nNBrTUdc8o/XSHSn1rmtZjrmLdB0nNN61Go9xND6559DTb08sLATsfWeSNhaPrDlUo+tS1nfJo3Seq2k9VnlF1UrTapKxvlQPQ9Cl9HIinppUehmhyIr6F0ToLVyuT9j2haHRzyzyv0HaXYXTUXK/ZbpC7btRnhS1O0Oi2ocDdF1otpNaazFy2qS6DWk7oxrlToLU+h9UOeTzQ+pejNHMbzA+jk269uX6wb5bzCSm9T9N6sbj1k2afRy9DNPS5OufQ8+jjmzTaTtn0NNuKfQ0+igjs6b1zT6jPoOUrSagdt0OUS5TuVvQo4LnuSWOiwmss8Kuel9V1lOwb4IdN0WwtZ5R/S2l9C1RQ3Qdp2l9EMVui3ROg9EEVmmtS9H0LkbU9U1Tpxcl1SWjolaMH1vSN6Vya6aaT1S9JqOj1L6Rs6NWv1Ry6hfVt5SsYjb0PQzTn6bt6HF1TQ9OabNNlR0dD0hNj0lF+x7c/TdJR0z6Gn0cs0bsh1fo36Obtu0o6bst2h23QStpKToO1Cewly3Y9CIlyW5V9Ycpz3JLl02FuWeDXLYWujWE9YHBS9H0bluWd8kPQo+FsZhJpOqWJ2FFoetQpajVPRy6g0wM6Vzpz2GzpZqi9TuRmhOh2dN05p9DT6Olc46Jo0055s82ao6Jo3TnmjdGhXoekem6SXmh7c/Qdqp0dj25uw7VUdXY9uTtv0VUdfTeuWfQ0+hqjo9bpGbHtVLdD0h03Sqi/YdI9N0kt6FJ03SQ8hy3TdBBckuFPWHOGoawnrDqsJYOTmuS4LcOu5C4Z5arj5bl1XBfzHJrk1hO5duvmjvA3DmoSqTRdYDxkpz6mn1cfQzTVYjtn1PPq4Js0+hqj6OfqefR8/P0PPqaI75se3HPqafU1R1XZekP0abVUX6b1KaGaVR/W9L0Pqqb0ZoreqpWbNNoSnlNEV6bpL1ulUr23aPo+qqLdjPo5/Q6VUdPbdubpu1VHVNj25e27NUdXYdubtu1VHR23Tm7HsVOn0PUOx7NStJYTsOwg1lO5Uug9Z3Gq+OzMw0w+syTdGm2ZIZs0+jMqDT6Gn0ZjUafQf1ZijT6jPqzIG/Rv0Zkhmxn0Zkh/QP0Zkh7HtmIC7DtmRbpumYBvR9Bih9b0GSb0PRYIvTdsyLdt2zJN2PbMk/9k=");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  margin:center;
  color:white;
  font-family: sans-serif;
  
}
.space{
  width:15px;
  height:auto;
  display:inline-block;
}
.spaceA{
  width:165px;
  height:auto;
  display:inline-block;
}
.container {
  min-height: 20vh;
  justify-content: center;
  align-items: center;
  display: flex;
  text-align: center;
}

input {
  cursor: pointer;
  border: 0;
  border-radius: 4px;
  font-weight: 600;
  margin: 0 10px;
  width: 200px;
  padding: 10px 0;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.2);
  transition: 0.4s;
}

.login {
  color: purple;
  background-color: rgba(255, 255, 255, 1);
  border: 1px solid rgba(104, 85, 224, 1);
}

.login:hover {
  color: white;
  width:;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.6);
  background-color: lightgreen;
}

.reset{
  color: purple;
  background-color: rgba(255, 255, 255, 1);
  border: 1px solid rgba(104, 85, 224, 1);
}

.reset:hover{
  color: white;
  width:;
  box-shadow: 0 0 20px rgba(104, 85, 224, 0.6);
  background-color: tomato;
}


</style>

<body>
<div class='portalheader'>
<h2 style="padding-top: 25px;"> <center>Online Book Shopping Portal</center></h2><br><br>
</div>

<div class='container'>
<form onsubmit = "return checkForm();" action="CheckLogin.jsp">

<div class='userType'>
<label><center>Customer<div class='spaceA'></div>Admin</center></label>
<input type=radio id='customer' name='usertype' value='customer'>
<input type=radio id='admin' name='usertype' value='admin'>
<br><br><br>
</div>

<label><center>Enter User ID:</label> 
<div class="space"></div>
<input type="text" id="uid" name="uid" ></center></label><br>

<label><center>Enter User PWD:</label> 
<input type="password" id="pwd" name="pwd" ></center></label><br><br>

<center>
<input class='login' type="submit" value="Login"  >
<div class="space"></div>
<input class='reset' type="reset" value="Reset">
</center>
<br><br>


<label>New User?</label><div class="space"></div><a href="RegisterUserPage.jsp" style="color:blue">Register here</a>
</form>
</div>

<script>
function checkForm(){
	var username = document.getElementById("uid");
	var password = document.getElementById("pwd");
	
	if(!document.getElementById("customer").checked & !document.getElementById("admin").checked){
		alert("Select a Customer or Admin");
		return false;
	}
	
	if(username.value.length == 0){
	alert("Enter username");
	return false;
	}
	
	if(password.value.length == 0){
	alert("Enter Password");
	return false;
	}
	
}
</script>
</body>
</html>