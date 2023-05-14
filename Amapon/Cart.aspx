<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Amapon.cart" %>

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
        body{
            background-color:#EBEDED;

        }
        .navbar-brand{
            background-color: #ffffff00;
            border: none;
            color: white;
        }
         .linkProd{
        color: #006174;
        }
        .linkProd:hover{
            color:#ba4f25;
            text-decoration: underline;
        }
        .col-md-7{
            height: 100%;
            background-color:#FFF;
            margin-top: 10px;
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
                <a class="nav-link" href="/Profile.aspx">Profile </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/Orders.aspx">Orders</a>
              </li>
            </ul>
          </div>
        </nav>
        <section>
            <div style="width: 80%; margin: auto; max-width: 1400px;">
                <div class="row">
                    <div class="col-md-7 item" style=" min-height: 866px;">
                        <br>
                        <h3>Carrello</h3>   
                        <div style="padding: 20px;" runat="server" id="cart1">
                            
                        </div>
                    </div>
                    <div class="col-md-4" style=" background-color: #FFF; margin-left: 10px; margin-top: 10px; padding: 20px; ">
                        <h5>Totale previsto:</h5><b runat="server" ID="Totale">4441,00€</b>
            
                        <div action='cartPayment.php'>
                            <button runat="server" ID="btnConferma" onserverclick="Ordina" type="submit" class="btn btn-warning" style="width: 100%; margin-top: 10px;"><small>Procedi all' ordine</small></button>
                        </div>
                    </div>

                    </div>
               </div>
        </section>
    </form>
</body>
</html>
