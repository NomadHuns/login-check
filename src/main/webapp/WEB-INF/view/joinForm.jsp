<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <meta charset="UTF-8">
            <title>HelloJSP</title>
        </head>

        <body>
            <h1>회원가입 페이지</h1>
            <hr>
            <form action="/join" method="post" onsubmit="return valid()">
                <input id="username" type="text" name="username" placeholder="Enter username"><br>
                <button type="button" onclick="sameCheck()">유저네임 중복체크</button>
                <br>
                <input type="password" name="password" placeholder="Enter password"><br>
                <input type="email" name="email" placeholder="Enter email"><br>
                <button type="submit">회원가입</button>
            </form>

            <script>
                let check = false;

                function valid() {
                    if (check == true) {
                        return true;
                    } else {
                        alert("유저네임 중복체크 해주세요");
                        return false;
                    }
                }

                function sameCheck() {
                    let username = $("#username").val();
                    $.ajax({
                        type: "get",
                        url: '/user/usernameCheck?username=' + username
                    })
                        .done((res) => {
                            alert(res.msg);
                            check = res.data;
                        })
                        .fail((err) => { });
                }
            </script>
        </body>

        </html>