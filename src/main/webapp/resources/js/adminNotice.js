
/* todo */

const doit = document.getElementsByClassName('doit');
const done = document.getElementsByClassName('done');

const doing = document.getElementById('doing');
const donelist = document.getElementById('donelist');

const on = document.getElementsByClassName('on');


function Showdoitlist() {
    doit[0].style.display='block';
    done[0].style.display='none';

}
function Showdonelist() {
    doit[0].style.display='none';
    done[0].style.display='block';
}

function addlist(){          
    txttg = document.getElementById('txt');
    if (txttg.value=="") {
        alert("할 일을 입력하세요.");
        return;
    }

    newtr = document.createElement('tr');
    newtd1 = document.createElement('td');
    newtd1.setAttribute('class','td1');

    newtd2 = document.createElement('td');
    newtd2.setAttribute('class','todoTd');

    newtd3 = document.createElement('td');
    newtd3.setAttribute('class','td3');


    intg = document.createElement('input'); 
    intg.setAttribute('type', 'checkbox');

    intg.setAttribute('onclick','check(this)');

    sptg = document.createElement('span');
    sptg.innerHTML = txttg.value;     

    btn = document.createElement('button');
    btn.innerHTML='✖';
    btn.setAttribute('class', 'boxBtn');
    btn.setAttribute('onclick', 'removelist(this)');

 
    newtd1.append(intg);
    newtd2.append(sptg);
    newtd3.append(btn);
    newtr.append(newtd1);
    newtr.append(newtd2);
    newtr.append(newtd3);
    doing.append(newtr);

    txttg.value="";

}

function check(chk) {
    trtg = chk.parentNode.parentNode
              
    if(chk.checked==true) {
        donelist.append(trtg);
    } else {
        doing.append(trtg);

    }

}

function removelist(btn) {
    trtg = btn.parentNode.parentNode;
    trtg.remove();
}

let todoflag=false;

function showTodolist() {
        if(todoflag==false) {
        let todolist = document.getElementById("todolist");
        todolist.style.display='block';
        todolist.style.backgroundColor='white';
        todolist.style.position='fixed';
        todolist.style.left='70%';
        todolist.style.top='60px';
        todolist.style.width='400px';
        todolist.style.height='500px';
        todoflag=true;

        } else {
            let todolist = document.getElementById("todolist");
            todolist.style.display='none';
            todoflag=false;

        }

}
