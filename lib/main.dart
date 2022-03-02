import 'package:flutter/material.dart';
import 'package:pizza_buy/Navig.dart';
import 'package:pizza_buy/globalTheme.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const obertca());
}

enum sauce {cheese, sweet, hot}


class obertca extends StatefulWidget {
  const obertca({Key? key}) : super(key: key);

  @override
  State<obertca> createState() => _obertcaState();
}

class _obertcaState extends State<obertca> {
  bool dTheme=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: globalThemes(dTheme),
         //home: _pizzaCalc()
         initialRoute: '/',
         routes: {
           '/': (context) => const _pizzaCalc(),
         }
     );
  }
}



class _pizzaCalc extends StatelessWidget {
  const _pizzaCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: navDraw(context),
        body:PizzaCalc(),
    );
  }
}






class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  _PizzaCalcState createState() => _PizzaCalcState();
}




class _PizzaCalcState extends State<PizzaCalc> {

  bool _testo=false;
  bool _twoChees=false;
  double _cost=0;
  double _size=40;
  sauce? _sauce = sauce.hot;


  double _calcPrice(){

    if (_testo) {
      _cost=300;
    } else {
      _cost=400;
    }
    switch (_sauce){
      case sauce.hot:
        _cost += 30;
        break;
      case sauce.sweet:
        _cost += 40;
        break;
      case sauce.cheese:
        _cost += 55;
        break;
    }

    if (_twoChees) _cost += 70;

    _cost+=_size*10;

    return _cost;
  }

  void _sauceChange(sauce? val)
  {
    setState(() {
      _sauce = val;
      _calcPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    _calcPrice();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Container(
                alignment: Alignment.topRight,
                child: Image(image: AssetImage('assets/pizza.png'),fit: BoxFit.cover, )
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children:  [
                  const SizedBox(height: 10,),
                  Text("Калькулятор пиццы",style: Theme.of(context).textTheme.headline3,),
                  const SizedBox(height: 5,),
                  Text("Выберите параметры:",style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 10,),

                  SlidingSwitch(
                      height: 30,
                      value: _testo,
                      animationDuration: const Duration(milliseconds: 200),
                      textOn: "Тонкое тесто",
                      textOff: "Обычное тесто",
                      colorOn : const Color(0xffFFFFFF),
                      colorOff : const Color(0xffFFFFFF),
                      background : const Color(0xffECEFF1),
                      buttonColor : Theme.of(context).colorScheme.primary,
                      inactiveColor : const Color(0x7d000000),
                      onChanged: (bool val){
                        setState(() {
                          _testo=val;
                          _calcPrice();
                          });
                      },
                      onTap: (){},
                      onDoubleTap: (){},
                      onSwipe: (){}),
                  const SizedBox(height: 15,),
                  Container(alignment: Alignment.centerLeft, child: Text("Размер:",style: Theme.of(context).textTheme.headline6)),
                  SfSlider(
                    min: 20.0,
                    max: 80.0,
                    value: _size,
                    interval: 20,
                    stepSize: 20,
                    showTicks: true,
                    showLabels: true,
                    showDividers: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 0,
                    numberFormat: NumberFormat('## см'),
                    onChanged: (dynamic value){
                    setState(() {
                      _size=value;
                      _calcPrice();
                    });
                    },
                  ),
                  const SizedBox(height: 15,),
                  Container(alignment: Alignment.centerLeft, child: Text("Соус:",style: Theme.of(context).textTheme.headline6)),
                  RadioListTile<sauce>(
                      title:const Text("Острый"),
                      value: sauce.hot,
                      groupValue: _sauce,
                      onChanged: _sauceChange,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),

                  ),
                  RadioListTile<sauce>(
                    title:const Text("Сырный"),
                    value: sauce.cheese,
                    groupValue: _sauce,
                    onChanged: _sauceChange,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),

                  ),
                  RadioListTile<sauce>(
                    title:const Text("Кисло-сладкий"),
                    value: sauce.sweet,
                    groupValue: _sauce,
                    onChanged: _sauceChange,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  ),
                  SizedBox(
                    height: 60,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        //color: const Color(0xFFF0F0F0),

                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Image(image: AssetImage('assets/chees.png'),fit: BoxFit.cover, ),
                            ),
                            Text("Дополнительный сыр",style: Theme.of(context).textTheme.headline6),
                            Switch(value: _twoChees, onChanged: (val){
                              setState(() {
                                _twoChees=val;
                                _calcPrice();
                              });
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(alignment: Alignment.centerLeft, child: Text("Стоймость:",style: Theme.of(context).textTheme.headline6)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: SizedBox(
                      height: 60,
                      child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          //color: const Color(0xFFF0F0F0),
                          child: Container(alignment: Alignment.center, child: Text("${_cost} руб.",style: Theme.of(context).textTheme.headline4))),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: ElevatedButton(onPressed: (){}, child: const Text("Заказать"), ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



