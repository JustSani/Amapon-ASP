<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Amapon.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
</head>
<body style="background-color: #eee;">
    <form id="form1" runat="server">
        <section class="h-100 gradient-form" >
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-6">
              <div class="card rounded-3 text-black">
                <div class="row g-0">
                    <div class="card-body p-md-5 mx-md-4">
      
                      <div class="text-center">
                        <img src="img/Amazon_icon.png"
                          style="width: 185px;" alt="logo">
                        <h4 class="mt-1 mb-5 pb-1">Amapon</h4>
                      </div>
      
                      <div >
                        <p>Please login to your account</p>
      
                        <div class="form-outline mb-4">
                            <asp:TextBox ID="TextBox1" runat="server" Text="customer" required="true" type="text" class="form-control"
                                placeholder="Username or Email" ></asp:TextBox>
                        </div>
                        
                        <div class="form-outline mb-4" aria-sort="none">
                            <asp:TextBox ID="TextBox2" runat="server" Text="customer" required="true" type="password" class="form-control" placeholder="Password"></asp:TextBox>
                        </div>
      
                        <div class="text-center pt-1 mb-5 pb-1">
                            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button" Text="Log In" OnClick="Button1_Click" />
                        </div>
      
                      </div>
                      
                      <div class="d-flex align-items-center justify-content-center pb-4">
                        <p class="mb-0 me-2">Don't have an account?</p>
                        <a href="html-components/register.html">
                            <button type="button" class="btn btn-outline-danger">Create new</button>
                        </a>

                    </div>
                    
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </form>
</body>
</html>
