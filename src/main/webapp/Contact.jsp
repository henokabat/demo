package com.example.demo;

<%@ page import="java.io.IOException, java.io.PrintWriter, javax.servlet.ServletException,
javax.servlet.annotation.WebServlet, javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest,
 javax.servlet.http.HttpServletResponse"%>;
<%! int hitCount=0;%>


        <!DOCTYPE html>
        <html lang='en'>
        <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0>
        <title>Customer Contact App</title>
        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css\" integrity=\"sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M\" crossorigin=\"anonymous\">");
        sb.append("  <link rel=\"stylesheet\" href=\"css/style.css\">");
        sb.append("  </head>");
        sb.append("  <body>");
        sb.append("  <header>");
        sb.append("  <nav class=\"navbar navbar-expand-lg navbar-dark bg-primary\">");
        sb.append("  <a class=\"navbar-brand\" href=\"index.html\">CS472-WAP ::: Lab10</a>");
        sb.append("  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarsExampleDefault\" aria-controls=\"navbarsExampleDefault\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">");
        sb.append("  <span class=\"navbar-toggler-icon\"></span>");
        sb.append("  </button>");
        sb.append("  <div class=\"collapse navbar-collapse\" id=\"navbarColor01\">");
        sb.append("  <ul class=\"navbar-nav mr-auto\">");
        sb.append("  <li class=\"nav-item active\">");
        sb.append("  <a class=\"nav-link\" href=\"#\">Home <span class=\"sr-only\">(current)</span></a>");
        sb.append("  </li>");
        sb.append("  <li class=\"nav-item\">");
        sb.append("  <a class=\"nav-link\" href=\"#\">About</a>");
        sb.append("  </li>");
        sb.append("  <li class=\"nav-item\">");
        sb.append("  <a class=\"nav-link\" href=\"#\">Contact Us</a>");
        sb.append("  </li>");
        sb.append("  </ul>");
        sb.append("  <form class=\"form-inline my-2 my-lg-0\">");
        sb.append("  <input class=\"form-control mr-sm-2\" type=\"text\" placeholder=\"Search\">");
        sb.append("  <button class=\"btn btn-secondary my-2 my-sm-0\" type=\"submit\">Search</button>");
        sb.append("</form>");
        sb.append("</div>");
        sb.append("</nav>");
        sb.append("</header>");

        sb.append("<div class=\"container\">");
        sb.append("<form id=\"formCustomerContact\" method=\"post\" action=\"process-contact-form\">");
        sb.append("<fieldset>");
        sb.append("<legend>Customer Contact Form</legend>");
        Object objErrMsgs = request.getAttribute("errMsgs");
        if(objErrMsgs != null) {
            String errorMsgs = (String) objErrMsgs;
            sb.append("<div><p>");
            sb.append(errorMsgs);
            sb.append("</p></div>");
        }
        String customerName = request.getParameter("customerName");
        String gender = request.getParameter("radioGender");
        String category = request.getParameter("ddlCategory");
        String message = request.getParameter("message");

        sb.append("<div class=\"form-group\">");
        sb.append("<label for=\"customerName\">*Name:</label>");
        if(customerName != null) {
            if(customerName.equals("")) {
                sb.append("<input type=\"text\" class=\"form-control\" id=\"customerName\" name=\"customerName\" aria-describedby=\"customerNameHelp\" placeholder=\"e.g. John Smith\" title=\"Enter your full name\" >");
            } else {
                sb.append("<input type=\"text\" class=\"form-control\" id=\"customerName\" name=\"customerName\" aria-describedby=\"customerNameHelp\" placeholder=\"e.g. John Smith\" title=\"Enter your full name\" value=\'" + customerName + "'>");
            }
        } else {
            sb.append("<input type=\"text\" class=\"form-control\" id=\"customerName\" name=\"customerName\" aria-describedby=\"customerNameHelp\" placeholder=\"e.g. John Smith\" title=\"Enter your full name\" >");
        }
        sb.append("<small id=\"customerNameHelp\" class=\"form-text text-muted\">Enter your full name.</small>");
        sb.append("</div>");

        sb.append("<label>*Gender:</label><br/>");
        sb.append("<label class=\"custom-control custom-radio\">");
        sb.append("  <input id=\"radioGenderMale\" name=\"radioGender\" type=\"radio\" class=\"custom-control-input\" value='male'");
        if(gender != null) {
            if(gender.equals("male")) {
                sb.append(" checked>");
            }
            else {
                sb.append(">");
            }
        } else {
            sb.append("  <input id=\"radioGenderMale\" name=\"radioGender\" type=\"radio\" class=\"custom-control-input\" value='male'>");
        }
        sb.append("  <span class=\"custom-control-indicator\"></span>");
        sb.append("  <span class=\"custom-control-description\">Male</span>");
        sb.append("</label>");
        sb.append("<label class=\"custom-control custom-radio\">");
        sb.append("  <input id=\"radioGenderFemale\" name=\"radioGender\" type=\"radio\" class=\"custom-control-input\" value='female'");
        if(gender != null) {
            if(gender.equals("female")) {
                sb.append(" checked>");
            } else {
                sb.append(">");
            }
        } else {
            sb.append("  <input id=\"radioGenderFemale\" name=\"radioGender\" type=\"radio\" class=\"custom-control-input\" value='female'>");
        }
        sb.append("  <span class=\"custom-control-indicator\"></span>");
        sb.append("  <span class=\"custom-control-description\">Female</span>");
        sb.append("</label>");

        sb.append("  <div class=\"form-group\">");
        sb.append("    <label for=\"ddlCategory\">*Category:</label>");
        sb.append("    <select class=\"form-control\" id=\"ddlCategory\" name=\"ddlCategory\">");
        if(category == null) {
            sb.append("    <option value=\"null\">Select...</option>");
            sb.append("    <option value=\"feedback\">Feedback</option>");
            sb.append("    <option value=\"inquiry\">Inquiry</option>");
            sb.append("    <option value=\"complaint\">Complaint</option>");
        } else {
            switch (category) {
                case "null":
                    sb.append("    <option selected value=\"null\">Select...</option>");
                    sb.append("    <option value=\"feedback\">Feedback</option>");
                    sb.append("    <option value=\"inquiry\">Inquiry</option>");
                    sb.append("    <option value=\"complaint\">Complaint</option>");
                    break;
                case "feedback":
                    sb.append("      <option value=\"null\">Select...</option>");
                    sb.append("      <option selected value=\"feedback\">Feedback</option>");
                    sb.append("      <option value=\"inquiry\">Inquiry</option>");
                    sb.append("      <option value=\"complaint\">Complaint</option>");
                    break;
                case "inquiry":
                    sb.append("    <option value=\"null\">Select...</option>");
                    sb.append("    <option value=\"feedback\">Feedback</option>");
                    sb.append("    <option selected value=\"inquiry\">Inquiry</option>");
                    sb.append("    <option value=\"complaint\">Complaint</option>");
                    break;
                case "complaint":
                    sb.append("    <option value=\"null\">Select...</option>");
                    sb.append("    <option value=\"feedback\">Feedback</option>");
                    sb.append("    <option value=\"inquiry\">Inquiry</option>");
                    sb.append("    <option selected value=\"complaint\">Complaint</option>");
                    break;
                default:
                    break;
            }
        }
        sb.append("   </select>");
        sb.append("  </div>");

        sb.append("<div class=\"form-group\">");
        sb.append("<label for=\"message\">*Message:</label>");
        if(message != null) {
            if(message.equals("")) {
                sb.append("<textarea class=\"form-control\" id=\"message\" name=\"message\" rows=\"3\" ></textarea>");
            } else {
                sb.append("<textarea class=\"form-control\" id=\"message\" name=\"message\" rows=\"3\">" + message + "</textarea>");
            }
        } else {
            sb.append("<textarea class=\"form-control\" id=\"message\" name=\"message\" rows=\"3\" ></textarea>");
        }
        sb.append("</div>");

        sb.append("<button id=\"btnSubmit\" type=\"submit\" class=\"btn btn-primary btn-block\">Submit</button>");
        sb.append("</fieldset>");
        sb.append("</form>");
        sb.append("</div>");
        Object objTotalHitCount = getServletContext().getAttribute("totalHitCount");
        String totalHitCount = (objTotalHitCount != null) ? ((Integer)objTotalHitCount).toString() : "--";
        sb.append("<div class=\"container\"><br/><br/>");
        sb.append("<span class=\"text-muted\">Hit Count for this page: " + this.hitCount +"</span><span style=\"float:right;\" class=\"text-muted\">Total Hit Count for the entire WebApp: " + totalHitCount + "</span>");
        sb.append("</div>");
        sb.append("<footer class=\"footer\">");
        sb.append("<div id=\"footer-content\">");
        sb.append("<span class=\"text-muted\">O. Kalu ::: CS472-WAP</span><span style=\"float:right;\" class=\"text-muted\">&copy april 2021</span>");
        sb.append("</div>");
        sb.append("</footer>");
        sb.append("</body>");
        sb.append("</html>");
        return sb.toString();
    }

}
