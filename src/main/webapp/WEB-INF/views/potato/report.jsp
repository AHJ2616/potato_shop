<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>신고하기</title>
<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="/resources/css/register.css">

<div class="register-container">
    <h2 align="center">신고하기</h2>
        <table class="table table-bordered">
        <thead>
        <tr>
        <th >신고 대상</th>
        <th><c:out value="${report.defendant_id}"/></th>
        </tr>
        </thead>
        </table>
        <form id="registerForm" action="/potato/do_report" method="post" >
        <div class="form-group row">
            <label for="content" class="col-sm-2 col-form-label">신고 사유</label>
            <div class="col-sm-10">
                <textarea name="content" class="form-control" rows="5" style="height: 200px;"></textarea>
                <div id="alert-address" class="custom-alert"></div>
            </div>
        </div>
        <input type="hidden" name="writer_id" value="${sessionScope.id}" />
        <input type="hidden" name="defendant" value="${report.defendant}" />
        <input type="hidden" name="defendant_id" value="${report.defendant_id}" />
        <button type="submit" class="btn btn-primary">신고하기</button>
    </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ include file="../common/footer.jsp" %>