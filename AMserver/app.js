//am项目服务器
//引入第三方模块
const express = require("express");
const session = require("express-session");
const cors = require("cors");
const mysql = require("mysql");

//数据库连接池
var pool = mysql.createPool({
  host: "127.0.0.1",
  user: "root",
  password: "",
  port: "3306",
  connectionLimit: 20,
  database: "am"
})

//监听web服务器8080端口
var server = express();
server.listen(8080);

//处理跨域
server.use(cors({
  origin: ["http://127.0.0.1:5050","http://localhost:5050"],
  credentials: true,
}))

//配置session
server.use(session({
  secret: "128位字符串",
  resave: true,
  saveUninitialized: true,
}));

//配置静态目录
server.use(express.static("public"));

//功能: 登录按钮
server.get("/login",(req,res)=>{
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql = "SELECT id FROM am_login WHERE uname=? AND upwd=md5(?)";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码错误"});
    }else{
      var id = result[0].id;
      req.session.uid = id;
      res.send({code:1,msg:"登录成功"});
    }
  });
});

//功能:分页显示商品
server.get("/gas",(req,res)=>{
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //默认显示数量
  if(!pno){
    pno = 1;
  };
  if(!pageSize){
    pageSize = 4;
  };
  var sql = "SELECT gid,title,subtitle,price,img_url FROM am_gas LIMIT ?,?";
  var offset = (pno - 1) * pageSize;
  pageSize = parseInt(pageSize);
  //发送query
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
});

//功能:按类型搜索商品

