$(document).ready(function() {
    const qnaData = [
        {
            q: "중고물품을 구매하려면 어떻게 해야 하나요?",
            a: "원하는 물품을 검색한 후, 해당 물품의 상세 페이지로 이동하여 '구매하기' 버튼을 클릭하면 구매 절차를 진행할 수 있습니다."
        },
        {
            q: "판매자는 어떻게 등록하나요?",
            a: "회원가입 후, '판매하기' 메뉴를 클릭하여 물품 정보를 입력하고 사진을 업로드하면 판매 등록이 완료됩니다."
        },
        {
            q: "거래 후 물품에 문제가 생기면 어떻게 하나요?",
            a: "거래 후 7일 이내에 문제가 발생한 경우, 고객센터에 문의하시면 환불 또는 교환 절차를 안내해 드립니다."
        },
        {
            q: "채팅 기능은 어떻게 사용하나요?",
            a: "관심 있는 물품의 상세 페이지에서 '채팅하기' 버튼을 클릭하면 판매자와 1:1 채팅을 시작할 수 있습니다."
        },
        {
            q: "결제는 어떻게 이루어지나요?",
            a: "결제는 안전한 결제 시스템을 통해 이루어지며, 구매자가 물품을 수령한 후 판매자에게 대금을 지급합니다."
        },
        {
            q: "중고물품의 가격은 어떻게 정하나요?",
            a: "판매자는 물품의 상태와 시장 가격을 고려하여 자유롭게 가격을 설정할 수 있습니다."
        },
        {
            q: "물품을 판매하기 전에 상태를 어떻게 확인하나요?",
            a: "물품의 상태를 사진으로 촬영하고, 상세 설명에 상태를 기재하여 구매자에게 정확한 정보를 제공해야 합니다."
        },
        {
            q: "거래가 완료된 후 리뷰는 어떻게 남기나요?",
            a: "거래가 완료된 후, 구매자는 판매자의 프로필 페이지에서 '리뷰 남기기' 버튼을 클릭하여 리뷰를 작성할 수 있습니다."
        },
        {
            q: "물품을 구매한 후 취소할 수 있나요?",
            a: "물품을 구매한 후, 배송 전까지는 취소가 가능하며, 고객센터를 통해 요청하시면 됩니다."
        },
        {
            q: "사이트 이용 중 문제가 발생하면 어떻게 하나요?",
            a: "사이트 이용 중 문제가 발생하면 고객센터에 문의하시거나, FAQ 페이지를 참조하여 해결 방법을 찾아보실 수 있습니다."
        }
    ];

    const qnaList = document.getElementById('qna-list');

    qnaData.forEach((item, index) => {
        const qnaItem = document.createElement('div');
        qnaItem.className = 'qna-item';
        qnaItem.innerHTML = `
            <div class="question" onclick="toggleAnswer(${index})">Q: ${item.q}</div>
            <div class="answer" id="answer-${index}">A: ${item.a}</div>
        `;
        qnaList.appendChild(qnaItem);
    });
});

function toggleAnswer(index) {
    const answer = document.getElementById(`answer-${index}`);
    answer.classList.toggle('show');
}