/** xiankefu-v1.3.0 GPL License By https://www.xiankefu.com */
 ;!function(){var e=document,t=window,n=window.XIANKEFU_GLOBAL||{},o="XIANKEFU_LOCAL_DB",i={v:"1.3.0"},r=function(e){return new a(e)},a=function(e){for(var t=0,n="object"==typeof e?[e]:(this.selector=e,document.querySelectorAll(e||null));t<n.length;t++)this.push(n[t])};a.prototype=[],a.prototype.constructor=a,r.extend=function(){var e=1,t=arguments,n=function(e,t){e=e||(t.constructor===Array?[]:{});for(var o in t)e[o]=t[o]&&t[o].constructor===Object?n(e[o],t[o]):t[o];return e};for(t[0]="object"==typeof t[0]?t[0]:{};e<t.length;e++)"object"==typeof t[e]&&n(t[0],t[e]);return t[0]},r.device=function(e){var n=navigator.userAgent.toLowerCase(),o=function(e){var t=new RegExp(e+"/([^\\s\\_\\-]+)");return e=(n.match(t)||[])[1],e||!1},i={os:function(){return/windows/.test(n)?"windows":/linux/.test(n)?"linux":/iphone|ipod|ipad|ios/.test(n)?"ios":/mac/.test(n)?"mac":void 0}(),ie:function(){return!!(t.ActiveXObject||"ActiveXObject"in t)&&((n.match(/msie\s(\d+)/)||[])[1]||"11")}(),weixin:o("micromessenger")};return e&&!i[e]&&(i[e]=o(e)),i.android=/android/.test(n),i.ios="ios"===i.os,(i.android||i.ios)&&(i.mobile=!0),i},r.stope=function(e){e=e||window.event,e.stopPropagation?e.stopPropagation():e.cancelBubble=!0},r.data=function(e,n,o){if(e=e||"layui",o=o||localStorage,t.JSON&&t.JSON.parse){if(null===n)return delete o[e];n="object"==typeof n?n:{key:n};try{var i=JSON.parse(o[e])}catch(r){var i={}}return"value"in n&&(i[n.key]=n.value),n.remove&&delete i[n.key],o[e]=JSON.stringify(i),n.key?i[n.key]:i}},r.sessionData=function(e,t){return this.data(e,t,sessionStorage)},r.each=function(e,t){var n,o=this;if("function"!=typeof t)return o;if(e=e||[],e.constructor===Object){for(n in e)if(t.call(e[n],n,e[n]))break}else for(n=0;n<e.length&&!t.call(e[n],n,e[n]);n++);return o},r.digit=function(e,t,n){var o="";e=String(e),t=t||2;for(var i=e.length;i<t;i++)o+="0";return e<Math.pow(10,t)?o+(0|e):e},r.elem=function(e,t){var n=document.createElement(e);return r.each(t||{},function(e,t){n.setAttribute(e,t)}),n},a.addStr=function(e,t){return e=e.replace(/\s+/," "),t=t.replace(/\s+/," ").split(" "),r.each(t,function(t,n){new RegExp("\\b"+n+"\\b").test(e)||(e=e+" "+n)}),e.replace(/^\s|\s$/,"")},a.removeStr=function(e,t){return e=e.replace(/\s+/," "),t=t.replace(/\s+/," ").split(" "),r.each(t,function(t,n){var o=new RegExp("\\b"+n+"\\b");o.test(e)&&(e=e.replace(o,""))}),e.replace(/\s+/," ").replace(/^\s|\s$/,"")},a.prototype.find=function(e){var t=this,n=0,o=[],i="object"==typeof e;return this.each(function(r,a){for(var s=i?[e]:a.querySelectorAll(e||null);n<s.length;n++)o.push(s[n]);t.shift()}),i||(t.selector=(t.selector?t.selector+" ":"")+e),r.each(o,function(e,n){t.push(n)}),t},a.prototype.each=function(e){return r.each.call(this,this,e)},a.prototype.css=function(){var e=arguments;return this.each(function(t,n){"string"==typeof e[0]?n.style[e[0]]=e[1]:"object"==typeof e[0]&&r.each(e[0],function(e,t){n.style[e]=t})})},a.prototype.addClass=function(e,t){return this.each(function(n,o){o.className=a[t?"removeStr":"addStr"](o.className,e)})},a.prototype.removeClass=function(e){return this.addClass(e,!0)},a.prototype.hasClass=function(e){var t=!1;return this.each(function(n,o){new RegExp("\\b"+e+"\\b").test(o.className)&&(t=!0)}),t},a.prototype.attr=function(e,t){var n=this;return void 0===t?function(){if(n.length>0)return n[0].getAttribute(e)}():n.each(function(n,o){o.setAttribute(e,t)})},a.prototype.removeAttr=function(e){return this.each(function(t,n){n.removeAttribute(e)})},a.prototype.html=function(e){return this.each(function(t,n){n.innerHTML=e})},a.prototype.val=function(e){return this.each(function(t,n){n.value=e})},a.prototype.append=function(e){return this.each(function(t,n){"object"==typeof e?n.appendChild(e):n.innerHTML=n.innerHTML+e})},a.prototype.remove=function(e){return this.each(function(t,n){e?n.removeChild(e):n.parentNode.removeChild(n)})},a.prototype.on=function(e,t){return this.each(function(n,o){o.attachEvent?o.attachEvent("on"+e,function(e){e.target=e.srcElement,t.call(o,e)}):o.addEventListener(e,t,!1)})},a.prototype.off=function(e,t){return this.each(function(n,o){o.detachEvent?o.detachEvent("on"+e,t):o.removeEventListener(e,t,!1)})};var s=function(){var e=this;e.config=r.extend({},e.config,n);e.init()};s.prototype.config={auto:!0,style:1,icon:"https://static.xiankefu.com/chat/icon-logo.png",title:"在线咨询",gateway:"https://chat.xiankefu.com/"},s.prototype.init=function(t){var n=this,t=r.extend({},n.config,t),o=r.elem("style",{id:"XIANKEFU-STYLE"}),i=[".XIANKEFU-bar{position: fixed; bottom: 50px; right: 50px; font-size: 16px; cursor: pointer; text-overflow: ellipsis; overflow: hidden;  background-color: #56b7c7; background-image: linear-gradient(to right,#56b7c7,#67D0AF); color: #fff;}",".XIANKEFU-bar > img{position: relative; top: -2px; width: 20px; height: 20px; display: inline-block; vertical-align: middle;}",".XIANKEFU-bar-style1{height: 60px; line-height: 60px; max-width: 200px; padding: 0 20px; border-radius: 30px; white-space: nowrap;}",".XIANKEFU-bar-style1 > span{padding-left: 10px;}",".XIANKEFU-bar-style2{width: 80px; height: 60px; padding: 20px 10px; border-radius: 50%; text-align: center; white-space: nowrap;}",".XIANKEFU-bar-style2 > img{margin: 6px 0;}",".XIANKEFU-bar-style2 > span{display: block; text-overflow: ellipsis; overflow: hidden;}",".XIANKEFU-bar-style3{width: 18px; padding: 15px; text-align: center; border-radius: 30px;}",".XIANKEFU-bar-style3 > img{margin: 0 0 5px;}",".XIANKEFU-bar-style3 > span{display: block; line-height: 18px;}",".XIANKEFU-panel{visibility: hidden; position: fixed; bottom: 0; right: 50px; z-index: -1; width: 490px; height: 490px; margin: 0; padding: 0; overflow: hidden; border: 1px solid #B2B2B2\\9; box-shadow: 0 0 3px 3px rgba(23,94,103,.05); border-radius: 2px;}",".XIANKEFU-panel-show{visibility: visible; z-index: 2147483647;}",".XIANKEFU-panel iframe{display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; margin: 0; padding: 0;}",".XIANKEFU-panel-show iframe{display: block;}","@media screen and (max-width: 768px) {","}"].join("\r");"styleSheet"in o?(o.setAttribute("type","text/css"),o.styleSheet.cssText=i):o.innerHTML=i,e.getElementsByTagName("head")[0].appendChild(o),n.params="?bid="+t.bid+function(){var e=[];return t.csid&&e.push("&csid="+t.csid),t.key&&e.push("&key="+t.key),"object"==typeof t.data&&e.push("&data="+encodeURIComponent(JSON.stringify(t.data))),e.join("")}(),t.auto&&n.render()},s.prototype.render=function(t){var n=this,t=n.config,i=r.data(o),a=r.device(),s=r.elem("div",{id:"XIANKEFU-BAR","class":"XIANKEFU-bar XIANKEFU-bar-style"+function(){var e=0|t.style;return(e<1||e>3)&&(e=1),e}()}),c=r.elem("div",{id:"XIANKEFU-PANEL","class":"XIANKEFU-panel"}),p=r.elem("iframe",{allowtransparency:"true",frameborder:"0",scrolling:"no",name:"XIANKEFU_SELF"});n.status||(n.creatBar=r(s),n.creatPanel=r(c),n.createIframe=r(p),n.creatBar.html((t.icon?'<img src="'+t.icon+'">':"")+function(){return t.title?"<span>"+(t.title||"")+"</span>":""}()),t.css&&r(s).css(t.css),c.appendChild(p),e.body.appendChild(s),e.body.appendChild(c),n.status=1,n.events(),!a.mobile&&i.show&&n.open())},s.prototype.open=function(){var e=this,t=e.config,n=r.device();return n.mobile?location.href=t.gateway+e.params+"&pageType=mobile":(e.createIframe.attr("src")?e.creatPanel.addClass("XIANKEFU-panel-show"):e.createIframe.attr("src",t.gateway+e.params+"&pageType=fixed"),window.postMessage||e.creatPanel.addClass("XIANKEFU-panel-show"),r.data(o,{key:"show",value:!0}),void(window.postMessage&&window.XIANKEFU_SELF.postMessage({open:1},"*")))},s.prototype.close=function(){var e=this;e.creatPanel.removeClass("XIANKEFU-panel-show"),r.data(o,{key:"show",value:!1}),window.postMessage&&window.XIANKEFU_SELF.postMessage({open:0},"*")},s.prototype.events=function(){var e=this;e.config;e.creatBar.on("click",function(){e.open()}),r(window).on("message",function(t){var n=t.data;n.close?e.close():n.init&&e.creatPanel.addClass("XIANKEFU-panel-show")})};var c=new s;i.open=function(){c.open()},i.remove=function(){c.remove()}}();