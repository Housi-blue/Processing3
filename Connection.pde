class Connection{
  float maxforce=0.1;
  float maxspeed=4;
  
  PVector velocity;
  PVector acceleration;
  
  Neuron a;
  Neuron b;
  float weight;
  
  boolean sending=false;
  PVector sender;
  
  float output=0;
  
  Connection(Neuron from,Neuron to,float w){
    weight=w;
    a=from;
    b=to;
  }
  
  void feedforward(float val){
    sending=true;
    sender=a.location.get();
    velocity=new PVector();
    acceleration=new PVector();
    output=val*weight;
  }
  
  void update(){
    if(sending){
    PVector target=b.location.get();
      
    PVector desired=PVector.sub(target,sender);
    
    desired.normalize();
    desired.mult(maxspeed);
    
    PVector steer=PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
      
      velocity.add(acceleration);
      velocity.limit(maxspeed);
      sender.add(velocity);
      acceleration.mult(0);
      
      float d=PVector.dist(sender,b.location);
      
      if(d < 1.7){
        b.feedforward(output);
        sending=false;
      }
    }
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  } 
  
  void display(){
   stroke(0);
   strokeWeight(1+weight*4);
   line(a.location.x,a.location.y,b.location.x,b.location.y);
   
   if(sending){
     fill(0);
     strokeWeight(1);
     ellipse(sender.x,sender.y,16,16);
    }
  }
}
