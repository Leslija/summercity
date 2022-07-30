let canvas = document.getElementById("canvas");
let ctx = canvas.getContext("2d");

let W = canvas.width;
let H = canvas.height;
let degrees = 0;
let new_degrees = 0;
let time = 0;
let color = "#f50707";
let txtcolor = "#ffffff";
let bgcolor = "#243237";
let bgcolor2 = "#41a491";
let bgcolor3 = "#00ff00";
let strokeStyle = "#000";
let key_to_press;

// Circle Green zone

let g_start, g_end;

let g_startMin = 20;
let g_startMax = 40;

let g_endMin = 5;
let g_endMax = 10;


let animation_loop;
let pointerWidth = 0.05;//red pointer size
let delayBetweenCircles = 0;//clear time between circles
let needed = 4;//needed streak amount
let streak = 0;//initial streak

let usingAdvanced = 0; 
let lockpickTime = [5,10,15];
let alockpickTime = [20,40,80];

let isCuffed = 0;
let cuffTime = 1;


function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}

function L_random_time(lockpickTime) {
    return lockpickTime[Math.floor(Math.random()*lockpickTime.length)];
}
function aL_random_time(alockpickTime) {
    return alockpickTime[Math.floor(Math.random()*alockpickTime.length)];
}


function init() {
    // Clear the canvas every time a chart is drawn
    
    ctx.clearRect(0,0,W,H);

    // Background 360 degree arc
    ctx.beginPath();
    ctx.strokeStyle = bgcolor;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0, Math.PI * 2, false);
    ctx.stroke();

    // Green zone
    ctx.beginPath();
    ctx.strokeStyle = correct === true? bgcolor3 : bgcolor2;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, g_start - 90 * Math.PI / 180, g_end - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Angle in radians = angle in degrees * PI / 180
    let radians = degrees * Math.PI / 180;
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 40;
    ctx.arc(W / 2, H / 2, 90, radians - pointerWidth - 90 * Math.PI / 180, radians - 90 * Math.PI / 180, false);
    ctx.stroke();

// alterar para 2 se n der o 0.01
    // Adding the key_to_press
    ctx.fillStyle = txtcolor;
    ctx.font = "100px sans-serif";
    let text_width = ctx.measureText(key_to_press).width;
    ctx.fillText(key_to_press, W / 2 - text_width / 2, H / 2 + 35);
    ctx.stroke();
    
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
      if ((new Date().getTime() - start) > milliseconds){
        break;
      }
    }
  }


function draw(time) {
    if (typeof animation_loop !== undefined) clearInterval(animation_loop);

    g_start = getRandomInt(g_startMin,g_startMax) / 10;
    g_end = getRandomInt(g_endMin,g_endMax) / 10;
    g_end = g_start + g_end;

    degrees = 0.0;
    new_degrees = 360.0;

    key_to_press = ''+getRandomInt(1,4);
    
    usingAdvanced = usingAdvanced;
    isCuffed = isCuffed;

    // lock minigame time switch

    if (usingAdvanced > 0) {

        time = aL_random_time(alockpickTime);

    } else if (isCuffed > 0) {

        time = cuffTime;

    } else {

        time = L_random_time(lockpickTime);
        
    };


    animation_loop = setInterval(animate_to, time);
    console.log(time,"s circle", "? advanced",usingAdvanced, "isCuffed?", isCuffed, cuffTime);
    
}



function animate_to() {
    if (degrees >= new_degrees) {
        wrong();
        return;
    }

    degrees+=2;
    init();
}

function correct(){
    streak += 1;
    if (streak == needed) {
        clearInterval(animation_loop);
        
        endGame(true);
    }else{    
        $('#canvas').hide();
        sleep(delayBetweenCircles);
        draw(time);
        $('#canvas').show();

    };
}

function wrong(){
    clearInterval(animation_loop);
    endGame(false);
}

document.addEventListener("keydown", function(ev) {
    let key_pressed = ev.key;
    let valid_keys = ['1','2','3','4'];
    if( valid_keys.includes(key_pressed) ){
        if( key_pressed === key_to_press ){
            let d_start = (180 / Math.PI) * g_start;
            let d_end = (180 / Math.PI) * g_end;
            if( degrees < d_start ){
                wrong();
            }else if( degrees > d_end ){
                wrong();
            }else{
                correct();
            }
        }else{
            wrong();
        }
    }
});

function startGame(time){
    $('#canvas').show();
    draw(time);      
  }
  
  function endGame(status){
    $('#canvas').hide();
    var xhr = new XMLHttpRequest();
    let u = "fail";
        if(status)
            u = "success";
    xhr.open("POST", `http://qb-lock/${u}`, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({}));
    streak = 0;
    needed = 4;
  }

  //listen for NUI if player is using Advanced
  window.addEventListener("message", (event)=> {
    let data = event.data;
        if (data.using_Advanced == 1) {
        usingAdvanced = 1;
  }else {
    usingAdvanced = 0;
  }
})
//listen for NUI if player is cuffed
window.addEventListener("message", (event)=> {
    let data = event.data;
        if (data.is_cuffed == 1) {
        isCuffed = 1;
  } else {
    isCuffed = 0;
}
})  

  window.addEventListener("message", (event) => {
    if(event.data.action == "start"){
        if(event.data.value != null ){
            needed = event.data.value
        }else{
            needed = 4
        }
        if(event.data.time != null ){
            time = event.data.time
        }else{
            time = 2
        }
	    /*console.log(event.data.time)*/
      startGame(time)
    }
  })

