<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Pulse | Add New Patient</title>

   
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    

  </head>

  <body>
  
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><i><strong>Pulse</strong></i></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="History.jsp">History</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
    
    
  <div class="container">
  	<div class="col-md-8 col-md-offset-2">
  	<p class="lead text-center">Use the following form to fill in the details of Patient and add him/her to the queue</p>
  	<p class="lead small text-center">Ensure you enter each detail correctly, then press the Submit Button to post the request]</p>
  	
  	
		<form action="Register" class="form-horizontal" method="POST">
            
                <div class="form-group">
                  <label class="col-sm-2 control-label">Registration Number</label>

                  <div class="col-sm-6">
                    <input name ="regNumber" type="text" class="form-control" placeholder="Reg. Number">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">First Name</label>

                  <div class="col-sm-6">
                    <input name = "firstName" type="text" class="form-control" placeholder="First Name">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label">Last Name</label>

                  <div class="col-sm-6">
                    <input name="lastName" type="text" class="form-control" placeholder="Last Name">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">Gender</label>
                  <div class="col-sm-6">
                  <select name ="gender"class="form-control">
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                    
                  </select>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-2 control-label">Faculty</label>

                  <div class="col-sm-6">
                    <input name = "faculty" type="text" class="form-control" placeholder="Faculty">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label">Department</label>

                  <div class="col-sm-6">
                    <input name = "department" type="text" class="form-control" placeholder="Department">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label">Doctor's Name</label>

                  <div class="col-sm-6">
                    <input name = "doctor" type="text" class="form-control" placeholder="Doctor's Name">
                  </div>
                </div>
                
              
              <div>
                
                <button id = "btnSubmit" type="submit" class="btn btn-primary col-md-8">Add to Queue</button>
                <button id = "btnCancel" class="btn btn-danger pull-right col-md-3">Cancel</button>
               
              </div>
              
            </form>
            </div>
            
            </div>
</html>