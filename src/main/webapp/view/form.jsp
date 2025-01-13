<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2025
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h1 class="page-title m-0">TITLE</h1>
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
                <form class="clearfix" action="${pageContext.request.contextPath}/places/create" method="post">
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Mã mặt bằng(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <input type="text" class="form-control" name="code" value="${place.code != null ? place.code : ""}">
                      <div class="text-danger">
                        ${errors.code != null ? errors.code:""}
                      </div>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Diện tích(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <input type="text"
                             class="form-control "
                             name="acreage" value="${place.acreage > 0 ? place.acreage : ""}">
                      <div class="text-danger">
                        ${errors.acreage != null ? errors.acreage:""}
                      </div>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Trạng thái(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <select class="form-control form-control-sm" name="status" aria-label=".form-select-sm example">
                        <option value="1" selected>Trống</option>
                        <option value="2">Hạ tầng</option>
                        <option value="3">Đầy đủ</option>
                      </select>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Tầng(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <select class="form-control form-control-sm" name="num_of_floors" aria-label=".form-select-sm example">
                        <option value="1" selected>1</option>
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
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Loại văn phòng(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <select class="form-control form-control-sm" name="type" aria-label=".form-select-sm example">
                        <option value="1" selected>Cho thuê</option>
                        <option value="2">Trọn gói</option>
                      </select>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Mô tả chi tiết</label>
                    <div class="col-lg-9 col-xl-7">
                        <textarea class="form-control form-control-sm" name="description" rows="12"></textarea>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <label class="col-md-9 col-form-label">Giá cho thuê(<code>*</code>)</label>
                    <div class="col-lg-9 col-xl-7">
                      <input type="text"
                             class="form-control "
                             name="price" value="${place.price > 0 ? place.price : ""}">
                      <div class="text-danger">
                        ${errors.price != null ? errors.price:""}
                      </div>
                    </div>
                  </div>
                  <div class="row align-items-center mb-2">
                    <div class="col-12">
                      <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                              <label class="col-md-9 col-form-label">Ngày bắt đầu(<code>*</code>)</label>
                              <div class="col-lg-9 col-xl-7">
                                <input type="text"
                                       class="form-control "
                                       name="start_date" value="">
                                <div class="text-danger"></div>
                              </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                          <div class="row">
                            <label class="col-md-9 col-form-label">Ngày kết thúc(<code>*</code>)</label>
                            <div class="col-lg-9 col-xl-7">
                              <input type="text"
                                     class="form-control"
                                     name="end_date" value="">
                              <div class="text-danger"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="mt-4 row justify-content-between">
                    <div class="col-auto">
                      <button type="submit" class="btn btn-primary px-4">
                        Lưu
                      </button>
                      <a role="button" href="places/" class="btn btn-secondary px-4">
                        Hủy
                      </a>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
  </div>
  <jsp:include page="${pageContext.request.contextPath}/layout/script.jsp" />
</div>

</body>
</html>
