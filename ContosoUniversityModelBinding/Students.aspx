﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="ContosoUniversityModelBinding.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ValidationSummary ShowModelStateErrors="true" runat="server" />
    <asp:GridView runat="server" ID="studentsGrid"
        ItemType="ContosoUniversityModelBinding.Models.Student" DataKeyNames="StudentID" 
        SelectMethod="studentsGrid_GetData"
        UpdateMethod="studentsGrid_UpdateItem"
        DeleteMethod="studentsGrid_DeleteItem"
        AutoGenerateEditButton="true" 
        AutoGenerateDeleteButton="true"  
        AutoGenerateColumns="false">
        <Columns>
            <asp:DynamicField DataField="StudentID" />
            <asp:DynamicField DataField="LastName" />
            <asp:DynamicField DataField="FirstName" />
            <asp:DynamicField DataField="Year" />          
            <asp:TemplateField HeaderText="Total Credits">
              <ItemTemplate>
                <asp:Label Text="<%# Item.Enrollments.Sum(en => en.Course.Credits) %>" 
                    runat="server" />
              </ItemTemplate>
            </asp:TemplateField>        
        </Columns>
    </asp:GridView>
</asp:Content>