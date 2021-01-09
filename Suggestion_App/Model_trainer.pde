void loadData(String filepath) {
  try {
    weka.core.converters.ConverterUtils.DataSource source
      = new weka.core.converters.ConverterUtils.DataSource(filepath);
    data = source.getDataSet();
    if (data.classIndex() == -1)
      data.setClassIndex(data.numAttributes() - 1);
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
}

void j48Train()
{
  try {
    j48 = new weka.classifiers.trees.J48();
    j48.setOptions(weka.core.Utils.splitOptions("-C 0.25 -M 4"));
    j48.buildClassifier(data);  
    weka.classifiers.Evaluation eval = new weka.classifiers.Evaluation(data);
    eval.crossValidateModel(         //cross-validate
      j48, data, 10, //with 10 folds
      new Random(1));                //and random number generator with seed 1

    println(eval.errorRate());       //Printing Training Mean root squared Error
    println(eval.toSummaryString()); //Summary of Training
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
}

String predict(String w, String a, String c, String dg, String dp, 
  String e, String ge, String h, String ac, double hh) {
  String r = "Sorry, unable to predict";
  if (j48 == null) return r;

  // build a new instance with the given input
  Instance di = new DenseInstance(11);
  di.setDataset(data);
  di.setValue(0, w);
  di.setValue(1, a);
  di.setValue(2, c);
  di.setValue(3, dg);
  di.setValue(4, dp);
  di.setValue(5, e);
  di.setValue(6, ge);
  di.setValue(7, h);
  di.setValue(8, ac);
  di.setValue(9, hh);

  try { 
    int i = (int)j48.classifyInstance(di);
    r = di.classAttribute().value(i);
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
  return r;
}

void loadModel(String filepath) {
  try {
    j48 = (weka.classifiers.trees.J48) SerializationHelper.read(filepath);
    println("J48 loaded");
    println(j48.toString());
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
}

void saveModel(String filepath, weka.classifiers.trees.J48 j) {
  try {
    SerializationHelper.write(filepath, j);
  }
  catch(Exception ex) {
    ex.printStackTrace();
  }
}
