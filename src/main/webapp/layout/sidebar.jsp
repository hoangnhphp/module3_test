<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2025
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto navbar-desktop">
    <!-- user name -->
    <li class="nav-item">
      <i class="fas fa-user" style="color: #858082;"></i>
      <span class="user-name d-block-inline text-truncate">huy hoàng</span>
    </li>
    <li class="nav-item border-right d-none pt-1 pr-3">
      <i class="fas fa-bell" style="color: #858082; font-size: 1.3em"></i>
      <span class="badge badge-danger envelope-badge">5</span>
    </li>
    <li class="nav-item pl-2">
<%--      <a href="#" class="btn btn-sm btn-secondary">ログアウト</a>--%>
    </li>
  </ul>

  <ul class="navbar-nav ml-auto navbar-mobile">
    <li class="nav-item border-right d-none pt-1 pr-3">
      <i class="fas fa-bell" style="color: #858082; font-size: 1.3em"></i>
      <span class="badge badge-danger envelope-badge mr-2">5</span>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
         aria-haspopup="true" aria-expanded="false">
      </a>
      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item">
          <i class="fas fa-user" style="color: #858082;"></i>
          huy hoàng
        </a>
<%--        <a class="dropdown-item" href="#">ログアウト</a>--%>
      </div>
    </li>
  </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="#" class="brand-link">
    <img src="${pageContext.request.contextPath}/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
         style="opacity: .8">
    <span class="brand-text font-weight-light">Quản lý mặt bằng</span>
  </a>
  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent nav-compact" data-widget="treeview"
          role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/places"
             class="nav-link">
            <i class="far fa-circle nav-icon"></i>
            <p>Danh sách mặt bằng</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/places/create"
             class="nav-link #">
            <i class="far fa-circle nav-icon"></i>
            <p>Tạo mới mặt bằng</p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
