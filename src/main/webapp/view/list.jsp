<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2025
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="${pageContext.request.contextPath}/layout/head.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed text-sm">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="${pageContext.request.contextPath}/layout/sidebar.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="page-title m-0">Danh sách mặt bằng</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-default">
                            <div class="card-body">
                                <form class="clearfix" action="${pageContext.request.contextPath}/places" method="get">
                                    <div class="row align-items-center mb-2">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <label class="col-sm-3 col-form-label">Loại mặt bằng</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <select class="form-control form-control-sm" name="type" aria-label=".form-select-sm example">
                                                                <option value="" selected>Chọn loại mặt bằng</option>
                                                                <option value="1">Cho thuê</option>
                                                                <option value="2">Trọn gói</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="row" >
                                                <label class="col-sm-3 col-form-label">Tầng</label>
                                                <div class="col-sm-8">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <select class="form-control form-control-sm" name="num_of_floors" aria-label=".form-select-sm example">
                                                                <option value="" selected>Chọn số tầng</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row align-items-center mb-2">
                                        <label class="col-sm-2 col-form-label">Ngày cho thuê</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <input type="text"
                                                           class="form-control form-control-sm datepicker datetimepicker-input"
                                                           name="start_date"
                                                           value=""
                                                           data-toggle="datetimepicker" />
                                                </div>
                                                <div class="col-1 text-center">
                                                    ~
                                                </div>
                                                <div class="col-md-5">
                                                    <input type="text"
                                                           class="form-control form-control-sm datepicker datetimepicker-input"
                                                           name="end_date"
                                                           value=""
                                                           data-toggle="datetimepicker" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 ml-2 text-center">
                                        <button type="submit" class="btn btn-sm btn-info w-120px"> Tìm kiếm </button>
                                    </div>
                                </form>
                                <div class="mt-4 pt-3">
                                    <div class="table-responsive table-default-height">
                                        <table class="table table-valign-middle text-nowrap table-head-fixed">
                                            <thead>
                                            <tr>
                                                <th class="bg-dark" width="10%">Mã MB</th>
                                                <th class="bg-dark" width="15%">Diện tích</th>
                                                <th class="bg-dark">Trạng thái</th>
                                                <th class="bg-dark">Tầng</th>
                                                <th class="bg-dark">Loại văn phòng</th>
                                                <th class="bg-dark">Giá cho thuê</th>
                                                <th class="bg-dark">Ngày bắt đầu</th>
                                                <th class="bg-dark">Ngày kết thúc</th>
                                                <th class="bg-dark">&nbsp;</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${places.size() > 0}">
                                                    <c:forEach items="${places}" var="place">
                                                        <tr>
                                                            <td>${place.code}</td>
                                                            <td>${place.acreage}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${place.status == 1}">
                                                                        Trống
                                                                    </c:when>
                                                                    <c:when test="${place.status == 2}">
                                                                        Hạ tầng
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Đầy đủ
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${place.num_of_floors}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${place.type == 1}">
                                                                        Cho thuê
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Trọn gói
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${place.price}</td>
                                                            <td>
                                                                ${place.start_date}
                                                            </td>
                                                            <td>
                                                                ${place.end_date}
                                                            </td>
                                                            <td>
                                                                <button role="button" class="btn btn-sm btn-danger px-3 mr-2 btn-delete" data-id="${place.id}" data-code="${place.code}">Xóa</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr class="text-center">
                                                        <td colspan="9">Không tìm thấy dữ liệu</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
    </div>

    <div class="modal" id="#modalDelete" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cảnh báo</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <div class="text-danger text-delete-warning">Bạn có chắc muốn xóa mặt bằng không?</div>
                    </div>
                </div>
                <div class="modal-footer justify-content-end">
                    <a role="button" href="#" class="btn btn-danger btnDelete">Xóa</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/layout/script.jsp" />
    <script>
        $(document).on("click", ".btn-delete", function () {
            let id = $(this).attr("data-id");
            let code = $(this).attr("data-code");
            if (confirm("Bạn có chắc muốn xóa mặt bằng "+code+" không?")) {
                location.href = "/places/delete/" + id;
            }
        });
    </script>
</div>

</body>
</html>
