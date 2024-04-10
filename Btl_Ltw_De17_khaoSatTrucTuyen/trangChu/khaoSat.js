let add = document.getElementById("add_question")
let tab1 = document.getElementById("tab1")
// let tuy_chon = document.getElementById('tuy_chon')
let value_select = 1


//tab 1 bat dau tu day

document.addEventListener("DOMContentLoaded", function() {
    const tabs = document.querySelectorAll('.tab_btn');
    const tabContents = document.querySelectorAll('.tab_content');
  
    tabs.forEach((tab, index)=> {
        tab.addEventListener('click', (e) => {
            tabs.forEach(tab => {tab.classList.remove("active")})
            tab.classList.add('active')
            var line = document.querySelector('.line');
            line.style.width = e.target.offsetWidth + 'px';
            console.log(e.target.offsetWidth );
            line.style.left = e.target.offsetLeft + 'px';


            tabContents.forEach(tab => {tab.classList.remove('active')})
            tabContents[index].classList.add('active')
        })
    })

    let titles = document.querySelectorAll(".title")
    titles.forEach((title) => {
        title.addEventListener("click", function () {
            window.location.href = "trangChu.aspx"
        })
    })
  });


function add_clicl() {
    let div1 = document.createElement('div')
    let div2 = document.createElement('div')
    div1.style = "height: 20px; background-color: #d9f5f9;"
    div2.className = "question-answer_container"
    div2.innerHTML = `<div>
                        <div class="question_container">
                            <input name="noiDung" type="text" class="question" placeholder="Câu hỏi"/>
                            <hr>
                        </div>
                        <div class="select_container">
                            <select class="select" name="select" id="" onchange="select_change(this)">
                                <option value="TN"> Trắc nghiệm</option>
                                <option value="HD">Hộp điểm</option>
                                <option value="DO">Đoạn</option>
                                <option value="MN">Menu thả xuống</option>
                            </select>
                            <div class="select_icon">
                                <i class="fa-sharp fa-solid fa-caret-down"></i>
                            </div>
                        </div>
                        <input type="button" value="X" class="remove_question" onclick="remove_question_click(this)"/>
                    </div>
    
                    <div class="answer_container">
                        <div class=""></div>
                        <div class="tuy_chon">
                            <div class="answer">
                                <p class="stt_an">*</p>
                                <input class="anwser_text" type="text" placeholder="Tùy chọn"/>
                                <input class="remove_anwser" type="button" value="X" onclick="remove_anwser_click(this)"/>
                            </div>
                        </div>
            
                        <div class="add_anwser">
                            <!-- <span onclick="them_tc_click(this)">Thêm tùy chọn</span> Hoặc <span onclick="them_khac_click(this)">Thêm câu trả lời khác</span> -->
                            <span onclick="them_tc_click(this)">Thêm tùy chọn</span>
                        </div>
                    </div>`
    tab1.appendChild(div2)
    //tab1.appendChild(div1)
}

remove_anwser_click = (btn) => {
    let button_parent = btn.closest('.answer')
    console.log(button_parent)
    button_parent.parentNode.removeChild(button_parent)
    
}


function them_khac_click(sp) {
    tuy_chon.innerHTML += 
    `<div class="answer">
        <input class="answer_type" type="radio" name="1" id=""/>
        <input class="anwser_text" type="text" placeholder="Tùy chọn"/>
        <input class="remove_anwser" type="button" value="X" onclick="remove_anwser_click(this)"/>
    </div>`
}

function them_tc_click(them_tc) {
    let i = 0
    let cur = them_tc.parentNode.previousElementSibling
    console.log(cur)
    let div = document.createElement('div')
    div.className = "answer"
    div.innerHTML = 
    `
        <p class="stt_an">*</p>
        <input class="anwser_text" type="text" placeholder="Tùy chọn"/>
        <input class="remove_anwser" type="button" value="X" onclick="remove_anwser_click(this)"/>
    `
    cur.appendChild(div)
}


