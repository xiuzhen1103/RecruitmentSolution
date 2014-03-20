$(document).ready(function() {   
    $("#form").validate({   
        rules: {   
                username: {   
                    required: true,   
                    rangelength: [6, 15]   
                },   
                pass1: {   
                    required: true,   
                    rangelength: [6, 15]   
                },   
                pass2: {   
                    required: true,   
                    rangelength: [6, 15],   
                    equalTo:"#pass1"   
                },                 
                email: {   
                    required: true,   
                    email: true   
                }
        },   
        messages: {   
                username: {   
                    required: "您没有填写用户名",   
                    rangelength: $.format('用户长度为{0}-{1}位之间')   
                },   
                pass1: {   
                    required: "请您输入密码",   
                    rangelength: $.format('密码长度为{0}-{1}位之间')   
                },   
                pass2: {   
                    required: "请您输入密码",   
                    rangelength: $.format('密码长度为{0}-{1}位之间'),   
                    equalTo: "两次密码输入不一样"   
                },                 
                email: {   
                    required: "请您输入Email",   
                    email:"Email格式不对"   
                }
        },   
        preErrs : {   
               
        }   
    });   
  
    $("#submit").click(   
        function(){   
            if($("#form").valid( )){   
                //验证成功   
                postdata();   
            }   
    });   
  
    $("#username").blur(function(){   
        $.ajax({   
            type: 'POST',   
            url: 'reg.php?ac=ajaxusername',   
            data: 'username='+jQuery("#username").val(),   
            success: function(msg){   
                if(msg=="0")   
                {   
                    $("#username_hint").html('请输入用户名');   
                }else if(msg=="-1"){   
                    $("#username_hint").html('用户名已经存在或者非法');   
                }else{   
                    $("#username_hint").html('<img src="images/right.gif" />');   
                }   
            }   
        });    
    });        
  
       
});   
  
function postdata(){                            
    $.ajax({                                                    
        type: "POST",                                     
        url: "reg.php?ac=reg",                                         
        data: "username="+$("#username").val()+"pass1="+$("#pass1").val()+"email="+$("#email").val(),       
        success: function(msg){    
            if(msg!="ok"){   
                alert(msg);   
            }else{   
                //alert(msg);   
                //window.location.href="index.php";    
                $("#mainTable").addClass("displayNone");   
                $("#displayTip").removeClass("displayNone");   
                $("#displayTip").addClass("displayTip");   
                $("#displayTip").html('注册成功，你的用户名是:'+$("#smUsername").val()+"密码是"+$("#smPassword").val()+"<p>请牢记密码，并以此用户名和密码登录</p>");   
            }                   
        }       
    });       
}   
  
  
  
