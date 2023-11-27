<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="naming" var="naming"/>

<fmt:message bundle="${naming}" key="table.label.type" var="type"/>
<fmt:message bundle="${naming}" key="table.label.cost" var="cost"/>
<fmt:message bundle="${naming}" key="table.label.roomNumber" var="roomNumber"/>
<fmt:message bundle="${naming}" key="room.label.apartment" var="apartment"/>
<fmt:message bundle="${naming}" key="room.label.business" var="business"/>
<fmt:message bundle="${naming}" key="room.label.deluxe" var="deluxe"/>
<fmt:message bundle="${naming}" key="room.label.duplex" var="duplex"/>
<fmt:message bundle="${naming}" key="room.label.familyRoom" var="familyRoom"/>
<fmt:message bundle="${naming}" key="room.label.standard" var="standard"/>
<fmt:message bundle="${naming}" key="room.label.president" var="president"/>
<fmt:message bundle="${naming}" key="room.label.roomSelection" var="roomSelection"/>
<fmt:message bundle="${naming}" key="button.label.choose" var="choose"/>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/favicon.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dataStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/tableStyle.css">
    <title>${roomSelection}</title>
</head>
<body>
<jsp:include page="../../fragments/header/mainHeader.jsp"/>

<div class="container">
    <div class="leftColumn">
        <jsp:include page="../../fragments/header/adminHeader.jsp"/>
    </div>
    <form action="${pageContext.request.contextPath}/controller?command=processOrder" method="post">
        <div class="rightColumn">
            <div class="tableScroll">
                <table>
                    <tr>
                        <th></th>
                        <th>${roomNumber}</th>
                        <th>${type}</th>
                        <th>${cost}</th>
                    </tr>
                    <jsp:useBean id="roomsWithCriteria" scope="request" type="java.util.List"/>
                    <c:forEach items="${roomsWithCriteria}" var="foundRooms">
                        <tr>
                            <td>
                                <input type="radio" id="idRoom" name="idRoom" value="${foundRooms.room.id}" required>
                            </td>
                            <td>
                                <div class="data">
                                        ${foundRooms.room.roomNumber}
                                </div>
                            </td>
                            <td>
                                <div class="data">
                                    <c:choose>
                                        <c:when test="${foundRooms.room.roomType == 'APARTMENT'}">
                                            ${apartment}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'BUSINESS'}">
                                            ${business}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'DELUXE'}">
                                            ${deluxe}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'DUPLEX'}">
                                            ${duplex}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'FAMILYROOM'}">
                                            ${familyRoom}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'STANDARD'}">
                                            ${standard}
                                        </c:when>
                                        <c:when test="${foundRooms.room.roomType == 'PRESIDENT'}">
                                            ${president}
                                        </c:when>
                                    </c:choose>
                                </div>
                            </td>
                            <td>
                                <div class="data">
                                    <input type="hidden" id="cost" name="cost" value="${foundRooms.roomPrice.cost}">
                                        ${foundRooms.roomPrice.cost}
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="addPanel">
                <button class="addButton" type="submit">${choose}
                </button>
            </div>
        </div>
    </form>
</div>
<jsp:include page="/WEB-INF/fragments/header/footer.jsp"/>
</body>
</html>