function select_change(sl) {
    value_select = sl.value;
    console.log(value_select);
    let addAnwserDiv = sl.parentNode;

    
    let anw_container = addAnwserDiv.parentNode.nextElementSibling;


    anw_container.querySelectorAll('.answer_type').forEach(function(elenment) {
        console.log(elenment);
        switch(value_select) {
            case "1": 
                elenment.type = "radio"
                break
            case "2": 
                elenment.type = "checkbox"
                break
            case "3": 
                elenment.type = "radio"
                break
            case "4": 
                elenment.type = "radio"
                break
            default: 
                elenment.type = "radio"
                break
        }
    })
}

function remove_question_click(btn) {
    let hhh = btn.closest('.question-answer_container')
    console.log(hhh.innerHTML);
    tab1.removeChild(hhh)
}

function testform() {
    var sel = [];
    let ques = []
    let ans = []
    document.querySelectorAll('.question-answer_container').forEach(function (container) {
        var questionInput = container.querySelector('.question');
        var SelectInput = container.querySelector('.select');
        var answerInputs = container.querySelectorAll('.anwser_text');

        // Kiểm tra xem phần tử có tồn tại không trước khi truy cập giá trị
        if (questionInput && SelectInput && answerInputs.length > 0) {
            var questionValue = questionInput.value;
            var SelectValue = SelectInput.value;

            answerInputs.forEach(function (answerInput) {
                ans.push(answerInput.value);
            });
            ans.push(";")

            ques.push(questionValue);
            sel.push(SelectValue);
        }
    });

    // Gán giá trị của chuỗi JSON vào input hidden

    document.getElementById("select_hidden").value = sel.join(',');
    document.getElementById("ques_hidden").value = ques.join(',');
    document.getElementById("ans_hidden").value = ans.join(',');
    console.log(ans.join(','));
}

//function testform() {
//    var sel = [];
//    let ques = []
//    let ans = []
//    document.querySelectorAll('.question-answer_container').forEach(function (container) {
//        var questionInput = container.querySelector('.question').value;
//        var SelectInput = container.querySelector('.select').value;
//        var answerInputs = container.querySelectorAll('.anwser_text');

//        answerInputs.forEach(function (answerInput) {
//            ans.push(answerInput.value);
//        });
//        ans.push(";")
//        ques.push(questionInput)
//        sel.push(SelectInput)
//    });

//    // Gán giá trị của chuỗi JSON vào input hidden

//    document.getElementById("select_hidden").value = sel.join(',');
//    document.getElementById("ques_hidden").value = ques.join(',');
//    document.getElementById("ans_hidden").value = ans.join(',');


//}

//function testform() {
//    var dataToSend = [];

//    document.querySelectorAll('.question-answer_container').forEach(function (container) {
//        var questionInput = container.querySelector('.question').value;
//        var SelectInput = container.querySelector('.select').value;
//        var answerInputs = container.querySelectorAll('.anwser_text');

//        var answers = [];
//        answerInputs.forEach(function (answerInput) {
//            answers.push(answerInput.value);
//        });

//        dataToSend.push({ question: questionInput, select: SelectInput, answers: answers });
//    });

//    console.log(dataToSend)
//    var jsonData = JSON.stringify(dataToSend);

//    // Gán giá trị của chuỗi JSON vào input hidden
//    let ques = []
//    let ans = []
//    dataToSend.forEach(function (item) {
//        var question = item.question;
//        var answers = item.answers;

//        ques.push(question)

//        answers.forEach(function (answer) {
//            ans.push(answer)
//            /*console.log("Answer:", answer);*/
//        });
//        ans.push(";")
//    });
//    console.log(ques.join(','))
//    console.log(ans.join(','))
//    document.getElementById("hidden_text").value = ques.join(',');

//    //var xhr = new XMLHttpRequest();
//    //xhr.open('POST', 'trangKhaoSat.aspx.cs', true);
//    //xhr.setRequestHeader('Content-Type', 'application/json');
//    //xhr.onload = function () {
//    //    if (xhr.status === 200) {
//    //        var response = JSON.parse(xhr.responseText);
//    //        console.log(response); // Xử lý kết quả từ phía server
//    //    } else {
//    //        console.log('Error saving data');
//    //    }
//    //};
//    //xhr.send(JSON.stringify(dataToSend)); // Gửi dữ liệu dưới dạng JSON
//}