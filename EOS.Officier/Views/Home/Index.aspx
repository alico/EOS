<%@ Page Language="C#" MasterPageFile="~/Content/Template/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ana Sayfa
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Anasayfa</a> <span class="divider">/</span></li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="block">
                    <a href="#page-stats" class="block-heading" data-toggle="collapse">Hoşgeldiniz</a>
                    <div id="page-stats" class="block-body collapse in">
                        <div class="stat-widget-container">
                        <img src="/Images/turk-bayragi.jpg" width="1000px" height="600px" />
                        <div>
                                Elektronik Seçim Sistemi Panel'inde gerçekleştirebileceğiniz bütün işlemler sol
                            taraftaki menüde ana başlıklar halinde sıralanmıştır.
                        </div>
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="block span6">
                    <a href="#tablewidget" class="block-heading" data-toggle="collapse">Users<span class="label label-warning">+10</span></a>
                    <div id="tablewidget" class="block-body collapse in">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        First Name
                                    </th>
                                    <th>
                                        Last Name
                                    </th>
                                    <th>
                                        Username
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        Mark
                                    </td>
                                    <td>
                                        Tompson
                                    </td>
                                    <td>
                                        the_mark7
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Ashley
                                    </td>
                                    <td>
                                        Jacobs
                                    </td>
                                    <td>
                                        ash11927
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Audrey
                                    </td>
                                    <td>
                                        Ann
                                    </td>
                                    <td>
                                        audann84
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        John
                                    </td>
                                    <td>
                                        Robinson
                                    </td>
                                    <td>
                                        jr5527
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Aaron
                                    </td>
                                    <td>
                                        Butler
                                    </td>
                                    <td>
                                        aaron_butler
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Chris
                                    </td>
                                    <td>
                                        Albert
                                    </td>
                                    <td>
                                        cab79
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <p>
                            <a href="users.html">More...</a></p>
                    </div>
                </div>
                <div class="block span6">
                    <a href="#widget1container" class="block-heading" data-toggle="collapse">ESS Hakında
                    </a>
                    <div id="widget1container" class="block-body collapse in">
                        <ul>
                            <li>Kolay Kullanım: Seçmenin oyunu kullanabilmesi için özel yeteneklere sahip olmak
                                zorunda kalmamasıdır. </li>
                            <li>Ergonomik Arayüz: Kullanıcı arayüzlerinin ve seçim ortamının ergonomik olmasına
                                dikkat edilmelidir. Ek olarak, seçmenin oyunu kullandıktan sonra, tekrar bir şey
                                yapmasına gerek duyulmamalıdır. </li>
                            <li>
                            Sistemin Kullanım Esnekliği: Seçmenlerin mümkün olduğunca değişik ortamlardan rahat
                                bir biçimde oy kullanabilmeleridir. Teoride İnternet ve cep telefonları aracılığıyla
                                bile oy kullanılabilmesi hedeflense de, bugün için bu gereksinimin önceliği olmadığını
                                söyleyebiliriz.
                                 </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <footer>
                        <hr>


                        <p>&copy; 2013 Ali KIZILDAĞ & Emrullah YAZLI</p>
                    </footer>
        </div>
    </div>
</asp:Content>
