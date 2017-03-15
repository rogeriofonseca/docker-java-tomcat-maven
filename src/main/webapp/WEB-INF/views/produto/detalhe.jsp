<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="../template/top.jsp" />
<div class="col-sm-8">
	<div class="panel panel-default">
		<div class="panel-heading">${produto.loja.nome}</div>
		<div class="panel-body">
			<div class="container">
				<h3>${produto.nome}</h3>
				<div class="col-sm-7">
					<legend></legend>
					<div class="col-sm-5">
						<img src="${produto.linkDaFoto}" width="200" height="300">
					</div>
					<div class="col-sm-7">
						<p>${produto.descricao}</p>
						<br />
						<h3>
							<fmt:formatNumber type="currency" value="${produto.preco}" />
						</h3>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="../template/down.jsp" />
