let nav = document.querySelector('.nav-all');
let leftArrow = document.querySelector('#arrow img');
let cnt = 0;
let common = document.querySelector(".Main");

function moving_sidebar()
{
    if(cnt === 0)
    {
        nav.style.transform = 'translateX(-100%)';
        leftArrow.style.transform = 'scale(-1)';
        leftArrow.style.transition = '0.8s';
        common.style.marginLeft = '20px';
        common.style.transition = '0.8s';
        common.style.width = 'calc(100% - 20px)';
        cnt++;
    }
    else
    {
        nav.style.transform = 'translateX(0%)';
        leftArrow.style.transform = 'scale(1)';
        leftArrow.style.transition = '0.8s';
        common.style.marginLeft = '270px';
        common.style.transition = '0.8s';
        common.style.width = 'calc(100% - 270px)';
        cnt--;
    }
}

function GoHome()
{
    location.href = "/";
}

function MiniHomePage()
{
    location.href = "#";
}

function PointShop()
{
    location.href = '/PointShop.do';
}

function MyPage()
{
    location.href = '#';
}

function Login()
{
    location.href = '/login.jsp';
}

function Logout()
{
    location.href = '/Logout.do';
}

let chk1 = document.getElementById('check1');
let chk2 = document.getElementById('check2');
let chk3 = document.getElementById('check3');
let chk4 = document.getElementById('check4');
let chk5 = document.getElementById('check5');
let span = document.querySelectorAll('.depth1 span');
let menuIcon = document.querySelectorAll('.menuIcon');
let bodyChk = document.querySelector('body');

function getColor(color)
{
    let r = document.querySelector(":root");
    let rs = getComputedStyle(r); //암기
    return rs.getPropertyValue(color);
}

function getDarkColor(color)
{
    let r = document.querySelector("body.dark");
    let rs = getComputedStyle(r); //암기
    return rs.getPropertyValue(color);
}

chk1.addEventListener('change', function()
{
    chk2.checked = false;
    chk3.checked = false;
    chk4.checked = false;
    chk5.checked = false;
    radioReset(span);
    if(this.checked)
    {
        span[0].innerHTML = '&#65293'; //full-width하이픈
        span[1].style.color = getColor('--color-point');
        span[1].style.fontWeight = 'bold';
    }
    else
    {
        span[0].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[1].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[1].style.color = getColor('--color-text');
        }
    }
});
chk2.addEventListener('change', function()
{
    chk1.checked = false;
    chk3.checked = false;
    chk4.checked = false;
    chk5.checked = false;
    radioReset(span);
    if(this.checked)
    {
        span[2].innerHTML = '&#65293';
        span[3].style.color = getColor('--color-point');
        span[3].style.fontWeight = 'bold';
    }
    else
    {
        span[2].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[3].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[3].style.color = getColor('--color-text');
        }
    }
});
chk3.addEventListener('change', function()
{
    chk1.checked = false;
    chk2.checked = false;
    chk4.checked = false;
    chk5.checked = false;
    radioReset(span);
    if(this.checked)
    {
        span[4].innerHTML = '&#65293';
        span[5].style.color = getColor('--color-point');
        span[5].style.fontWeight = 'bold';
    }
    else
    {
        span[4].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[5].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[5].style.color = getColor('--color-text');
        }
    }
});
chk4.addEventListener('change', function()
{
    chk1.checked = false;
    chk2.checked = false;
    chk3.checked = false;
    chk5.checked = false;
    radioReset(span);
    if(this.checked)
    {
        span[6].innerHTML = '&#65293';
        span[7].style.color = getColor('--color-point');
        span[7].style.fontWeight = 'bold';
    }
    else
    {
        span[6].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[7].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[7].style.color = getColor('--color-text');
        }
    }
});

chk5.addEventListener('change', function()
{
    chk1.checked = false;
    chk2.checked = false;
    chk3.checked = false;
    chk4.checked = false;
    radioReset(span);
    if(this.checked)
    {
        span[8].innerHTML = '&#65293';
        span[9].style.color = getColor('--color-point');
        span[9].style.fontWeight = 'bold';
    }
    else
    {
        span[8].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[9].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[9].style.color = getColor('--color-text');
        }
    }
});

function radioReset(span)
{
    for(let i = 0; i <= 8; i += 2)
    {
        span[i].innerHTML = '&#65291';
        if(bodyChk.classList.contains('dark'))
        {
            span[i + 1].style.color = getDarkColor('--color-text');
        }
        else
        {
            span[i + 1].style.color = getColor('--color-text');
        }
        span[i + 1].style.fontWeight = 'normal';
    }
}

// 다크 모드
const body = document.querySelector('body');
const modeSwitch = body.querySelector(".toggle-switch");

modeSwitch.addEventListener("click", () =>
{
    body.classList.toggle("dark");
    let body1 = document.querySelector('body');
    let chk = body1.classList.contains('dark');
    localStorage.setItem('whatMode', String(chk));
    for(let i = 0; i <= 8; i += 2)
    {
        if(span[i].innerHTML !== '－')
        {
            if(bodyChk.classList.contains('dark'))
            {
                span[i + 1].style.color = getDarkColor('--color-text');
            }
            else
            {
                span[i + 1].style.color = getColor('--color-text');
            }
        }
    }

    if(!chk)
    {
        for(const MI of menuIcon)
        {
            MI.style.filter = 'none';
        }
    }
    else
    {
        for(const MI of menuIcon)
        {
            MI.style.filter = 'brightness(0) saturate(100%) invert(88%) sepia(4%) saturate(5%) hue-rotate(192deg) brightness(102%) contrast(90%)';
        }
    }
});

window.addEventListener('beforeunload', function()
{
    chk1.checked = false;
    chk2.checked = false;
    chk3.checked = false;
    chk4.checked = false;
    chk5.checked = false;
})

document.addEventListener('DOMContentLoaded', function()
{
    const body = document.querySelector('body');
    const whatMode = localStorage.getItem('whatMode'); //whatMode 아이템 값 불러오기

    if(whatMode === "false")
    { // 라이트 모드 라면
        return !1;
    }
    else
    { // 다크 모드 라면
        body.classList.toggle("dark");
        for(const MI of menuIcon)
        {
            MI.style.filter = 'brightness(0) saturate(100%) invert(88%) sepia(4%) saturate(5%) hue-rotate(192deg) brightness(102%) contrast(90%)';
        }
    }
})
