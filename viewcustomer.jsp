<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ngwe Pone Gyi</title>
    <link href="https://unpkg.com/lucide@latest" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background: #ff5722;
            color: white;
            height: 80px;
            display: flex;
            align-items: center;
            padding: 0 32px;
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        .header-content {
            display: flex;
            align-items: center;
            gap: 16px;
            width: 100%;
        }

        .logo {
            width: 56px;
            height: 56px;
            background: #e0e0e0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        
        .logo img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .brand-name {
            font-size: 35px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-left: 600px;
        }

        /* Layout */
        .container {
            display: flex;
            flex: 1;
            margin-top: 80px;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background: white;
            border-right: 1px solid #e0e0e0;
            padding: 16px;
            position: fixed;
            top: 80px;
            bottom: 0;
            left: 0;
            overflow-y: auto;
            z-index: 900;
        }

        .nav-menu {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 16px;
            text-decoration: none;
            color: #666;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
            cursor: pointer;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            border-radius: 8px;
        }

        .menu-item:hover {
            background-color: #f8f9fa;
            color: #333;
        }

        .menu-item.active {
            background-color: #e3f2fd;
            color: #1976d2;
            border: 1px solid #bbdefb;
        }

        .menu-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-section {
            border-top: 1px solid #e0e0e0;
            margin-top: auto;
            padding-top: 16px;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 240px;
            background: #f8f9fa;
            min-height: calc(100vh - 80px);
            padding-bottom: 24px;
        }

        .top-bar {
            background: white;
            border-bottom: 1px solid #e0e0e0;
            padding: 16px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .search-container {
            flex: 1;
            max-width: 400px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 10px 16px 10px 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: all 0.2s ease;
            background: #f8f9fa;
        }
        .search-input:focus {
            border-color: #1976d2;
            background: white;
            box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .top-bar-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .action-btn {
            width: 40px;
            height: 40px;
            border: none;
            background: none;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            cursor: pointer;
            transition: all 0.2s ease;
            position: relative;
        }

        .action-btn:hover {
            background-color: #f0f0f0;
            color: #333;
        }

        .notification-dot {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 8px;
            height: 8px;
            background: #f44336;
            border-radius: 50%;
        }

        /* Content Area */
        .content-area {
            background: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-left: 24px;
            margin-right: 24px;
        }

        /* Table Styles */
        .table-responsive {
            overflow-x: auto;
            margin-top: 20px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        .table th, .table td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        .table th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 600;
            white-space: nowrap;
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.05);
        }

        /* Button Styling */
        .btn {
            padding: 10px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .btn-sm {
            padding: 8px 10px;
            font-size: 11px;
        }

        .btn-primary {
            background-color: #1976d2;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1565c0;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #212529;
            border: none;
        }

        .btn-warning:hover {
            background-color: #ffca2c;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        .btn-danger:hover {
            background-color: #bb2d3b;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        /* Flex Utilities */
        .d-flex {
            display: flex;
        }

        .justify-content-between {
            justify-content: space-between;
        }

        .align-items-center {
            align-items: center;
        }

        .mb-4 {
            margin-bottom: 1.5rem;
        }

        /* Modal styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1100;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            backdrop-filter: blur(4px);
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            width: 500px;
            max-width: 90%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            transform: translateY(20px);
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            overflow: hidden;
            border: none;
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0);
        }

        .modal-header {
            padding: 18px 24px;
            background: linear-gradient(135deg, #ff5722 0%, #ff7043 100%);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .modal-close {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .modal-close:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .modal-body {
            padding: 24px;
            background: #fafafa;
        }

        .modal-footer {
            padding: 16px 24px;
            background: white;
            border-top: 1px solid #f0f0f0;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        /* Enhanced Form Styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.2s ease;
            background: white;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .form-control:focus {
            border-color: #ff5722;
            box-shadow: 0 0 0 3px rgba(255, 87, 34, 0.1);
            outline: none;
        }

        /* Enhanced Button Styles */
        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-secondary {
            background: #f5f5f5;
            color: #555;
        }

        .btn-secondary:hover {
            background: #e0e0e0;
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff5722 0%, #ff7043 100%);
            color: white;
            box-shadow: 0 2px 6px rgba(255, 87, 34, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #e64a19 0%, #f4511e 100%);
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(255, 87, 34, 0.3);
        }

        /* Floating action button for add */
        .add-unit-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ff5722 0%, #ff7043 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(255, 87, 34, 0.3);
            z-index: 100;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .add-unit-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 16px rgba(255, 87, 34, 0.4);
        }
        
        /* Search Container */
		.search-container {
		    flex: 1;
		    max-width: 500px;
		    position: relative;
		    display: flex;
		    align-items: center;
		}
		
		/* Search Input */
		.search-input {
		    width: 100%;
		    padding: 10px 16px 10px 40px;
		    border: 1px solid #e0e0e0;
		    border-radius: 20px;
		    font-size: 14px;
		    outline: none;
		    transition: all 0.2s ease;
		    background: #ffffff;
		    color: #333;
		}
		
		.search-input:focus {
		    border-color: #ff5722;
		    box-shadow: 0 0 0 2px rgba(255, 87, 34, 0.1);
		}
		
		/* Search Icon */
		.search-icon {
		    position: absolute;
		    left: 14px;
		    color: #9e9e9e;
		    width: 18px;
		    height: 18px;
		}
		
		.search-input:focus + .search-icon {
		    color: #ff5722;
		}
		.search-clear-icon {
		    position: absolute;
		    right: 14px;
		    color: #aaa;
		    width: 18px;
		    height: 18px;
		    cursor: pointer;
		    display: none;
		    z-index: 2;
		    transition: color 0.2s ease;
		}
		
		.search-clear-icon:hover {
		    color: #ff5722;
		}
		
		/* Pagination Styles */
		.pagination {
		    display: flex;
		    justify-content: center;
		    margin-top: 20px;
		    gap: 8px;
		}
		
		.pagination a, .pagination span {
		    padding: 8px 16px;
		    border: 1px solid #e0e0e0;
		    border-radius: 4px;
		    text-decoration: none;
		    color: #333;
		    font-size: 14px;
		    transition: all 0.2s ease;
		}
		
		.pagination a:hover {
		    background-color: #f5f5f5;
		}
		
		.pagination .active {
		    background-color: #ff5722;
		    color: white;
		    border-color: #ff5722;
		}
		
		.pagination .disabled {
		    color: #999;
		    pointer-events: none;
		}
        /* Responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                top: auto;
            }
            
            .main-content {
                margin-left: 0;
            }
            /* Responsive Adjustments */
			.search-container {
			        max-width: 100%;
			        margin-right: 0;
			        margin-bottom: 10px;
			    }
			    
			    .top-bar {
			        flex-wrap: wrap;
			    }
			    
			    .top-bar-actions {
			        margin-top: 10px;
			    }
	        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Ccircle cx='50' cy='50' r='45' fill='%23ff5722'/%3E%3Ctext x='50' y='60' text-anchor='middle' fill='white' font-size='40' font-weight='bold'%3EN%3C/text%3E%3C/svg%3E" alt="Logo">
            </div>
            <h1 class="brand-name">Ngwe Pone Gyi</h1>
        </div>
    </header>

    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav-menu">
                <a href="dashboard" class="menu-item">
                    <i data-lucide="home" class="menu-icon"></i>
                    <span>Dashboard</span>
                </a>
                <a href="viewstock" class="menu-item">
                    <i data-lucide="package" class="menu-icon"></i>
                    <span>Stocks</span>
                </a>
                <a href="orders" class="menu-item">
                    <i data-lucide="shopping-cart" class="menu-icon"></i>
                    <span>Orders</span>
                </a>
                <a href="viewcustomer" class="menu-item active">
                    <i data-lucide="users" class="menu-icon"></i>
                    <span>Customers</span>
                </a>
                <a href="viewsupplier" class="menu-item">
                    <i data-lucide="truck" class="menu-icon"></i>
                    <span>Suppliers</span>
                </a>
                <a href="viewcategory" class="menu-item">
                    <i data-lucide="folder" class="menu-icon"></i>
                    <span>Categories</span>
                </a>
                <a href="viewstockbalance" class="menu-item">
                    <i data-lucide="bar-chart-3" class="menu-icon"></i>
                    <span>Stock Balance</span>
                </a>
                <a href="viewwarehouse" class="menu-item">
                    <i data-lucide="warehouse" class="menu-icon"></i>
                    <span>Warehouse</span>
                </a>
                <a href="viewunit" class="menu-item">
                    <i data-lucide="scale" class="menu-icon"></i>
                    <span>Unit</span>
                </a>
                <a href="payments" class="menu-item">
                    <i data-lucide="credit-card" class="menu-icon"></i>
                    <span>Payments</span>
                </a>
                <a href="vouchers" class="menu-item">
                    <i data-lucide="file-text" class="menu-icon"></i>
                    <span>Vouchers</span>
                </a>
                
                <div class="logout-section">
                    <a href="logout" class="menu-item">
                        <i data-lucide="log-out" class="menu-icon"></i>
                        <span>Log Out</span>
                    </a>
                </div>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Top Bar -->
            <div class="top-bar">
                <!-- Search Form -->
                <form action="viewcustomer" method="get" class="search-container" id="searchForm">
                    <i data-lucide="search" class="search-icon"></i>
                    <input type="text" class="search-input" name="keyword" 
                           id="searchInput"
                           placeholder="Search customers..." 
                           value="${param.keyword}"
                           aria-label="Search customers">
                    <i id="clearSearchBtn" data-lucide="x-circle" class="search-clear-icon"></i>
                
                </form> 

                <!-- Action Buttons -->
                <div class="top-bar-actions">
                    <button class="action-btn">
                        <i data-lucide="bell"></i>
                        <span class="notification-dot"></span>
                    </button>
                    <button class="action-btn">
                        <i data-lucide="user"></i>
                    </button>
                </div>
            </div>
              
            <!-- Content Area -->
            <div class="content-area">
                <div class="content">
                    <div class="content-header d-flex justify-content-between align-items-center mb-4">
                        <h1 class="page-title">Customers List</h1>
                                    <button type="submit" style="display: none;"></button>
              
		 <a href="viewcustomer?keyword=${keyword}&page=${currentPage}&sortField=customer_at&sortDir=${sortField eq 'customer_at' and sortDir eq 'asc' ? 'desc' : 'asc'}" 
   class="btn btn-primary d-flex ">
   Sort by Date 
   <c:choose>
       <c:when test="${sortField eq 'customer_at' and sortDir eq 'asc'}">↑</c:when>
       <c:when test="${sortField eq 'customer_at' and sortDir eq 'desc'}">↓</c:when>
   </c:choose>
</a>
            
                        <a href="add?keyword=${param.keyword}&sortField=${param.sortField}&sortDir=${param.sortDir}&page=${param.page}" 
                           class="btn btn-primary d-flex align-items-center">
                            <i data-lucide="plus" class="me-1"></i> Add New Customer
                        </a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Created At</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cust" items="${list}" varStatus="status">
                                    <tr>
                                       <td>${status.index + 1}</td> 
                                        <td>${cust.customer_name}</td>
                                        <td>${cust.customer_ph}</td>
                                        <td>${cust.customer_address}</td>
                                        <td>${cust.created_at}</td>
                                        <td>
                                            <a href="edit?id=${cust.customer_id}&keyword=${param.keyword}&sortField=${param.sortField}&sortDir=${param.sortDir}&page=${param.page}" 
                                               class="btn btn-sm btn-warning d-flex align-items-center">
                                                <i data-lucide="edit" width="14" height="14" class="me-1"></i> Edit
                                            </a>
                                            <a href="delete?id=${cust.customer_id}" 
                                               class="btn btn-sm btn-danger d-flex align-items-center"
                                               onclick="return confirm('Are you sure you want to delete this customer?')">
                                                <i data-lucide="trash-2" width="14" height="14" class="me-1"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <div class="pagination">
                            <%-- Previous Page --%>
                            <c:choose>
                                <c:when test="${currentPage > 1}">
                                    <a href="viewcustomer?page=${currentPage - 1}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.sortField}'>&sortField=${param.sortField}</c:if><c:if test='${not empty param.sortDir}'>&sortDir=${param.sortDir}</c:if>">
                                        &laquo; Previous
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="disabled">&laquo; Previous</span>
                                </c:otherwise>
                            </c:choose>
                            
                            <%-- Page Numbers --%>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <span class="active">${i}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="viewcustomer?page=${i}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.sortField}'>&sortField=${param.sortField}</c:if><c:if test='${not empty param.sortDir}'>&sortDir=${param.sortDir}</c:if>">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            
                            <%-- Next Page --%>
                            <c:choose>
                                <c:when test="${currentPage < totalPages}">
                                    <a href="viewcustomer?page=${currentPage + 1}<c:if test='${not empty param.keyword}'>&keyword=${param.keyword}</c:if><c:if test='${not empty param.sortField}'>&sortField=${param.sortField}</c:if><c:if test='${not empty param.sortDir}'>&sortDir=${param.sortDir}</c:if>">
                                        Next &raquo;
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="disabled">Next &raquo;</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>
                </div>
            </div>
        </main>
    </div>

    <!-- Add/Edit Customer Modal -->
    <c:if test="${showAddModal || showEditModal}">
        <div class="modal-overlay active">
            <div class="modal-content">
                <form:form modelAttribute="customer" method="post" action="save">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            ${showAddModal ? 'Add Customer' : 'Edit Customer'}
                        </h5>
                        <button type="button" class="modal-close" onclick="window.location.href='viewcustomer?keyword=${param.keyword}&sortField=${param.sortField}&sortDir=${param.sortDir}&page=${param.page}'">
                            <i data-lucide="x" width="18" height="18"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form:hidden path="customer_id"/>
                        <div class="form-group">
                            <form:label path="customer_name" class="form-label">Name <span class="text-danger">*</span></form:label>
                            <form:input path="customer_name" class="form-control ${not empty errors.getFieldError('customer_name') ? 'is-invalid' : ''}" 
                                   placeholder="Enter customer name" required="true"/>
                            <form:errors path="customer_name" class="invalid-feedback" />
                        </div>
                        <div class="form-group">
                            <form:label path="customer_ph" class="form-label">Phone <span class="text-danger">*</span></form:label>
                            <form:input path="customer_ph" class="form-control ${not empty errors.getFieldError('customer_ph') ? 'is-invalid' : ''}" 
                                   placeholder="Enter phone number" required="true"/>
                            <form:errors path="customer_ph" class="invalid-feedback" />
                        </div>
                        <div class="form-group">
                            <form:label path="customer_address" class="form-label">Address</form:label>
                            <form:input path="customer_address" class="form-control ${not empty errors.getFieldError('customer_address') ? 'is-invalid' : ''}" 
                                   placeholder="Enter address (optional)"/>
                            <form:errors path="customer_address" class="invalid-feedback" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="viewcustomer?keyword=${param.keyword}&sortField=${param.sortField}&sortDir=${param.sortDir}&page=${param.page}" 
                           class="btn btn-secondary">
                            <i data-lucide="x" class="me-1" width="16" height="16"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i data-lucide="save" class="me-1" width="16" height="16"></i> ${showAddModal ? 'Save' : 'Update'}
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </c:if>

    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        // Initialize Lucide icons
        lucide.createIcons();
    </script>
</body>
</html>