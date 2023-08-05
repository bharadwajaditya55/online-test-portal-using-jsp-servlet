<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
  <title>Toolbar with TextArea </title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script type="text/javascript">
  $(function()
  {
      $('#wysiwyg').wysiwyg();
  });
  </script>
</head>
<body>
  <h1>Toolbar with TextArea </h1> 
  <div>
    <textarea name="wysiwyg" id="wysiwyg" rows="5" cols="47"></textarea>
  </div>
</body>
</html>