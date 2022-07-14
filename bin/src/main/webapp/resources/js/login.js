const password = document.getElementById('pw');
const toggle = document.getElementById('toggle');

function showHide()
{
    if(password.type === 'password')
    {
        password.setAttribute('type', 'text');
        toggle.style.background = 'url(/resources/img/login/loginEyeHidden.svg)';
        toggle.style.backgroundSize = 'cover';
    }
    else
    {
        password.setAttribute('type', 'password');
        toggle.style.background = 'url(/resources/img/login/loginEye.svg)';
        toggle.style.backgroundSize = 'cover';
        toggle.classList.remove('hide');
    }
}