$(function(){
     //阻止他body里的右键点击事件
    $(".hui-resize-table").bind("contextmenu", function(e){
        if ( e.which == 3) {
        var offset = $(this).offset();
        var relativeX = (e.pageX - offset.left);
        var relativeY = (e.pageY - offset.top);
        $('#operate').show().css({left:relativeX+'px',top:relativeY - 20 +'px'});
        $('html').click(function(){
                $('#operate').hide();
            })
        $("#operate").click(function(event){
            event.stopPropagation();
        });
        $('#tbody,.listBox').bind("contextmenu", function(e){
            if(e.which ==3){
                $('#operate').hide();
            }
        })
        return false;
    }
    })
    $(".hui-table-title,.hui-path").bind("contextmenu", function(e){
        return false;
    })
    //右键菜单
    $("#tbody").bind("contextmenu", function(e){
        //右键为3
        if ( e.which == 3) {
            var offset = $(this).offset();
            var relativeX = (e.pageX - offset.left);
            var relativeY = (e.pageY - offset.top);
            console.log("X: " + offset.left + "  Y: " + offset.top);
            var i =Math.floor(relativeY/36);
            console.log(i);
            $('#rightKey').show().css({left:relativeX+'px',top:relativeY+36+'px'});
            var tby = $('#tbody').children('tr');
            $(tby[i]).find('.hui-checkbox').prop('checked',true);
            $(tby[i]) .find('td').addClass('bground boderColor')
            $(tby[i]).siblings().find('.hui-checkbox').prop('checked',false);
            $(tby[i]).siblings().find('td').removeClass('bground boderColor')
            //重命名
            $('.rightKeyRename').bind('click',function(){
                var inputBox = $(tby[i]).find('.hui-popup');
                var input = $(tby[i]).find('.hui-popup').children('.hui-rename');
                var txt = $(tby[i]).find('.fileName').text();
                inputBox.show();
                input.val(txt);
                input.focus();
                $(tby[i]).siblings().find('.hui-popup').hide();
                $('#rightKey').hide();
            });
            //删除
            $('.rightKeyDelete').bind('click',function(){
                if($(tby[i]).closest('tr').find('.hui-checkbox').prop('checked')){
                    $(tby[i]).closest('tr').remove();
                }
                    $('#rightKey').hide();
            });
            //鼠标点击除右键菜单外的其他地方，隐藏菜单
            $('html').click(function(){
                $('#rightKey').hide();
            })
            $('.hui-resize-table').bind("contextmenu", function(e){
                if(e.which ==3){
                    $('#rightKey').hide();
                }
            })
            $("#rightKey").click(function(event){
                event.stopPropagation();
            });
        }
        return false;
    });

    //鼠标经过行变色和显示更多
        $('#tbody tr').hover(function(){
            if($(this).find("input[name='checked']").prop("checked")){
                 $(this).find('td').addClass('boderColor').removeClass('bground');
            }else{
                $(this).find('td').addClass('boderColor');
            }
            if(!$(this).find('.hui-popup').is(":hidden")){
                $(this).find('.hui-table-operate').hide();
                $(this).find('.hui-content').css('padding-right','0')
            }else{
                $(this).find('.hui-table-operate').show();
                $(this).find('.hui-content').css('padding-right','100px')
            }
            
        },function(){
            if($(this).find("input[name='checked']").prop("checked")){
                 $(this).find('td').addClass('bground boderColor');
            }else{
                $(this).find('td').removeClass('boderColor bground');
            }
            $(this).find('.hui-table-operate').hide();
            $(this).find('.hui-content').css('padding-right','0')
        })
    //更多操作
        $('.more').bind('click',function(){
            $(this).next('.hui-moreBox').toggle();
        });
        $('.btn-rename,.btn-delete').bind('click',function(){
            $('.hui-moreBox').hide();
        })
    //重命名
        $('.btn-rename').bind('click',function(){
            var inputBox = $(this).closest('tr').find('.hui-popup');
            var input = $(this).closest('tr').find('.hui-popup').children('.hui-rename');
            var txt = $(this).closest('tr').find('.fileName').text();
            inputBox.show();
            input.val(txt);
            input.focus();
            $(this).closest('tr').find('.hui-checkbox').prop('checked',true);
            $(this).closest('tr').siblings().find('.hui-popup').hide();
        });
    //取消重命名
        $('.btn-cancel').bind('click',function(){
            $(this).closest('.hui-popup').hide();
            $(this).closest('tr').find('.hui-checkbox').prop('checked',false);
        });
    //确定重命名 ——按钮
    $('.btn-sure').bind('click',function(){
        var txt = $(this).prev('.hui-rename').val();
        $(this).closest('.hui-popup').hide();
        $(this).closest('td').find('.fileName').text(txt);
         $(this).closest('tr').find('.hui-checkbox').prop('checked',false);
    })
    //重命名 —— 回车
    $(document).keyup(function(event){
        var target = event.target;
        if(event.keyCode ==13){
           $(target).closest('tr').find(".btn-sure").trigger("click");
        }
    });
    //全选
    $("#allChecked").bind('click',function(){
        if($("#allChecked").prop("checked")){
             $("input[name='checked']").prop("checked", true);
             $('#tbody').find('td').addClass('bground boderColor');
         }else{
             $("input[name='checked']").prop("checked", false);
             $('#tbody').find('td').removeClass('bground boderColor');
         }
    });
    var allSelect = function(){
        var number =  $("input[name='checked']").length;
        var count =  $("input[name='checked']:checked").length;
        if(number == count){
            $("#allChecked").prop("checked", true);
        }else{
            $("#allChecked").prop("checked", false);
        }
    }
    //选择框
    $('.hui-checkbox').bind('click',function(){
        allSelect();
        if($(this).prop("checked")){
            $(this).closest('tr').find('td').addClass('bground boderColor');
        }else{
            $(this).closest('tr').find('td').removeClass('bground boderColor');
        }
    });
    //点击行选中
    $('.check').bind('click',function(){
        $(this).closest('tr').find('td').addClass('bground boderColor');
        $(this).closest('tr').find('.hui-checkbox').prop("checked",true);
        $(this).closest('tr').siblings().find('td').removeClass('bground boderColor');
        $(this).closest('tr').siblings().find('.hui-checkbox').prop("checked",false);
        $("#allChecked").prop("checked", false);
    });
    //排序类型
    $('#rankBtn').bind('click',function(){
       $('.rankBox').toggle();
    });
    $('.rankIcon,.rankImg').bind('click',function(){
        if($(this).find('img').attr('src')=='img/down.png'){
             $(this).find('img').attr('src','img/up.png');
        }else{
            $(this).find('img').attr('src','img/down.png');
        }
    });
    //删除
    $('.btn-delete').bind('click',function(){
        $(this).closest('tr').remove();
    });
    //切换排列
    $('#cutBtn').bind('click',function(){
        if($('#sample2').is(':visible')){
            $(this).attr('src','img/tile.png')
            $('#sample2').hide();
            $('#sample1').show();
        }else{
            $(this).attr('src','img/list.png')
            $('#sample1').hide();
            $('#sample2').show();
        }
        
    })
    //大图标 选择文件
    $('.listBox-item').hover(function(){
        $(this).find("input[name='selected']").show();
    },function(){
        if($(this).find("input[name='selected']").prop('checked')){
            $(this).find("input[name='selected']").show();
        }else{
            $(this).find("input[name='selected']").hide();
            }
    })
     //全选
    $("#imgAllChecked").bind('click',function(){
        if($("#imgAllChecked").prop("checked")){
             $("input[name='selected']").prop("checked", true).show();
             $('.listBox').find('.listWrap').addClass('active');
         }else{
             $("input[name='selected']").prop("checked", false).hide();
             $('.listBox').find('.listWrap').removeClass('active');
         }
    });
    //单击选择
    $('.listWrap,.list-checkbox').bind('click',function(){
        if($(this).closest('.listWrap').find('.list-checkbox').prop('checked')){
            $(this).closest('.listWrap').find('.list-checkbox').prop('checked',false)
            $(this).closest('.listWrap').removeClass('active');
        }else{
            $(this).closest('.listWrap').find('.list-checkbox').prop('checked',true)
            $(this).closest('.listWrap').addClass('active');
        }
        var number =  $("input[name='selected']").length;
        var count =  $("input[name='selected']:checked").length;
        if(number == count){
            $("#imgAllChecked").prop("checked", true);
        }else{
            $("#imgAllChecked").prop("checked", false);
        }
    });

    //右键菜单
    $(".listBox").bind("contextmenu", function(e){
        //右键为3
        if ( e.which == 3) {
            var offset = $(this).offset();
            var relativeX = (e.pageX - offset.left);
            var relativeY = (e.pageY - offset.top);
            console.log("X: " + relativeX + "  Y: " + relativeY);
            var i =Math.floor((relativeX-50)/120);
            var j =Math.floor(relativeY/160);
            var z = Math.floor(($(window).width() - 110)/120);
                i = j*z+i;
            $('#rightKey').show().css({left:relativeX +'px',top:relativeY+ 36 +'px'});
            var listItem = $('.listBox').children('li');

            //点击右键选中当前文件
            $(listItem[i]).find('.list-checkbox').prop('checked',true);
            $(listItem[i]) .find('.listWrap').addClass('active')
            $(listItem[i]).siblings().find(".list-checkbox").hide();
            $(listItem[i]).siblings().find('.list-checkbox').prop('checked',false);
            $(listItem[i]).siblings().find('.listWrap').removeClass('active');
            $("#imgAllChecked").prop("checked", false);
            
            //重命名
            $('.rightKeyRename').bind('click',function(){
                var inputBox = $(listItem[i]).find('.popup');
                var input = $(listItem[i]).find('.popup').children('.rename');
                var txt = $(listItem[i]).find('.listTitle').text();
                inputBox.show();
                input.val(txt);
                input.focus();
                $(listItem[i]).siblings().find('.popup').hide();
                $('#rightKey').hide();
            });
            //取消重命名
            $('.popup .btn-cancel').bind('click',function(){
                    $(this).closest('.popup').hide();
                    $(this).closest('li').find('.list-checkbox').prop('checked',false);
                    $(this).closest('li').find('.listWrap').removeClass('active');
                });
            //确定重命名 ——按钮
            $('.popup .btn-sure').bind('click',function(){
                var txt = $(this).prev('.rename').val();
                $(this).closest('.popup').hide();
                $(this).closest('li').find('.listTitle').text(txt);
                $(this).closest('li').find('.list-checkbox').prop('checked',false);
                $(this).closest('li').find('.listWrap').removeClass('active');
            })
            //重命名 —— 回车
            $(document).keyup(function(event){
                var target = event.target;
                if(event.keyCode ==13){
                $(target).closest('li').find(".btn-sure").trigger("click");
                }
            });

            //删除
            $('.rightKeyDelete').bind('click',function(){
                if($(listItem[i]).closest('li').find('.list-checkbox').prop('checked')){
                    $(listItem[i]).closest('li').remove();
                }
                    $('#rightKey').hide();
            });
            //鼠标点击除右键菜单外的其他地方，隐藏菜单
            $('html').click(function(){
                $('#rightKey').hide();
            })
            $("#rightKey").click(function(event){
                event.stopPropagation();
            });
            $('.hui-resize-table').bind("contextmenu", function(e){
                if(e.which ==3){
                    $('#rightKey').hide();
                }
            })
        }
        return false;
    });
    
});
var data =[{
    fileName :'的闪电湖看看',
    fileType:'filetype/barcode_result_page_type_pdf_icon.png',
    fileTime:'2016-05-07'
},{
    fileName :'的是滴是滴收到',
    fileType:'filetype/barcode_result_page_type_txt_icon.1.png',
    fileTime:'2016-05-07'
}]