/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var msg = function msg(data) {
    var resultArea = document.getElementById("AjaxGuess:result");
    var errorArea = document.getElementById("AjaxGuess:errors1"); 
    if (errorArea.innerHTML !== null && errorArea.innerHTML !== "") {
        resultArea.innerHTML="";
    }
};

 