
void setup() {
    size(800, 450);
}

var t = 10;
var diameter = 50;
var posx = 250;
var posy = 250;
var score = 0;
var vx = 0;
var vy = 0;
var DotExists = 1;
var prikker =[];
for (int i = 0 ;i < 1000; ++i){
    prikker.push({x : random(3000), y : random(3000), color : #ff8899});
}

int distance(int x1, int y1, int x2, int y2) {
    int a = x1 - x2;
    int b = y1 - y2;

    return sqrt(a * a + b * b);
}

void draw() {

    if (t % 1000 === 0){
        prikker.push({x : random(1024), y : random(526), color : #ff8899});
    }

    //Ellipse
    background(#000000);
    text("Score " + score, 10, 20);
    fill(#ff8899);
    vx = mouseX - 400;
    vy = mouseY - 225;
    speed = sqrt(vx * vx + vy * vy);
    posx = posx + vx/speed / sqrt((score  + 1)/100);
    posy = posy + vy/speed / sqrt((score + 1)/100);
    ellipse(400, 225, diameter, diameter);
    stroke(#ff88ff);
    fill(#fde201);

    for ( var i = 0; i <prikker.length; i++) {
        if (distance(400, 225, prikker[i].x - posx, prikker[i].y - posy) < diameter / 2) {
            prikker.splice(i,1);
            score = score + 1;
            diameter = 50 + score;
        }
    }

    for ( var i = 0; i <prikker.length; i ++){
        fill(prikker[i].color);
        ellipse(prikker[i].x - posx, prikker[i].y -posy, 10, 10);
    }
}