const express = require ("express");
const app = express();


app.get("/reserva",function(req,res){
    res.render ('reserva');
})

app.get("/Clientes", function(req,res){
    res.render("Clientes")
})

//EJS
app.set('view engine','ejs');

//CSS
app.use(express.static('Arquivos'))

app.listen(3000, function(){
    console.log("Servidor no AR!")
});
