import 'dart:async';
import 'dart:collection';

class MyBloc{
  int counter=0;
  StreamController counterController= new StreamController<int>.broadcast();
  Stream get counterStream => counterController.stream.transform(counterTransformer);
  
  //lang nghe nhieu su kiem
  var counterTransformer = StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    data = data + 10;
    sink.add(data);
  },);

  void increment(){
    counter++;
    counterController.sink.add(counter);
  }

  void dispose(){
    counterController.close();
  }
}