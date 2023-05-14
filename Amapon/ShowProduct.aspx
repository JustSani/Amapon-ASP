<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowProduct.aspx.cs" Inherits="Amapon.ShowProduct" %>

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
        .navbar-brand{
            background-color: #ffffff00;
            border: none;
            color: white;
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
                <a class="nav-link" href="/Cart.aspx">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/Orders.aspx">Orders</a>
              </li>
            </ul>
          </div>
        </nav>
        <a style="margin-left: 10px; color: #232F3E;" href="ShowCategori.aspx"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
</svg> Torna indietro</a>
        <section style="width: 80%; background-color: #FFF; margin: auto; padding: 20px; max-width: 1150px;">
             <div class="row">
                <div class="col-md-4">
                    <div class="form-group" >
                        <img runat="server" ID="img"  style="border: 4px solid black; margin: auto;" class="img-fluid rounde" alt="Responsive image"  >
                    
                    </div>
                </div>
                <div class="col-md-5">
                    <h5 runat="server" ID="prodName"> Harry Potter Colouring Book [Lingua inglese]</h5>
                    <small runat="server" ID="smallProduct" >Produttore: Antonio Ricci</small>
                    <br>
                    <hr>
                    <h5 runat="server" ID="prize">20,00€</h5>
                    <small>Tutti i prezzi includono l'IVA.</small>
                    <p><b>Spedizione GRATUITA</b> con consegna presso <b>punti di ritiro (se disponibile per il tuo ordine).</b></p>
                    <hr>
                    <h6>Informazioni su questo articolo</h6>
                    <p runat="server" ID="prodDesc">Packed with stunning pieces of artwork from the Warner Bros. archive, this book gives fans the chance to colour in the vivid settings and beloved characters of J.K. Rowling s wizarding world. From the heraldry of the four Hogwarts houses to the extravagant wares of Weasley s Wizard Wheezes, the world of Harry Potter overflows with radiant colour. Filled with intricate illustrations and elaborate designs used in the making of the Harry Potter films, this book invites you to imbue the wizarding world with colour in your own explorations of Hogwarts castle, the Forbidden Forest, and much more. You will also find pages of magical creatures and iconic scenes from the films, from the Sorting Ceremony in Harry s first year, to the unforgettable final battle between Harry and Lord Voldemort, as well as some of the marvellous props used in the movies, such as The Quibbler, Quidditch World Cup posters, and the Triwizard Cup. Unique and interactive, the Harry Potter Colouring Book is a perfect collector s item for fans of the blockbuster saga. For best results, we recommend the use of colouring pencils to colour and create your stunning pictures.</p>                            
                    <br>
                </div>
                <div class="col-md-3">
                    <div style="border: solid 1px #AAA; height: auto; padding-left: 40px;padding-right: 40px; padding-top: 20px;">
                        <small><b>Nuovo:</b></small>
                        <br>
                        <h5 style="color: #b80000;" runat="server" ID="prize2"></h5>
                        <small>Consegna senza costi aggiuntivi in <b runat="server" ID="tempo">23 giorni</b> lavorativi. Ordina ora perfavore.</small>
                        <br><br>
                        <h5 style="color: green;">Disponibilità immediata.</h5>
                    
                        <div>
                            <div style="float:left;">Quantità:</div>
                            <div style="float:left; margin-left: 7px;">
                                <select runat="server" ID="quantiSelect">
                                
                                </select>
                            </div>
                            <br><br>
                            <asp:Button runat="server" type='button' class='btn btn-warning' ID="addToCartBtn" style='width: 100%' OnClick='addToCart' Text="Add to cart" />                        
                            <br>
                            <br>
                            <small>
                                <div class="row">
                                    <div class="col">
                                        Spedizione
                                        Venditore
                                    </div>
                                    <div class="col" runat="server" ID="venditore">
                                        Amazon
                                        Antonio Ricci                                </div>
                                </div>
                            </small>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
