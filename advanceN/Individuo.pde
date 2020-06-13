class Individuo
{
  int [] genes;
  int fitness;
  //imagen 
  PImage iprueba;
  Individuo(int bn)
  {
    genes=new int[bn];
    for(int i=0;i<genes.length;i++){
    genes[i]=(int)random(0,255);
    }
  } 
  //here
  PImage getImagen(){
    return iprueba;
  }
 
  
  //cambio a arreglo de int
  void fitness(int target[]){
    int [] diferencias=new int[genes.length];
    for(int i=0;i<genes.length;i++){
      diferencias[i]=abs(target[i]-genes[i]);
      
    }
    for(int i=0;i<diferencias.length;i++){
      fitness+=diferencias[i];
    }
    //println(fitness);
    //fitness=abs()
   /* int score=0;
    for(int i=0;i<genes.length;i++){
      if(genes[i]==target[i]){
      score++;
      }
      
    }
    fitness=(int)score/ (int)target.length;
  */
  }
  Individuo crossover(Individuo partner) 
  {
    Individuo hijo= new Individuo(genes.length);

    int midpoint= int(random(genes.length));

    for (int i = 0; i < genes.length; i++) 
    {
      if (i > midpoint) hijo.genes[i] = genes[i];
      else              hijo.genes[i] = partner.genes[i];
    }
    return hijo;
  }
  void mutate(int mutationRate){
    for(int i=0; i<genes.length; i++){
      if(random(1)<mutationRate){
        genes[i]=(int) random(0,255);
      }
    }
  }
  void getcolor()
  {
    loadPixels();
    lips.loadPixels();
    for (int x=0; x<width; x++)
    {
      for (int y=0; y<height; y++)
      {
        int loc=x+y*width;
        float r=red(lips.pixels[loc]);
        float g=green(lips.pixels[loc]);
        float b=blue(lips.pixels[loc]);
        pixels[loc]=color(r, g, b);
      }
    }
    updatePixels();
  }
  void mutate(float mutationRate){
    for(int i=0;i<genes.length;i++){
    if(random(1)<mutationRate){
      genes[i]=(int) random(0,255);
    
    }
  }
  }
}
