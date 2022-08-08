const swiper1 = new Swiper('.notice-swap', {

    direction: 'vertical', loop: true,

    autoplay: {
        delay: 2000, disableOnInteraction: false,
    },

});



const swiper2 = new Swiper('.banner', {

    direction: 'horizontal', loop: true,


    pagination: {
        el: '.swiper-pagination', type: 'bullets', clickable: 'true',
    },

    navigation: {
        nextEl: '.swiper-button-next', prevEl: '.swiper-button-prev',
    },

    autoplay: {
        delay: 2000, disableOnInteraction: false,
    },

});



$('#tabUI>ul li').on('click', function()
{
    idx = $(this).index();

    $('#tabUI>ul li').removeClass('change-board');
    $('#tabUI>ul li').eq(idx).addClass('change-board');

    $('#Board-table>table').hide();
    $('#Board-table>table').removeClass('change-board');
    $('#Board-table>table').eq(idx).addClass('change-board').show();


})


$('#pointshop>ul li').on('click', function()
{
    ItemIdx = $(this).index();

    $('#pointshop>ul li').removeClass('item');
    $('#pointshop>ul li').eq(ItemIdx).addClass('item');

    $('#pointshop-table>table').hide();
    $('#pointshop-table>table').removeClass('item');
    $('#pointshop-table>table').eq(ItemIdx).addClass('item').show();

});




/* 날씨 api */

const API_KEY = "1f9c4e9d7cd3037c0d63775a0f6aced9"; //내 키 
const COORDS = 'coords'; //좌표를 받을 변수 

//DOM객체들 

const Htemperature = document.querySelector('.temperature');
const Hplace = document.querySelector('.place');
const HweatherDescription = document.querySelector('.weatherDescription');

const weatherInfo = document.querySelector('.weatherInfo');
const weatherIconImg = document.querySelector('.weatherIcon');

//초기화 
function init() {
    askForCoords();
}

//좌표를 물어보는 함수 
function askForCoords() {
    navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
}

//좌표를 얻는데 성공했을 때 쓰이는 함수 
function handleSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude,
        longitude
    };
    getWeather(latitude, longitude); //얻은 좌표값을 바탕으로 날씨정보를 불러온다.
}
//좌표를 얻는데 실패했을 때 쓰이는 함수 
function handleError() {
    const latitude = '37.541';
    const longitude = '126.986'; 

    getWeather(latitude, longitude);
}

//날씨 api를 통해 날씨에 관련된 정보들을 받아온다. 
function getWeather(lat, lon) {
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=kr`).then(function(response) {
        return response.json();
    })
    .then(function(json) {
        //온도, 위치, 날씨묘사, 날씨아이콘을 받는다. 
        const temperature = json.main.temp;
        const place = json.name;
        const weatherDescription = json.weather[0].description;
        const weatherIcon = json.weather[0].icon;
        const weatherIconAdrs = `http://openweathermap.org/img/wn/${weatherIcon}@2x.png`;

        //받아온 정보들을 표현한다. 
        Htemperature.innerText= `${Math.round(temperature * 10) / 10} °C`;
        Hplace.innerText = `${place}`;
        HweatherDescription.innerText = `${weatherDescription}`;
        weatherIconImg.setAttribute('src', weatherIconAdrs);
        
    })
    .catch((error) => console.log("error:", error));
}

init();



function goDeveloper()
{
    location.href = '/footer/developer.jsp';
}


