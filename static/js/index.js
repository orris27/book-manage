// $(function () {
//     var $name = $('#manager_id');
//     var $pwd = $('#manager_pwd');
//             console.log('hello');
//     var err_name = true, err_pwd = true;
//
//
//
//     console.log('hello');
//     $name.bind("blur", function () {
//         check_name();
//     })
//
//     $pwd.bind('blur', function () {
//         check_pwd();
//     })
//     var re_name = /^\w{5,15}$/i;
//
//     function check_name() {
//         if (re_name.test($name.val())) {
//             // $name.next().hide();
//             // err_name = false;
//             var url="/manager/exists/?name="+$name.val();
//             $.get(url,function(data){
//                 var count=data['count'];
//                 if(count==1)
//                 {
//                     err_name=false;
//                 }
//                 else
//                 {
//                     $name.next().html("用户名不存在").show();
//                     err_name=true;
//                 }
//             })
//
//         }
//         else {
//             $name.next().html('请输入包含数字,字母或下划线的5到11位用户名').show();
//             err_name = true;
//         }
//
//     }
//
//     var re_pwd = /^\w{8,20}$/i;
//
//     function check_pwd() {
//         if (re_pwd.test($pwd.val())) {
//             $pwd.next().hide();
//             err_pwd = false;
//         }
//         else {
//             $pwd.next().show();
//             err_pwd = true;
//         }
//     }
//
//     $('#login').bind('click',function(){
//         if(err_name==true||err_pwd==true)
//         {
//             return false;
//         }
//
//     })
//
//
// })