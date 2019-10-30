void setup() {
size(700, 700);
//fullScreen();
background(0);
translate(width/2, height);

for(int i = 1; i < 10000; i++) {
  IntList sequence = new IntList();
  int n = i;
  do {
    sequence.append(n);
    n = collatz(n);
  } while (n != 1);
  sequence.append(1);
  sequence.reverse();
  
  int steps = 0;
  float len = height / 100.0;
  float angle = 0.2;
  resetMatrix();
  translate(width/2, height);
  for (int j = 0; j < sequence.size(); j++) {
    int value = sequence.get(j);
    
    if (value % 2 == 0) {
      rotate(angle); 
    } else {
      rotate(-angle);
    }
    strokeWeight(1);
    int r = (j * 4) % 255;
    int g = (j * 3) % 255;
    int b = (j * 2) % 255;
    
    stroke(r, g, b, 10);
    line(0,0,0,-len);
    translate(0, -len);
    steps++;
  }
}
println("Finished");
}

int collatz(int n) {
  if (n % 2 == 0) {
    return n / 2;
  } else {
    return (n * 3 + 1) / 2;
  }
}
