
//引入express模块
const express=require('express');
//引入连接池
const pool=require('../pool.js');

//创建路由器对象
const userRouter=express.Router();

//添加路由  
//1.用户注册
userRouter.get('/reg',function(req,res){
//获取get请求的数据
	var obj=req.query;
	console.log(obj);
//检测值是否为空

	if(obj.upwd==''){
		res.send({code:402,msg:'upwd required'});
//阻止往后执行
		return;

	}
	if(obj.email=='')
		{
		res.send({code:404,msg:'email required'});
		return;
	}
	
	//执行sql语句
	pool.query('INSERT INTO xz_user set ?',[obj],function(err,result){
		if(err)throw err;
		console.log(result);
		//判断是否注册成功
		if(result.affectedRows>0)
		{
			res.send({code:200,msg:'regsuc'});
		}
	});

});

//2.用户登录
//post /login
userRouter.post('/login',function(req,res){
	var obj=req.body;
//	console.log(obj);
//验证数据是否为空 401 402
 if (obj.uname==''){
	res.send({code:401,msg:'uname required'});
	return;
 }
 if(!obj.upwd){
	res.send({code:402,msg:'upwd required'});
	return;
 }
 //执行SQL语句
 //查询用户表中是否含有用户名和密码同时匹配的数据
pool.query('select * from xz_user where uname=? and upwd=?',[obj.uname,obj.upwd],function(err,result){
	if(err)throw err;
//	console.log(result);
//判断数组的长度是否大于0
if(result.length>0){
	res.send({code:200,msg:'login suc'});
}else{
	res.send({code:301,msg:'login err'});
}
});

//	res.send('登陆成功');
});

////3.用户修改
//// post /update
//userRouter.post('/update',function(req,res){
//	var obj=req.body;
////遍历对象属性，获取所有的属性
//	var n=400;
//for(var key in obj){
//	n++;
//	//console.log(key,obj[key]);
//	//判断属性值是否为空
//	if(!obj[key]){
//			res.send({code:n,msg:key+' required'});
//			return;
//		}
//} 
//	
//	pool.query('update xz_user set email=?,user_name=?,phone=?,gender=? where uid=?',[obj.email,obj.user_name,obj.phone,obj.gender,obj.uid,],function(err,result){
//		if (err) throw err;
//	//判断是否修改成功
//	if(result.affectedRows>0){
//		res.send({code:200,msg:'update suc'});
//	}else{
//		res.send({code:301,msg:'update err'});
//	}
//	});
//});
//
////4.用户检索
//// get /detail
//userRouter.get('/detail',function(req,res){
//	var obj=req.query;
//
//	if(!obj.uid){
//		res.send({code:401,msg:'uid required'});
//		return;
//	}
//
//pool.query('select * from xz_user where uid=?',[obj.uid],function(err,result){
//	if (err) throw err;
//	res.send(result);
//	//验证是否为空
//
//	});
//});
//
////5.用户列表（分页查询）
//userRouter.get('/list',function(req,res){
//	var obj=req.query;
//	obj.pnum=parseInt(obj.pnum);
//	obj.count=parseInt(obj.count);
////验证是否为空
//	if(!obj.pnum){obj.pnum=1;}
//	if(!obj.count){obj.count=3;}
//	var start=(obj.pnum-1)*obj.count;
////将传递的值转为整型
//
//pool.query('select * from xz_user limit ?,?',[start,obj.count],function(err,result){
//		if (err) throw err;
//		res.send(result);
//	});
//
//});
//
////6.删除用户
//userRouter.get('/delete',function(req,res){
//	var obj=req.query;
//
////验证是否为空	
//	if(!obj.uid){
//		res.send({code:401,msg:'uid required'});
//		return;
//	}
//
//pool.query('delete from xz_user where uid=?',[obj.uid],function(err,result){
//	if (err) throw err;
//	
//	if(result.affectedRows>0){
//		res.send({code:200,msg:'delete suc'});
//	}else
//	{res.send({code:401,msg:'delete err'});
//	}
//
//});
//});


//导出路由器对象
module.exports=userRouter;

