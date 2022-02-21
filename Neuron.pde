class Neuron{
  
  PVector location;
  
  ArrayList<Connection> connections;
  
  float sum=0;
  float r=32;
  
  Neuron(float x,float y){
    location=new PVector(x,y);
    connections=new ArrayList<Connection>();
  }
  
  void feedforward(float input){
    sum +=input;
    if(sum>1){
      fire();
      sum=0;
    }
  }
  
  void fire(){
    r=64;
    
    for(Connection c:connections){
      c.feedforward(sum);
    }
  }
  
  void addConnection(Connection c){
    connections.add(c);
  }
  
  void display(){
    stroke(0);
    strokeWeight(1);
    
    float b=map(sum,0,1,255,0);
    fill(b);
    ellipse(location.x,location.y,r,r);
    
    r=lerp(r,32,0.1);
  }
}
