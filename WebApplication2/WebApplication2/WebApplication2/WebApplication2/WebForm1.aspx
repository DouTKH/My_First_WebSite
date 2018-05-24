<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MY_PAGE</title>
    <style type="text/css">
        #div1 {
            border: 1px solid #aaaaaa;
            height: 10px;
            padding: 20px;
            width: 20px;
        }
        #div2 {
            border: 1px solid #aaaaaa;
            height: 30px;
            padding: 40px;
            width: 40px;
        }
    </style>
    <script type="text/javascript">
        var flag = 0;
        function cnvs_getCoordinates(e) {
            x = e.clientX;
            y = e.clientY;
            if (flag == 1)
                document.getElementById("xycoordinates").innerHTML = "Coordinates: (" + x + "," + y + ")";
            else
                document.getElementById("xycoordinates").innerHTML = "";

        }

        function cnvs_clearCoordinates() {
            document.getElementById("xycoordinates").innerHTML = "";
        }
        function allowDrop(ev) {
            ev.preventDefault();
        }

        function drag(ev) {
            ev.dataTransfer.setData("Text", ev.target.id);
        }

        function drop(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("Text");
            ev.target.appendChild(document.getElementById(data));
        }
    </script>
</head>
<body>
<form id="form1" runat="server">
    <div>
        hello world!
    </div>
</form>
<p>把鼠标在下面的矩形上按住可以看到坐标：</p>

<div id="coordiv" style="float:left;width:199px;height:99px;border:1px solid #c3c3c3" onmousemove="cnvs_getCoordinates(event)" onmousedown="flag=1" onmouseup="flag=0"     onmouseout="cnvs_clearCoordinates()"></div>
<br />
<br />
<br />
<div id="xycoordinates"></div>
<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
<br />
<tr>
    <button id="button1" onclick="<% %>" draggable="true" ondragstart="drag(event)">button1</button>
</tr>
<video autoplay="autoplay" draggable="true" controls="controls" width="400" height="300" ondragstart="drag(event)" id="video1">
    <source src="/i/movie.ogg">
    你的播放器太菜了
</video>

</body>
</html>