<%@page import="com.example.entity.User"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="assets/css/user.css">
    <script src="https://kit.fontawesome.com/6a26f00cc0.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>JSP Page</title>
</head>
<body>
<%
    List<User>list=(List<User>) request.getAttribute("usersJ");
%>
<div class=" container mycontainer" >
    <div class="row">
        <div class="col-4" >
            <form action="usersJ" method="GET">
                <div class="form-group">
                    <label>name:</label>
                    <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>

                </div>
                <div class="form-group">
                    <label>surname:</label>
                    <input  placeholder="Enter surname" class="form-control" type="text" name=surname value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search" id="btnsearch"/>

            </form>
        </div>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>nationality</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User u : list) {
            %>
            <tr>
                <td><%=u.getName()%></td>
                <td><%=u.getSurname()%></td>
                <td><%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%></td>
                <td style="width: 5px">
                    <form action="userdetail"method="POST">
                        <input type="hidden" name="id" value="<%=u.getId()%>"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button  class="btn btn-danger"  type="submit" value="delete"
                                 data-toggle="modal" data-target="#exampleModal"
                                 onclick="setIdForDelete(<%=u.getId()%>)">

                            <i class="fas fa-trash-alt"></i>
                        </button>

                    </form>

                </td>
                <td style="width: 5px">
                    <form action="userdetail"method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>"/>
                        <input type="hidden" name="action" value="update"/>
                        <button class="btn btn-secondary" type="submit" value="update" >
                            <i class="fas fa-pen-square"></i>
                        </button>
                    </form>
                </td>

            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>



<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are You sure  to delete?
            </div>
            <div class="modal-footer">
                <form action="userdetail" method="POST">
                    <input type="hdden" name="id" value="" id="idForDelete"/>
                    <input type="hdden" name="action" value="delete"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
