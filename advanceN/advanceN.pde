PImage lips;
Individuo[] individuos= new Individuo[150];
int[] target;
int popmax;
float mutationRate;
Population population;
void setup()
{
  size(256,256);
  lips=loadImage("p1.png");
  target=new int[lips.pixels.length];
  popmax=150;
  mutationRate=0.01;
  for(int i=0; i<individuos.length;i++)
  {
    individuos[i]= new Individuo(int(random(0,255)));
  }
  population=new Population(target, mutationRate, popmax);
}
void draw()
{
  //genera el mating pool
  population.naturalSelection();
  //crear siguiente generacion
  population.genera();
  // calcula fitness
  population.calcFitness();
  //display
  //background(population.getBest());
  
  if(population.finished()){
  println(millis()/1000.0);
  noLoop();
  }
  /*
    for(int i=0; i<individuos.length;i++)
  {
  
    individuos[i].getcolor();
    
  }*/
  
}
void displayImages(){
  background(255);
  //Display pero el metodo que tengo que llamar es una imagen -getBest()
}
