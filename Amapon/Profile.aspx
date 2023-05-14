<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Amapon.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    
     <style>
        .navbar-brand{
            background-color: #ffffff00;
            border: none;
            color: white;
        }
        button{width: 20vw;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #232F3E"> 
            <asp:Button ID="Button1" runat="server" Text="Mini-Amapon" Style="margin-left: 2vw;" class="navbar-brand" OnClick="Button1_Click" />
            
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Profile </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/Cart.aspx">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/Orders.aspx">Orders</a>
              </li>
            </ul>
          </div>
        </nav>

        <section>
            <div class="row" style="margin: auto; width: 80%; background-color: #232F3E; margin-top: 10px">
             <div class="col-6" style="text-align: center; color: white;  padding: 50px;" ><h1 runat="server" id="wallet">Wallet : 171948939 €</h1> </div>
                <div class="col-6" style=" color: white; border-radius: 5px 5px 5px 5px ; padding: 50px;">
                    <div class="form-group">
                        <label>Username</label>
                        <input runat="server" ID="username" disabled type="text" class="form-control" required placeholder="Username" name="username" value='customer'>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Name</label>
                        <input runat="server" ID="name" disabled  type="text" class="form-control"  required placeholder="Name" name="Name" value='Fabio'>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Surname</label>
                        <input runat="server" ID="surname" disabled  type="text" class="form-control" required placeholder="Surname" name="Surname" value='Sanino'>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Email</label>
                        <input runat="server" ID="email" disabled type="email" class="form-control" required placeholder="Email" name="email" value='fabiosanino@gmail.com'>
                    </div>
                    <br>
                    <br>
                </div>
                <asp:Button ID="Button2" runat="server" Text="esci" OnClick="esci" type="submit" class="btn btn-danger"/>
            </div>
        </section>
    </form>
</body>
</html>
