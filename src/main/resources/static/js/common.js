//获取url中的参数
function getUrlParam(name) {
    //正则表达式，获取地址中的参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

$("#logoHome").click(function () {
    window.open("index.html");
});