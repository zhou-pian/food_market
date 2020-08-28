<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style type="text/css">
        #menu{

            position:fixed;
            top:100px;
            left:0px;
            width:15%;
            height:600px;
            background-color: #525252;
            border-top:2px solid #141414;
            padding: 10px 0px;
            text-align: center;

        }

        #menu a{

            margin: 0 8px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;

        }

        #menu a:hover{
            color: #999;

        }

        #menu .all{
            color: yellow

        }

        #mid{
            border-top:2px solid #141414;
            position:absolute;
            top:100px;
            left:15%;
            width:85%;
            /*height:600px;*/

            background-size:cover;

        }

        #top{

            position:fixed;
            top:0px;
            left:0px;
            width:100%;
            height:100px;
            background-color:#ffffff;
        }


        ul li{
            list-style:none;
            width:85px ;
        }
        .pic{
            background:black;
        }
        .pic span{
            display:block;
            boder:1px solid #333;
            padding:3px;
            background:black;
            position:relative;
            top:-4px;
            left:-4px;
        }

    </style>

    <script>
        //全选和非全选的功能
        function chooseAll(){
            //取到checkbox的所有元素节点
            var box=document.getElementsByName("ids");
            if(box[0].checked){//状态
                for(var i=0;i<box.length;i++){
                    box[i].checked=true;
                }
                document.getElementById("btn").disabled="";//开启删除按钮
            }else{
                for(var i=0;i<box.length;i++){
                    box[i].checked=false;
                }
                document.getElementById("btn").disabled="disabled";//禁用删除按钮
            }

        }

        //监听里面的每一个选项
        function chooseOne(){
            //判断点击的这个checkbox选项到底的是选中还是没有选中(不是这一个按钮，我的意思是判断循环里面的checkbox是否都全部选中或者非选中)
            var box=document.getElementsByName("ids");
            var result=false;
            for(var i=1;i<box.length;i++){
                if(box[i].checked==false){//只要有一个为空
                    result=true;//绝对不是全部选中状态
                    break;
                }
            }
            if(result){//不是全选的状态那么checkbox[0]肯定不能选中
                box[0].checked=false;
                document.getElementById("btn").disabled="disabled";//禁用删除按钮
            }else{
                box[0].checked=true;
                document.getElementById("btn").disabled="";//开启删除按钮
            }
            //这里需要开始进行删除的按钮的显示或者禁用
            //开启的前提是只要有一个选中了那么我就开启是删除的按钮

            var temp=false;
            for(var i=1;i<box.length;i++){
                if(box[i].checked){
                    temp=true;
                    break;
                }
            }
            if(temp){
                document.getElementById("btn").disabled="";
            }else{
                document.getElementById("btn").disabled="disabled";
            }

        }

        //执行删除的方法，通过confirm询问框
        function del(){
            var box=document.getElementsByName("ids");
            var ids="";
            for(var i=1;i<box.length;i++){
                if(box[i].checked){
                    ids+=box[i].value+",";
                }
            }
            //去除id多余的,
            ids = ids.substring(0, ids.length-1);
            if(confirm('你确定要删除id是'+ids+'的数据吗?')){
                // alert('执行删除');
                location.href='/admin/deleteProduct?ids='+ids;
            }else{
                alert('您取消了删除的操作!');
            }
        }

        //执行分页pageIndex是当前的页数
        function doPage(pageIndex){
            //console.log(pageIndex);
            document.getElementById("pageIndex").value=pageIndex;
            document.getElementById("pageSize").value=10;
            document.getElementById("form1").submit();


        }
    </script>
</head>
<body>
<div  id="menu">

    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex">全部商品</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=1">饮品</a> </h3>
    <h3 style="font-family:楷体; color:white;text-align:center"><a href="/admin/adminindex?categoryId=2">坚果</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=3">肉类</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=4">糖果</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=5">饼干</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=6">薯片</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=7">巧克力</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=8">蛋糕</a> </h3>
    <h3 style="font-family:楷体; color:black;text-align:center"><a href="/admin/adminindex?categoryId=9">其他</a> </h3>

</div>



<div id="mid">
    <#if list?? && (list?size > 0) >
            <form action="/admin/adminindex" method="get" id="form1">
                <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                <input type="hidden" name="pageSize" id="pageSize" value="10">
<#--                <input type="text" name="productTitle" value="${productTitle}"><input type="submit" value="查询">-->
                <table align="center" width="520"  border="0px"  cellspacing="0px">
                    <tr height="150px">
                        <td colspan="4" align="center"><input type="text" name="productTitle" value="${productTitle}" style="width:400px ;height:30px;border-radius:5px;background:none;"></td>
                        <td colspan="2" align="center"><input type="submit" value="搜索" style="height:30px;background:none;
																			border-width:0;
																			outline:none;
																			cursor:pointer;
																			"/>
                        </td>
                    </tr>
                </table>
            </form>
            <table class="table table-striped" style="width: 90%;margin-left: 80px">
            <tr><td><input type="checkbox" name="ids" onclick="chooseAll();"></td><td>序列号</td><td>商品ID</td><td>商品名称</td><td>原价</td><td>促销价</td><td>月销量</td><td>总销量</td><td>库存</td><td>操作</td></tr>
            <#list list as item>
                <tr><td><input type="checkbox" name="ids" value="${item.productId}" onclick="chooseOne();"></td>
                    <td>${item_index+1}</td>
                    <td>${item.productId}</td>
                    <td>${item.productTitle}</td>
                    <td>${item.productOldPrice}</td>
                    <td>${item.productNewPrice}</td>
                    <td>${item.productSellMonthCount}</td>
                    <td>${item.productSellTotalCount}</td>
                    <td>${item.productTotalCount}</td>
                    <td><a href="/admin/selectProductById?productId=${item.productId}">修改</a></td></tr>
            </#list>
            </table>
    <table align="center">
           <td> <a href="/admin/insertandupdate">点击我新增数据</a></td>
           <td colspan="4"><input type="button" value="删除" id="btn" disabled="disabled" onclick="del();"></td>
            <#if pageIndex!=1>
                <td colspan="4">
                    <a href="javascript:doPage(${pageIndex-1});">上一页</a>
                </td>
            </#if>
            <td>总的数量:${totalCount}----总的页数:${totalPage}----每页的最大条数:${pageSize}----当前页:${pageIndex}</td>
            <#if pageIndex!=totalPage>
                <td colspan="3">
                    <a href="javascript:doPage(${pageIndex+1});">下一页</a>
                </td>
            </#if>
    </table>
    <#else>
        暂无数据
    </#if>

</div>


<div id="top">

    <table align="center" width="1100px"  border="0px"  cellspacing="0px">
        <tr height="80px" align="center">
            <td>
                <table align="left">
                    <tr>
                        <td colspan="1" ><h1 style="font-family:Kaiti">后台管理页面</h1></td>
                    </tr>
                </table>
                <table align="right">
                    <tr>
                        <td colspan="1" ><a style="font-family:Kaiti;margin-top: 80px" href="/admin/adminorderlist">订单管理</a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</div>

</body>
</html>