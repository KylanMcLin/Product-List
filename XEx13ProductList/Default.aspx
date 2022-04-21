<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx13ProductList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Product List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblCategory" for="ddlCategory" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a category:</label>
                <div class="col-xs-8 col-sm-5">
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"
                        DataSourceID="SqlDataSource1" DataTextField="LongName" 
                        DataValueField="CategoryID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
                        ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
                        SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories] 
                            ORDER BY [LongName]">
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                    <asp:DataList ID="dlProducts" runat="server" 
                        DataKeyField="ProductID" DataSourceID="SqlDataSource2" 
                        CssClass="table table-bordered table-striped table-condensed">
                        <HeaderTemplate>
                            <span class="col-xs-2">ID</span>
                            <span class="col-xs-2">Product</span>
                            <span class="col-xs-2 text-right">Unit Price</span>
                            <span class="col-xs-2 text-right">On Hand</span>
                            <span class="col-xs-2 text-right">Total</span>
                        </HeaderTemplate>
                        <ItemTemplate>  
                            <asp:Label ID="lblID" runat="server" 
                                Text='<%# Eval("ProductID") %>' CssClass="col-xs-2" />
                            <asp:Label ID="lblName" runat="server" 
                                Text='<%# Eval("Name") %>' CssClass="col-xs-2" />
                            <asp:Label ID="lblUnitPrice" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:C}") %>' CssClass="col-xs-2 text-right" />
                            <asp:Label ID="lblOnHand" runat="server" 
                                Text='<%# Eval("OnHand") %>' CssClass="col-xs-2 text-right" />    
                            <asp:Label ID="lblTotal" runat="server" 
                                Text='<%# Eval("Total", "{0:C}") %>' CssClass="col-xs-2 text-right" /> 
                        </ItemTemplate>
                        <HeaderStyle CssClass="bg-halloween" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                        SelectCommand="SELECT ProductID, Name, UnitPrice, OnHand, UnitPrice * OnHand AS Total FROM Products WHERE (CategoryID = @CategoryID) ORDER BY ProductID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>    
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>