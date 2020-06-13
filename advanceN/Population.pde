class Population
{
  float mutationRate;
  Individuo[] poblacion;
  ArrayList<Individuo> matingPool;
  int[] target;
  int generaciones;
  boolean finished;
  int perfectScore;
  
  
  Population(int[] t, float m, int num)
  {
    this.target=t;
    this.mutationRate=m;
    this.poblacion=new Individuo[num];
    for(int i=0;i<poblacion.length;i++){
      poblacion[i]=new Individuo(this.target.length);
    }
    calcFitness();
    matingPool=new ArrayList<Individuo>();
    finished=false;
    generaciones=0;
    perfectScore=1;
  
    
  }
  //targeta arreglo de int
  void calcFitness(){
    for(int i=0;i<poblacion.length;i++){
      poblacion[i].fitness(this.target);
    }
  }
  void naturalSelection(){
    matingPool.clear();
    float maxFitness=poblacion[0].fitness;
    float minFitness=poblacion[0].fitness;
    for(int i=0;i<poblacion.length;i++){
      if(poblacion[i].fitness<minFitness){
      minFitness=poblacion[i].fitness;
      }
    }
    
    for(int i=0;i<poblacion.length;i++){
      if(poblacion[i].fitness>maxFitness){
      maxFitness=poblacion[i].fitness;
      }
    }
    
    for (int i = 0; i < poblacion.length; i++) {
      float fitness = map(poblacion[i].fitness,maxFitness,minFitness,0,1);
      //println(fitness);
      int n = int(fitness * 100); 
      //println(n);
      for (int j = 0; j < n; j++) {
        //println(poblacion[i]);
        
        matingPool.add(poblacion[i]);
      }
    }
    
    
  }
  
  void genera()
  {
   
    for(int i=0; i<poblacion.length;i++)
    {
      int a= int(random(matingPool.size()));
      int b= int(random(matingPool.size()));
      Individuo partnerA=matingPool.get(a);
      Individuo partnerB=matingPool.get(b);
      Individuo hijo=partnerA.crossover(partnerB);
      hijo.mutate(mutationRate);
      poblacion[i]=hijo;
    }
    generaciones++;
  }
  //getBestImage
  PImage getBest(){
  float worldrecord=100.0;
  int index=0;
    for(int i=0;i<poblacion.length;i++){
      if(poblacion[i].fitness<worldrecord){
        index=i;
        worldrecord=poblacion[i].fitness;
      }
    }
    if(worldrecord==perfectScore) finished=true;
    return poblacion[index].getImagen();
  }
  boolean finished(){
  return finished;
  }
  int getGenerations(){
  return generaciones;
  }
  
  
  float getAverageFitness(){
    float total=0;
    for(int i=0;i<poblacion.length;i++){
      total +=poblacion[i].fitness;
    }
    return total/(poblacion.length);
  }
  //mejorar funcion
  int allPixels(){
    int everything= 0;
    
    
    int displayLimit= min(poblacion.length, 50);
    
    for(int i=0; i<displayLimit;i++)
    {
      PImage imag= new PImage();
      imag.loadPixels();
      for(int x=0; x<imag.width;x++)
      {
        for(int y=0;y<imag.height;y++)
        {
          int pixelsLocation=x+y*imag.width;
          everything +=poblacion[i].getImagen().pixels[pixelsLocation];
        }
      }
    }
    return everything;
    
    
    
  }



}
