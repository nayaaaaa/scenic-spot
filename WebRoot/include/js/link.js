$(function(){
    var prov=document.getElementById("prov");
    var city=document.getElementById("city");
    var area=document.getElementById("area");

    //这是一种增强的for循环，是一种不使用下标的遍历方式，可以用作json的遍历
    for(var x in obj){
        var node=document.createElement("option");
        node.innerHTML=x;
        prov.appendChild(node);
    }

    var prov_con="陕西省";
    for(var x in obj[prov_con][0]){
        var node=document.createElement("option");
        //console.log(node);
        node.innerHTML=x;
        city.appendChild(node);
    }
    var city_con="西安市";
    for(var x in obj[prov_con][0][city_con][0]){
        var node=document.createElement("option");
        //console.log(node);
        node.innerHTML=x;
        area.appendChild(node);
    }

    //城市改变，让县也发生改变
    city.onchange= function () {
        //检测当前选择的市
        var city_sel=city[this.selectedIndex].innerHTML;
        //console.log(city_sel);
        area.innerHTML="";
        var area_sel=obj[prov_con][0][city_sel][0];
        for(var x in area_sel){
            var node=document.createElement("option");
            //console.log(node);
            node.innerHTML=x;
            //console.log(node);
            area.appendChild(node);
        }
    };

    //改变省，让市也发生改变
    prov.onchange= function () {
        //console.log(prov_sel);
        //检测当前选择的省
        var prov_sel=prov[this.selectedIndex].innerHTML;
        //console.log(prov_sel);
        //每次在选择省的时候，将原先的市和县清空，重新添加新的对应的省和市的节点
        city.innerHTML="";
        area.innerHTML="";
        //将当前选择的省作为默认值
        prov_con=prov_sel;
        //遍历该省下面的JSON对象，创建option节点
        for(var x in obj[prov_con][0]){
            var node=document.createElement("option");
            node.innerHTML=x;
            console.log(node);
            //向市下拉列表框中添加节点
            city.appendChild(node);
        }
        //将当前选中的市作为默认值，遍历该市下面的县对象
        city_con=city[city.selectedIndex].innerHTML;
        for(var x in obj[prov_con][0][city_con][0]){
            var node=document.createElement("option");
            //console.log(node);
            node.innerHTML=x;
            //console.log(node);
            area.appendChild(node);
        }
    };
});