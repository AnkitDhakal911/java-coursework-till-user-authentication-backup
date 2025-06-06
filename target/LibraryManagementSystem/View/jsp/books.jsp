<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books - Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-bg: #F5F7FA;
            --sidebar-bg: #6B46C1;
            --accent-blue: #6B46C1;
            --text-white: #FFFFFF;
            --text-gray: #666666;
            --card-bg: #FFFFFF;
            --returned-green: #48BB78;
            --overdue-red: #EF4444;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html, body {
            height: 100%;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #232946 0%, #6d83f2 100%);
            color: #232946;
            margin: 0;
            overflow-x: hidden;
        }
        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100vw;
        }
        .content {
            flex: 1;
            padding: 40px 0 0 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: none;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            margin-top: 0;
            background: none;
        }
        .main-card {
            background: #fff;
            border-radius: 1.7rem;
            box-shadow: 0 8px 32px 0 rgba(35, 41, 70, 0.13);
            padding: 38px;
            width: 90%;
            max-width: 1200px;
            margin: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #E5E7EB;
        }
        th {
            background-color: #F0F0F0;
            color: #2D3748;
            font-weight: 500;
        }
        td {
            color: #2D3748;
        }
        tr:hover {
            background-color: #F9FAFB;
        }
        h2 {
            color: #6B46C1;
            font-size: 2rem;
            margin-bottom: 20px;
            text-align: center;
        }
        footer {
            background: #232946;
            padding: 32px 0 18px 0;
            text-align: center;
            width: 100%;
            border-radius: 0 0 1.5rem 1.5rem;
            box-shadow: 0 -2px 12px 0 rgba(109, 131, 242, 0.07);
            color: #fff;
        }
        footer p {
            margin-bottom: 12px;
            color: #fff;
            font-size: 1.08em;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 18px;
            margin-top: 8px;
        }
        .social-icons a {
            color: #fff;
            font-size: 1.6em;
            transition: color 0.3s;
        }
        .social-icons a:hover {
            color: #A78BFA;
        }
        .navbar {
            width: 100vw;
            background: rgba(36, 32, 77, 0.98);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 48px;
            height: 70px;
            box-shadow: 0 2px 16px 0 rgba(35, 41, 70, 0.10);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .navbar-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .navbar-logo {
            height: 48px;
            width: auto;
            border-radius: 10px;
            background: #fff;
            padding: 4px 8px;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-appname {
            font-size: 1.5rem;
            font-weight: 800;
            color: #fff;
            letter-spacing: 1px;
        }
        .navbar-links {
            display: flex;
            align-items: center;
            gap: 28px;
            margin-left: 32px;
        }
        .navbar-links a {
            color: #e0e7ff;
            font-size: 1.08em;
            font-weight: 500;
            text-decoration: none;
            padding: 8px 0;
            border-bottom: 2.5px solid transparent;
            transition: color 0.2s, border-bottom 0.2s;
        }
        .navbar-links a.active, .navbar-links a:hover {
            color: #fff;
            border-bottom: 2.5px solid #6B46C1;
        }
        .navbar-user {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .navbar-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #fff;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-userinfo {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .navbar-username {
            font-size: 1.08em;
            font-weight: 600;
            color: #fff;
        }
        .navbar-useremail {
            font-size: 0.98em;
            color: #e0e7ff;
        }
        .navbar-authbtns a {
            margin-left: 12px;
            padding: 8px 22px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1.08em;
            text-decoration: none;
            border: none;
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            transition: background 0.2s, color 0.2s;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-authbtns a:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            color: #fff;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="navbar-left">
        <img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="Library Logo" class="navbar-logo" />
        <span class="navbar-appname">Library.io</span>
        <nav class="navbar-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/library_loans">Library Loans</a>
                <a href="${pageContext.request.contextPath}/books" class="active">Books</a>
                <a href="${pageContext.request.contextPath}/members">Members</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/recent_activities">My Profile</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/View/jsp/contact.jsp">Contact Us</a>
        </nav>
    </div>
    <div class="navbar-user">
        <c:choose>
            <c:when test="${sessionScope.user != null && not empty sessionScope.user.imageData}">
                <img src="${pageContext.request.contextPath}/user-image/${sessionScope.user.userID}" alt="Profile" class="navbar-avatar" />
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/assets/default-avatar.jpg" alt="Default" class="navbar-avatar" />
            </c:otherwise>
        </c:choose>
        <c:if test="${sessionScope.user != null}">
            <div class="navbar-userinfo">
                <span class="navbar-username">${sessionScope.user.name}</span>
                <span class="navbar-useremail">${sessionScope.user.email}</span>
            </div>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <div class="navbar-authbtns">
                <a href="${pageContext.request.contextPath}/View/jsp/login.jsp">Sign In</a>
                <a href="${pageContext.request.contextPath}/View/jsp/register.jsp" style="background:#EF4444;">Register</a>
            </div>
        </c:if>
    </div>
</div>

<div class="container">
    <main class="content">
        <div class="main-content">
            <div class="main-card">
                <h2>Books</h2>
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th>ISBN</th>
                        <th>Year</th>
                        <th>Genre</th>
                        <th>Pages</th>
                        <th>Image</th>
                        <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                            <th>Action</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.id}</td>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.publisher}</td>
                            <td>${book.isbn}</td>
                            <td>${book.publicationYear}</td>
                            <td>${book.genre}</td>
                            <td>${book.pages}</td>
                            <td>
                                <c:if test="${not empty book.imageData}">
                                    <img src="${pageContext.request.contextPath}/book-image/${book.id}" alt="Book Cover" style="width:40px;height:60px;object-fit:cover;border-radius:3px;">
                                </c:if>
                            </td>
                            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                                <td>
                                    <form action="${pageContext.request.contextPath}/books" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this book?');">
                                        <input type="hidden" name="deleteBookId" value="${book.id}" />
                                        <button type="submit" style="background:#EF4444;color:#fff;border:none;border-radius:4px;padding:6px 12px;cursor:pointer;">Delete</button>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <footer>
        <p>© 2025 Library IO. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>
</div>
</body>
</html>