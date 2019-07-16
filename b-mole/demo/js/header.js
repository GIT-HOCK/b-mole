// 加载页头
$('#header').load('header.html')
// 轮播图
$('.images .item:first,.title div:first').addClass('active');
// 设置初始index为1  避免定时器第一次调用index=0没有任何动作多用3秒
var index=0;
function autoPlay(i){  
// 注意：index++是指执行完后再自增1，所以index=0时，eq(index++)最开始是eq(0);
index+=i;
if(index>2){index=0;}
else if(index==-1){index=2;}               
$('.images .item').removeClass('active').eq(index).addClass('active'); 
$('.title div').removeClass('active').eq(index).addClass('active');
$('.control span').removeClass('active').eq(index).addClass('active');
// 当index自增到len,也就是超出图片的数量时，归零.                 
}                       
// 定时器会循环触发函数autoPlay
loop = setInterval(function(){
autoPlay(1)
},2500);    
$('.but span').hover(
function(){clearInterval(loop)},
function(){loop = setInterval(function(){autoPlay(1)}, 2500)})    
// 按钮开关
var canClick=true;
// 右按钮
$('.but .carousel-control-next-icon').click(function(){
if(canClick){
    clearInterval(loop)
    autoPlay(1);
    canClick=false;
setTimeout(function(){canClick=true},1000)
}                 
})
// 左按钮                   
$('.but .carousel-control-prev-icon').click(function(){
if(canClick){
    clearInterval(loop)
    autoPlay(-1)
    canClick=false;
setTimeout(function(){canClick=true},1000)
}                 
})  
// 了解更多
$('.title .about').hover(function(){
$(this).css('background','none')
},function(){
$(this).css('background',`rgba(241, 219, 13, 0.7)`)
})