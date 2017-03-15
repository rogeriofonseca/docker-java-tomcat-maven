<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="template/top.jsp" />
<div class="col-sm-8">
<div class="panel panel-default">
	<div class="panel-heading">Produto</div>
	<div class="panel-body">
		<div class="row">
			<c:forEach items="${produtos}" var="produto">
				<div class="col-lg-4 col-sm-6">
					<h4>${produto.nome}</h4>
					<p>
						<a href="<c:url value="/produto/${produto.id}" />"
							class="block clearfix"> <img src="${produto.linkDaFoto}"
							width="150" height="200">
						</a>
					<p>
						<a class="btn btn-default"
							href="<c:url value="/produto/${produto.id}" />" />Saiba mais </a>
						<a class="btn btn-default"
							href="<c:url value="/produto/${produto.id}/form" />" />Editar </a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>
<c:import url="template/down.jsp" />
