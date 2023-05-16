<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Private.aspx.cs" Inherits="Amapon.Private" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
   
<link href="https://sanino.altervista.org/Amapon//css/producerNavbar.css" rel="stylesheet">
<style>
    
    .navbar-brand{
      color: white;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
       <header>
    <!-- Sidebar -->
    <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse ">
      <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">
          <a href="?page=Add" class="list-group-item list-group-item-action py-2 ripple"
            ><i class="fas fa-lock fa-fw me-3"></i><span>Add Product</span></a
          >

      </div>
    </nav>
    <!-- Sidebar -->
  
    <!-- Navbar -->
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light fixed-top">
      <!-- Container wrapper -->
      <div class="container-fluid">
        <!-- Toggle button -->
        <button
          class="navbar-toggler"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#sidebarMenu"
          aria-controls="sidebarMenu"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars"></i>
        </button>
  
        <!-- Brand -->
        <a class="navbar-brand" href="../">
          AMAPON
        </a>

        Product Manager

        <!-- Right links -->
        <ul class="navbar-nav ms-auto d-flex flex-row">
         
      <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->
  </header>
  <!--Main Navigation-->
  
  <!--Main layout-->
  <main style="margin-top: 58px;">
    <div class="container pt-4">



<!--Chiusura nel php--><!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Prodotto caricato con successo!</h5>
      </div>
      <div class="modal-body">
        Il prodotto da lei creato è stato caricato con successo sul database ed è visualizzabile nella sezione "Product List".
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closemodal()">Close</button>
      </div>
    </div>
  </div>
</div>
<h4>Crea un nuovo prodotto:</h4>
<br>

<div >
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group" >
                <img id="rounde" style="border: 1px solid black; " class="img-fluid rounde" alt="Responsive image" src="https://sanino.altervista.org/Amapon/productsImages/default.png" >
                <br><br>
                
                <asp:FileUpload required ID="pic" runat="server" class="form-control"  type="file" />        
            </div>
        </div>
        <div class="col-sm">
            <div class="row">
                <div class="col-9">
                    <div class="form-group" >
                        <label >Nome del prodotto</label>
                        <input runat="server" required id="prodName" name="prodName" type="text" maxlength="225" class="form-control" placeholder="Cuffie Gaming per PC Xbox One Mac, Controllo del Volume, Blu">
                    </div>
                </div>
                <div class="col-3">
                    <div class="form-group" >
                        <label >Prezzo</label>
                        <input runat="server" required id="prize" name="prize" type="number" maxlength="45" class="form-control" placeholder="1999">
                    </div>
                </div>
            </div>
            <br>
            <div class="form-group" >
                <label>Descrizione</label>
                <textarea required runat="server" id="prodDescription" name="prodDescription" class="form-control" rows="3" maxlength="2250" placeholder="Massimo 225 lettere"></textarea>
            </div>
            <br>
            <div class="row">
                <div class="col-3">
                    <div class="form-group" >
                        <label >Disponibilita prodotto</label>
                        <input runat="server" id="nAvailable" required name="nAvailable" class="form-control" type="number" placeholder="1">
                    </div>
                </div>
                <div class="col-3">
                    <div class="form-group" >
                        <label >Arrivo in</label>
                        <input runat="server" id="daysToWait" required name="daysToWait" class="form-control" type="number" placeholder="N° giorni">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group" >
                        <label >Nome produttore/marca</label>
                        <input runat="server" id="producer" required name="producer" type="text" maxlength="25" class="form-control" placeholder="Razer">
                    </div>
                </div>
            </div>
            <br>
            <div class="form-group">
                <div class="row">
                    <div class="col-6">
                        <label>Categoria</label>
                        <select class="form-control" runat="server" id="macrocat" >
                            <option value="1">Technology</option><option value="6">Books</option><option value="11">Clothing</option><option value="15">Home</option><option value="23">Games</option><option value="27">Health</option><option value="32">Food</option>                        </select>
                    </div>
                    
                </div>
            </div>
            <br>
            <div class="form-group">
                <button runat="server" ID="send" onserverclick="caricaProdotto" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>
    </form>
</body>
</html>
