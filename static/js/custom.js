$(function(){

    //登陆验证
    $('#form-login').validate({
    ignore:'',
    rules : {
        username:{ required: true},
        password:{required: true}
    },
    messages : {
        username : {required: '请填写用户名'},
        password : {required: '请填写密码'}
    },
    submitHandler:function(form) {
        var url = '/login';
        $(form).ajaxSubmit({
            url:url,
            type:'POST',
            dataType:'json',
            success:function(data) {
                alert(data.message)
                if (data.code) {
                   setTimeout(function(){window.location.href="/index"}, 500);
                }/* else {
                   setTimeout(function(){ $('#dialogInfo').modal('hide'); }, 1000);
                }*/
            }
        });
    }
    });
})
