<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/* footer 하단에 고정하려면 자기가  가장 큰 div를 .cotainer와 동일하게 css를  주세요 */

footer {
    height: 20px;
}

 .footer {
  background: white;
  font-size: 12px;  
  color: #999;
  margin-top: 50px;
}    
.footer a {
   color:#4D4D4D;
}
.footer-menu {
  background: white;
  border-top: 1px solid #d9d9d9;
  border-bottom: 1px solid #d9d9d9;
}
.footer-menu ul {
  max-width: 1020px;
  margin: 0 auto;
  padding-left: 0;
  overflow: hidden;
}
.footer-menu li {
  float: left;
  list-style: none;

  font-size:13px;
  padding: 15px 0 13px 0;
}
.footer-menu li:after {
  float: right;
  display: block;
  content:"|";
  color: #d9d9d9;
  margin-left: 30px;
}

.footer-menu li.fr {
  float: right;
}
.footer-menu li.fr:after {
  content: "";
}
.footer-menu li:first-child a {
  padding-left: 10px;
}
.footer-menu li:last-child:after {
  content: "";
}
.footer-menu li.notice:after {
  content: "";
}
.footer-menu li.down_app {
  padding-left:10px;
  margin-left: -3px;
}
.footer-menu li.notice:before {
  float: left;
  display: block;
  content: "";
  color: #d9d9d9;
}
.footer-menu li a {
  display: inline-block;
  color: #818181;
  padding: 0 20px;
  text-decoration: none;
}
.footer-menu li.privacy-txt a {
  color: #5f5f5f;
  font-weight: bold;
  letter-spacing: -1px;
}
.footer-menu li.sns-link {
  float: right
}
.footer-menu li.sns-link a {
  line-height: 16px;
  margin-left: 32px;
  padding: 0;
}
.footer-menu li.sns-link a span {
  display:inline-block;
  width: 16px;
  height: 16px;
  margin: -1px 5px 0 0;
  vertical-align:middle;
}
a.facebook span {
  background: url(../image/img-footer1.png?v=ba95c55ec00bfd241a89b21fe55a7b72bdfacaab) no-repeat 0 -70px;
}
a.blog span {
  background: url(../image/img-footer1.png?v=ba95c55ec00bfd241a89b21fe55a7b72bdfacaab) no-repeat -16px -70px;
}
@media (max-width: 768px) {
  .footer-menu ul {
    text-align: center;
  }
  .footer-menu li {
    display: none;
  }
  .footer-menu li a {
    padding: 0 10px 0 7px;
  }
  .footer-menu li.mb {
    display: inline-block;
    float: none;
  }
  .company-info span.pnum {
    color: #4D4D4D;
  }
  a[href^=tel] { color: inherit; text-decoration: none; }
}
.footer-menu li .app {
  background: url(../image/ico-yogiyo-down.png) 0 0 no-repeat;
  background-size: 16px 16px;
  padding-left: 20px;
}

.company-wrap {
  position: relative;
  max-width: 1020px;
  margin: 32px auto 0 auto;
  padding-left: 20px;
}

.service-info {
  max-width: 1020px;
  padding-left: 138px;
  margin: 30px auto;
  overflow: auto;
}
.service-info div {
  float: left;
  margin-right: 30px;
}
.service-info .text {
  display: inline-block;
  vertical-align:middle;
}
.service-info .img {
  display:inline-block;
  width: 38px;
  height: 38px;
  margin: 0 10px 0 0;
  vertical-align:middle;
}

.guide {
  max-width: 1000px;
  color: #989898;
  line-height: 1;
  margin: 0 auto;
  padding: 0 15px;
}
.guide p {
  padding: 0;
}

	
</style>
    