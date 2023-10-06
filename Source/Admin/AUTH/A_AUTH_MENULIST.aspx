<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Admin/Web.Master" AutoEventWireup="true" CodeBehind="A_AUTH_MENULIST.aspx.cs" Inherits="T2LHomePage.Source.Admin.AUTH.A_AUTH_MENULIST" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .default-table-wrap{
            width:100%;
            min-height:300px;
            max-height:500px;
            border-top:1px solid #eaeaea;
            border-bottom:1px solid #eaeaea;
        }
        .default-table{
            table-layout:fixed;
            width:100%;
            border-collapse:collapse;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="default-table-wrap">
        <table class="default-table">

        </table>
    </div>
</asp:Content>
