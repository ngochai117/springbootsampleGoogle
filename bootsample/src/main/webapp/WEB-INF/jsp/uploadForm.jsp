<html xmlns:th="http://www.thymeleaf.org">
<body>

	<div th:if="${message}">
		<h2 th:text="${message}"/>
	</div>

	<div>
	<div>web demo upload file len google drive Nhom 8</div>
		<form method="POST" enctype="multipart/form-data" action="/upfile">
			<table>
				<tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
				<tr><td></td><td><input type="submit" value="Upload" /></td></tr>
			</table>
		</form>
	</div>

	<div>
		<ul>
			<li th:each="file : ${files}">
				<a th:if="${linktai}" th:href="${file}" th:text="${file}" ></a>
				<div th:if="${linktai}"><a th:href="${linktai}" th:text="${linktai}"></a></div>
			</li>
		</ul>
	</div>

</body>
</html>
