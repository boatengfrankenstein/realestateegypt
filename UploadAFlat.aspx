<%@ Page Language="C#" MasterPageFile="~/Real Estate.master" AutoEventWireup="true" CodeFile="UploadAFlat.aspx.cs" Inherits="UploadAFlat" Title="Egypt Flat Finder - Upload A Flat" Theme="Real Estate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Upload Flat Info</h1>
    <br />
    <h3>Upload information about your flat or apartment in Cairo to be available to 
        lodgers from all over the world</h3>
    <br />
    <br />
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
        onfinishbuttonclick="Wizard1_FinishButtonClick" 
        onnextbuttonclick="Wizard1_NextButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" Title="Start">
                <blockquote>
                    <p>Welcome To Uploading Flat Info Wizard</p>
                    <p style="text-indent: 0px">This Wizard will guide you through the necessary steps.</p>
                    <p>Press Next To Start</p>
                    <asp:Label ID="ErrorLabel" runat="server" 
                        Text="An Error Occured while Processing Data Upload Please Be Patient and Start it from Scratch!" 
                        ForeColor="Red" Visible="False"></asp:Label>
                </blockquote>    
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Login Info">
                <blockquote>
                    <asp:Login ID="Login1" runat="server">
                    </asp:Login>
                    <br />
                    <a href="Register.aspx">Sign Up</a>
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Address Info">
                <blockquote>
                                
                    <table style="width: 100%">
                        <tr>
                            <td>
                                Address :
                            </td>
                            <td>
                                <asp:TextBox ID="TBAddress_1" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TBAddress_1" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="TBAddress_2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City :
                            </td>
                            <td>
                                <asp:TextBox ID="TBCity" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TBCity" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                                
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Contact Info">
                <blockquote>
                <table style="width: 100%">
                    <tr>
                        <td>
                            Owner Name : </td>
                        <td>
                            <asp:TextBox ID="TBName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TBName" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-Mail : </td>
                        <td>
                            <asp:TextBox ID="TBEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="TBEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TBEmail" ErrorMessage="X" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Telephone :
                        </td>
                        <td>
                            <asp:TextBox ID="TBTelephone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TBTelephone" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="TelephoneValidator" runat="server" 
                                ControlToValidate="TBTelephone" ErrorMessage="X" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Layout Info">
                <blockquote>
                    
                    <table style="width: 100%">
                        <tr>
                            <td>
                                Area :
                            </td>
                            <td valign="bottom">
                                <asp:TextBox ID="TBArea" runat="server" Columns="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TBArea" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                    runat="server" ControlToValidate="TBArea" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                m²</td>
                        </tr>
                        <tr>
                            <td>
                                Number Of Rooms :
                            </td>
                            <td>
                                <asp:TextBox ID="TBRooms" runat="server" Columns="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="TBRooms" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                                    runat="server" ControlToValidate="TBRooms" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number Of Bedrooms :
                            </td>
                            <td>
                                <asp:TextBox ID="TBBedrooms" runat="server" Columns="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="TBBedrooms" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                    runat="server" ControlToValidate="TBBedrooms" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number Of People :
                            </td>
                            <td>
                                <asp:TextBox ID="TBCapacity" runat="server" Columns="4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="TBCapacity" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                                    runat="server" ControlToValidate="TBCapacity" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Facilities Info">
                <blockquote>
                    
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxFurniture" runat="server" Text="Furniture" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxAirConditioner" runat="server" 
                                    Text="Air Conditioner" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxTelephone" runat="server" Text="Local Telephone" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxInternet" runat="server" Text="Internet Cable" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxTelevision" runat="server" Text="Television" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxSatellite" runat="server" Text="Satellite" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxCleaning" runat="server" Text="Cleaning Included" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxBills" runat="server" Text="Bills Paid By Owner" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxMeals" runat="server" Text="Meals Included" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBoxDoorMan" runat="server" Text="Door Man" />
                            </td>
                        </tr>
                    </table>
                    
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Rent Info">
                <blockquote>
                    
                    <table style="width: 100%">
                        <tr>
                            <td>
                                Start Date :
                            </td>
                            <td valign="bottom">
                                <asp:DropDownList ID="StartDateMonth" runat="server" Width="80px">
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;-
                                <asp:DropDownList ID="StartDateDay" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;-
                                <asp:DropDownList ID="StartDateYear" runat="server">
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                    <asp:ListItem>2027</asp:ListItem>
                                    <asp:ListItem>2028</asp:ListItem>
                                    <asp:ListItem>2029</asp:ListItem>
                                    <asp:ListItem>2030</asp:ListItem>
                                    <asp:ListItem>2031</asp:ListItem>
                                    <asp:ListItem>2032</asp:ListItem>
                                    <asp:ListItem>2033</asp:ListItem>
                                    <asp:ListItem>2034</asp:ListItem>
                                    <asp:ListItem>2035</asp:ListItem>
                                    <asp:ListItem>2036</asp:ListItem>
                                    <asp:ListItem>2037</asp:ListItem>
                                    <asp:ListItem>2038</asp:ListItem>
                                    <asp:ListItem>2039</asp:ListItem>
                                    <asp:ListItem>2040</asp:ListItem>
                                    <asp:ListItem>2041</asp:ListItem>
                                    <asp:ListItem>2042</asp:ListItem>
                                    <asp:ListItem>2043</asp:ListItem>
                                    <asp:ListItem Value="36">2044</asp:ListItem>
                                    <asp:ListItem>2045</asp:ListItem>
                                    <asp:ListItem>2046</asp:ListItem>
                                    <asp:ListItem>2047</asp:ListItem>
                                    <asp:ListItem>2048</asp:ListItem>
                                    <asp:ListItem>2049</asp:ListItem>
                                    <asp:ListItem>2050</asp:ListItem>
                                    <asp:ListItem>2051</asp:ListItem>
                                    <asp:ListItem>2052</asp:ListItem>
                                    <asp:ListItem>2053</asp:ListItem>
                                    <asp:ListItem>2054</asp:ListItem>
                                    <asp:ListItem>2055</asp:ListItem>
                                    <asp:ListItem>2056</asp:ListItem>
                                    <asp:ListItem>2057</asp:ListItem>
                                    <asp:ListItem>2058</asp:ListItem>
                                    <asp:ListItem>2059</asp:ListItem>
                                    <asp:ListItem>2060</asp:ListItem>
                                    <asp:ListItem>2061</asp:ListItem>
                                    <asp:ListItem>2062</asp:ListItem>
                                    <asp:ListItem>2063</asp:ListItem>
                                    <asp:ListItem>2064</asp:ListItem>
                                    <asp:ListItem>2065</asp:ListItem>
                                    <asp:ListItem>2066</asp:ListItem>
                                    <asp:ListItem>2067</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                End Date :
                            </td>
                            <td valign="bottom">
                                <asp:DropDownList ID="EndDateMonth" runat="server" Width="80px">
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;-&nbsp;<asp:DropDownList ID="EndDateDay" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;-
                                <asp:DropDownList ID="EndDateYear" runat="server">
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                    <asp:ListItem>2026</asp:ListItem>
                                    <asp:ListItem>2027</asp:ListItem>
                                    <asp:ListItem>2028</asp:ListItem>
                                    <asp:ListItem>2029</asp:ListItem>
                                    <asp:ListItem>2030</asp:ListItem>
                                    <asp:ListItem>2031</asp:ListItem>
                                    <asp:ListItem>2032</asp:ListItem>
                                    <asp:ListItem>2033</asp:ListItem>
                                    <asp:ListItem>2034</asp:ListItem>
                                    <asp:ListItem>2035</asp:ListItem>
                                    <asp:ListItem>2036</asp:ListItem>
                                    <asp:ListItem>2037</asp:ListItem>
                                    <asp:ListItem>2038</asp:ListItem>
                                    <asp:ListItem>2039</asp:ListItem>
                                    <asp:ListItem>2040</asp:ListItem>
                                    <asp:ListItem>2041</asp:ListItem>
                                    <asp:ListItem>2042</asp:ListItem>
                                    <asp:ListItem>2043</asp:ListItem>
                                    <asp:ListItem Value="36">2044</asp:ListItem>
                                    <asp:ListItem>2045</asp:ListItem>
                                    <asp:ListItem>2046</asp:ListItem>
                                    <asp:ListItem>2047</asp:ListItem>
                                    <asp:ListItem>2048</asp:ListItem>
                                    <asp:ListItem>2049</asp:ListItem>
                                    <asp:ListItem>2050</asp:ListItem>
                                    <asp:ListItem>2051</asp:ListItem>
                                    <asp:ListItem>2052</asp:ListItem>
                                    <asp:ListItem>2053</asp:ListItem>
                                    <asp:ListItem>2054</asp:ListItem>
                                    <asp:ListItem>2055</asp:ListItem>
                                    <asp:ListItem>2056</asp:ListItem>
                                    <asp:ListItem>2057</asp:ListItem>
                                    <asp:ListItem>2058</asp:ListItem>
                                    <asp:ListItem>2059</asp:ListItem>
                                    <asp:ListItem>2060</asp:ListItem>
                                    <asp:ListItem>2061</asp:ListItem>
                                    <asp:ListItem>2062</asp:ListItem>
                                    <asp:ListItem>2063</asp:ListItem>
                                    <asp:ListItem>2064</asp:ListItem>
                                    <asp:ListItem>2065</asp:ListItem>
                                    <asp:ListItem>2066</asp:ListItem>
                                    <asp:ListItem>2067</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Rent / Day :
                            </td>
                            <td valign="bottom">
                                <asp:TextBox ID="TBRentPerDay" runat="server" Columns="7"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TBRentPerDay" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" 
                                    runat="server" ControlToValidate="TBRentPerDay" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                U.S. Dollars</td>
                        </tr>
                        <tr>
                            <td>
                                Rent / Week :
                            </td>
                            <td valign="bottom">
                                <asp:TextBox ID="TBRentPerWeek" runat="server" Columns="7"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TBRentPerWeek" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" 
                                    runat="server" ControlToValidate="TBRentPerWeek" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                U.S. Dollars</td>
                        </tr>
                        <tr>
                            <td>
                                Rent / Month :
                            </td>
                            <td valign="bottom">
                                <asp:TextBox ID="TBRentPerMonth" runat="server" Columns="7"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TBRentPerMonth" ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" 
                                    runat="server" ControlToValidate="TBRentPerMonth" ErrorMessage="X" 
                                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                                U.S. Dollars</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <br />
                                <asp:Label ID="Label1" runat="server" 
                                    
                                    Text="The Agency gets 10% of the net amout paid for the total period of stay in advance from both sides of the deal on closing deals." 
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Upload Pictures">
                <blockquote>
                    
                    <table style="width: 100%">
                        <tr>
                            <td valign="bottom">
                                Picture #1 :
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                                <asp:Label ID="LabelUpload" runat="server"></asp:Label>
                                <br />
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    
                </blockquote>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Complete">
                <blockquote>                    
                    <p>Thank You !</p><br />
                    <p style="text-indent: 0px">Information about your flat is available now on our 
                        catalog.</p>
                    <p style="text-indent: 0px">Our Operators will contact you by e-mail as soon as 
                        potential customers show interest in your flat.</p>
                </blockquote>
            </asp:WizardStep>
        </WizardSteps>
        </asp:Wizard>
    <asp:Label ID="LabelFileName" runat="server" Visible="False"></asp:Label>
</asp:Content>

