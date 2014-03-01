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
                    required: "��û����д�û���",   
                    rangelength: $.format('�û�����Ϊ{0}-{1}λ֮��')   
                },   
                pass1: {   
                    required: "������������",   
                    rangelength: $.format('���볤��Ϊ{0}-{1}λ֮��')   
                },   
                pass2: {   
                    required: "������������",   
                    rangelength: $.format('���볤��Ϊ{0}-{1}λ֮��'),   
                    equalTo: "�����������벻һ��"   
                },                 
                email: {   
                    required: "��������Email",   
                    email:"Email��ʽ����"   
                }
        },   
        preErrs : {   
               
        }   
    });   
  
    $("#submit").click(   
        function(){   
            if($("#form").valid( )){   
                //��֤�ɹ�   
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
                    $("#username_hint").html('�������û���');   
                }else if(msg=="-1"){   
                    $("#username_hint").html('�û����Ѿ����ڻ��߷Ƿ�');   
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
                $("#displayTip").html('ע��ɹ�������û�����:'+$("#smUsername").val()+"������"+$("#smPassword").val()+"<p>���μ����룬���Դ��û����������¼</p>");   
            }                   
        }       
    });       
}   
  
  
  
