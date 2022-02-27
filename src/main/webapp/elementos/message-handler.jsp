<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");

    if (success != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%= success %>
        </div>
        <%
    }
    if (error != null) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
        <%
    }
%>
