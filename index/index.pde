int[][] board=new int[3][3];
int turn=1;
int playing=1;
void setup() {
  size(300, 300);
  for (int j=0; j<3; j++) {
    for (int i=0; i<3; i++) {
      board[j][i]=-1;
    }
  }
}
boolean t(int i, int j) {
  return board[j][i]==turn;
}
void check_win() {
  if ((t(0, 0)&&t(0, 1)&&t(0, 2))||(t(1, 0)&&t(1, 1)&&t(1, 2))||(t(2, 0)&&t(2, 1)&&t(2, 2))||(t(0, 0)&&t(1, 0)&&t(2, 0))||(t(0, 1)&&t(1, 1)&&t(2, 1))||(t(0, 2)&&t(1, 2)&&t(2, 2))||(t(0, 0)&&t(1, 1)&&t(2, 2)||(t(2, 0)&&t(1, 1)&&t(0, 2)))) {
    println(turn+" won!");
    playing=0;
    return;
  }
  for (int j=0; j<3; j++) {
    for (int i=0; i<3; i++) {
      if (board[j][i]==-1) {
        return;
      }
    }
  }
  println("Tie!");
  playing=0;
}
void make_move(int i, int j) {
  if (i>-1&&i<3&&j>-1&&j<3&board[j][i]==-1) {
    board[j][i]=turn;
    check_win();
    turn=1-turn;
    return;
  }
}
void mousePressed() {
  int x=int(mouseX/100), y=int(mouseY/100);
  if (x<0||x>2||y<0||y>2) {
    return;
  }
  make_move(x, y);
}
void draw() {
  background(128);
  noStroke();
  for (int j=0; j<3; j++) {
    for (int i=0; i<3; i++) {
      if (board[j][i]==0) {
        fill(0);
        rect(i*width/3, j*height/3, width/3, height/3);
      }
      if (board[j][i]==1) {
        fill(255);
        rect(i*width/3, j*height/3, width/3, height/3);
      }
    }
  }
  strokeWeight(5);
  stroke(25);
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);
  line(0, height/3, width, height/3);
  line(0, height/3*2, width, height/3*2);
  if (playing==0) {
    noLoop();
  }
}
