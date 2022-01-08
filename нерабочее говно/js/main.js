$('.btn').click(function (e) {

    e.preventDefault();

    let login = $('input[name="login"]').val(), 
        password = $('input[name="password"').val();

    $.ajax({
        url: 'include/signin.php',
        type: 'POST',
        dataType: 'json',
        data: {
            login: login,
            password: password,
        },
        success: function (data) {
            if (data.status)　{
                document.location.href = '/profile.php'; 
             } else {

                if (data.type === 1) {
                    data.fields.forEach(function (field) {
                        $(`input[name=${field}"]`).addClass('error');
                    });
                }

            $('.msg').removeClass('none').text(data.message);
            }
        }
    });

    console.log(login)
})