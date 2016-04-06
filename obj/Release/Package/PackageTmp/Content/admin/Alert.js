

var ALERT_TITLE = "Thông báo";
var ALERT_BUTTON_TEXT = "Ok";

if (document.getElementById) {
    window.alert = function (txt) {
        createCustomAlert(txt);
    }
}

function createCustomAlert(txt) {
    d = document;

    if (d.getElementById("modalContainer")) return;

    mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
    mObj.id = "modalContainer";
    mObj.style.height = d.documentElement.scrollHeight + "px";

    alertObj = mObj.appendChild(d.createElement("div"));
    alertObj.id = "alertBox";
    if (d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
    alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
    alertObj.style.visiblity = "visible";

    h1 = alertObj.appendChild(d.createElement("h1"));
    h1.appendChild(d.createTextNode(ALERT_TITLE));

    msg = alertObj.appendChild(d.createElement("p"));
    //msg.appendChild(d.createTextNode(txt));
    msg.innerHTML = txt;

    btn = alertObj.appendChild(d.createElement("a"));
    btn.id = "closeBtn";
    btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
    btn.href = "#";
    btn.focus();
    btn.onclick = function () { removeCustomAlert(); return false; }

    alertObj.style.display = "block";

}

function removeCustomAlert() {
    document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
}
if (document.getElementById) {
    window.confirm = function (mess, title, okBtnText, cancelBtnText, iconType) {
        return CustomConfirm(mess, title, okBtnText, cancelBtnText, iconType);
    }
}


function CustomConfirm(mess, title, okBtnText, cancelBtnText, iconType) {
    this.mess = (mess == null ? '' : mess);
    this.title = (title == null ? 'Thông báo!' : title);
    this.okBtnText = (okBtnText == null ? 'Đồng ý' : okBtnText);
    this.cancelBtnText = (cancelBtnText == null ? 'Hủy' : cancelBtnText);
    this.iconType = (iconType == null ? 1 : iconType);


    d = document;
    if (d.getElementById("divCustomConfirm")) return;
    mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
    mObj.id = "divCustomConfirm";
    mObj.style.position = "absolute";
    mObj.style.width = "100%";
    mObj.style.height = "100%";
    mObj.style.top = "0px";
    mObj.style.left = "0px";
    mObj.style.zIndex = "1001";
    mObj.style.backgroundColor = "transparent";

    alertObj = mObj.appendChild(d.createElement("div"));
    alertObj.id = "confirmBox";
    alertObj.style.position = "absolute";
    alertObj.style.width = "auto";
    alertObj.style.height = "auto";
    alertObj.style.minWidth = "300px";
    alertObj.style.minHeight = "100px";
    alertObj.style.top = d.documentElement.clientHeight / 3 + "px";  //cần động cột này theo màn hình trình duyệt
    if (d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
    alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
    alertObj.style.border = "1px solid #000000";
    alertObj.style.backgroundColor = "#FFFFFF";
    alertObj.style.backgroundRepeat = "no-repeat"; //no repeat icon in alertBox div
    alertObj.style.backgroundPosition = "10px 30px"; //position of icon
    alertObj.style.visiblity = "visible";


    h1 = alertObj.appendChild(d.createElement("h1"));
    h1.appendChild(d.createTextNode(this.title));
    h1.style.marginTop = "0px";
    h1.style.font = "bold 1em verdana,arial";
    h1.style.backgroundImage = "url(http://lh4.ggpht.com/_yy5LQxtxYo0/SoKRR2bCCXI/AAAAAAAAAZc/LsAvrSLBXac/s128/bgtitle.png)";
    h1.style.backgroundRepeat = "repeat";
    h1.style.backgroundPosition = "0px 0px";
    h1.style.color = "#FFFFFF";
    h1.style.borderBottom = "1px solid #000000";
    h1.style.padding = "2px 0px 2px 5px";


    msg = alertObj.appendChild(d.createElement("div"));
    msg.innerHTML = this.mess;
    msg.style.font = "1em verdana,arial";
    msg.style.height = "auto";
    msg.style.width = "auto";
    msg.style.minHeight = "50px"
    msg.style.textAlign = "center";


    tbl = alertObj.appendChild(d.createElement("table"));
    tbl.style.width = "100%";
    tr = tbl.appendChild(d.createElement("tr"));
    tdleft = tr.appendChild(d.createElement("td"));
    tdleft.style.textAlign = "right";
    tdright = tr.appendChild(d.createElement("td"));
    tdright.style.textAlign = "left";


    okBtn = tdleft.appendChild(d.createElement("a"));
    okBtn.id = "okBtn";
    okBtn.appendChild(d.createTextNode(this.okBtnText));
    okBtn.href = "#";
    okBtn.focus();
    okBtn.onclick = function () { RemoveCustomElementById("divCustomConfirm"); return true; }
    okBtn.style.display = "block";
    okBtn.style.position = "relative";
    okBtn.style.margin = "5px auto";
    okBtn.style.padding = "3px";
    okBtn.style.border = "1px solid #000000";
    okBtn.style.width = "70px";
    okBtn.style.font = "1em verdana, arial";
    okBtn.style.textTransform = "none";
    okBtn.style.textAlign = "center";
    okBtn.style.color = "#FFFFFF";
    okBtn.style.textDecoration = "none";
    okBtn.style.backgroundImage = "url(http://lh3.ggpht.com/_yy5LQxtxYo0/SoKRRjvi6yI/AAAAAAAAAZY/4lBkeAJr3hg/s128/bgbutton.PNG)";
    okBtn.style.backgroundRepeat = "repeat";
    okBtn.style.backgroundPosition = "0px 0px";


    cancelBtn = tdright.appendChild(d.createElement("a"));
    cancelBtn.id = "cancelBtn";
    cancelBtn.appendChild(d.createTextNode(this.cancelBtnText));
    cancelBtn.href = "#";
    cancelBtn.focus();
    cancelBtn.onclick = function () { RemoveCustomElementById("divCustomConfirm"); return false; }
    cancelBtn.style.display = "block";
    cancelBtn.style.position = "relative";
    cancelBtn.style.margin = "5px auto";
    cancelBtn.style.padding = "3px";
    cancelBtn.style.border = "1px solid #000000";
    cancelBtn.style.width = "70px";
    cancelBtn.style.font = "1em verdana, arial";
    cancelBtn.style.textTransform = "none";
    cancelBtn.style.textAlign = "center";
    cancelBtn.style.color = "#FFFFFF";
    cancelBtn.style.textDecoration = "none";
    cancelBtn.style.backgroundImage = "url(http://lh3.ggpht.com/_yy5LQxtxYo0/SoKRRjvi6yI/AAAAAAAAAZY/4lBkeAJr3hg/s128/bgbutton.PNG)";
    cancelBtn.style.backgroundRepeat = "repeat";
    cancelBtn.style.backgroundPosition = "0px 0px";


    alertObj.style.display = "block";
}


function RemoveCustomElementById(mId) {
    document.getElementsByTagName("body")[0].removeChild(document.getElementById(mId));
}