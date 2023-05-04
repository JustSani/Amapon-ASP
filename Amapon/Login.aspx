<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Amapon.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
           <section class="h-100 gradient-form" style="background-color: #eee;">
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

                        <div>
                            <p>Please login to your account</p>
      
                            <div class="form-outline mb-4">
                              
                                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                <input required type="text" id="user" name="user" class="form-control"
                                placeholder="Username or Email" />
                            </div>
                        
                            <div class="form-outline mb-4">
                              <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                <input required type="password" id="password" name="password" class="form-control" 
                              placeholder="Password"/>
                            </div>
      
                            <div class="text-center pt-1 mb-5 pb-1">
                               <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button1_Click" />
                                <button type="submit" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button">Log
                                in</button>
                            </div>
                        </div>
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
