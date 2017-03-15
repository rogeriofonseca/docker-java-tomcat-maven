<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<c:import url="../template/top.jsp" />
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">Novo produto</div>

		<div class="panel-body">
			<form action="${spring:mvcUrl('cadastraProduto').build()}" method="post">
				<div class="form-group">
					<label for="nome">
						Nome:
					</label>
					<input type="text" class="form-control" name="nome" value="${produto.nome}">
					<form:errors path="produto.nome" />
				</div>

				<div class="form-group">
					<label for="nome">
						Link da foto:
					</label>
					<input type="text" class="form-control" name="linkDaFoto" value="${produto.linkDaFoto}">
					<form:errors path="produto.linkDaFoto" />
				</div>
				<div class="form-group">
					<label for="nome">
						Preço:
					</label>
					<input type="text" class="form-control" name="preco" value="${produto.preco}">
					<form:errors path="produto.preco" />
				</div>
				<div class="form-group">
					<label for="nome">
						Loja:
					</label>
					<select name="loja.id" class="form-control">
						<option value="selecione">Selecione</option>
						<c:forEach items="${lojas}" var="loja">
							<c:choose>
								<c:when test="${produto.loja.id == loja.id }">
									<option value="${loja.id}" selected>${loja.nome}</option>	
								</c:when>
								<c:when test="${produto.loja.id != loja.id }">
									<option value="${loja.id}">${loja.nome}</option>	
								</c:when>
							</c:choose>
						</c:forEach>
					</select>
					<form:errors path="produto.loja.id" />
				</div>
				<div class="form-group">
					<label for="descricao">
						Categoria:
					</label><br>
					<c:forEach items="${categorias}" var="categoria" varStatus="status">
						<c:set var="contains" value="false"/>
						
						<c:forEach items="${produto.categorias}" var="categoriaProduto" varStatus="statusProduto">
							<c:if test="${categoriaProduto.id == categoria.id}">
								<c:set var="contains" value="true"/>		
							</c:if>
						</c:forEach>	
						<c:choose>	
							<c:when test="${contains}">
					 			<input type="checkbox" name="categorias" value="${categorias[status.index].id}" checked> 
									${categoria.nome}<br>
								<c:set var="contains" value="false"/>		
							</c:when>
							<c:when test="${not contains }">
								<input type="checkbox" name="categorias" value="${categorias[status.index].id}"> 
									${categoria.nome}<br>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				<div class="form-group">
					<label for="descricao">
						Descrição:
					</label>
					<textarea name="descricao" class="form-control">${produto.descricao}</textarea>
				</div>
				<form:errors path="produto.descricao" />
				
				<c:if test="${produto.id != null}">
					<div class="form-group">
						<input type="submit" class="btn btn-success" value="Atualizar">
						<input type="hidden" name="id" value="${produto.id}">
					</div>
				</c:if>
				
				<c:if test="${produto.id == null}">
					<div class="form-group">
						<input type="submit" class="btn btn-success" value="Cadastrar">
					</div>
				</c:if>
				
 			</form>
		</div>
	</div>
</div>


</body>
</html>