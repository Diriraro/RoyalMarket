<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="container">
	<table class="table table-hover" style="width: 1170px">
		<tr>
			<td width="70%" align="center" style="background: black; color: white; font-size: medium;" >SUBJECT</td>
			<td align="center" style="background: black; color: white; font-size: medium;">DATE</td>
		</tr>
			<tr>
			<td></td>
			</tr>
		<tr>
			<td width="70%" align="center" style="border: 1px solid white; background: white;">${no_select.notitle}</td>
			<td align="center" style="border: 1px solid white; background: white;">${no_select.no_regDate}</td>
		</tr>
	</table>
	<div class="container" style="border: 1px solid white; background: white;">
			${no_select.no_contents}
	</div>
</div>