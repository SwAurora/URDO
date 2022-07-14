$('#password').keyup(function()
{
    let pwd1 = $('#password').val();
    $('#passwordCheck').attr('pattern', pwd1);
})

$('#chk').click(function()
{
    let checked = $('#chk').is(':checked');

    if(checked)
    {
        $('#joinForm input:checkbox').prop('checked', true);
    }
    else
    {
        $('#joinForm input:checkbox').prop('checked', false);
    }
});

