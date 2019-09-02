<#macro ht>
    <div class="header">
        <div class="head-top">
            <div class="nb">
                <span style="color:#e01;font-size:14px;">演示站，请勿购物！！&nbsp; 前台账号 yunec&nbsp; &nbsp; <span style="color: rgb(238, 0, 17); font-size: 14px;">密码&nbsp;</span>666666&nbsp; &nbsp;后台地址：&nbsp;<a href="https://demo.yunec.cn/admin.html" target="_self" title="https://demo.yunec.cn/admin.html">https://demo.yunec.cn/admin.html</a></span><div class="rside" style="float:right">
                    <ul class="head-ul"><li><a href="../login.html">登录</a></li>
                        <li><a href="../reg.html">注册</a></li><li><a href="../myorder.html">我的订单</a></li>
                        <li><a href="../user.html">会员中心</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="head-bot">
            <div class="nb">
                <div class="web-title-container">
                    <a href="../index.html" class="logo"><img src="../static/images/logo.png" alt=""></a>
                    <div class="searchbox">
                        <form name="search" action="../list.html" method="get">
                            <input type="search" name="word" id="word" value="" placeholder="请输入关键词" class="txt-search">
                            <input type="submit" value="搜&nbsp;&nbsp;索" id="btn-search" class="btn-submit">
                            <input type="hidden" name="action" value="list">
                        </form>
                    </div>
                    <div class="cartbox">
                        <div class="cartbtn">
                            <a href="../cart.html" class="radv-nav"><span>购物车</span>(<span class="cartinfo">1</span>)</a>
                        </div>
                        <div class="cart-slidedownbox">
                            <h3>最近加入</h3>
                            <ul class="cart-slidedown" id="cart-list"></ul>
                            <div class="sum-box">
                                <a class="slidecart-js" href="../cart.html">立即结算(<span class="cartinfo">0</span>)</a>
                                <div class="sum">合计：￥<span class="red" id="cart-total">0.00</span></div>
                                <div class="check">
                                    <p>共<span class="red cartinfo">0</span>件商品</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="nav">
                    <div class="nav-classify">
                        <h3 class="nav-all-btn">全部分类</h3>
                        <ul class="menu-mainnav" style="height: 450px;">
                        </ul>
                    </div>
                    <ul class="nav-othder">
                        <li><a href="../index.html">首页</a></li><li><a href="/17rec.html" target="_blank">数码电器</a></li>
                        <li><a href="/PQscH.html" target="_blank">美妆个护</a></li>
                        <li><a href="/timespike.html" target="_blank">限时抢购</a></li>
                        <li><a href="/quan.html" target="_blank">优惠券</a></li>
                        <li><a href="/NSlFz.html" target="_blank">时尚服装</a></li>
                        <li><a href="https://www.yunec.cn/" target="_blank">云EC官网</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <#nested >
    <script>

        var isDev = true;
        function out(msg) { if(isDev) console.log(msg); }

        /**
         * 使用Form表单POST方式提交，可以加在<button>或者<a>点击提交使用
         * @param url 提交url
         * @param map post提交参数
         */
        function anchorPostSubmit(url, map) {
            var form = $('<form>');
            form.attr({
                method: 'POST',     // 使用post请求传参
                action: url     // form表单请求地址
            }).css({
                display: "none"
            });
            for(var i = 0; i < map.length; i++) {
                var obj = map[i];
                var objStr = JSON.stringify(obj);
                objStr = objStr.replace(/[{}"]/g, "");
                var temp = objStr.split(":");
                var name = temp[0];
                var value = temp[1];
                out(name + ', ' + value);
                var input = $('<input>').attr({
                    name: name,
                    value: value
                });
                form.append(input);
            }
            out(form);
            $('body').append(form);

            form.submit();
        }

        $(function() {
            var cgyJson = null;
            $.getJSON("/category/getAll", function(json) {
                cgyJson = json.data;
                out(cgyJson);
                // 初始化分类导航栏菜单
                init_main_nav();
            });

            function init_main_nav() {
                if(cgyJson == null)
                    return;
                $('.menu-mainnav').empty();
                // cgyJson下标为1的是第一层结点的list json
                var level_1_list = cgyJson['0'];
                out(level_1_list);
                out(level_1_list.length);
                var len = level_1_list.length;
                // list 下标为0的是父节点的Category bean，
                // 之后的才是子节点的Category bean，所以要从index=1开始遍历
                for(var i = 0; i < len; i++) {
                    var level_1_node = level_1_list[i];
                    var li = $('<li>');
                    var sortmaintitle = $('<div>').addClass('sortmaintitle');
                    ///, target: '_self'
                    var title = $('<a>').attr({
                        href: 'javascript:void(0)',
                        onclick: 'anchorPostSubmit("search/category/title/'+encodeURI(level_1_node.title)+'", ' +
                            '[{code1: '+level_1_node.cgy_id+'}])'
                    }).text(level_1_node.title);
                    var navsonbox = $('<div>').addClass('navsonbox');
                    var nr = $('<div>').addClass('nr');
                    var navson_classify = $('<div>').addClass('navson-classify'); // 二层节点加在这个里面
                    sortmaintitle.append(title);
                    navsonbox.append(nr);
                    nr.append(navson_classify);
                    li.append(sortmaintitle).append(navsonbox);
                    $('.menu-mainnav').append(li);

                    var level_2_list = cgyJson[level_1_node.cgy_id];
                    if(level_2_list) {
                        for(var j = 0; j < level_2_list.length; j++) {
                            var level_2_node = level_2_list[j];
                            var navson_classify_box = $('<div>').addClass('navson-classify-box');
                            var maintitle = $('<h3>').addClass('maintitle');
                            var title_sub = $('<a>').attr({
                                href: 'javascript:void(0)',
                                onclick: 'anchorPostSubmit("/search/category/title/'+encodeURI(level_1_node.title) + '/' + encodeURI(level_2_node.title)+'", ' +
                                    '[{code1: '+level_1_node.cgy_id+'}, {code2: '+level_2_node.cgy_id+'}])'
                            }).html(level_2_node.title + '<span>&gt;<span>');
                            var navson_classify_subtitle = $('<div>').addClass('navson-classify-subtitle'); // 第三层放这里

                            navson_classify.append(navson_classify_box);
                            navson_classify_box.append(maintitle).append(navson_classify_subtitle);
                            maintitle.append(title_sub);

                            var level_3_list = cgyJson[level_2_node.cgy_id];
                            if(level_3_list) {
                                for (var k = 0; k < level_3_list.length; k++) {
                                    var level_3_node = level_3_list[k];
                                    var title_sub_sub = $('<a>').attr({
                                        href: 'javascript:void(0)',
                                        onclick: 'anchorPostSubmit("/search/category/title/'+encodeURI(level_1_node.title) + '/' + encodeURI(level_2_node.title) + '/' + encodeURI(level_3_node.title)+'", ' +
                                            '[{code1: '+level_1_node.cgy_id+'}, {code2: '+level_2_node.cgy_id+'}, {code3: '+level_3_node.cgy_id+'}])'
                                    }).text(level_3_node.title);

                                    navson_classify_subtitle.append(title_sub_sub);
                                }
                            }
                        }
                    }
                }

            }
        });
    </script>
</#macro>