document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('myCanvas');
  var ctx = canvas.getContext('2d');
  canvas.width = 500;
  canvas.height = 800;

  ctx.fillStyle = 'red';
  ctx.strokeStyle = 'pink';
  ctx.lineWidth = 20;
  ctx.beginPath();
  ctx.arc(150, 200, 100, 2.5, 6);
  ctx.arc(350, 200, 100, 3.8, 7.0);
  ctx.lineTo(250, 500);
  ctx.closePath();
  ctx.stroke();
  ctx.fill();
});
