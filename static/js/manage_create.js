$(function () {
    var $name = $('#name');
    var $pwd = $('#pwd');
    var $contact = $('#contact');
    var err_name = true, err_pwd = true, err_contact = true;

    $name.bind("blur", function () {
        check_name();
    })

    $pwd.bind('blur', function () {
        check_pwd();
    })

    $contact.bind('blur', function () {
        check_contact();
    })

    $name.bind('focus', function () {
        $name.next().hide();
    })
    $pwd.bind('focus', function () {
        $pwd.next().hide();
    })
    $contact.bind('focus', function () {
        $contact.next().hide();
    })


    $('#create').bind('click', function () {
        if (err_name == true || err_pwd == true || err_contact == true) {
            return false;
        }

    })

    var re_name = /^\w{5,15}$/i;

    function check_name() {
        if (re_name.test($name.val())) {
            url = "/manager/exists/?name=" + $name.val();
            $.get(url, function (data) {
                var count = data['count'];
                if (count == 1) {
                    $name.next().html('用户名已经存在').show();
                    err_name = true;
                }
                else {
                    err_name = false;
                }
            })
        }
        else {
            $name.next().html('请输入包含数字,字母或下划线的5到11位用户名').show();
            err_name = true;
        }

    }

    var re_pwd = /^\w{8,20}$/i;

    function check_pwd() {
        if (re_pwd.test($pwd.val())) {
            $pwd.next().hide();
            err_pwd = false;
        }
        else {
            $pwd.next().show();
            err_pwd = true;
        }
    }

    var re_contact = /^\d{6,11}$/;

    function check_contact() {
        if (re_contact.test($contact.val())) {
            $contact.next().hide();
            err_contact = false;
        }
        else {
            $contact.next().show();
            err_contact = true;
        }
    }


})