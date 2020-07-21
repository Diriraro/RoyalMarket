<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check eq 'accept'}">
	<div class="w3-container">
		<div class="listSection">
			<div class="topnav">
				<a class="check active" title="MemberList">일반 회원 관리</a> <a
					class="check " title="MemberBlockList">차단 회원 관리</a>
				<!-- <a href="#about">About</a> <a
			href="#contact">Contact</a> -->
				<div class="search-container">
					<select id="kind">
						<option value="mem_id" selected="selected">아이디</option>
						<option value="mem_storeNum">회원번호</option>
						<option value="mem_name">회원이름</option>
					</select> <input type="text" placeholder="Member Search.." name="search"
						id="search">
					<button type="submit" id="frm">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th><i class="far fa-id-card"
							style="width: 25; height: 25; color: gray"></i> 회원 아이디</th>
						<th><img alt="비밀번호 확인 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
							width="16" height="20"> 회원 비밀번호</th>
						<th><i class="glyphicon glyphicon-user"
							style="width: 20; height: 20; color: gray"></i> 회원 이름</th>
						<th><img alt="이메일 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAeCAYAAABE4bxTAAAAAXNSR0IArs4c6QAAAmNJREFUWAntlz9IG1Ecx3OXZFCSTUhLN0EoxTrUqYOgdOrYRZ2UTtmv2RIv/whZYvZMpVPRReriVKo4CKVmsB0KmYsG3C60kL9+v+m9xxnvvAvkzgz+4HHvfr/fe98Pv/e7u0TJ5XKD0BSZOkUsQ5SIAEKlFDF/iKs4qamrkASqVCpzD1EZalq1JVCr1fpqDQQFR01qCz0JBMdS0FAWmCU7oIsgoUZgqD00WaFYLPYGnkCgRmFM7dtAqVTqOggoOxhq/69PKCQrRIffUG4wZLgF5CeUFxhbID+gvMI4Ak0SahyYe4EcoE7K5fI8Y16MuXi3nSCX75kLPjTWBrbb404PjSZZGr2O2It2u/29UChsDQYDx7WMMYe5XINR9wJDbUV8Zd2+9tVqdcYwjI8Q2+BC2G+MfUVRjqPR6B86Op3OM8RXMV3HeI4RQnwvHo+/1zTtH++dTHDInx9OicJvbriZz+c/w1eE8EtcdVx1VEKkyStAfuJmJ5vNfpFODxPPQGIvCgDisFQqLfd6vbeYLyL2xIxfAeRXOBw+SqfT55iP/Wt0bCAKm0I/MOWwtUwmY+t3czo2pttCv+KPQG6VVdEPBpPQpE/dkv2KC22yqHhKGhTqdruv/BJ027ff7y8zhywq7MBc8AGOwP8KURNAGhnIoiYSiSpK1UBgrVgs7gQJRS1Tc40MQxaS4bvzGsFTjDAC3+DajUQidbzcLhmftLFnzBbhqRCmh7Gi6/qZPCIT6hMSFiYNcN9+AGlgbBOGeRKIN7VabbbZbGo403dIWgBcnP5JG/Y2sDcb+IDHlEwm/wqNGyY5cTR18XRcAAAAAElFTkSuQmCC"
							width="18" height="15"> 회원 이메일</th>
						<th><img alt="휴대폰 번호 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAoCAYAAACb3CikAAAAAXNSR0IArs4c6QAAAKJJREFUWAntmNEKgCAUQ7vRh/vnFcHtYbAUssuC9WLTl3m2QIvW2r4IPKuAh8vClkZOMpHvlWMmIkPERjD+uyO4kNnh/FvNuigTDSWSO2c7yPXRsUdYhoiNYKQmYiJIALU7YiJIALU7YiJIALU7YiJIAPXImbXkbixTVkpk1ukdI2BahoiMkadoPikpi/wXREp/3MgQkTESvVs6++5nz8sQOQDArxrcaIpJNgAAAABJRU5ErkJggg=="
							width="17" height="20"> 회원 핸드폰</th>
						<th><i class="fas fa-house-user"
							style="width: 25; height: 25; color: gray"></i> 회원 주소</th>
						<th><i class="fas fa-dollar-sign"></i> 회원 잔여포인트</th>
						<th><i class="fas fa-ban"></i> 회원 접속 차단</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.mem_storeNum}</td>
							<td>${vo.mem_id}</td>
							<td>${vo.mem_pw}</td>
							<td>${vo.mem_name}</td>
							<td>${vo.mem_email}</td>
							<td>${vo.mem_phone}</td>
							<td>${vo.mem_address}</td>
							<td>${vo.mem_point}</td>
							<td><button class="AccessGrant1" title="${vo.mem_storeNum}">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>
