<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Amapon.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #eee;">
        <div class="container py-5">
          <div class="row d-flex justify-content-center align-items-center">
            <div class="col-xl-6">
              <div class="card rounded-3 text-black">
                <div class="row g-0">
                    <div class="card-body p-md-5 mx-md-4">
                      <div class="text-center">
                        <img src="../img/Amazon_icon.png"
                          style="width: 185px;" alt="logo">
                        <h4 class="mt-1 mb-5 pb-1">Register</h4>
                      </div>
      
                      <div>
                        <p></p>
      
                        <div class="form-outline mb-4">
                          <input runat="server" required type="text" id="username" name="username" class="form-control"
                            placeholder="Username" />
                            <small class="form-text text-muted">Potrà esser usato per loggarsi</small>
                        </div>

                        <div class="form-outline mb-4">
                            <input runat="server" required type="email" id="email" name="email" class="form-control"
                              placeholder="Email" />
                              <small class="form-text text-muted">Potrà esser usato per loggarsi</small>
                          </div>

                        <div class="form-outline mb-4">
                            <input runat="server" required type="password" id="password" name="password" class="form-control" 
                            placeholder="Password"/>
                            <small class="form-text text-muted">La tua password non verrà criptata e quindi potrò vederla.</small>
                        </div

                        <div class="form-outline mb-4">
                            <input runat="server" required type="text" id="name" name="name" class="form-control"
                              placeholder="Name" />
                          </div>
                          <br />
                          <div class="form-outline mb-4">
                            <input runat="server" required type="text" id="surname" name="surname" class="form-control"
                              placeholder="Surname" />
                          </div>

                          <div class="form-outline mb-4">
                            <select runat="server" required id="type" name="type" class="form-control">
                                <option value="USR">USR</option>
                                <option value="ADM">ADM</option>
                            </select>
                          </div>
      
                      </div>
                        <div class="text-center pt-1 mb-5 pb-1">
                                <asp:Button ID="Button1" runat="server" Text="Register" type="button"  onclick="registra"  class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" />
                            </div>
                      
                      <div class="d-flex align-items-center justify-content-center pb-4">
                        <p class="mb-0 me-2">Do u want to login?</p>
                        <a href="/Default.aspx">
                            <button type="button" id="btnLogin" class="btn btn-outline-danger">Login</button>
                        </a>

                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
        <br><br><br>
            </div>
    </form>
</body>
</html>
