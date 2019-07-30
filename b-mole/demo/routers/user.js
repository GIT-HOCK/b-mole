
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
		return;	}	
	//执行sql语句
	pool.query('INSERT INTO jhq_user set ?',[obj],function(err,result){
		if(err)throw err;
		console.log(result);
		//判断是否注册成功
		if(result.affectedRows>0){res.send({code:200,msg:'regsuc'});
	  }
	});
});
//2.用户登录
//post /login
userRouter.get('/login',function(req,res){
	var obj=req.query;
	console.log(obj)
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
pool.query('select * from jhq_user where uname=? and upwd=?',[obj.uname,obj.upwd],function(err,result){
	if(err)throw err;
//	console.log(result);
//判断数组的长度是否大于0
if(result.length>0){	
	res.send({uid:result[0].uid,code:200,msg:"login suc"});
}else{
	res.send({code:301,msg:'login err'});
}
});
//	res.send('登陆成功');
});

userRouter.get('/cart',(req,res)=>{
	var obj=req.query;
	var sql='select * from cart where uid=?'
	pool.query(sql,[obj.uid],(err,result)=>{
		if(err) throw err
		if(result.length>0){
			res.send({code:200,msg:'success',result})
		}else{
			res.send({code:301,msg:'err'})
		}
	})	
})
userRouter.get('/cartdelete',(req,res)=>{
	var cid=req.query.cid
	var sql='delete from cart where cid=?'
	pool.query(sql,[cid],(err,result)=>{
		if(err) throw err
		if(result.affectedRows>0){
			res.send('1')
		}else{
			res.send('0')
		}
	})
})
userRouter.get('/cartupdate',(req,res)=>{
	var obj=req.query.obj;	
	var sql='update cart set cartNumber= ? where cid= ?';
	var open=true;
	// console.log(obj[0].num,obj[0].cid)
	for(var i=0;i<obj.length;i++){	
		// console.log( parseInt(obj[i].num),typeof parseInt(obj[i].num))
		var num=parseInt(obj[i].num)	
		var cid=parseInt(obj[i].cid)
		pool.query(sql,[num,cid],(err,result)=>{
			if(err) throw err;
			if(result.affectedRows>0){
				setTimeout(function(){
					if(open){
						res.send({code:'200',msg:'success'});
					open=false;
					}					
				},1000)
			}			
		})
	}	
})
//导出路由器对象
module.exports=userRouter;

