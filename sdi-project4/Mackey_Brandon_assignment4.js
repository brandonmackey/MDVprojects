
// Brandon Mackey
// Augest 22, 2012
// SDI 1208 Wk 4
// Project 4: My Library



var myLibrary = function(){

    // Find the number of days difference between two dates.
    
    var daysTill = function(today,birthday){
        var javaDay  = 24*60*60*1000; // hours*minutes*seconds*milliseconds
        today        = new Date(today);
        birthday     = new Date(birthday);
        var diffDate = Math.abs((today.getTime() - birthday.getTime())/(javaDay));
        return diffDate
    };
    
    
    
    // Format a number to use a specific number of decimal places, as for money:


    
    
    
    
    
    
    return{
        "daysTill": daysTill
    
    };
    
    
    
};


var newLib = new myLibrary();

console.log("There are " + newLib.daysTill("2012,07,22", "2013,06,17") + " days till my birthday!" );
