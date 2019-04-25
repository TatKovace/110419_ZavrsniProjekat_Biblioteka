<%@ Page Title="Welcome to Library Online" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_110419_ZavrsniProjekat_Biblioteka.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -CDN-
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />  
		-->
	  <link href="Content/bootstrap.min.css" rel="stylesheet" />
		<!-- Custom cascade style -->
	  <link href="Content/CustomCS.css" rel="stylesheet" /> 
    <title><%: Page.Title %></title>
</head>

<body>
	<!-- <form id="form1" runat="server"> -->
	<!-- Navbar -->
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top bg-dark">        
        <a class="navbar-brand" href="Default.aspx">Logo</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navb">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="Default.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="javascript:void(0)">Disabled</a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Login.aspx">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SignUp.aspx">Sign Up</a>
                </li>
            </ul>
        </div>
    </nav>
	<!-- </form> -->
	<!-- Jumbotron -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><%: Title %></h1>
            <p>This is some text.</p>
        </div>
    </div>
    <!-- Main content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Lorem ipsum dolor sit amet, elementum eget hymenaeos malesuada ante laoreet, officiis et sed aliquam, quae hendrerit vehicula nulla aliquam. Odio pellentesque venenatis rhoncus, cursus faucibus dolor nulla vel et sed. Pellentesque integer convallis dis, in metus nibh neque, lectus leo dui sed. Ultrices quisque, semper aenean accumsan pede quis dignissim, feugiat augue sem curabitur, interdum nec nam. Venenatis est curabitur tempus interdum, neque volutpat est odio, consequat lacinia nibh sed. Pulvinar penatibus parturient, ut maecenas integer et maecenas, etiam dolor.</p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Lorem ipsum dolor sit amet, elementum eget hymenaeos malesuada ante laoreet, officiis et sed aliquam, quae hendrerit vehicula nulla aliquam. Odio pellentesque venenatis rhoncus, cursus faucibus dolor nulla vel et sed. Pellentesque integer convallis dis, in metus nibh neque, lectus leo dui sed. Ultrices quisque, semper aenean accumsan pede quis dignissim, feugiat augue sem curabitur, interdum nec nam. Venenatis est curabitur tempus interdum, neque volutpat est odio, consequat lacinia nibh sed. Pulvinar penatibus parturient, ut maecenas integer et maecenas, etiam dolor.</p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Lorem ipsum dolor sit amet, elementum eget hymenaeos malesuada ante laoreet, officiis et sed aliquam, quae hendrerit vehicula nulla aliquam. Odio pellentesque venenatis rhoncus, cursus faucibus dolor nulla vel et sed. Pellentesque integer convallis dis, in metus nibh neque, lectus leo dui sed. Ultrices quisque, semper aenean accumsan pede quis dignissim, feugiat augue sem curabitur, interdum nec nam. Venenatis est curabitur tempus interdum, neque volutpat est odio, consequat lacinia nibh sed. Pulvinar penatibus parturient, ut maecenas integer et maecenas, etiam dolor.</p>
            </div>
        </div>
    </div>

	<!-- <div class="container body-content"> -->      
    <!-- Footer -->
    <footer class="container">
        <hr />
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy;<% Response.Write(DateTime.Now.Year.ToString()); %> TatKovace &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> </p>
    </footer>
    <!-- </div> -->

		<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
		-->

	<script src="Scripts/jquery-3.0.0.slim.min.js"></script>
	<script src="Scripts/popper.min.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
