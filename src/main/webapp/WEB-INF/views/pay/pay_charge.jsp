<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/pay.css">

<div id="charge-container" data-member-number="<%= session.getAttribute("member_number") %>">
    <h1>충전하기</h1>
    <form id="chargeForm"> <!-- action 속성 제거 -->
        <div class="form-group">
            <label for="amount">충전 금액</label>
            <div class="input-container">
                <input type="number" id="amount" name="pay_amount" min="1" required placeholder="충전할 금액을 입력하세요." oninput="toggleClearButton()">
                <button type="button" class="clear-button" onclick="clearAmount()" style="display:none;">✖</button>
            </div>
        </div>
        <div class="form-group">
            <ul class="AmountShortcut_shortcut-list__pEIG9">
                <li class="AmountShortcut_item__LIolC"><button type="button" class="AmountShortcut_button-amount__tuXDw" onclick="addAmount(10000)">+1만</button></li>
                <li class="AmountShortcut_item__LIolC"><button type="button" class="AmountShortcut_button-amount__tuXDw" onclick="addAmount(50000)">+5만</button></li>
                <li class="AmountShortcut_item__LIolC"><button type="button" class="AmountShortcut_button-amount__tuXDw" onclick="addAmount(100000)">+10만</button></li>
                <li class="AmountShortcut_item__LIolC"><button type="button" class="AmountShortcut_button-amount__tuXDw" onclick="addAmount(1000000)">+100만</button></li>
            </ul>
        </div>
        <div class="form-group">
            <button type="button" class="btn" onclick="openVerificationWindow()">충전하기</button>
        </div>
    </form>
</div>

<div class="footer">
    <p>감자페이를 이용해 주셔서 감사합니다!</p>
</div>

<script src="/resources/js/pay_charge.js"></script>
<%@ include file="../common/footer.jsp"%>