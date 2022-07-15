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

    $('#tabUI>ul li').removeClass('change-borad');
    $('#tabUI>ul li').eq(idx).addClass('change-borad');

    $('#Board-table>table').hide();
    $('#Board-table>table').removeClass('change-borad');
    $('#Board-table>table').eq(idx).addClass('change-borad').show();


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

function goDeveloper()
{
    location.href = 'developer.jsp';
}
