import 'package:calculator2/Cubit/CalculateCubit.dart';
import 'package:calculator2/Cubit/CubitStates.dart';
import 'package:calculator2/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CalculatorScreen extends StatelessWidget {
   CalculatorScreen({Key? key}) : super(key: key);
  final List<String> Buttons =
  [
    'C' , 'DEL' , '%' ,'/',
    '9' , '8' , '7' , '*' ,
    '6' , '5' , '4' , '-' ,
    '3' , '2' , '1' , '+' ,
    '0' , '.' ,'ANS' ,'=' ,
  ];



  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=> CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit , CubitSates>(
         listener:(context , index){},
         builder:(context , index)
        {
          CalculatorCubit Cubit = CalculatorCubit.get(context);
          return Scaffold(
          backgroundColor: Colors.deepPurple[100],
          body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(child:
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 50,),
          Text(
            Cubit.userQuestion,
          style: TextStyle(
          fontSize:20 ,
            color: Colors.black
          ),
          ),
          Spacer(),
          Row(
          children: [
          Spacer(),
          Text(
          Cubit.userAnswer,
          style: TextStyle(
        fontSize:20 ,
            color: Colors.black,
        ),
        ),
        ],
        ),
        const SizedBox(height: 30,),
        ],
        ),
        )
        ),
          Spacer(),
          Expanded(
        flex: 3,
        child: Container(
        child: GridView.builder(
        itemCount: Buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context , int index )
        {
        if(index==0)
        {
        return MyButton(
          buttonTapped: ()
          {
             Cubit.COperatorFun();
          },
        buttonText: Buttons[index],
        textColor: Colors.white ,
        color: Colors.green,
        );
        }
        else if(index==1)
        {
        return MyButton(
          buttonTapped:()
          {
              Cubit.DeleteFun();
          },
        buttonText: Buttons[index],
        textColor: Colors.white ,
        color: Colors.red,
        );
        }
        else if(index==Buttons.length-1)
        {
          return MyButton(
            buttonTapped:()
            {
               Cubit.equalPressed();
            },
            color: Colors.deepPurple,
            textColor: Colors.white,
            buttonText: Buttons[index],
          );
        }
        else if (index == Buttons.length-2) {
          return  MyButton(
            buttonTapped: ()
            {
              Cubit.AnsButtonFun();
            },
            color:Colors.deepPurple[50],
            textColor: Colors.deepPurple,
            buttonText: Buttons[index],
          );
        }
        else {
        {
        return MyButton(
        buttonTapped:()
        {
          Cubit.UserQuestionFun(Buttons[index]);
        },
        buttonText: Buttons[index],
        textColor: isOperator(Buttons[index])
        ? Colors.white
            : Colors.deepPurple,
        color: isOperator(Buttons[index])
        ? Colors.deepPurple
            : Colors.deepPurple[50],
        );
        }
        }
        }
        ),
        )
        ),
        ],
        ),
        );
        }
      ),
    );
  }

  bool isOperator(String x)
  {
    if( x=='/' || x=='%' || x=='*' || x=='-' || x=='+' || x=='=')
    {
      return true ;
    } else if(x== null)
    {
      return false ;
    } else
    {
      return false ;
    }
  }

}
