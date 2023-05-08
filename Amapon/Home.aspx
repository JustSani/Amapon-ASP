<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Amapon.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    
    <style>
        .card-container{
            //border-radius: 20px 20px 20px 20px;
            padding: 10px;
            background-color: white;
        }
        .col-md-3{
            margin-bottom: 2vw;
        }
        .navbar-brand{
            background-color: #ffffff00;
            border: none;
            color: white;
        }
        .hidden{

        }
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
                <a class="nav-link" href="#">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Orders</a>
              </li>
            </ul>
          </div>
        </nav>
        <section class='padd-10' style="padding: 3vw; background-color:#e7e3e3 ">
           <div>
               <div class='row '>
                   <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Technology & Computers</b>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="ShowCategori_Redirect">
                                <img src='https://sanino.altervista.org/Amapon/img/Technology.jpeg' style="width: 100%;">
                            </asp:LinkButton>
                            <br><br>
                            <asp:LinkButton ID="LinkButton2" runat="server"  OnClick="ShowCategori_Redirect">Scopri di più</asp:LinkButton>
                        </div>
                   </div>
                   <div class="col-md-3 wrapper" >
                       <div class="card-container">
                            <b>Books</b>
                            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="ShowCategori_Redirect">
                                <img src='https://sanino.altervista.org/Amapon/img/Books.jpeg' style="width: 100%;"> </a>
                           </asp:LinkButton> 
                           <br><br>
                            <a href='?category=Books' ><small>Scopri di più</small></a>
                       </div>
                   </div>
                   <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Clothing & Accessories</b>
                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="ShowCategori_Redirect">
                                 <img src='https://sanino.altervista.org/Amapon/img/Clothing.jpeg' style="width: 100%;">
                            </asp:LinkButton>
                            <br><br>
                            <a href='?category=Clothing' ><small>Scopri di più</small></a>
                        </div>
                   </div>
                   <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Home & Kitchen</b>
                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="ShowCategori_Redirect">
                                <img src='https://sanino.altervista.org/Amapon/img/Home.jpeg' style="width: 100%;">
                            </asp:LinkButton>
                            <br><br>
                            <a href='?category=Home' ><small>Scopri di più</small></a>
                        </div>
                   </div>
                   <div class='w-100 d-none d-md-block'></div>
                   <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Games & Toys</b>
                            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="ShowCategori_Redirect">
                                <img src='https://sanino.altervista.org/Amapon/img/Games.jpeg' style="width: 100%;"> </a>
                            </asp:LinkButton>
                            <br><br>
                            <a href='?category=Games' ><small>Scopri di più</small></a>
                        </div>
                    </div>
                    <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Health & Beauty</b>
                            <a href='?category=Health'><img src='https://sanino.altervista.org/Amapon/img/Health.jpeg' style="width: 100%;"> </a>
                            <br><br>
                            <a href='?category=Health' ><small>Scopri di più</small></a>
                        </div>
                    </div>
                    <div class="col-md-3 wrapper" >
                        <div class="card-container">
                            <b>Food & Drinks</b>
                            <a href='?category=Food'>
                                <img src='https://sanino.altervista.org/Amapon/img/Food.jpeg' style="width: 100%;">
                            </a>
                            <br><br>
                            <a href='?category=Food' ><small>Scopri di più</small></a>
                        </div>
                    </div>
             </div>
           </div>
        </section>
    </form>
    </body>
</html>
