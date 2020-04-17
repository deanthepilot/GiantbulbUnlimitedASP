<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<!-- 

Original Author: Joshua Novikoff
Date Created: 8/22/2019
Version: 2.1
Date Last Modified: 4/17/20
Modified by: Joshua Novikoff
Modification log: Converted to ASP

				  
-->
<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "giantbulb"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertInquiry @nameTextBox,@emailTextBox, @phoneTextBox, @priceDropDown, @msgTextBox, 1", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@phoneTextBox", System.Data.SqlDbType.BigInt, 50);
            comm.Parameters["@phoneTextBox"].Value = phone.Text;
            comm.Parameters.Add("@priceDropDown", System.Data.SqlDbType.NVarChar, 50);
            comm.Parameters["@priceDropDown"].Value = price.SelectedValue;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("gu_thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="description" content="Inquire about services from Giantbulb Unlimited"/>
<meta name="keywords" content="computers, technology, delivery, web design"/>
<meta name="author" content="Joshua Novikoff"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Giantbulb Unlimited||Contact</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/styles.css"/>
<link href="https://fonts.googleapis.com/css?family=Lexend+Deca|Open+Sans+Condensed:300&display=swap" rel="stylesheet"/>
<link rel="shortcut icon" type="image/png" href="images/gu_favicon.png" />

</head>

<body>
<nav>
<a href="gu_index.html"><img src="images/gu_logo.png" alt="logo"/></a>
<ul>
	<li><a href="gu_index.html">Home</a></li>
	<li><a href="gu_about.html">About</a></li>
	<li><a href="gu_pricing.html">Pricing</a></li>
	<li><a href="gu_examples.html">Examples</a></li>
	<li><a href="gu_contact.html">Contact</a></li>
        <li><a href="gu_login.php">Admin</a></li>
</ul>
</nav>
<main>
	<h1>Service Inquiry</h1>
<br>
<fieldset>
<form runat="server">
		<label for="name">Name:</label> 
		<%--<input type="text" name="Name" id="name" placeholder="first and last name" required />--%>
        <asp:TextBox ID="name" runat="server" />
		
		<br />
		
		<br /><label for="email">Email:</label>
		<%--<input type="email" name="contactEmail" id="email" placeholder="email@email.com" required />--%>
        <asp:TextBox ID="email" runat="server" />
		
		<br />
		
		<br />
		
		<label for="phone">Phone number:</label>
		<%--<input type="tel" name="contactPhone" id="phone" placeholder="(###) ###-####" required 
		pattern="^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$" /> --%>
        <asp:TextBox ID="phone" runat="server" />

		<br />		

		<br /><label for="price">What is your ideal price point?</label><br />
		<%-- <select name="cost" id="price">
		<option value="$100-$200">$100-$200</option>
		<option value="$200-$300">$200-$300</option>
		<option value="$300-$400">$300-$400</option>
		<option value="$400-$500">$400-$500</option>
		<option value="$500-$600">$500-$600</option>
		<option value="$600-$700">$600-$700</option>	
		<option value="$700-$800">$700-$800</option>	
		<option value="$800-$900">$800-$900</option>	
		<option value="$900-$1000">$900-$1000</option>			
		</select>--%>
		<asp:DropDownList ID="price" runat="server">
            <asp:ListItem>$100-$200</asp:ListItem>
            <asp:ListItem>$200-$300</asp:ListItem>
            <asp:ListItem>$300-$400</asp:ListItem>
            <asp:ListItem>$400-$500</asp:ListItem>
            <asp:ListItem>$500-$600</asp:ListItem>
            <asp:ListItem>$600-$700</asp:ListItem>
            <asp:ListItem>$700-$800</asp:ListItem>
            <asp:ListItem>$800-$900</asp:ListItem>
            <asp:ListItem>$900-$1000</asp:ListItem>
        </asp:DropDownList>
        <br />
		<br />
		<label for="Message">If inquiring about web design, explain your design idea. <br /> 
			If inquiring about a custom computer, list your ideal specifications.</label><br />
		<%--<textarea cols="100" rows="10" name="comment" id="Message"></textarea>--%><br />
		<asp:TextBox ID="message" runat="server" Height="100px" Width="200px" />
		<%-- input type="submit" id="submit" value="Submit" class="btn"> --%>
        <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
        <br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

     </form>
</fieldset>
</main>

<footer>
Giantbulb Unlimited &#8226; 57814 Loower Moor Dr, New York NY
</footer>

</body>
</html>