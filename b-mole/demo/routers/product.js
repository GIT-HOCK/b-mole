const express=require('express');
const pool=require('../pool.js');
const details=express.Router();
details.get('/details',function(req,res){
    var obj=parseInt(req.query.id);    
    var sql="select * from jhq_product where pid=?";
    pool.query(sql,[obj],function(err,result){
        if(err) throw err        
        res.send(result)
    })
})
details.get('/news',(req,res)=>{
    var sql='select * from jhq_news';
    pool.query(sql,function(err,result){
        if(err)throw err;
        // console.log(result);
        res.send(result);
    })
})

module.exports=details;