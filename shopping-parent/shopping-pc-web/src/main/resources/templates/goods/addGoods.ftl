                              d<!DOCTYPE html>
<!-- saved from url=(0022)https://demo.yunec.cn/ -->
<html>
<#import "../layout/layout.ftl" as layout>
<head>
<@layout.h>
    <link rel="stylesheet" type="text/css" href="/view/default/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/view/default/css/easyui/icon.css">
</@layout.h>
<@layout.b hasNavRight=false>
    <button>添加<button>
            <div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="essential_info" role="tab" data-toggle="tab">基本信息</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">商品规格</a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">商品图片</a></li>
                    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">商品详情</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="essential_info">
                        1
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">商品规格</div>
                    <div role="tabpanel" class="tab-pane" id="messages">商品图片</div>
                    <div role="tabpanel" class="tab-pane" id="settings">商品详情</div>
                </div>
            </div>
    <script type="text/javascript" src="/view/default/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/view/default/js/bootstrap/bootstrap.min.js"></script>
</@layout.b>