class Network{
  ArrayList<Neuron> neurons;
  
  ArrayList<Connection> connections;
  PVector location;
  
  Network(float x,float y){
    location=new PVector(x,y);
    neurons=new ArrayList<Neuron>();
    connections=new ArrayList<Connection>();
  }
  
  void feedforward(float input1,float input2){
    Neuron n1=neurons.get(0);
    n1.feedforward(input1);
    
    Neuron n2=neurons.get(1);
    n2.feedforward(input2);
  }
  
  void addNeuron(Neuron n){
    neurons.add(n);
  }
  
  void connect(Neuron a,Neuron b,float weight){
  Connection c=new Connection(a,b,weight);
  a.addConnection(c);
  connections.add(c);
}

  void update(){
    for(Connection c: connections){
      c.update();
    }
  }
  
  void display(){
   pushMatrix();
   translate(location.x,location.y);
   for(Neuron n: neurons){
     n.display();
   }
   
   for(Connection c: connections){
     c.update();
     c.display();
   }
   popMatrix();
  }
}
