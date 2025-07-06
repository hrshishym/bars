ArrayList<Bar> bars;
boolean loop_flag = true;

void setup(){
  size(640, 640);
  bars = new ArrayList<Bar>();
}

void draw(){
  noStroke();
  
  fill(255);
  rect(0, 0, width, height);
  
  int i;
  for(i = 0; i < bars.size(); i++){
    Bar bar = bars.get(i);
    fill(bar._r, bar._g, bar._b, bar._a);
    bar.draw();
    bar._height *= 0.95;
    bars.set(i, bar);
  }
  for(i = 0; i < bars.size(); i++){
    Bar bar = bars.get(i);
    if(bar._height <= 1){
      bars.remove(i);
      i--;
    }
  }
}

void mouseClicked(){
  Bar bar = new Bar();
  bars.add(bar);
}

// スペースバーを押すとバーを追加
void keyPressed(){
  if (key == ' ') {
    Bar bar = new Bar();
    bars.add(bar);
  }
  // qを押すと描画を一時停止
  else if (key == 'q') {
    if (loop_flag) {
      loop_flag = false;
      noLoop(); // 描画を停止
    } else {
      loop_flag = true;
      loop(); // 描画を再開
    }
  }
}


class Bar {
  int _r, _g, _b, _a;
  int _height;
  int _y;
  
  Bar (){
    _r = (int)random(128, 255);
    _g = (int)random(128, 255);
    _b = (int)random(128, 255);
    _a = (int)random(0, 255);
    
    _height = (int)random(10, 200);
    _y      = (int)random(0 + _height / 2, height - _height / 2);
  }
  
  void draw(){
    quad(0, _y + _height, width, _y + _height, width, _y - _height, 0, _y - _height);
  }
}
