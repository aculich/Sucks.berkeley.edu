function indexmap(){

    data = [{"name":"","elements": [{"name":"one", "size":12, "time":2},
        {"name":"two", "size":18,"time":12},
        {"name":"three", "size":18,"time":24},
        {"name":"four","size":20,"time":40},
        {"name":"five","size":50,"time":30},
        {"name":"six","size":20,"time":78},
        {"name":"seven","size":50,"time":60}]}];
 
    childrenFunction = function(d){return d.elements};
    sizeFunction = function(d){return d.size;};
    colorFunction = function(d){return d.time;};
    nameFunction = function(d){return d.name;};
 
    color = d3.scale.linear()
                .domain([0,33,66,100])
                .range(["#3AA9FF","#2E90D9","#2375B1","#155987"]);

    window.onresize = function() {
       $("#chart").empty();
       drawTreemap($(window).height() - 50, $(window).width() - 1, '#chart', data, childrenFunction, nameFunction, sizeFunction, colorFunction, color); 
    };

    drawTreemap($(window).height() - 50, $(window).width() - 1, '#chart', data, childrenFunction, nameFunction, sizeFunction, colorFunction, color);
}

function drawTreemap(height,width,elementSelector,data,childrenFunction,nameFunction,sizeFunction,colorFunction,colorScale){
 
    var treemap = d3.layout.treemap()
        .children(childrenFunction)
        .size([width,height])
        .value(sizeFunction);
 
    var div = d3.select(elementSelector)
        .append("div")
        .style("position","relative")
        .style("width",width + "px")
        .style("height",height + "px");
 
    div.data(data).selectAll("div")
        .data(function(d){return treemap.nodes(d);})
        .enter()
        .append("div")
        .attr("class","cell")
        .style("background",function(d){ return colorScale(colorFunction(d));})
        .style("font-family", "Open Sans Condensed, sans-serif")
        .style("font-size", "1.2em")
        .style("line-height", "1.3em")
        .call(cell)
        .attr("title",function(d) { return d.name; })
        .text(nameFunction);
}
 
function cell(){
    this
        .style("left",function(d){return d.x + "px";})
        .style("top",function(d){return d.y + "px";})
        .style("width",function(d){return d.dx - 1 + "px";})
        .style("height",function(d){return d.dy - 1 + "px";});
}