<c:if test="${check eq 'denied'}">
	<div class="w3-container">
		<div class="listSection">
			<div class="topnav">
				<a class="check" title="MemberList">일반 회원 관리</a> <a
					class="check active" title="MemberBlockList">차단 회원 관리</a>
				<!-- <a href="#about">About</a> <a
			href="#contact">Contact</a> -->
				<div class="search-container">
					<form>
						<select id="kind">
							<option value="mem_id" selected="selected">아이디</option>
							<option value="mem_storeNum">회원번호</option>
							<option value="mem_name">회원이름</option>
						</select> <input type="text" placeholder="Member Search.." name="search"
							id="search">
						<button type="submit" id="frm1">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th><i class="far fa-id-card"
							style="width: 25; height: 25; color: gray"></i> 회원 아이디</th>
						<th><img alt="비밀번호 확인 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
							width="16" height="20"> 회원 비밀번호</th>
						<th><i class="glyphicon glyphicon-user"
							style="width: 20; height: 20; color: gray"></i> 회원 이름</th>
						<th><img alt="이메일 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAeCAYAAABE4bxTAAAAAXNSR0IArs4c6QAAAmNJREFUWAntlz9IG1Ecx3OXZFCSTUhLN0EoxTrUqYOgdOrYRZ2UTtmv2RIv/whZYvZMpVPRReriVKo4CKVmsB0KmYsG3C60kL9+v+m9xxnvvAvkzgz+4HHvfr/fe98Pv/e7u0TJ5XKD0BSZOkUsQ5SIAEKlFDF/iKs4qamrkASqVCpzD1EZalq1JVCr1fpqDQQFR01qCz0JBMdS0FAWmCU7oIsgoUZgqD00WaFYLPYGnkCgRmFM7dtAqVTqOggoOxhq/69PKCQrRIffUG4wZLgF5CeUFxhbID+gvMI4Ak0SahyYe4EcoE7K5fI8Y16MuXi3nSCX75kLPjTWBrbb404PjSZZGr2O2It2u/29UChsDQYDx7WMMYe5XINR9wJDbUV8Zd2+9tVqdcYwjI8Q2+BC2G+MfUVRjqPR6B86Op3OM8RXMV3HeI4RQnwvHo+/1zTtH++dTHDInx9OicJvbriZz+c/w1eE8EtcdVx1VEKkyStAfuJmJ5vNfpFODxPPQGIvCgDisFQqLfd6vbeYLyL2xIxfAeRXOBw+SqfT55iP/Wt0bCAKm0I/MOWwtUwmY+t3czo2pttCv+KPQG6VVdEPBpPQpE/dkv2KC22yqHhKGhTqdruv/BJ027ff7y8zhywq7MBc8AGOwP8KURNAGhnIoiYSiSpK1UBgrVgs7gQJRS1Tc40MQxaS4bvzGsFTjDAC3+DajUQidbzcLhmftLFnzBbhqRCmh7Gi6/qZPCIT6hMSFiYNcN9+AGlgbBOGeRKIN7VabbbZbGo403dIWgBcnP5JG/Y2sDcb+IDHlEwm/wqNGyY5cTR18XRcAAAAAElFTkSuQmCC"
							width="18" height="15"> 회원 이메일</th>
						<th><img alt="휴대폰 번호 Input 아이콘"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAoCAYAAACb3CikAAAAAXNSR0IArs4c6QAAAKJJREFUWAntmNEKgCAUQ7vRh/vnFcHtYbAUssuC9WLTl3m2QIvW2r4IPKuAh8vClkZOMpHvlWMmIkPERjD+uyO4kNnh/FvNuigTDSWSO2c7yPXRsUdYhoiNYKQmYiJIALU7YiJIALU7YiJIALU7YiJIAPXImbXkbixTVkpk1ukdI2BahoiMkadoPikpi/wXREp/3MgQkTESvVs6++5nz8sQOQDArxrcaIpJNgAAAABJRU5ErkJggg=="
							width="17" height="20"> 회원 핸드폰</th>
						<th><i class="fas fa-house-user"
							style="width: 25; height: 25; color: gray"></i> 회원 주소</th>
						<th><i class="fas fa-dollar-sign"></i>회원 잔여포인트</th>
						<th><i class="far fa-check-circle"></i> 회원 접속 차단 해제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.mem_storeNum}</td>
							<td>${vo.mem_id}</td>
							<td>${vo.mem_pw}</td>
							<td>${vo.mem_name}</td>
							<td>${vo.mem_email}</td>
							<td>${vo.mem_phone}</td>
							<td>${vo.mem_address}</td>
							<td>${vo.mem_point}</td>
							<td><button class="AccessGrant0" title="${vo.mem_storeNum}">O</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</c:if>