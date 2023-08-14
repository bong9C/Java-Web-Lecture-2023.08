<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * { font-family: 'Noto Sans KR', sans-ser-serif; }
    </style>
</head>
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <img src="/demo/img/ck-logo.png" height="60">
            <div class="p-2 bg-dark justify-content-center">
                <img src="https://picsum.photos/1500/180" width="100%">
            </div>
        </div>     
    </nav>
    <div class="container" style="margin-top: 240px;">
        <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <h4 class="mb-3"><strong>회원 가입</strong></h4>
            <hr>
            <form action="/demo/bs/register" method="post" enctype="multipart/form-data">
                    <table class="table table=borderless">
                        <tr>
                            <td style="width: 50%;"><label class="col-form-labal">사용자 ID</label></td>
                            <td><input type="text" name="uid" class="form-control" ></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">패스워드</label></td>
                            <td><input type="password" name="pwd" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">패스워드 확인</label></td>
                            <td><input type="password" name="pwd2" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">이름</label></td>
                            <td><input type="text" name="uname" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">이메일</label></td>
                            <td><input type="email" name="email" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">성별</label></td>
                            <td>
                                <input type="radio" name="gender" value="1" checked>남자
                                <input class="ms-3" type="radio" name="gender" value="2" >여자
                            </td>
                        </tr>
                        <tr>
                            <td><label class="col-form-labal">프로필 사진</label></td>
                            <td><input type="file" name="profile" class="form-control"></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <button type="submit" class="btn btn-primary">제출</button>
                                <button type="reset" class="btn btn-secondary">취소</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
</body>
</html> 