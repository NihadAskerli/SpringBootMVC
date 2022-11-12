
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<div class=" container " >
    <div class="row">
        <div class="col-4" >

            <%--@elvariable id="user" type="com.example.form.UserForm"--%>
            <f:form action="usersm" method="GET" modelAttribute="user">
                <div class="form-group">
                    <label for="name">name:</label>
                    <f:input onkeyup="writeWhatIamTyping"
                             placeholder="Enter name"
                             class="form-control"
                             path="name"/>
                    <form:errors path="name"/>
                </div>
                <div class="form-group">
                    <label>surname:</label>
                    <f:input  placeholder="Enter surname"
                              class="form-control"
                              path="surname"
                              />
                <form:errors path="surname"/>
                </div>
                <f:button class="btn btn-primary" type="submit" id="btnsearch">Search </f:button>

            </f:form>
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
          <c:forEach items="${list}" var="u">
                <td>${u.getName()}</td>
                <td>${u.getSurname()}</td>
                <td>${u.nationality.name}</td>
                <td style="width: 5px">
                    <form action="userdetail"method="POST">
                        <input type="hidden" name="id" value="${u.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button  class="btn btn-danger"  type="submit" value="delete"
                                 data-toggle="modal" data-target="#exampleModal"
                                 onclick="setIdForDelete(${u.id})">

                            <i class="fas fa-trash-alt"></i>
                        </button>

                    </form>

                </td>
                <td style="width: 5px">
                    <form action="userdetail"method="POST">
                        <input type="hidden" name="id" value="${u.id}"/>
                        <input type="hidden" name="action" value="update"/>
                        <button class="btn btn-secondary" type="submit" value="update" >
                            <i class="fas fa-pen-square"></i>
                        </button>
                    </form>
                </td>

            </tr>
          </c:forEach>
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