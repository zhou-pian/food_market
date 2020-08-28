<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style type="text/css">
        #mid{
            position:absolute;
            width:40%;
            margin-left: 400px;
            /*height:600px;*/
            margin-top: 200px;
            background-size:cover;

        }

        #top{

            border-bottom:2px solid #141414;
            position:fixed;
            top:0px;
            left:0px;
            width:100%;
            height:100px;
            background-color:#ffffff;
        }
    </style>
    <script>
        window.onload=function () {
            var userId=document.getElementById("productId").value.trim();
            if(userId==''||userId==null){
                document.getElementById("productSellMonthCount").disabled="";
                document.getElementById("productSellTotalCount").disabled="";
                // document.getElementById("productTotalCount").disabled="";
            }
            else {
                document.getElementById("productSellMonthCount").disabled="disabled";
                document.getElementById("productSellTotalCount").disabled="disabled";
                // document.getElementById("productTotalCount").disabled="disabled";
            }
        }
    </script>
</head>
<body>
<div id="mid">
    <form class="form-horizontal" role="form" action="/admin/insertupdate" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productId" id="productId" value="${productId}">
        <div class="form-group">
            <label class="col-sm-2 control-label">商品图片</label>
            <div class="col-sm-10">
                <input type="file" id="photoUrl" name="photoUrl" value="${photoUrl}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productTitle" name="productTitle" value="${productTitle}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">所属类别</label>
            <div class="col-sm-10">
                <select name="categoyId">
                    <#list list as item>
                        <option value="${item.categoryId}">${item.categoryName}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">原价</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productOldPrice" name="productOldPrice" value="${productOldPrice}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">促销价</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productNewPrice" name="productNewPrice" value="${productNewPrice}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">月销量</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productSellMonthCount" name="productSellMonthCount" value="${productSellMonthCount}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">总销量</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productSellTotalCount" name="productSellTotalCount" value="${productSellTotalCount}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">库存</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="productTotalCount" name="productTotalCount" value="${productTotalCount}">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">上传</button>
            </div>
        </div>
    </form>
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
                        <td colspan="1" ><a style="font-family:Kaiti;margin-top: 80px" href="/admin/adminindex" >商品管理</a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</div></body>
</html>